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
import tarantool.crypto.Digest;

/**
 *  Sha types
 */
enum ShaType {    
    Sha0;
    Sha1;
    Sha224;
    Sha256;
    Sha384;
    Sha512;
}

/**
 *  For working with sha hash
 */
class Sha extends DigestData {

    /**
     *  Dss calc function
     */
    var shaCalc : String -> String;

    /**
     *  Dss type
     */
    public var shaType (default, null) : ShaType;

    /**
     *  Create instance of Sha0
     */
    public inline static function createSha () : Sha {
        return new Sha (ShaType.Sha0);
    }

    /**
     *  Create instance of Sha1
     */
    public inline static function createSha1 () : Sha {
        return new Sha (ShaType.Sha1);
    }

    /**
     *  Create instance of Sha224
     */
    public inline static function createSha224 () : Sha {
        return new Sha (ShaType.Sha224);
    }

    /**
     *  Create instance of Sha256
     */
    public inline static function createSha256 () : Sha {
        return new Sha (ShaType.Sha256);
    }

    /**
     *  Create instance of Sha384
     */
    public inline static function createSha384 () : Sha {
        return new Sha (ShaType.Sha384);
    }

    /**
     *  Create instance of Sha512
     */
    public inline static function createSha512 () : Sha {
        return new Sha (ShaType.Sha512);
    }

    /**
     *  Constructor
     */
    function new (shaType : ShaType) {
        this.shaType = shaType;
        switch (shaType) {
            case ShaType.Sha0: shaCalc = function(e : String) : String {
                return Digest.sha (e);
            }
            case ShaType.Sha1: shaCalc = function(e : String) : String {
                return Digest.sha1 (e);
            }
            case ShaType.Sha224: shaCalc = function(e : String) : String {
                return Digest.sha224 (e);
            }
            case ShaType.Sha256: shaCalc = function(e : String) : String {
                return Digest.sha256 (e);
            }
            case ShaType.Sha384: shaCalc = function(e : String) : String {
                return Digest.sha384 (e);
            }
            case ShaType.Sha512: shaCalc = function(e : String) : String {
                return Digest.sha512 (e);
            }
            default: shaCalc = function(e : String) : String {
                return Digest.sha (e);
            }
        }

        super (0);
    }

    /**
     *  Compute md4 hash from byte array
     *  @param data - some byte data
     *  @return ByteArray
     */
    override public inline function computeArray (data : ByteArray) : ByteArray {
        return ByteArray.fromString (shaCalc (data.toString ()));
    } 

    /**
     *  Compute md4 hash from string
     *  @param data - some byte array
     *  @return ByteArray
     */
    override public inline function computeString (data : String) : String {
        return shaCalc (data);
    }
}