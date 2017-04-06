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

package tarantool.types;

import lua.Lua;
using StringTools;

abstract UInt64(Dynamic) {

    /**
     *  Constructor
     *  @param value - 
     */
    inline function new (value : Dynamic){
        this = value;
    }

    /**
     *  Add UInt64
     *  @param value - 
     *  @return UInt64
     */
    @:op(A + B) public inline function addUInt64 (value : UInt64) : UInt64 {
        return untyped __lua__("{0} + {1}", this, value);
    }

    /**
     *  Substract UInt64
     *  @param value - 
     *  @return UInt64
     */
    @:op(A - B) public inline function subUInt64 (value : UInt64) : UInt64 {
        return untyped __lua__("{0} - {1}", this, value);
    }

    /**
     *  Add float or int
     *  @param value - 
     *  @return UInt64
     */
    @:op(A + B) public inline function addFloat (value : Float) : UInt64 {
        return untyped __lua__("{0} + {1}", this, value);
    }

    /**
     *  Multyply float or int
     *  @param value - 
     *  @return UInt64
     */
    @:op(A * B) public inline function multyplyFloat (value : Float) : UInt64 {
        return untyped __lua__("{0} * {1}", this, value);
    }

    /**
     *  Divide float or int
     *  @param value - 
     *  @return UInt64
     */
    @:op(A / B) public inline function divideFloat (value : Float) : UInt64 {
        return untyped __lua__("{0} / {1}", this, value);
    }

    /**
     *  From float or int
     *  @param value - 
     *  @return UInt64
     */
    @:from public inline static function fromFloat (value : Float) : UInt64 {
        return new UInt64(value); 
    }        

    /**
     *  Convert to string
     */
    @:to public inline function toString () {
        var s = Lua.tostring(this);
        return s.replace ("ULL", "");
    }
}