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

package platform.ffi;

/**
 *  Some missing methods for lua.Ffi
 */

@:luaRequire("ffi")
extern class Ffi {

    /**
     *  Create some object
     *  @param q - query. Example uint8_t[?]
     *  @param p - params
     *  @return Dynamic
     */
    @:native("new")
    public static function create (q : String, p : Dynamic) : Dynamic;

    /**
     *  Cast object to type
     *  @param s - type. Example uint8_t*
     *  @param d - object to cast
     *  @return Dynamic
     */

    @:native("cast")
    public static function castObj (s : String, d : Dynamic) : Dynamic;

    /**
     *  Create type
     *  @param s - type. Example: uint8_t*
     *  @return Dynamic
     */
    public static function typeof (s : String) : Dynamic;
}

/**
 *  Unsafe functions: memory manipulation
 */
@:native("p.Unsafe")
class Unsafe {

    /**
     *  Ffi for C functions
     */
    static var ffi : Dynamic;

    /**
     *  On class init
     */
    public static function __init__ () {
        var ffi = untyped require ('ffi');
        untyped __lua__ ('ffi.cdef [[
            void* malloc (size_t sizemem);
            void* realloc (void* ptr, size_t sizemem);
            void* memmove (void* dst, const void* src, size_t num);
            void free (void* ptr);
        ]]');
        Unsafe.ffi = ffi;
    }

    /**
     *  Create some object
     *  @param q - query. Example uint8_t[?]
     *  @param p - params
     *  @return Dynamic
     */
    public inline static function create (q : String, p : Dynamic) : Dynamic {
        return Ffi.create (q, p);
    }

    /**
     *  Allocate memory
     *  @param size - memory size
     */
    public inline static function malloc (size : Int) : Dynamic {        
        return untyped ffi.C["malloc"] (size);
    }

    /**
     *  Reallocate memory
     *  @param size - memory size
     */
    public inline static function realloc (ptr : Dynamic, size : Int) : Dynamic {
        return untyped ffi.C["realloc"] (ptr, size);
    }
    
    /**
     *  Move memory
     *  @param dst - destination
     *  @param src - source
     *  @param size - block size
     *  @return Dynamic
     */
    public inline static function memmove (dst : Dynamic, src : Dynamic, size : Int) : Dynamic {
        return untyped ffi.C["memmove"] (dst, src, size);
    }

    /**
     *  Free memory
     *  @param ptr - object to free
     */
    public inline static function free (ptr : Dynamic) {
        untyped ffi.C["free"] (ptr);
    }

    /**
     *  Add __gc function to object and bind it to onCollect
     *  @param object - some object
     *  @param onCollect - function that fires on __gc
     */
    public static function bindCollect (object : Dynamic, onCollect : Void -> Void) {

    }

    /**
     *  Cast object to type
     *  @param s - type. Example uint8_t*
     *  @param d - object to cast
     *  @return Dynamic
     */
    public inline static function castObj (s : String, d : Dynamic) : Dynamic {
        return Ffi.castObj (s, d);
    }

    /**
     *  Create type
     *  @param s - type. Example: uint8_t*
     *  @return Dynamic
     */
    public inline static function typeof (s : String) : Dynamic {
        return Ffi.typeof (s);
    }
}