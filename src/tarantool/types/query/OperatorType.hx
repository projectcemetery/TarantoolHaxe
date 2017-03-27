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

package tarantool.types.query;

/**
 *  Operations
 */
@:native("t.OperatorType")
@:enum
abstract OperatorType(String) from String to String {

    /**
     *   For addition (values must be numeric)
     */
    var Add = "+";

    /**
     *  For subtraction (values must be numeric)
     */
    var Substract = "-";

    /**
     *  For bitwise AND (values must be unsigned numeric)
     */
    var And = "&";

    /**
     *  For bitwise OR (values must be unsigned numeric)
     */
    var Or = "|";

    /**
     *  For bitwise XOR (values must be unsigned numeric)
     */
    var Xor = "^";

    /**
     *  For string splice
     */
    var Splice = ":";

    /**
     *  For insertion
     */
    var Insert = "!";

    /**
     *  For deletion
     */
    var Delete = "#";
    
    /**
     *  For assignment
     */
    var Assign = "=";
}