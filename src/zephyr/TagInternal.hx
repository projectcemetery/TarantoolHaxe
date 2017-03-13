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

class TagInternal {
    /**
     *  Child tags
     */
    var tags : Array<Tag>;

    /**
     *  Tag attributes
     */
    var attributes : Map<String, String>;

    /**
     *  Tag name
     */
    public var Name (default, null) : String;

    /**
     *  Css classes
     */
    public var Css (get, null) : String;
    private function get_Css () : String {
        if (attributes.exists ("class")) return attributes.get ("class");
        return "";
    }

    /**
     *  Constructor
     */
    public function new (name : String, ?options : TagOptions, ?tags : Array<Tag>) {
        attributes = new Map<String, String> ();

        Name = name;
        tags = tags != null ? tags : new Array<Tag> ();            
                
        if (options != null) {
            if (options.css != null) attributes["class"] = options.css;
        }        
    }

    /**
     *  Add tags to this
     *  @param tags - some tags
     */
    public function addTags (tags : Array<Tag>) {
        this.tags = tags.concat (tags);
    }    

    /**
     *  Render tag name and all attributes
     *  @return StringBuf
     */
    public function renderName () : StringBuf {
        var s = new StringBuf ();
        s.add ('<$Name');
        for (i in attributes.keys()) {
             s.add (" ");
             s.add ('${i}="${attributes[i]}"');
        }
        s.add (">");
        return s;
    }

    /**
     *  Append render tags to buffer
     *  @param s - 
     */
    public function renderChilds (s : StringBuf) {
        for (tag in tags) {
            s.add (tag.toString ());
        }
    }

    /**
     *  Append close tag
     *  @param s - 
     */
    public function closeTag (s : StringBuf) {
        s.add ('</$Name>');
    }

    /**
     *  Translate all tags to string
     *  @return String
     */
    public function toString () : String {
        var s = renderName ();
        renderChilds (s);
        closeTag (s);        
        return s.toString ();
    }
}