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

import tarantool.fiber.native.FiberNative;
import tarantool.fiber.native.ConditionObjectNative;

/**
 *  Object for wait
 */
@:native("p.Condition")
class Condition {

    /**
     *  Native condition object
     */
    var conditionObject : ConditionObjectNative;

    /**
     *  Constructor
     */
    public function new () {
        conditionObject = FiberNative.cond ();
    }

    /**
     *  Wait for fiber execution
     *  @param timeout - 
     *  @return Bool
     */
    public inline function wait (?timeout : Int) : Bool {
        if (timeout != null) {
            return conditionObject.wait (timeout);
        }
        return conditionObject.wait ();
    }

    /**
     *  Wake up a single fiber that has executed wait() for the same variable
     */
    public inline function signal () {
        conditionObject.signal ();
    }

    /**
     *  Wake up all fibers that have executed wait() for the same variable.
     */
    public inline function broadcast () {
        conditionObject.broadcast ();
    }
}