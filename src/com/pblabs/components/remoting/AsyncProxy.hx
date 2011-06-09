package com.pblabs.components.remoting;
/**
  * This uses callbacks for both the client and server.  Compare with the 
  * std haxe.remoting.AsyncProxy, where only the client uses callbacks, thus
  * the server must return the function result immediately.
  *
  * This is problematic for 'servers' where the called functioned does not return 
  * immediately.
  * Examples:
  * Node.js, where most functions are designed to use callbacks.
  * Flash->JS facebook API
  *
  * It's up to the subclass to sync the callbacks from both ends. 
  */
@:autoBuild(com.pblabs.components.remoting.Macros.addAsyncProxyMethods())
class AsyncProxy 
{
	var _conn :haxe.remoting.AsyncConnection;
	
	public function new (c :haxe.remoting.AsyncConnection)
	{
		_conn = c;	
	}
}
