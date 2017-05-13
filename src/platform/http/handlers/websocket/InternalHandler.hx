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

package platform.http.handlers.websocket;

import platform.io.ByteArray;
import platform.io.output.IByteWriteable;
// TODO: replace
import haxe.crypto.Base64;
import haxe.crypto.Sha1;
import haxe.crypto.BaseCode;
import platform.net.Peer;
import platform.net.TcpSocket;

/**
 *  State of work
**/
enum WorkState {
    /**
     *  Handshake with client
    **/
    Handshake;   

    /**
     *  Get frame type
    **/
    TypeFrame;
    /**
     *  Get length
    **/
    Length;
    /**
     *  Get data
    **/
    Data;
    /**
     *  Connection closed
     */
    Close;
}

/**
 *  Handle websocket data
**/
class InternalHandler implements IByteWriteable {

    /**
     *  Message mask size
    **/
    static inline var MASK_SIZE = 4;

    /**
     *  One byte max body size
    **/
    static inline var ONE_BYTE_MAX_BODY_SIZE = 125;

    /**
     *  Two byte body size
    **/
    static inline var TWO_BYTE_BODY_SIZE = 126;

    /**
     *  Eight byte body size
    **/
    static inline var EIGHT_BYTE_BODY_SIZE = 127;

    /**
     *  Sec-WebSocket-Key header name
    **/
    static inline var SecWebSocketKey = "Sec-WebSocket-Key";

    /**
     *  Web socket GUID
    **/
    static inline var WS_GUID = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11";

    /**
     *  Client peer
    **/
    var peer : Peer;

    /**
     *  Channel for data IO
    **/
    var channel : TcpSocket;

    /**
     *  State of handler
    **/
    var state : WorkState;

    /**
     *  Handshake headers
    **/
    var headers : Map<String, String>;

    /**
     *  Frame type
    **/
    var frameType : Int;

    /**
     *  Packet length
    **/
    var packLen : Int;

    /**
     *  On connect callback
    **/
    public var onConnect : OnWSConnect;

    /**
     *  On normal web socket close
    **/
    public var onClose : OnWSClose;

    /**
     *  On data callback
    **/
    public var onData : OnWSData;

    /**
     *  On error callback
    **/
    public var onError : OnWSError;

    /**
     *  Decode hex string to Bytes
    **/
    private function decode (str : String) {
        // TODO: remove Bytes
        var base = haxe.io.Bytes.ofString("0123456789abcdef");
        return new BaseCode(base).decodeBytes(haxe.io.Bytes.ofString(str.toLowerCase()));
    }

    /**
     *  Send error through OnError
    **/
    private function pushError (e : Dynamic) {        
        if (onError != null) {
            onError (peer, e);
        }
    }

    /**
     *  Process handshake from client
    **/
    private function processHandshake () : Void {        
        var key = headers[SecWebSocketKey] + WS_GUID;
        var sha = Sha1.encode (key);
        var shaKey = Base64.encode (decode (sha));
        var stringBuffer = new StringBuf ();
        stringBuffer.add ("HTTP/1.1 101 Switching Protocols\r\n");
        stringBuffer.add ("Upgrade: websocket\r\n");
        stringBuffer.add ("Connection: Upgrade\r\n");
        stringBuffer.add ('Sec-WebSocket-Accept: ${shaKey}\r\n');
        stringBuffer.add ("\r\n");
        channel.output.writeString (stringBuffer.toString ());
        state = WorkState.TypeFrame;
        onConnect (peer, this);        
    }

    /**
     *  Process frame type, opcode, mask, len part
    **/
    private function processFrame () : Void {
        var binaryData = channel.input.readBytes (2);
        var frame = binaryData.get (0);

        frameType = frame & 0x0F;

        var len = binaryData.get (1);
        packLen = 0;
        if ((len & 0x80) < 1) throw "Only masked message allowed";
        packLen += len ^ 0x80;

        if (packLen > ONE_BYTE_MAX_BODY_SIZE) {
            state = WorkState.Length;
        } else {
            state = WorkState.Data;
        }
    }

    /**
     *  Process length
    **/
    private function processLength () : Void {
        if (packLen == TWO_BYTE_BODY_SIZE) {
            var binaryData = channel.input.readBytes (2);
            packLen += binaryData.get (0);            
        } else if (packLen == EIGHT_BYTE_BODY_SIZE) {
            //var binaryData = BinaryData.FromBytes (_socket.input.read (8));            
        } else {
            throw "Wrong length type";
        }

        state = WorkState.Data;
    }

    /**
     *  Process data
    **/
    private function processData () : Void {
        var binaryData = channel.input.readBytes (packLen + MASK_SIZE);

        switch (frameType) {
            case FrameType.Close: {
                onClose (null);
                state = WorkState.Close;
                Disconnect ();
            }
            case FrameType.Text |
                 FrameType.Binary:
            {
                var mask = binaryData.slice (0, MASK_SIZE);
                var data = binaryData.slice (MASK_SIZE, binaryData.length - MASK_SIZE);                
                var res = new ByteArray (data.length);

                for (i in 0...data.length) {
                    var j = i % 4;
                    var b = data.get (i);
                    var d = b ^ mask.get (j);
                    res.set (i, d);
                }

                // On data
                onData (peer, res, this);
                state = WorkState.TypeFrame;
            }            
            default: throw "Unknown frame";
        }                  
    }

    /**
     *  Disconnect connection
    **/
    private function Disconnect () {
        try {
            channel.output.close ();
        } catch (e : Dynamic) {
            trace (e);
        }
    }

    /**
     *  Constructor
     *  @param context - http context
     */
    public function new (context : HttpContext) {
        channel = context.response.channel;
        headers = context.request.headers;
        state = WorkState.Handshake;
    }

    /**
     *  Start to process data from client
    **/
    public function start () : Void {
        try {
            while (true) {
                switch (state) {
                    case WorkState.Handshake: processHandshake ();
                    case WorkState.TypeFrame: processFrame ();
                    case WorkState.Length: processLength ();
                    case WorkState.Data: processData ();
                    case WorkState.Close: break;
                }
            }
        }
        catch (e : Dynamic) {
            pushError (e);
            Disconnect ();
        }
    }    

    /**
     *  Write one byte
     *  @param data - byte
     */
    public function writeByte (data : Int) : Void {
        return channel.output.writeByte (data);
    }

    /**
     *  Write bytes to stream
     *  @param data - byte array
     *  @return Number of bytes written
     */
    public function writeBytes (data : ByteArray) : Int {
        var frame = new ByteArray (2 + data.length);
        frame.set (0, 0x80 + FrameType.Binary);  // FIN, BINARY
        frame.set (1, data.length);
        ByteArray.copy (frame, data, 2, 0, data.length);
        return channel.output.writeBytes (frame);
    }

    /**
     *  Write string
    **/
    public function writeString (data: String) : Void {
        var dat = ByteArray.fromString (data);
        writeBytes (dat);
    }

    /**
     *  Close socket
    **/
    public function close () : Void {
        channel.output.close ();
    }
}