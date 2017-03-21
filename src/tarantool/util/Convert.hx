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

/**
 *  Convert haxe data to lua
 */
class Convert {
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
     *  Serialize object to lua types
     *  Simple type -> simple type
     *  Array<Dynamic> -> Table<Int, String>
     *  Object -> Table<String, Dynamic>
     *  @param object - some object
     *  @return Dynamic
     */
    public static function SerializeToLua (object : Dynamic) : Dynamic {
        if (IsSimpleType (object)) {
            return object;
        } else if (Reflect.isEnumValue (object)) {
            var res : EnumValue = cast object;
            return res.getName ();
        } else if (Std.is (object, Array)) {                
            return ArrayToTable (cast (object, Array<Dynamic>));
        }        
        else if (Reflect.isObject (object)) {
            var table = AnyTable.create ();
            var fields = Reflect.fields (object);
            for (field in fields) {
                var prop = Reflect.getProperty (object, field);
                var obj = SerializeToLua (prop);
                untyped table[field] = obj;
            }
            return table;
        }
        throw "Unsupported type";
    }

    /**
     *  Convert Array<Dynamic> to lua.Table
    **/
    public static function ArrayToTable (data : Array<Dynamic>) : AnyTable {
        var tbl : Table<Dynamic, Dynamic> = Table.create ();
        for (i in 1...data.length + 1) {
            var d = data[i - 1];
            tbl[i] = SerializeToLua (d);
        }
        return tbl;
    }
}