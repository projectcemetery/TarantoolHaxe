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

/**
 *  Response on client request
 */
abstract Response (AppResponse) {
    /**
     *  Converts string to Response
     *  @param s - any string
     *  @return Response
     */
    @:from public static inline function fromString (s : String) : Response {
        return new Response (AppResponse.string (s));
    }

    /**
     *  Converts from json response
     *  @param s - json response
     *  @return Response
     */
    @:from public static inline function fromJson (s : JsonResponse) : Response {
        return new Response (AppResponse.json (s));
    }

    /**
     *  Constructor
     */
    public function new (d : AppResponse) {
        this = d;
    }

    /**
     *  Translate response to string
     */
    public function toString () : String {
        switch (this) {
            case string (s): return s;
            case json (s): return s.toString ();
        }

        throw "Unknow response type";
    }
}

/**
 *  Response types
 */
enum AppResponse {
    /**
     *  Response as string
     */
    string (s : String);

    /**
     *  Response as json
     */
    json (s : JsonResponse);
}