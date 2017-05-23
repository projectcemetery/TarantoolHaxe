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
 *  Abstract digest data manipulation
 */
class DigestData extends BinaryData {
    
    /**
     *  Complete add data and compute hash
     */
    public function compute () : ByteArray {
        // TODO: too many copy
        return ByteArray.fromString (computeString (this.toString ()));
    }

    /**
     *  Compute hash from byte array
     *  @param data - some byte data
     *  @return ByteArray
     */
    public function computeArray (data : ByteArray) : ByteArray {
        throw "Not implemented";
    } 

    /**
     *  Compute hash from string
     *  @param data - some byte array
     *  @return ByteArray
     */
    public function computeString (data : String) : String {
        throw "Not implemented";
    }
}