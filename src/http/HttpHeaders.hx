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

/**
 *  Http headers
 */
@:final
class HttpHeaders {
    /**
     *  Content-Types that are acceptable for the response.
     *  Accept: text/plain
     */
    public inline static var Accept = "Accept";

    /**
     *  Character sets that are acceptable.
     *  Accept-Charset: utf-8
     */
    public inline static var AcceptCharset = "Accept-Charset";

    /**
     *  List of acceptable encodings.
     *  Accept-Encoding: gzip, deflate
     */
    public inline static var AcceptEncoding = "Accept-Encoding";




    /**
     *  The length of the request body in octets (8-bit bytes).
     *  Content-Length: 348
     */
    public inline static var ContentLength = "Content-Length";



    /**
     *  A name for the server
     *  Server: Apache/2.4.1 (Unix)
     */
    public inline static var Server = "Server";
}