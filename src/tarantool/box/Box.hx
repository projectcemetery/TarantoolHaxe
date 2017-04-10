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

package tarantool.box;

import tarantool.box.native.BoxNative;
import tarantool.util.Convert;

/**
 *  Tarantool box
 */
@:native("t.Box")
class Box {

    /**
     *  Disable constructor
     */
    private function new () {}

    /**
     *  Start box
     */
    public inline static function cfg (config : BoxOptions) {
        var options = Convert.serializeToLua (config);
        BoxNative.cfg (options);
    }

    /**
     *  Call once
     *  @param call - callback
     */
    public inline static function once (name : String, call : Void -> Void) {
        BoxNative.once (name, call);
    }

    /**
     *  Begin the transaction. Disable implicit yields until the transaction ends. 
     *  Signal that writes to the write-ahead log will be deferred until the transaction ends. 
     *  In effect the fiber which executes box.begin() is starting an “active multi-request transaction”, 
     *  blocking all other fibers.
     */
    public inline static function begin () : Void {
        BoxNative.begin ();
    }

    /**
     *  End the transaction, and make all its data-change operations permanent.
     */
    public inline static function commit () : Void {
        BoxNative.commit ();
    }

    /**
     *  End the transaction, but cancel all its data-change operations. 
     *  An explicit call to functions outside box.space that always yield, 
     *  such as fiber.sleep() or fiber.yield(), will have the same effect.
     */
    public inline static function rollback () : Void {
        BoxNative.rollback ();
    }
}