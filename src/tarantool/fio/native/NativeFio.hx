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

package tarantool.fio.native;

import lua.Table;

/**
 *  Extern for fio
 */
@:luaRequire("fio")
extern class NativeFio {
    /**
     *  Get files in directory
     *  @param path - directory name
     *  @return Table<Int, String>
     */
    public static function glob (path : String) : Table<Int, String>;

    /**
     *  Get file info
     *  @param path - file name
     *  @return Table<String, String>
     */
    public static function stat (path : String) : Table<String, String>;

    /**
     *  Get file base name
     *  @param path - file name
     */
    public static function basename (path : String) : String;

    /**
     *  Open file
     *  @param path - file name
     *  @param flags - 
     *  @param mode - 
     *  @return NativeFileHandle
     */
    public static function open (path : String, ?flags : Dynamic, ?mode : Dynamic) : NativeFileHandle;
}