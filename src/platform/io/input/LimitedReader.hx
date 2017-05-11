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
 *  Reader with size limit
 */
class LimitedReader implements ILimitedReadable {

    /**
     *  Data input
     */
    var input : IByteReadable;

    /**
     *  Size
     */
    public var length (default, null) : Int;

    /**
     *  Current pos
     */
    public var position (default, null) : Int; 

    /**
     *  Constructor
     *  @param input - data input
     */
    public function new (input : IByteReadable, length : Int) {
        this.input = input;
        this.length = length;
        position = 0;
    }

    /**
     *  Read one byte
     *  @return Int
     */
    public function readByte () : Int {
        if (position + 1 >= length) throw IoError.Eof;
        var data = input.readByte ();
        position += 1;
        return data;
    }

    /**
     *  Read bytes
     *  @param count - byte count to read
     *  @return ByteArray
     */
    public function readBytes (count : Int) : ByteArray {
        var cnt = position + count;
        if (cnt >= length) {
            cnt = cnt - length;
        }

        if (cnt < 1) throw IoError.Eof;
        var data = input.readBytes (cnt);
        position += data.length;
        return data;
    }

    /**
     *  Read bytes to buffer
     *  @param buffer - buffer to read
     *  @param pos - position to add bytes
     *  @param size - length of read
     *  @return Read count
     */
    public function readToBuffer (buffer : ByteArray, pos : Int, size : Int) : Int {
        var cnt = pos + size;
        if (cnt >= length) {
            cnt = length - cnt;
        }

        if (cnt < 1) throw IoError.Eof;

        var count = input.readToBuffer (buffer, pos, cnt);
        position = pos;
        position += count;
        return count;
    }

    /**
     *  Read all data from current position to end
     */
    public function readToEnd () : ByteArray {
        var cnt = length - position;
        if (cnt < 1) throw IoError.Eof;
        var data = new ByteArray (cnt);
        // TODO: check all is read
        readToBuffer (data, position, cnt);
        return data;
    }
}