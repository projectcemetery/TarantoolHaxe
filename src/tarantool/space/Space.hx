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
import tarantool.index.Index;
import tarantool.util.Convert;
import tarantool.index.IndexOptions;

/**
 *  Tarantool space
 */
class Space {
    private var spaceObject : SpaceObjectNative;

    /**
     *  Space name
     */
    public var name (default, null) : String;

    /**
     *  Create new space
     *  @param name - 
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
    public inline static function get (name : String) : Space {
        var obj = untyped box.space[name];
        return new Space (obj, name);
    }

    /**
     *  Create index in space
     */
    public function createIndex (name : String, ?options : IndexOptions) : Index {
        var idx : IndexNative = null;

        if (options != null) {
            var table : Dynamic = Convert.SerializeToLua (options);
            idx = spaceObject.create_index (name, table);
        } else {
            idx = spaceObject.create_index (name);
        }
                
        return new Index (idx, name);
    }

    /**
     *  Insert array of data in space
     */
    public function insert (data : Array<Dynamic>) {
        var table = Convert.ArrayToTable (data);
        spaceObject.insert (table);
    }

    /**
     *  Insert array of data in space with autoincrement of primary key
     */
    public function auto_increment (data : Array<Dynamic>) {
        var table = Convert.ArrayToTable (data);
        spaceObject.auto_increment (table);
    }

    /**
     *  Constructor
     */
    private function new (spaceObject : SpaceObjectNative, name : String) {
        this.spaceObject = spaceObject;
        this.name = name;
    }    
}