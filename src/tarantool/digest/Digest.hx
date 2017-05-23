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

package tarantool.digest;

/**
 *  Tarantool digest module. Only functions that is not exists in crypto module
 */
class Digest {

    /**
     *  Digest module
     */
    static var module : Dynamic;

    /**
     *  On class init
     */
    static function __init__ () {
        module = untyped require ("digest");
    }

    /**
     *  Create crc32 object
     *  @return Dynamic
     */
    public static function crc32new () : Dynamic {
        var module = module;
        return untyped __lua__ ("module.crc32.new ()");
    }

    /**
     *  Create decode base64 string
     *  @return Dynamic
     */
    public static function base64decode (data : String) : String {
        var module = module;
        return untyped __lua__ ("module.base64_decode (data)");
    }

    /**
     *  Create encode string to base64
     *  @return Dynamic
     */
    public static function base64encode (data : String) : String {
        var module = module;
        return untyped __lua__ ("module.base64_encode (data)");
    }
}