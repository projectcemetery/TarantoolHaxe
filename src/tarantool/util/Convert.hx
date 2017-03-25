/*
 * Copyright (c) 2017 Grabli66
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
 * Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
 * THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

package tarantool.util;

import lua.Table;
import tarantool.util.Tuple;
import tarantool.util.ITupleObject;
import tarantool.util.SequenceArray;

/**
 *  Convert haxe data to lua
 */
@:native("t.Convert")
class Convert {

    /**
     *  Convert Array<Dynamic> to lua.Table
    **/
    private static function arrayToTable (data : Array<Dynamic>) : AnyTable {
        var tbl : Table<Dynamic, Dynamic> = Table.create ();
        for (i in 1...data.length + 1) {
            var d = data[i - 1];
            tbl[i] = SerializeToLua (d);
        }
        return tbl;
    }

    /**
     *  Convert SequenceArray to lua.Table
     *  @return AnyTable
     */
    private static function SequenceArrayToTable (data : SequenceArrayInternal<Dynamic>) : AnyTable {
        var res = new Array<Dynamic> ();
        var array = data.array;
        for (it in array) {
            var tupleObject = castToTupleObject (it);
            if (tupleObject == null) throw "Wrong type";
            var arr = tupleObjectToArray (tupleObject);
            for (a in arr) {
                res.push (a);
            }
        }
        return arrayToTable (res);
    }

    /**
     *  Check type is simple
    **/
    public static inline function IsSimpleType (data : Dynamic) : Bool {
        if (Std.is (data, Int) || Std.is (data, Float) || Std.is (data, String)) {
            return true;
        }
        return false;
    }

    /**
     *  Cast object to tuple object or null
     *  @return ITupleObject
     */
    public static function castToTupleObject (object : Dynamic) : ITupleObject {
        var isTuple = Std.is (object, ITupleObject);
        if (isTuple) {
            return cast (object, ITupleObject);
        }
        return null;
    }

    /**
     *  Convert tuple object to array. Not convert to lua
     *  @param tupleObject - 
     */
    public static function tupleObjectToArray (tupleObject : ITupleObject) : Array<Dynamic> {
        var res = new Array<Dynamic> ();
        var fields = tupleObject.getFields ();
        for (i in 0...fields.length) {
            var field = fields[i];
            var prop = Reflect.getProperty (tupleObject, field);
            res.push (prop);
        }        
        return if (res.length < 1) null else res;
    }

    /**
     *  Convert class instance fields, or anonymous struct to AnyTable, recursive for all fields
     *  @param object - 
     *  @return AnyTable
     */
    public static function objectToTable (object : Dynamic) : AnyTable {
        var table = AnyTable.create ();        

        var tupleObject = castToTupleObject (object);
        if (tupleObject != null) {
            var fields = tupleObject.getFields ();
            for (i in 0...fields.length) {
                var field = fields[i];
                var prop = Reflect.getProperty (object, field);
                var obj = SerializeToLua (prop);
                table[i+1] = obj;
            }
        } else {
            var fields = Reflect.fields (object);
            for (field in fields) {
                var prop = Reflect.getProperty (object, field);
                var obj = SerializeToLua (prop);
                untyped table[field] = obj;
            }
        }
                
        return table;
    }

    /**
     *  Serialize object to types for tarantool functions
     *  Simple type -> simple type
     *  Array<Dynamic> -> Table<Int, Dynamic>
     *  SequenceArray<Dynamic> -> Table<Int, Dynamic>. Exm: [{1,"d"}, {3, "s"}] to [1, "d", 3, "s"]
     *  Object -> If tuple object to Table<Int, Dynamic>, other to Table<String, Dynamic>
     *  @param object - some object
     *  @return Dynamic
     */
    public static function SerializeToLua (object : Dynamic) : Dynamic {
        if (IsSimpleType (object)) {
            return object;
        } else if (Reflect.isEnumValue (object)) {
            var res : EnumValue = cast object;
            return res.getName ();
        }
        else if (Std.is (object, SequenceArrayInternal)) {
            return SequenceArrayToTable (cast (object, SequenceArrayInternal<Dynamic>));
        }
        else if (Std.is (object, Array)) {            
            return arrayToTable (cast (object, Array<Dynamic>));
        }
        else if (Reflect.isObject (object)) {
            return objectToTable (object);
        }
        throw "Unsupported type";
    }

    /**
     *  Convert lua table to dynamic
    **/
    public static function TableToTuple (table : AnyTable) : Tuple {
        var res = new Array<Dynamic> ();
        Table.foreach (table, function (i, it) {
            var typ = untyped type (it);
            if (typ == 'cdata') {
                var tab = untyped it.totable ();
                res.push (TableToTuple (tab));
            } else {                
                res.push (it);
            }
        });
        return res;
    }
}