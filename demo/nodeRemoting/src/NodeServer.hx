package;

import haxe.remoting.Context;
import haxe.remoting.NodeJSHTMLConnection;

import js.Node;

class NodeServer
{
    public function new ()
    {
    }
    
    public static function main() 
    {
        
        var http = Node.http;
        
        //Create the Api.  The client will proxy this
        var api = new Api();
        // create an incoming connection and give acces to the "inst" object
        var context = new haxe.remoting.Context();
        context.addObject("api", api);
        NodeJSHTMLConnection.connect(context);

        http.createServer(function (req :Request, res :Response) {
            
            trace("handled?= " + NodeJSHTMLConnection.handleRequest(req, res));
        }).listen(8000, "127.0.0.1");
    }
}


