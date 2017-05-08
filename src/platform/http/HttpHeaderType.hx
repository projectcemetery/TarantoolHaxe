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

package platform.http;

/**
 *  Http header types
 */
@:enum
abstract HttpHeaderType (String) from String to String {
    /**
     *  Content-Types that are acceptable for the response.
     *  Accept: text/plain
     */
    var Accept = "Accept";

    /**
     *  Character sets that are acceptable.
     *  Accept-Charset: utf-8
     */
    var AcceptCharset = "Accept-Charset";

    /**
     *  List of acceptable encodings.
     *  Accept-Encoding: gzip, deflate
     */
    var AcceptEncoding = "Accept-Encoding";

    /**
     *  List of acceptable human languages for response.
     *  Accept-Language: en-US
     */
    var AcceptLanguage = "Accept-Language";

    /**
     *  Acceptable version in time.
     *  Accept-Datetime: Thu, 31 May 2007 20:35:00 GMT
     */
    var AcceptDatetime = "Accept-Datetime";

    /**
     *  Authentication credentials for HTTP authentication.
     *  Authorization: Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==
     */
    var Authorization = "Authorization";

    /**
     *  Used to specify directives that must be obeyed by all caching mechanisms along the request-response chain.
     *  Cache-Control: no-cache
     */
    var CacheControl = "Cache-Control";

    /**
     *  Control options for the current connection and list of hop-by-hop request fields.
     *  Connection: keep-alive
     *  Connection: Upgrade
     */
    var Connection = "Connection";

    /**
     *  An HTTP cookie previously sent by the server with Set-Cookie (below).
     *  Cookie: $Version=1; Skin=new;
     */
    var Cookie = "Cookie";

    /**
     *  The length of the request body in octets (8-bit bytes).
     *  Content-Length: 348
     */
    var ContentLength = "Content-Length";

    /**
     *  A Base64-encoded binary MD5 sum of the content of the request body.
     *  Content-MD5: Q2hlY2sgSW50ZWdyaXR5IQ==
     */
    var ContentMD5 = "Content-MD5";

    /**
     *  The MIME type of the body of the request (used with POST and PUT requests).
     *  Content-Type: application/x-www-form-urlencoded
     */
    var ContentType = "Content-Type";

    /**
     *  The date and time that the message was originated (in "HTTP-date" format as defined by RFC 7231 Date/Time Formats).
     *  Date: Tue, 15 Nov 1994 08:12:31 GMT
     */
    var Date = "Date";

    /**
     *  Indicates that particular server behaviors are required by the client.
     *  Expect: 100-continue
     */
    var Expect = "Expect";

    /**
     *  Disclose original information of a client connecting to a web server through an HTTP proxy.
     *  Forwarded: for=192.0.2.60;proto=http;by=203.0.113.43 Forwarded: for=192.0.2.43, for=198.51.100.17
     */
    var Forwarded = "Forwarded";

    /**
     *  The email address of the user making the request.
     *  From: user@example.com
     */
    var From = "From";

    /**
     *  The domain name of the server (for virtual hosting), and the TCP port number on which the server is listening. 
     *  The port number may be omitted if the port is the standard port for the service requested.
     *  [11] Mandatory since HTTP/1.1.
     *  Host: en.wikipedia.org:8080
     *  Host: en.wikipedia.org
     */
    var Host = "Host";

    // TODO : more headers


    /**
     *  Ask the server to upgrade to another protocol.
     *  Upgrade: HTTP/2.0, HTTPS/1.3, IRC/6.9, RTA/x11, websocket
     */
    var Upgrade = "Upgrade";

    /**
     *  A name for the server
     *  Server: Apache/2.4.1 (Unix)
     */
    var Server = "Server";
}