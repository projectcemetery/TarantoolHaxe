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

package http;

import tarantool.socket.SocketError;
import tarantool.socket.TcpSocket;
import http.handlers.Handler;

/**
 *  Embedded http server for tarantool
 */
class HttpServer {
    /**
     *  Server socket
     */
    var socket : TcpSocket;

    /**
     *  First handler
     */
    var firstHandler : Handler;

    /**
     *  Last handler
     */
    var lastHandler : Handler;

    /**
     *  Process client requests
     *  @param peer - client peer
     *  @param channel - read write channel
     */
    function processClient (channel : TcpSocket) {        
        try {
            while (true) {                
                var request = new HttpRequest (channel);
                var response = new HttpResponse (channel);
                var context = new HttpContext (request, response);
                firstHandler.process (context);
            }
        } catch (e : SocketError) {
            // TODO: process error
            trace (e);
        }        
        catch (e : Dynamic) {            
            trace (e);
            channel.output.close ();
        }
    }

    /**
     *  Constructor
     */
    public function new () {
        socket = new TcpSocket ();        
    }

    /**
     *  Add http request handler
     *  @param handler - request handler
     */
    public function addHandler (handler : Handler) : Void {        
        if (firstHandler == null) {
            firstHandler = handler;
            lastHandler = handler;
        }

        lastHandler.Next = handler;
        lastHandler = handler;
    }

    /**
     *  Bind server to host and port
     *  @param host - Example: * - for all possible ip, localhost, 192.168.0.196, mysite.ru
     *  @param port - Example: 80, 8080
     */
    public function bind (host : String, port : Int) : Void {
        if (firstHandler == null) throw "No handlers";

        socket.bind (host, port, function (c : TcpSocket) {
            processClient (c);
        });
    }
}