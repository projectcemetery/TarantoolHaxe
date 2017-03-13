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

/**
 *  Html Builder
 */
class HtmlBuilder {
    /**
     *  Create <html> tag
     *  @param tags - child tags
     *  @return Tag
     */
    public static function html (?options : TagOptions, ?tags : Array<Tag>) : Tag {        
        return new TagInternal ("html", options, tags);
    }

    /**
     *  Create <header> tag
     *  @param tags - child tags
     *  @return Tag
     */
    public static function head (?options : TagOptions, ?tags : Array<Tag>) : Tag {
        return new TagInternal ("head", options, tags);
    }

    /**
     *  Create <body> tag
     *  @param tags - 
     *  @return Tag
     */
    public static function body (?options : TagOptions, ?tags : Array<Tag>) : Tag {
        return new TagInternal ("body", options, tags);
    }

    /**
     *  Create <body> div
     *  @param text - 
     *  @param tags -
     *  @return Tag
     */
    public static function div (?options : TextTagOptions, ?tags : Array<Tag>) : Tag {
        var tag = new TextTag ("div", options, tags);
        return tag;
    }

    /**
     *  Create <p> tag
     *  @param text - 
     *  @param tags - 
     *  @return Tag
     */
    public static function p (?options : TextTagOptions, ?tags : Array<Tag>) : Tag {
        return new TextTag ("p", options, tags);
    }

    /**
     *  Create <h1> tag
     *  @param text - 
     *  @param tags - 
     *  @return Tag
     */
    public static function h1 (?options : TextTagOptions, ?tags : Array<Tag>) : Tag {
        return new TextTag ("h1", options, tags);
    }
}