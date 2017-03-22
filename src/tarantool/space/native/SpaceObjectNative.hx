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

import tarantool.index.native.IndexNative;
import lua.Table;

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
     *  Create index object
     *  @return Dynamic
     */
    public function create_index (name : String, ?options : AnyTable) : IndexNative;

    /**
     *  Insert data
     *  @param data - some data
     *  @return AnyTable
     */
    public function insert (tuple : AnyTable) : AnyTable;
    
    /**
     *  Select data by one or more key
     *  @param key - array of keys
     *  @return array of tuples
     */
    public function select (?key : AnyTable) : AnyTable;

    /**
     *  Get data by one or more key
     *  @param key - array of keys
     *  @return one tuple
     */
    public function get (key : AnyTable) : AnyTable;

    /**
     *  Drop space
     */
    public function drop () : Void;

    /**
     *  Rename space
     */
    public function rename (name : String) : Void;

    /**
     *  Replace tuple
     *  @param data - tuple
     *  @return AnyTable
     */
    public function replace (tuple : AnyTable) : AnyTable;

    /**
     *  Replace tuple
     *  @param data - tuple
     *  @return AnyTable
     */
    public function put (tuple : AnyTable) : AnyTable;

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

    /**
     *  Delete tuple
     *  @param key - 
     *  @return deleted tuple
     */
    public function delete (key : AnyTable) : AnyTable;

    /**
     *  Count tuples
     *  @param key - one or more key
     *  @param iterator - comparison method
     *  @return tuple count
     */
    public function count (?key : AnyTable, ?iterator : AnyTable) : Int;

    /**
     *  Total tuple count
     *  @return Int
     */
    public function len () : Int;

    /**
     *  Delete all tuples in space
     */
    public function truncate () : Void;

    /**
     *  Insert a new tuple using an auto-increment primary key. 
     *  @param data - some data
     *  @return AnyTable
     */
    public function auto_increment (tuple : AnyTable) : AnyTable;
}