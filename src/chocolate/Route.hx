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

import chocolate.response.Response;

/**
 *  Request route
 */
class Route {
    /**
     *  Pattern for request
     */
    private var _pattern : String;

    /**
     *  Callback for process request
     */
    private var _call : RequestCall;

    /**
     *  Constructor
     *  @param pattern - pattern for request. Example: /mypage/:id
     */
    public function new (pattern : String, call : RequestCall) {
        _pattern = pattern;
        // Bug
        _call = function (r : Request) : Response {
            return call (r);
        };
    }

    /**
     *  Check if path matches route pattern
     *  @param path - request path
     *  @return Bool
     */
    public function isMatch (path : String) : Bool {
        // TODO: normal path match
        
        var items1 = path.split ("/");
        var items2 = _pattern.split ("/");
        if (items1.length != items2.length) return false;

        for (s2 in items2) {
            for (s1 in items1) {
                if (s2 != s1) return false;
            }
        }

        return true;
    }

    /**
     *  Process client request
     *  @param request - request converted from http request
     *  @return Response
     */
    public function process (request : Request) : Response {
        return _call (request);
    }
}