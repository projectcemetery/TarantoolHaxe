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

package platform.io.input;

/**
 *  Read binary data from input
 */
class BinaryReader implements IByteReadable {

    /**
     *  Data input
     */
    var input : IByteReadable;

    /**
     *  Constructor
     *  @param input - data input
     */
    public function new (input : IByteReadable) {
        this.input = input;
    }

    /**
     *  Read one byte
     *  @return Int
     */
    public inline function readByte () : Int {
        return input.readByte ();
    }

    /**
     *  Read bytes
     *  @param count - byte count to read
     *  @return ByteArray
     */
    public inline function readBytes (count : Int) : ByteArray {
        return input.readBytes (count);
    }

    /**
     *  Read bytes to buffer
     *  @param buffer - buffer to read
     *  @param pos - position to add bytes
     *  @param size - length of read
     *  @return Read count
     */
    public inline function readToBuffer (buffer : ByteArray, pos : Int, size : Int) : Int {
        return input.readToBuffer (buffer, pos, size);
    }
}