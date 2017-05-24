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

package tarantool.fiber.native;

/**
 *  Condition object
 */
extern class ConditionObjectNative {

    /**
     *  Make the current fiber go to sleep, waiting until until another fiber invokes the signal() or broadcast() method on the cond object. 
     *  The sleep causes an implicit fiber.yield()
     *  @param timeout - timeout to wait
     *  @return Bool
     */
    public function wait (?timeout : Int) : Bool;

    /**
     *  Wake up a single fiber that has executed wait() for the same variable.
     */
    public function signal () : Void;

    /**
     *  Wake up all fibers that have executed wait() for the same variable.
     */
    public function broadcast () : Void;
}