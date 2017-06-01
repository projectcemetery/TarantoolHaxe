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

import platform.io.input.ISocketInput;
import platform.io.ByteArray;

/**
 *  Native object must have these functions
 */
typedef NativeReadSocket = {
    public function read (limit : haxe.extern.EitherType<Int,String>, ?timeout : Int) : String;
    public function close () : Void;
}

/**
 *  Output for socket
 */
class SocketInput implements ISocketInput {
    
    /**
     *  Native socket object
     */
    var sock : NativeReadSocket;

    /**
     *  Constructor
     *  @param s - native socket object
     */
    public function new (s : NativeReadSocket) {
        sock = s;
    }

    /**
     *  Read one byte
     *  @return Int
     */
    public function readByte () : Int {
        var dat = sock.read (1);
        if (dat == null || dat.length < 1) throw SocketError.Disconnect;
        return StringTools.fastCodeAt (dat, 0);
    }

    /**
     *  Read bytes
     *  @param count - byte count to read
     *  @return ByteArray
     */
    public function readBytes (count : Int) : ByteArray {
        var dat = sock.read (count);
        if (dat == null || dat.length < 1) throw SocketError.Disconnect;
        return ByteArray.fromString (dat);
    }

    /**
     *  Read line from stream
     *  @return String
     */
    public function readLine () : String {
        var dat = sock.read ("\n");
        if (dat == null || dat.length < 1) throw SocketError.Disconnect;
        return dat;
    }

    /**
     *  Close stream
     */
    public inline function close () : Void {
        sock.close ();
    }
}