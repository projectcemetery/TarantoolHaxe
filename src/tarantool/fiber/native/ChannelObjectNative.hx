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
 *  Extern to channel object
 */
extern class ChannelObjectNative {

    /**
     *  Send a message using a channel. 
     *  If the channel is full, channel:put() waits until there is a free slot in the channel.
     *  @param message - what will be sent, usually a string or number or table
     *  @param timeout - maximum number of seconds to wait for a slot to become free
     *  @return If timeout is specified, and there is no free slot in the channel 
     *  for the duration of the timeout, then the return value is false. If the channel is closed, 
     *  then the return value is false. Otherwise, the return value is true, indicating success.
     */
    public function put (message : Dynamic, ?timeout : Int) : Bool;

    /**
     *  Close the channel. All waiters in the channel will stop waiting. 
     *  All following channel:get() operations will return nil, 
     *  and all following channel:put() operations will return false.
     */
    public function close () : Null<Bool>;

    /**
     *  [Description]
     *  @param timeout - 
     *  @return If timeout is specified, and there is no message in the channel 
     *  for the duration of the timeout, then the return value is nil. 
     *  If the channel is closed, then the return value is nil. Otherwise, 
     *  the return value is the message placed on the channel by channel:put().
     */
    public function get (?timeout : Int) : Dynamic;

    /**
     *  Check whether the channel is empty (has no messages).
     *  @return true if the channel is empty. Otherwise false.
     */
    public function is_empty () : Bool;

    /**
     *  Find out how many messages are in the channel.
     *  @return the number of messages
     */
    public function count () : Int;

    /**
     *  Check whether the channel is full.
     *  @return true if the channel is full (the number of messages in the channel 
     *  equals the number of slots so there is no room for a new message). 
     *  Otherwise false.
     */
    public function is_full () : Bool;

    /**
     *  Check whether writers are waiting because they have issued channel:put() and the channel is full.
     *  @return true if writers are waiting. Otherwise false.
     */
    public function has_writers () : Bool;

    /**
     *  true if the channel is already closed. Otherwise false.
     *  @return Bool
     */
    public function is_closed () : Bool;
}