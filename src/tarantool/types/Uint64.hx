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

/**
 *  Internal Type for uint64_t
 */
class UInt64Internal {

    public var data : Any;

    public function new (data : Any) {
        this.data = data;
    }
}

/**
 *  Type for uint64_t
 *  Slow cause of class creation on every operation
 *  TODO : make fast
 */
abstract UInt64(UInt64Internal) from UInt64Internal to UInt64Internal {

    /**
     *  Wrap lua type
     *  @param dat - 
     *  @return UInt64
     */
    public static function fromLua (dat : Any) : UInt64 {        
        return new UInt64 (new UInt64Internal (dat));
    }

    /**
     *  Constructor
     *  @param dat - 
     */
    public function new (dat : UInt64Internal) {
        this = dat;
    }

    /**
     *  Add int
     *  @param dat - 
     *  @return UInt64
     */
    @:op(A + B)
    public function addInt ( dat : Int) : UInt64 {                
        var res = untyped (this.data + dat);
        return fromLua (res);
    }

    /**
     *  Substract int
     *  @param dat - 
     *  @return UInt64
     */
    @:op(A - B)
    public function substractInt ( dat : Int) : UInt64 {                
        var res = untyped (this.data - dat);
        return fromLua (res);
    }

    /**
     *  Mupltyply int
     *  @param dat - 
     *  @return UInt64
     */
    @:op(A * B)
    public function multInt ( dat : Int) : UInt64 {                
        var res = untyped (this.data * dat);
        return fromLua (res);
    }

    /**
     *  Div int
     *  @param dat - 
     *  @return UInt64
     */
    @:op(A / B)
    public function divInt ( dat : Int) : UInt64 {                
        var res = untyped (this.data / dat);
        return fromLua (res);
    }

    /**
     *  Convert to string
     *  @return String
     */
    public function toString () : String {
        return untyped tostring (this.data);
    }
}