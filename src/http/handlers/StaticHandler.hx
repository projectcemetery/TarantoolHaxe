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

package http.handlers;

import tarantool.fio.File;
import tarantool.fio.Path;

/**
 *  Process static content
 */
class StaticHandler extends Handler {
    /**
     *  Paths to process
     */
    public var Paths : Map<String, String>;

    /**
     *  Constructor
     */
    public function new () {
        Paths = new Map<String, String> ();
    }
    
    /**
     *  Add path that can be processed
     *  @param path - relative path from working dir
     */
    public function addPath (path : String) {
        if (!Path.exists (path)) throw 'Directory ${path} not exists';
        var parts = path.split ("/");
        var parts = parts.filter (function (s : String) { return s != "" && s != "." && s != ".."; });
        var newPath = parts.join ("/");        
        Paths.set (newPath, newPath);
    }

    /**
     *  Process request
     *  @param context - Http context
     */
    public override function process (context : HttpContext) : Void {        
        var path : String = context.request.url.path;
        var parts = path.split ("/");
        var file = parts.pop ();
        var parts = parts.filter (function (s : String) { return s != "" && s != "." && s != ".."; });
        var newPath = parts.join ("/");
        
        if (Paths.exists (newPath)) {
            var fl = './${newPath}/${file}';
            if (Path.exists (fl)) {
                var file = new File (fl);       
                var data = file.readAllBytes (fl);
                context.response.write (data);
                context.response.close ();
            } else {
                throw HttpStatus.NotFound;
            }
        } else {
            callNext (context);
        }        
    }
}