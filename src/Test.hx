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

import chocolate.Chocolate.App;
import chocolate.Request;
import chocolate.response.Response;
import zephyr.HtmlBuilder.*;

import tarantool.box.Box;
import lua.Table;
import tarantool.util.Convert;
import tarantool.types.query.UpdateQuery;
import tarantool.types.query.UpdateQueryBuilder;
import tarantool.crypto.Digest;
import tarantool.clock.Clock;
import tarantool.clock.native.ClockNative;
import tarantool.types.UInt64;
import tarantool.fiber.native.ChannelNative;
import tarantool.uuid.Uuid;
import platform.io.ByteArray;
import platform.io.input.TextReader;
import platform.net.TcpSocket;
import platform.ffi.Unsafe;
import platform.io.BinaryData;

class Test {
    static function main() {
        /*var sock = new TcpSocket ();
        sock.bind ("localhost", 8881, function (s : TcpSocket) {
            var textReader = new TextReader (s.input);
            trace (textReader.readLine ());
        });        */
       
       //var data1 = new BinaryData ();
       //var data2 = new BinaryData ();              

       //var dat = new BinaryData ();
       var bb = new haxe.io.BytesBuffer ();

       var clock = tarantool.clock.Clock.thread64 ();
       for (i in 0...100000) {           
           //dat.addByte (1);
           
           bb.addByte (33);
       }

       var clock = (tarantool.clock.Clock.thread64 () - clock) / 1000;

       trace (clock);       
       Sys.stdin ().read (1);
       trace (bb.length);
       //trace (data1.length);
       //trace (data2.length);
    }    
}