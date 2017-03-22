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

package tarantool.index;

/**
 *  Type of index field
**/
@:enum
abstract IndexFieldType(String) from String to String {
    /**
     *  Unsigned integers between 0 and 18446744073709551615, about 18 quintillion.
     *  Legal in memtx TREE or HASH indexes, and in vinyl TREE indexes
    **/
    var Unsigned = "unsigned";

    /**
     *  Any set of octets, up to the maximum length. May also be called ‘str’. 
     *  Legal in memtx TREE or HASH or BITSET indexes, and in vinyl TREE indexes
    **/
    var String = "string";

    /**
     *  Integers between -9223372036854775808 and 18446744073709551615. May also be called ‘int’.
     *  Legal in memtx TREE or HASH indexes, and in vinyl TREE indexes.
    **/
    var Integer = "integer";

    /**
     *  Integers between -9223372036854775808 and 18446744073709551615, single-precision floating point numbers, or double-precision floating point numbers. 
     *  Legal in memtx TREE or HASH indexes, and in vinyl TREE indexes.
    **/    
    var Number = "number";

    /**
     *  Array of integers between -9223372036854775808 and 9223372036854775807. Legal in memtx RTREE indexes
    **/
    var Array = "array";

    /**
     *  Booleans (true or false), or integers between -9223372036854775808 and 18446744073709551615, or single-precision floating point numbers, or double-precison floating-point numbers, or strings. 
     *  When there is a mix of types, the key order is: booleans, then numbers, then strings. 
     *  Legal in memtx TREE or HASH indexes, and in vinyl TREE indexes
    **/
    var Scalar = "scalar";
}