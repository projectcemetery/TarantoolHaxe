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

import http.HttpRequest;
import http.HttpHeaderType;
import mime.MimeTypes;

/**
 *  Request from client
 */
class Request {

    /**
     *  Request headers
     */
    public var headers (default, null) : Map<String, String>;

    /**
     *  Query parameters
     */
    public var query (default, null) : Map<String, String>;

    /**
     *  Form parameters
     */
    public var form (default, null) : Map<String, String>;

    /**
     *  Constructor. Converts http request to app request
     *  @param request - Http request from http server
     */
    public function new (request : HttpRequest) {
        headers = request.headers;
        query = [for (p in request.url.query.iterator()) p.name.toString() => p.value.toString ()];

        var contentType = request.headers[HttpHeaderType.ContentType];
        if (contentType == MimeTypes.application.x_www_form_urlencoded) {
            if (request.body != null) {
                var body = request.body.toString ();
                var query : tink.url.Query = body;
                form = [for (p in query.iterator()) p.name.toString() => p.value.toString ()];
            }
        }
    }
}