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

package platform.crypto;

import platform.io.ByteArray;
import platform.io.BinaryData;
import tarantool.digest.Digest;

/**
 *  For working with crc32
 */
class Crc32 extends DigestData {

    /**
     *  Native crc32 object
     */
    var crc32 : Dynamic;

    /**
     *  Array for data. For fast computeString
     */
    var array : ByteArray;

    /**
     *  Create instance of crc32 hash
     */
    public static function create () : Crc32 {
        return new Crc32 ();
    }

    /**
     *  Constructor
     */
    function new () {
        super (0);
        crc32 = Digest.crc32new ();
        array = new ByteArray (4);
    }

    /**
     *  Compute collected data to UInt32
     *  @return Int
     */
    public inline function computeUInt32 () : Int {
        crc32.clear ();
        crc32.update (toString ());
        return crc32.result ();
    }

    /**
     *  Compute crc32 hash from byte array
     *  @param data - some byte data
     *  @return ByteArray
     */
    override public inline function computeArray (data : ByteArray) : ByteArray {
        crc32.clear ();
        crc32.update (data.toString ());
        var res = crc32.result ();
        var array = new ByteArray (4);
        BinaryData.SetUInt32 (res, array);
        return array;
    } 

    /**
     *  Compute crc32 hash from string
     *  @param data - some byte array
     *  @return ByteArray
     */
    override public inline function computeString (data : String) : String {
        crc32.clear ();
        crc32.update (data);
        var res = crc32.result ();
        BinaryData.SetUInt32 (res, array);
        return array.toString ();
    }

    /**
     *  Compute array to uint32
     *  @param data - 
     *  @return Int
     */
    public inline function computeArrayToUInt32 (data : ByteArray) : Int {
        crc32.clear ();
        crc32.update (data.toString ());
        return crc32.result ();
    }

    /**
     *  Compute array to uint32
     *  @param data - 
     *  @return Int
     */
    public inline function computeStringToUInt32 (data : String) : Int {
        crc32.clear ();
        crc32.update (data);
        return crc32.result ();
    }
}