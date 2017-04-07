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

package tarantool.uuid; 

import haxe.io.Bytes;
import tarantool.uuid.native.UuidNative;
import tarantool.uuid.native.UuidObjectNative;

/**
 *  Unique id manipulation
 */
class Uuid {

    /**
     *  Native uuid object
     */
    var uuidNative : UuidObjectNative;

    /**
     *  Constructor
     */
    public function new () {
        uuidNative = UuidNative.create ();
    }

    /**
     *  Convert uuid to 16-byte string
     *  @return String
     */
    public inline function toBytes () : Bytes {        
        return Bytes.ofString (uuidNative.bin ());
    }

    /**
     *  Convert uuid to 36-byte string
     *  @return String
     */
    public inline function toString () : String {
        return uuidNative.str ();
    }
}