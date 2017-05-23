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

/*import chocolate.Chocolate.App;
import chocolate.Request;
import chocolate.response.Response;
import zephyr.HtmlBuilder.*;*/

import tarantool.box.Box;
import lua.Table;
import tarantool.util.Convert;
import tarantool.types.query.UpdateQuery;
import tarantool.types.query.UpdateQueryBuilder;
//import tarantool.crypto.Digest;
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
import platform.ffi.Unsafe;
import platform.crypto.*;
import tarantool.digest.Digest;

class Test {

    static function tstBinaryData () {        
        var clock = tarantool.clock.Clock.thread64 ();
        for (i in 0...1) {
            var dat = new BinaryData (0, 100000);
            for (d in 0...100) {
                dat.addByte (41);
            }
            trace (dat.toString ());
        }

       var clock = (tarantool.clock.Clock.thread64 () - clock) / 1000;

       trace (clock); 
    }

    static function tstDigest () {        
        /*var clock = tarantool.clock.Clock.thread64 ();
        for (i in 0...1000) {
            tarantool.crypto.Digest.sha512 ("12");            
        }
        var clock = (tarantool.clock.Clock.thread64 () - clock) / 1000;
        trace (clock); */

        var clock = tarantool.clock.Clock.thread64 ();        
        var base64 = Base64.create ();

        for (i in 0...10) {
            trace (base64.decodeString ("R09PT0Q="));
        }
        var clock = (tarantool.clock.Clock.thread64 () - clock) / 1000;
        trace (clock);
    }

    static function main() {        
       tstDigest ();       
       Sys.stdin ().read (1);
       Unsafe.collect ();
    }    
}