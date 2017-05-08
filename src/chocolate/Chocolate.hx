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

package chocolate;

import platform.http.HttpContext;
import platform.http.HttpServer;
import platform.http.HttpStatus;
import platform.http.handlers.websocket.WebSocketHandler;
import platform.http.handlers.ErrorHandler;
import platform.http.handlers.HttpHandler;
import platform.http.handlers.StaticHandler;
import chocolate.response.Response;

/**
 *  Chocolate app
 */
@:final
class Chocolate {    
    /**
     *  Http server
     */
    private var _httpServer : HttpServer;    

    /**
     *  Routes 
     */
    private var _routes : Map<String, Route>;

    /**
     *  On error callback
     */
    private var _errorHandlers : Map<HttpStatus, RequestCall>;

    /**
     *  App instance
     */
    public static var App (default, null) : Chocolate;

    /**
     *  Web socket instance
     */
    public static var WebSocket (default, null) : WebSocket;

    /**
     *  On init class
     */
    private static function __init__ () : Void {
        App = new Chocolate ();
        WebSocket = new WebSocket ();
    }

    /**
     *  Constructor
     */
    private function new () {
        _httpServer = new HttpServer ();
        _routes = new Map<String, Route> ();
        _errorHandlers = new Map<HttpStatus, RequestCall> ();        
    }

    /**
     *  On http error
     *  @param c - http context
     *  @param error - http status
     */
    private function onHttpError (c : HttpContext, error : HttpStatus) : Void {
        if (_errorHandlers.exists (error)) {
            var call = _errorHandlers.get (error);
            var req = new Request (c.request);
            var resp = call (req);
            writeResponse (c, resp);
        }
    }
    
    /**
     *  Write response to client
     *  @param c - Http context for write
     *  @param response - response from server
     */
    private function writeResponse (c : HttpContext, response : Response) {
        c.response.writeString (response.toString ());
    }

    /**
     *  Process http request
     */     
    private function onHttpRequest (c : HttpContext) : Void {
        var found = false;
        for (kv in _routes) {
            if (kv.isMatch (c.request.url.path)) {
                var req = new Request (c.request);
                var resp = kv.process (req);
                writeResponse (c, resp);
                found = true;
                break;
            }
        }
        if (!found) throw HttpStatus.NotFound;
    }    

    /**
     *  Add route for get method
     *  @param pattern - path to handle. Example: /mypage/id/1
     *  @param call - callback to handle request
     */
    public function get (pattern : String, call : RequestCall) : Void {
        _routes[pattern] = new Route (pattern, call);        
    }

    /**
     *  Add route to post method
     *  @param pattern - path to handle. Example: /mypage/id/1
     *  @param call - callback to handle request
     */
    public function post (pattern : String, call : RequestCall) : Void {
        _routes[pattern] = new Route (pattern, call);
    }

    /**
     *  For process http error
     *  @param err - error type
     *  @param call - callback to process error
     */
    public function onError (err : HttpStatus, call : RequestCall) : Void {
        _errorHandlers[err] = call;
    }

    /**
     *  Start listen
     *  @param options - various options like port to listen
     */
    public function listen (options : AppOptions) : Void {
        if (options.WebSocket != null) {            
            var wshandler = new WebSocketHandler (WebSocket.Handle);
            _httpServer.addHandler (wshandler);
        }

        var errorHandler = new ErrorHandler (onHttpError);
        _httpServer.addHandler (errorHandler);

        if (options.StaticDir != null) {
            var staticHandler = new StaticHandler ();
            staticHandler.addPath (options.StaticDir);
            _httpServer.addHandler (staticHandler);
        }

        var httpHandler = new HttpHandler (onHttpRequest);
        _httpServer.addHandler (httpHandler);
        _httpServer.bind ("*", options.Port);
    }
}