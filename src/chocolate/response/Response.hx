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

package chocolate.response;

/**
 *  Response on client request
 */
@:forward
abstract Response (AbstractResponse) {
    
    /**
     *  Constructor
     */
    public function new (d : AbstractResponse) {
        this = d;
    }

    /**
     *  Convert String to Response
     *  @param s - any string
     *  @return Response
     */
    @:from public static inline function fromString (s : String) : Response {
        return new Response (new StringResponse (s));
    }

    /**
     *  Convert AbstractResponse to Response
     *  @param s - 
     *  @return Response
     */
    @:from public static inline function fromResponse (s : AbstractResponse) : Response {
        return new Response (s);
    }
}