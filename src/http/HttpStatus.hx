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
 *  Http status for response
 */
 @:enum
abstract HttpStatus(Int) {
    /**
     *  Normal response
     */
    var Ok = 200;

    /**
     *  Server internal error
     */
    var Internal = 500;

    /**
     *  Bad request
     */
     var BadRequest = 400;

    /**
     *  Resource not found
     */
    var NotFound = 404;

    /**
     *  Get string description of error
     *  @return String
     */
    public function getDescription () : String {
        switch (this) {
            case Ok: return "OK";
            case Internal: return "Internal error";
            case BadRequest: return "Bad request";
            case NotFound: return "Not found";
        }

        return "Unknown";
    }
}