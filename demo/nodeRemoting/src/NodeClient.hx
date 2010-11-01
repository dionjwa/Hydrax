package;

import haxe.remoting.HttpAsyncConnection;

class ApiProxy extends haxe.remoting.AsyncProxy<Api>
{
    public function new (c :haxe.remoting.AsyncConnection)
    {
        super(c.resolve("api"));
    }
}

class NodeClient extends flash.display.Sprite 
{
    public function new() 
    {
        super();

        var onResult = function(r) trace("Result : "+Std.string(r));
        
        var conn = HttpAsyncConnection.urlConnect("http://localhost:8000");
        conn.setErrorHandler( function(err) trace("Error : "+Std.string(err)) );
        var proxy = new ApiProxy(conn);
        proxy.foo(1,3, function (v :Int) :Void {
            trace("result=" + v);
        });
    }

    public static function main() 
    {
        flash.system.Security.allowDomain('*');
        flash.Lib.current.addChild(new NodeClient());
    }
}


