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

package tarantool.fiber;

import tarantool.fiber.native.ChannelNative;
import tarantool.fiber.native.ChannelObjectNative;

/**
 *  IPC for fibers
 */
@:native("t.Channel")
class Channel {

    /**
     *  Native channel
     */
    var channelObject : ChannelObjectNative;

    /**
     *  Constructor
     *  @param capacity - maximum put messages
     */
    public function new (?capacity : Int) {
        ChannelNative.channel (capacity);
    }

    /**
     *  Send a message using a channel. 
     *  If the channel is full, channel.put() waits until there is a free slot in the channel.
     *  @param message - any data
     *  @param timeout - maximum number of seconds to wait for a slot to become free
     *  @return If timeout is specified, and there is no free slot in the channel 
     *  for the duration of the timeout, then the return value is false. If the channel is closed, 
     *  then the return value is false. Otherwise, the return value is true, indicating success.
     */
    public inline function put (message : Dynamic, ?timeout : Int) : Bool {
        return channelObject.put (message, timeout);
    }

    /**
     *  Close the channel. All waiters in the channel will stop waiting. 
     *  All following channel:get() operations will return nil, 
     *  and all following channel.put() operations will return false.
     */
    public inline function close () {
        channelObject.close ();
    }

    /**
     *  [Description]
     *  @param timeout - maximum number of seconds to wait for a message
     *  @return If timeout is specified, and there is no message in the channel 
     *  for the duration of the timeout, then the return value is nil. 
     *  If the channel is closed, then the return value is nil. Otherwise, 
     *  the return value is the message placed on the channel by channel.put().
     */
    public inline function get (?timeout : Int) : Dynamic {
        return channelObject.get ();
    }

    /**
     *  Check whether the channel is empty (has no messages).
     *  @return true if the channel is empty. Otherwise false.
     */
    public inline function isEmpty () : Bool {
        return channelObject.is_empty ();
    }

    /**
     *  Find out how many messages are in the channel.
     *  @return the number of messages
     */
    public inline function count () : Int {
        return channelObject.count ();
    }

    /**
     *  Check whether the channel is full.
     *  @return true if the channel is full (the number of messages in the channel 
     *  equals the number of slots so there is no room for a new message). 
     *  Otherwise false.
     */
    public inline function isFull () : Bool {
        return channelObject.is_full ();
    }

    /**
     *  Check whether writers are waiting because they have issued channel.put() and the channel is full.
     *  @return true if writers are waiting. Otherwise false.
     */
    public inline function hasWriters () : Bool {
        return channelObject.has_writers ();
    }

    /**
     *  true if the channel is already closed. Otherwise false.
     *  @return Bool
     */
    public inline function isClosed () : Bool {
        return channelObject.is_closed ();
    }
}