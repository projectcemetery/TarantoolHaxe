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

import tarantool.socket.NativeSslSocket;
import tarantool.socket.NativeSslSocketObject;

/**
 *  For working with ssl socket client and server
 */
class SslSocket extends AbstractTcpSocket {    

    /**
     *  Native ssl socket object
     */
    var sock : NativeSslSocketObject;

    /**
     *  Bind native socket object
     */
    private function assignSocket (s : NativeSslSocketObject) : Void {
        sock = s;
        /*var nameTable = sock.name ();
        var host = untyped nameTable["host"];
        var port = untyped nameTable["port"];*/
        //peer = new Peer (host, port);
        input = new SocketInput (sock);
        output = new SocketOutput (sock);        
    }

    /**
     *  Constructor
     */
    public function new () {
        
    }

    /**
     *  Bind to socket
     *  @param host - host or ip 
     *  @param port - port
     *  @param cert - certificate
     *  @param key - private key
     *  @param handler - handler for incoming connection
     */
    public function bind (host : String, port : Int, cert : String, key : String, handler : SslSocket -> Void) : Void {
        NativeSslSocket.tcp_server (host, port, cert, key, function (s : NativeSslSocketObject) {
            var socket = new SslSocket ();
            socket.assignSocket (s);
            handler (socket);
        });
    }
}