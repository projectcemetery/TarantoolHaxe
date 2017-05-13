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

package platform.net;

import platform.io.ByteArray;
import platform.io.output.ISocketOutput;
import tarantool.socket.native.NativeSocketObject;

/**
 *  Output for socket
 */
class SocketOutput implements ISocketOutput {

    /**
     *  Native socket object
     */
    private var sock : NativeSocketObject;

    /**
     *  Constructor
     *  @param s - native socket object
     */
    public function new (s : NativeSocketObject) {
        sock = s;
    }

    /**
     *  Write one byte
     *  @param data - byte
     */
    public function writeByte (data : Int) : Void {
        var s = String.fromCharCode (data);
        sock.write (s);
    }

    /**
     *  Write bytes to stream
     *  @param data - byte array
     *  @return Number of bytes written
     */
    public function writeBytes (data : ByteArray) : Int {
        var str = data.toString ();
        return sock.write (str);
    }

    /**
     *  Write string to stream
     *  @param data - some string
     */
    public function writeString (data : String) {
        sock.write (data);
    }

    /**
     *  Close stream
     */
    public function close () : Void {
        sock.close ();
    }
}