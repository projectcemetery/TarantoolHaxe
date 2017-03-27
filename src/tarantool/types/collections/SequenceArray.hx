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

package tarantool.types.collections;

/**
 *  Join all data in one array
 */
@:native("t.SequenceArray")
@:forward
abstract SequenceArray<T> (SequenceArrayInternal<T>) {

    /**
     *  Constructor
     */
    public function new (arr : SequenceArrayInternal<T>) {
        this = arr;
    }

    @:from public static function fromArray<T> (arr : Array<T>) {
        return new SequenceArray<T> (new SequenceArrayInternal(arr));
    }

    @:to public function toArray<T> () : Array<T> {
        return this.array;
    }
}

/**
 *  Internal SequenceArray for type checking
 */
@:native("t.SequenceArrayInternal")
class SequenceArrayInternal<T> {
    public var array(default, null) :  Array<T>;

    public function new (arr : Array<T>) {
        array = arr;
    }
}