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

import platform.io.BinaryData;
import platform.io.ByteArray;

/**
 *  Abstract class of coding and decoding data
 */
class CryptoCodec extends BinaryData {
    
    /**
     *  Encode collected data
     *  @return ByteArray
     */
    public function encode () : ByteArray {
        return ByteArray.fromString (encodeString (this.toString ()));
    }

    /**
     *  Decode collected data
     *  @return ByteArray
     */
    public function decode () : ByteArray {
        return ByteArray.fromString (decodeString (this.toString ()));
    }

    /**
     *  Encode bytes
     *  @param data - 
     *  @return ByteArray
     */
    public function encodeBytes (data : ByteArray) : ByteArray {
        throw "Not implemented";
    }

    /**
     *  Encode string
     *  @param data - 
     *  @return String
     */
    public function encodeString (data : String) : String {
        throw "Not implemented";
    }

    /**
     *  Decode bytes
     *  @param data - 
     *  @return ByteArray
     */
    public function decodeBytes (data : ByteArray) : ByteArray {
        throw "Not implemented";
    }
    
    /**
     *  Decode string
     *  @param data - 
     *  @return String
     */
    public function decodeString (data : String) : String {
        throw "Not implemented";
    }
}