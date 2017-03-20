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
import tarantool.index.Index;

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
        var space = new Space ();
        space.name = name;
        space.spaceObject = obj;
        return space;
    }

    /**
     *  Get space by name
     *  @param name - name of space
     *  @return Space
     */
    public inline static function get (name : String) : Space {
        var space = new Space ();
        space.name = name;
        space.spaceObject = untyped box.space[name];
        return space;
    }

    /**
     *  Create index in space
     */
    public inline function createIndex (name : String) : Index {
        var obj = new Index ();
        obj.name = name;
        obj.indexObject = spaceObject.create_index (name);
        return obj;
    }

    /**
     *  Disable public constructor
     */
    private function new () {}    
}