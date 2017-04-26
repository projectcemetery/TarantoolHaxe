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

package tarantool.types.iterators;

/**
 *  Iterator types for bitset key
 */
enum BitsetIteratorType {

    /**
     *  All index keys match. Tuples are returned in their order within the space.
     */
    All;

    /**
     *  If an index key is equal to a bitset value, it matches. 
     *  Tuples are returned in their order within the space. This is the default.
     */
    Eq;

    /**
     *  If all of the bits which are 1 in the bitset value are 1 in the index key, it matches. 
     *  Tuples are returned in their order within the space.
     */
    BitsAllSet;

    /**
     *  If any of the bits which are 1 in the bitset value are 1 in the index key, it matches. 
     *  Tuples are returned in their order within the space.
     */
    BitsAnySet;

    /**
     *  If all of the bits which are 1 in the bitset value are 0 in the index key, it matches. 
     *  Tuples are returned in their order within the space.
     */
    BitsAllNotSet;
}