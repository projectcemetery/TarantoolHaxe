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

package platform.io;

import platform.ffi.Ffi;

/**
 *  Iterator for uint8 array
 */
class UInt8ArrayIterator {
    
    /**
     *  Current position
     */
    var pos : Int;

    /**
     *  Uint8 array
     */
    var owner : UInt8Array;

    /**
     *  Constructor
     *  @param owner - 
     */
    public function new (owner : UInt8Array) {
        this.owner = owner;
        pos = 0;
    }

    /**
     *  Check array has next element
     *  @return Bool
     */
    public function hasNext() : Bool {
        return pos < owner.length;
    }

    /**
     *  Return next
     *  @return Int
     */
    public function next() : Int {
        var b = owner.get (pos);
        pos += 1;
        return b;
    }
}

/**
 *  Array of unsigned byte based on luajit ffi.
 *  For small memory footprint.
 */
class UInt8Array {

    /**
     *  Native uint8_t* data
     */
    var data : Dynamic;

    /**
     *  Size of array
     */
    public var length (default, null) : Int;

    /**
     *  Convert string to uint8 array
     *  @param s - 
     */
    public static function fromString (s : String) : UInt8Array {
        var arr = new UInt8Array (s.length);
        lua.Ffi.copy (arr.data, s, s.length);
        return arr;
    }

    /**
     *  Constructor
     *  @param size - 
     */
    public function new (size : Int) {
        this.length = size;
        data = Ffi.create ("uint8_t[?]", size);
    }

    /**
     *  Get data from array
     *  @param k - 
     */    
    public inline function get (k : Int) {
        return data[k];
    }

    /**
     *  Set data for array
     *  @param k - 
     *  @param v - 
     */    
    public inline function set (k : Int, v : Int) : Int {
        data[k] = v;
        return v;
    }

    /**
     *  Return iterator for array
     *  @return Iterator<Int>
     */
    public function iterator () : UInt8ArrayIterator {
        return new UInt8ArrayIterator (this);
    }

    /**
     *  Concat two array
     *  @param array - 
     *  @return UInt8Array
     */
    public function concat (array : UInt8Array) : UInt8Array {
        var len = length + array.length;
        var arr = new UInt8Array (len);
        lua.Ffi.copy (arr.data, data, length);
        lua.Ffi.copy (arr.data + length, array.data, array.length);
        return arr;
    }
}