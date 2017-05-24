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

package platform.concurrency;

/**
 *  Helper for fibers
 */
class Async {

    /**
     *  Execute function on fiber, wait for execution
     */
    public static function await (call : Void -> Void) {
        var flag = new Condition ();
        var fiber = new Fiber (function (data : Dynamic) {
            var cond : Condition = cast (data, Condition);                        
            cond.wait ();
            call ();            
            cond.signal ();
        }, flag);        
        flag.signal ();
        flag.wait ();
    }

    /**
     *  Execute function on fiber, dont wait for execution
     */
    public static function async (call : Void -> Void) {        
        var fiber = new Fiber (function (data : Dynamic) {            
            call ();            
        });        
    }

    /**
     *  Fiber.yield ()
     */
    public static function yield () {
        Fiber.sleep (0);
    }
}