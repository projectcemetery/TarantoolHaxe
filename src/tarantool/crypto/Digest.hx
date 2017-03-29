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

package tarantool.crypto;

/**
 *  Digest algorothms
 */
@:native("t.digest")
class Digest {

    /**
     *  Crypto module
     */
    private static var module : Dynamic;

    /**
     *  On class init
     */
    private static function __init__ () {
        module = untyped require ("crypto");
    }

    /**
     *  Dss
     *  @param s - 
     *  @return String
     */
    public static function dss (s : String) : String {
        return untyped module.digest["dss"] (s);
    }

    /**
     *  Dss1
     *  @param s - some string
     *  @return String
     */
    public static function dss1 (s : String) : String {
        return untyped module.digest["dss1"] (s);
    }

    /**
     *  Md4
     *  @param s - some string
     *  @return String
     */
    public static function md4 (s : String) : String {
        return untyped module.digest["md4"] (s);
    }

    /**
     *  Md5
     *  @param s - some string
     *  @return String
     */
    public static function md5 (s : String) : String {
        return untyped module.digest["md5"] (s);
    }

    /**
     *  Mdc2
     *  @param s - some string
     *  @return String
     */
    public static function mdc2 (s : String) : String {
        return untyped module.digest["mdc2"] (s);
    }

    /**
     *  Ripemd160
     *  @param s - some string
     *  @return String
     */
    public static function ripemd160 (s : String) : String {
        return untyped module.digest["ripemd160"] (s);
    }
}