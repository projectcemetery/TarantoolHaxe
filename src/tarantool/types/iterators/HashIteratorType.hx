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
 *  Iterator types for Hash key
 */
enum HashIteratorType {

    /**
     *  All index keys match. 
     *  Tuples are returned in ascending order by hash of index key, which will appear to be random.
     */
    All;

    /**
     *  The comparison operator is ‘==’ (equal to). If an index key is equal to a search value, it matches. 
     *  The number of returned tuples will be 0 or 1. This is the default.
     */
    Eq;

    /**
     *  The comparison operator is ‘>’ (greater than). 
     *  If a hash of an index key is greater than a hash of a search value, it matches. 
     *  Tuples are returned in ascending order by hash of index key, which will appear to be random. 
     *  Provided that the space is not being updated, one can retrieve all the tuples in a space, N tuples at a time, 
     *  by using {iterator=’GT’, limit=N} in each search, and using the last returned value 
     *  from the previous result as the start search value for the next search.
     */
    Gt;
}