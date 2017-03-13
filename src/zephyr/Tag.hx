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

package zephyr;

import chocolate.Response;

/**
 *  Tag that can be used like response
 */
 @:forward(toString)
abstract Tag (TagInternal) {
    /**
     *  Constructor
     *  @param tag -
     */
    public function new (tag : TagInternal) {
        this = tag;
    }

    /**
     *  Convert internal tag to tag response
     *  @param tag - 
     *  @return Tag
     */
    @:from public static function fromTag (tag : TagInternal) : Tag {
        return new Tag (tag);
    }

    /**
     *  Convert tag to string response
     *  @param tag - tag to convert
     *  @return Response
     */
    @:to public static function toResponse (tag : TagInternal) : Response {
        return tag.toString ();
    }
}