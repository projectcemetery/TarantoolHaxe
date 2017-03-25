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

package tarantool.util;

import lua.Table;

/**
 *  Immutable tuple of any data
 */
@:forward(toString)
abstract Tuple(Array<Dynamic>) from Array<Dynamic> to Array<Dynamic> {
    
    /**
     *  Constructor
     *  @param data - 
     */
    public function new (data : Array<Dynamic>) {
        this = data;
    }

    @:arrayAccess
    public inline function get(key:Int) {
        return this[key];
    }

    /**
     *  Copy tuple
     */
    public inline function copy () : Tuple {
        return new Tuple (this.copy ());
    }

    /**
     *  Get a slice of tuple
     *  @param pos - start pos
     *  @param len - slice len
     *  @return Tuple
     */
    public function slice( pos : Int, len : Int = 1) : Tuple {
        var res = this.slice (pos, pos + len);
        return new Tuple (res);
    }

    /**
     *  Return iterator
     *  @return Iterator<Dynamic>
     */
    public inline function iterator() : Iterator<Dynamic> {
		var cur_length = 0;
		return {
			hasNext : function() return cur_length < this.length,
			next : function() return this[cur_length++]
		}
	}

    /**
     *  Convert tuple to lua table
     *  @return AnyTable
     */
    @:to public inline function toTable () : AnyTable {        
        return Convert.SerializeToLua (this);
    }

    /**
     *  Convert table to tuple
     *  @param table - 
     *  @return Tuple
     */
    @:from public static inline function fromTable (table : AnyTable) : Tuple {
       return Convert.TableToTuple (table);
    }

    /**
     *  Convert tuple object to tuple
     *  @param table - 
     *  @return Tuple
     */
    @:from public static inline function fromTupleObject (table : ITupleObject) : Tuple {
       return Convert.tupleObjectToArray (table);
    }
}