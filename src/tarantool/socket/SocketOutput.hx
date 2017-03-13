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

package tarantool.socket;

import haxe.io.Output;
import haxe.io.Bytes;
import tarantool.socket.native.NativeSocketObject;

/**
 *  Output for socket
 */
class SocketOutput extends Output {
    /**
     *  Native socket object
     */
    private var _sock : NativeSocketObject;

    /**
     *  Constructor
     *  @param s - native socket object
     */
    public function new (s : NativeSocketObject) {
        _sock = s;
    }

    /**
     *  Write one byte
     *  @param c - 
     */
    public override function writeByte(c : Int) : Void {
        var s = haxe.Utf8.char (c);
        _sock.write (s);
    }

    /**
     *  Write string
     *  @param s - string to write
     */
    public override function writeString( s : String ) {
        _sock.write (s);
    }

    /**
     *  Write bytes
     *  @param s - bytes to write
     *  @param pos - position
     *  @param len - length
     *  @return Int
     */
    public override function writeBytes( s : Bytes, pos : Int, len : Int ) : Int {
        var str = s.getString(pos, len);
        return _sock.write (str);
    }
}