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

package tarantool.space;

import tarantool.space.native.SpaceNative;
import tarantool.space.native.SpaceObjectNative;
import tarantool.index.native.IndexNative;
import tarantool.box.KeyType;
import tarantool.index.Index;
import tarantool.util.Convert;
import tarantool.index.IndexOptions;
import tarantool.box.Tuple;
import lua.Table;

/**
 *  Tarantool space
 */
@:native("t.space")
class Space {

    /**
     *  Native tarantool space
     */
    private var spaceObject : SpaceObjectNative;

    /**
     *  Id of space
     */
    public var id (get, null) : Int;
    public inline function get_id () : Int {
        return spaceObject.id;
    }

    /**
     *  Space name
     */
    public var name (default, null) : String;

    /**
     *  Create new space
     *  @param name - space name
     *  @return Space
     */
    public inline static function create (name : String) : Space {
        var obj = SpaceNative.create (name);
        return new Space (obj, name);
    }

    /**
     *  Get space by name
     *  @param name - name of space
     *  @return Space
     */
    public inline static function getByName (name : String) : Space {
        var obj = untyped box.space[name];
        return new Space (obj, name);
    }

    /**
     *  Constructor
     *  @param spaceObject - native space object
     *  @param name - space name
     */
    private function new (spaceObject : SpaceObjectNative, name : String) {
        this.spaceObject = spaceObject;
        this.name = name;
    }    

    /**
     *  Create index in space
     *  @param name - index name
     *  @param options - index create options
     *  @return Index
     */
    public function createIndex (name : String, ?options : IndexOptions) : Index {
        var idx : IndexNative = null;

        if (options != null) {
            var table : Dynamic = Convert.SerializeToLua (options);
            trace (table);
            idx = spaceObject.create_index (name, table);
        } else {
            idx = spaceObject.create_index (name);
        }
                
        return new Index (idx, name);
    }

    /**
     *  Insert array of data in space
     *  @param tuple - tuple
     *  @return replaced Tuple    
     */
    public inline function insert (tuple : Tuple) : Tuple {
        return spaceObject.insert (tuple);
    }

    /**
     *  Insert some object
     *  @param obj - object
     *  @return Dynamic
     */
    public function insertObject (obj : Dynamic) {
        var object = Convert.SerializeToLua (obj);
        spaceObject.insert (object);
    }

    /**
     *  Select tuples by key
     *  @param key - scalar type or tuple of key parts
     *  @return Tuple
     */
    public function select (?key : KeyType) : Array<Tuple> {
        var tables = {
            if (key != null) {
                var table = Convert.SerializeToLua (key);
                spaceObject.select (table);
            } else {
                spaceObject.select ();
            }
        };

        return {
            var res = new Array<Tuple> ();
            AnyTable.foreachi (tables, function(i,val,e) {
                var tab = val.totable ();                
                res.push (tab);
            });
            res;           
        }
    }

    /**
     *  Get one record
     *  @param key - scalar type or tuple of key parts
     *  @return Array<Dynamic>
     */
    public function get (key : KeyType) : Tuple {
        return {
            var table = Convert.SerializeToLua (key);
            var tup = spaceObject.get (table);
            if (tup != null) {
                tup;
            } else {
                null;
            }            
        }        
    }

    /**
     *  Drop space
     */
    public inline function drop ()  {
        spaceObject.drop ();
    }

    /**
     *  Rename space
     */
    public inline function rename (name : String)  {
        spaceObject.rename (name);
        this.name = name;
    }

    /**
     *  Replace tuple
     *  @param tuple - tuple   
     *  @return replaced Tuple  
     */
    public inline function replace (tuple : Tuple) : Tuple {
        return spaceObject.replace (tuple);
    }

    /**
     *  Replace tuple
     *  @param tuple - tuple  
     *  @return replaced Tuple    
     */
    public inline function put (tuple : Tuple) : Tuple {
        return spaceObject.put (tuple);
    }

    /**
     *  Update tuple
     *  @param key - scalar type or tuple of key parts
     *  @param query - array of query for update    
     *  @return updated Tuple 
     */
    public inline function update (key : KeyType, query : Array<UpdateQuery>) : Tuple {
        var keyTable = Convert.SerializeToLua (key);
        var table = Convert.SerializeToLua (query);
        return spaceObject.update (keyTable, table);
    }

    /**
     *  Update or insert data
     *  @param tuple - tuple to update/insert
     *  @param query - array of query for update
     *  @return inserted Tuple
     */    
    public function upsert (tuple : Tuple, query : Array<UpdateQuery>) : Tuple {        
        var table = Convert.SerializeToLua (query);
        return spaceObject.upsert (tuple, table);
    }

    /**
     *  [Description]
     *  @param key - 
     *  @return Tuple
     */
    public function delete (key : KeyType) : Tuple {
        var table = Convert.SerializeToLua (key);
        return spaceObject.delete (table);
    }

    /**
     *  Count tuples
     *  @param key - 
     *  @param iterator - 
     *  @return Int
     */
    public function count (?key : KeyType, ?iterator : AnyTable) : Int {
        return 0;
    }

    /**
     *  Total tuple count
     *  @return Int
     */
    public inline function len () : Int {
        return spaceObject.len ();
    }

    /**
     *  Delete all tuples in space
     */
    public inline function truncate () : Void {
        spaceObject.truncate ();
    }

    /**
     *  Insert array of data in space with autoincrement of primary key
     *  @param tuple - tuple
     *  @return inserted Tuple
     */
    public inline function auto_increment (tuple : Tuple) : Tuple {        
        return spaceObject.auto_increment (tuple);
    }
}