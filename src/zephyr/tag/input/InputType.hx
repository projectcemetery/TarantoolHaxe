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

package zephyr.tag.input;

/**
 *  Link relation type
 */
 @:enum
abstract InputType(String) to String {    
    var button = "button";
    var checkbox = "checkbox";
    var color = "color";
    var date = "date";
    var datetimeLocal = "datetime-local";
    var email = "email";
    var file = "file";
    var hidden = "hidden";    
    var image = "image";
    var month = "month";
    var number = "number";
    var password = "password";
    var radio = "radio";
    var range = "range";
    var reset = "reset";
    var search = "search";
    var submit = "submit";
    var tel = "tel";
    var text = "text";
    var time = "time";
    var url = "url";
    var week = "week";

    public function new (s : String) {
        this = s;
    }    

    @:from public static inline function fromString (s : String) : InputType {
        return new InputType (s);
    }
}