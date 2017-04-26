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
enum RtreeIteratorType {

    /**
     *  All keys match. Tuples are returned in their order within the space.
     */
    All;

    /**
     *  If all points of the rectangle-or-box defined by the search value are the same as the rectangle-or-box defined by the index key, it matches. 
     *  Tuples are returned in their order within the space. 
     *  “Rectangle-or-box” means “rectangle-or-box as explained in section about RTREE”. This is the default.
     */
    Eq;

    /**
     *  If all points of the rectangle-or-box defined by the search value are within the rectangle-or-box defined by the index key, it matches. 
     *  Tuples are returned in their order within the space.
     */
    Gt;

    /**
     *  If all points of the rectangle-or-box defined by the search value are within, or at the side of, the rectangle-or-box defined by the index key, it matches. 
     *  Tuples are returned in their order within the space.
     */
    Ge;

    /**
     *  If all points of the rectangle-or-box defined by the index key are within the rectangle-or-box defined by the search key, it matches. 
     *  Tuples are returned in their order within the space.
     */
    Lt;

    /**
     *  If all points of the rectangle-or-box defined by the index key are within, or at the side of, the rectangle-or-box defined by the search key, it matches. 
     *  Tuples are returned in their order within the space.
     */
    Le;

    /**
     *  If some points of the rectangle-or-box defined by the search value are within the rectangle-or-box defined by the index key, it matches. 
     *  Tuples are returned in their order within the space.
     */
    Overlaps;

    /**
     *  If some points of the rectangle-or-box defined by the defined by the key are within, or at the side of, defined by the index key, it matches. 
     *  Tuples are returned in order: nearest neighbor first.
     */
    Neighbor;
}