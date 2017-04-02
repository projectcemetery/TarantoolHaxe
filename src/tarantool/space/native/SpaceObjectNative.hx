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

package tarantool.space.native;

import tarantool.util.ScalarType;
import tarantool.index.native.IndexNative;
import lua.Table;
import lua.Lua;

@:native("t.SpaceObjectNative")
/**
 *  Extern for tarantool space object
 */
extern class SpaceObjectNative {

    /**
     *  Id of space
     */
    public var id : Int;

    /**
     *  Is space enabled or disabled
     */
    public var enabled : Bool;

    /**
     *  Required number of fields
     */
    public var field_count : Int;

    /**
     *  All indexes
     */
    public var index : AnyTable;

    /**
     *  Insert a new tuple using an auto-increment primary key. 
     *  @param data - some data
     *  @return AnyTable
     */
    public function auto_increment (tuple : AnyTable) : AnyTable;

    /**
     *  Number of bytes in the space
     *  @return Int
     */
    public function bsize () : Int;

    /**
     *  Count tuples
     *  @param key - one or more key
     *  @param iterator - comparison method
     *  @return tuple count
     */
    public function count (?key : AnyTable, ?iterator : AnyTable) : Int;

    /**
     *  Create index object
     *  @return Dynamic
     */
    public function create_index (name : String, ?options : AnyTable) : IndexNative;    

    /**
     *  Delete tuple
     *  @param key - 
     *  @return deleted tuple
     */
    public function delete (key : AnyTable) : AnyTable;

    /**
     *  Drop space
     */
    public function drop () : Void;

    /**
     *  Get data by one or more key
     *  @param key - array of keys
     *  @return one tuple
     */
    public function get (key : AnyTable) : AnyTable;    

    /**
     *  Insert data
     *  @param data - some data
     *  @return AnyTable
     */
    public function insert (tuple : AnyTable) : AnyTable;
    
    /**
     *  Total tuple count
     *  @return Int
     */
    public function len () : Int;

    /**
     *  Trigger on replace data
     *  The trigger-function will be executed whenever a replace or insert or update or upsert or delete
     *  onReplace = function (old : AnyTable, new : AnyTable)
     */
    public function on_replace (call : AnyTable -> AnyTable -> Void) : Void;

    /**
     *  Search for a tuple or a set of tuples in the given space, and allow iterating over one tuple at a time.
     *  @return iterator
     */
    public function pairs (?key : AnyTable, ?iterator : AnyTable) : PairsResult<ScalarType, Dynamic>;

    /**
     *  Replace tuple
     *  @param tuple - tuple
     *  @return AnyTable
     */
    public function put (tuple : AnyTable) : AnyTable;

    /**
     *  Rename space
     */
    public function rename (name : String) : Void;

    /**
     *  Replace tuple
     *  @param tuple - tuple
     *  @return AnyTable
     */
    public function replace (tuple : AnyTable) : AnyTable;
    
    /**
     *  Turn on/off replace trigger
    */
    public function run_triggers (value : Bool) : Void

    /**
     *  Select data by one or more key
     *  @param key - array of keys
     *  @return array of tuples
     */
    public function select (?key : AnyTable) : AnyTable;                

    /**
     *  Delete all tuples in space
     */
    public function truncate () : Void;    

    /**
     *  Update tuple
     *  @param key - one or more key
     *  @param query - {{operator, field_no, value}, ...}
     *  @return updated tuple
     */
    public function update (key : AnyTable, query : AnyTable) : AnyTable;

    /**
     *  Update or insert tuple
     *  @param tuple - some tuple
     *  @param query - {{operator, field_no, value}, ...}
     *  @return updated/inserted tuple
     */
    public function upsert (tuple : AnyTable, query : AnyTable) : AnyTable;            
}