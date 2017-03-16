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

package zephyr.tag;

/**
 *  Text tag
 */
class TextTag extends Tag {

    /**
     *  Tag inner text
     */
    public var text (default, null) : String;

    /**
     *  Constructor
     *  @param name - 
     *  @param text - 
     *  @param tags - 
     */
    public function new (name : String, ?options : TextTagOptions, ?tags : Array<Tag>) {
        super (name, options, tags);
        text = "";
        if (options != null) {
            text = options.text != null ? options.text : "";
        }
    }

    /**
     *  Translate all tags to string
     *  @return String
     */
    override public function toString () : String {
        var s = renderName ();
        if (text != "") s.add (text);
        renderChilds (s);
        closeTag (s);        
        return s.toString ();
    }
}