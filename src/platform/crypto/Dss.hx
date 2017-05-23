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
 *  Dss types
 */
enum DssType {    
    Dss;
    Dss1;
}

/**
 *  For working with dss hash
 */
class Dss extends DigestData {    

    /**
     *  Dss calc function
     */
    var dssCalc : String -> String;

    /**
     *  Dss type
     */
    public var dssType (default, null) : DssType;

    
    /**
     *  Create instance of Dss
     */
    public static function createDss () : Dss {
        return new Dss (DssType.Dss);
    }

    /**
     *  Create instance of Dss1
     */
    public static function createDss1 () : Dss {
        return new Dss (DssType.Dss1);
    }

    /**
     *  Constructor
     */
    function new (dssType : DssType) {
        this.dssType = dssType;
        switch (dssType) {
            case DssType.Dss: dssCalc = Digest.dss;
            case DssType.Dss1: dssCalc = Digest.dss1;
            default: dssCalc = Digest.dss;
        }

        super (0);
    }

    /**
     *  Compute md4 hash from byte array
     *  @param data - some byte data
     *  @return ByteArray
     */
    override public inline function computeArray (data : ByteArray) : ByteArray {
        return ByteArray.fromString (dssCalc (data.toString ()));
    } 

    /**
     *  Compute md4 hash from string
     *  @param data - some byte array
     *  @return ByteArray
     */
    override public inline function computeString (data : String) : String {
        return dssCalc (data);        
    }
}