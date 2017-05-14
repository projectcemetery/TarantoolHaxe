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
 *  For working with binary data in memory
 */
class BinaryData {

    /**
     *  Size for buffer incement
     */
    var incrementSize : Int = 10000;
    
    /**
     *  Total size of allocated memory
     */
    var size : Int;

    /**
     *  Memory for data
     */
    var buffer : Dynamic;

    /**
     *  Length of buffer
     */
    public var length (default, null) : Int;
    
    /**
     *  Resize buffer
     *  @param newsize - 
     */
    function resize (newsize : Int) {
        if (buffer == null) {
            buffer = Unsafe.castObj ("uint8_t*", Unsafe.malloc (newsize));
        } else {
            buffer = Unsafe.castObj ("uint8_t*", Unsafe.realloc (buffer, newsize));
        }
        
        size = newsize;
    }

    /**
     *  Add size of buffer by incrementSize
     */
    function incSize (?incement : Int) {
        var inc = if (incement != null) incement else incrementSize;
        resize (size + inc);
    }
    
    /**
     *  Insert hole in buffer for data
     *  @param pos - position
     *  @param len - length
     */
    function insertSize (pos : Int, len : Int) {
        var ln = length + len;
        if (ln > size) resize (ln + incrementSize);
        var sz = length - pos;                
        Unsafe.memmove (buffer + pos + len, buffer + pos, sz);
        length += len;
    }

    /**
     *  Prepare byte array size
     */
    inline function prepareSize (needSize : Int) {
        if (length + needSize >= size) {                        
            incSize (if (needSize >= incrementSize) needSize else incrementSize);
        }
    }

    /**
     *  Constructor
     */
    public function new (?startSize : Int, ?increment : Int) {
        size = 0;
        length = 0;
        if (increment != null && increment > 0) incrementSize = increment;        
        if (startSize != null) {
            resize (startSize);
        } else {
            incSize ();
        }
    }

// BYTE

    /**
     *  Get byte by position
     *  @param pos - position of byte
     *  @return Int
     */
    public function getByte (pos : Int) : Int {
        return buffer[pos];
    }

    /**
     *  Append byte
     *  @param data - byte
     */
    public function addByte (data : Int) {
        if (length >= size) incSize ();
        setByte (length, data);
        length += 1;
    }

    /**
     *  Insert byte
     *  @param data - byte
     */
    public function insertByte (pos : Int, data : Int) {
        insertSize (pos, 1);
        setByte (pos, data);
    }    

    /**
     *  Set byte at position
     *  @param data - byte
     */
    public inline function setByte (pos : Int, data : Int) {
        buffer[pos] = data;
    }
    
// BYTES

    /**
     *  Get all bytes from binary data
     *  @return ByteArray
     */
    public function getBytes () : ByteArray {
        // TODO: remove copy. Do better
        var data = new ByteArray (length);
        lua.Ffi.copy (data.data, buffer, length);
        return data;
    }

    /**
     *  Add bytes
     *  @param data - byte array
     */
    public function addBytes (data : ByteArray) {
        prepareSize (data.length);
        lua.Ffi.copy (buffer + length, data.data, data.length);
        length += data.length;
    }

// STRING

    /**
     *  Write string to stream
     *  @param data - some string
     */
    public function addString (data : String) {
        incSize (data.length);        
        lua.Ffi.copy (buffer + length, data, data.length);
        length += data.length;
    }


    /**
     *  Return data of byte array as string
     *  @return String
     */
    public function toString () : String {
		return [for (i in 0...length) String.fromCharCode(getByte (i))].join("");
    }
}