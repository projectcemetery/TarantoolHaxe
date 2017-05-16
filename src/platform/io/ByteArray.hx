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

import platform.ffi.Unsafe;

/**
 *  Iterator for uint8 array
 */
class ByteArrayIterator {
    
    /**
     *  Current position
     */
    var pos : Int;

    /**
     *  Uint8 array
     */
    var owner : ByteArray;

    /**
     *  Constructor
     *  @param owner - 
     */
    public function new (owner : ByteArray) {
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
class ByteArray {

    /**
     *  Native uint8_t* data
     */
    @:allow(platform.io.BinaryData)
    var data : Dynamic;

    /**
     *  Size of array
     */
    public var length (default, null) : Int;

    /**
     *  Convert string to uint8 array
     *  @param s - 
     */
    public static function fromString (s : String) : ByteArray {
        var arr = new ByteArray (s.length);
        lua.Ffi.copy (arr.data, s, s.length);
        return arr;
    }

    /**
     *  Copy data of one array to another
     *  @param dst - destinstion array
     *  @param src - source array
     *  @param dstPos - start position in destination array
     *  @param srcPos - start position in source array
     *  @param len - length bytes copy
     */    
    public static function copy (dst : ByteArray, src : ByteArray, dstPos : Int, srcPos : Int, len : Int) {
        // TODO: check ranges
        lua.Ffi.copy (dst.data + dstPos, src.data + srcPos, len);
    }

    /**
     *  Copy data from string to array
     *  @param dst - 
     *  @param src - 
     *  @param pos - 
     *  @param len - 
     */    
    public static function copyString (dst : ByteArray, src : String, pos : Int) {
        lua.Ffi.copy (dst.data + pos, src);
    }    

    /**
     *  Constructor
     *  @param size - 
     */
    public function new (size : Int) {
        this.length = size;
        data = Unsafe.create ("uint8_t[?]", size);
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
    public function iterator () : ByteArrayIterator {
        return new ByteArrayIterator (this);
    }

    /**
     *  Concat two array
     *  @param array - 
     *  @return ByteArray
     */
    public function concat (array : ByteArray) : ByteArray {
        var len = length + array.length;
        var arr = new ByteArray (len);
        lua.Ffi.copy (arr.data, data, length);
        lua.Ffi.copy (arr.data + length, array.data, array.length);
        return arr;
    }    

    /**
     *  Get slice of array
     *  @param pos - start pos
     *  @param size - length of chunk
     *  @return ByteArray
     */
    public function slice (pos : Int, size : Int) : ByteArray {
        var cnt = pos + size;
        if (cnt >= length) {
            cnt = cnt - length;
        }

        if (cnt < 1) return null;

        var bytes = new ByteArray (cnt);
        ByteArray.copy (bytes, this, 0, 0, cnt);
        return bytes;
    }

    /**
     *  Return data of byte array as string
     *  @return String
     */
    public function toString () : String {
        return lua.Ffi.string (data, length);
		//return [for (i in 0...length) String.fromCharCode(get (i))].join("");
    }
}