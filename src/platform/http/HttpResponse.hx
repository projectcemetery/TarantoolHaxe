package platform.http;

import haxe.io.Output;
import haxe.io.Bytes;
import haxe.io.BytesBuffer;
import platform.net.TcpSocket;
import platform.http.HttpHeaderType;

/**
    Response to client
**/
class HttpResponse extends Output {
    /**
        Buffer for response
    **/
    var buffer : BytesBuffer;

    /**
     *  Raw channel for write/read data
     */
    public var channel (default, null) : TcpSocket;

    /**
        Response headers
    **/
    public var headers (default, null) : Map<String, String>;

    /**
     *  Response status
     */
    public var status : HttpStatus = HttpStatus.Ok;

    /**
     *  Write headers to channel
     */
    private function writeHeaders () {
        headers[HttpHeaderType.ContentLength] = Std.string (buffer.length);
        headers[HttpHeaderType.Server] = "tyrant";

        for (k in headers.keys()) {
            var v = headers.get (k);
            channel.output.writeString ('${k}: ${v}\n');
        }

        channel.output.writeString ("\n");
    }

    /**
     *  Constructor
     *  @param channel - 
     */
    public function new (channel : TcpSocket) {
        this.channel = channel;
        headers = new Map<String, String> ();
        reset ();
    }

    /**
     *  Reset response
     */
    public function reset () {
        buffer = new BytesBuffer ();
    }

    /**
     *  Write data
     *  @param data - bytes
     *  @return Int
     */
    public override function write (data: Bytes) : Void {
        buffer.addBytes (data, 0, data.length);        
    }

    /**
     *  Write string
     *  @param data - string
     *  @return Int
     */
    public override function writeString (data: String) : Void {
        buffer.addString (data);        
    }

    /**
     *  Write http response
     */
    public override function close () : Void {
        var descr = status.getDescription ();
        channel.output.writeString ('HTTP/1.1 ${status} ${descr}\n');
        writeHeaders ();        
        channel.output.write (buffer.getBytes ());
    }
}