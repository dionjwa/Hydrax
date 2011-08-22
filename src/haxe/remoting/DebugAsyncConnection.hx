package haxe.remoting;

/**
  * For dummying up remoting connections locally.
  */
class DebugAsyncConnection 
	implements AsyncConnection
{
	/** Client side */
	var _context : Context;
	var __path : Array<String>;
	
	public static var serverContext :Context;

	public function new( ctx, ?path) {
		_context = ctx;
		__path = path == null ? [] : path;
	}

	public function resolve(field) : AsyncConnection {
		var e = new DebugAsyncConnection(_context, __path.copy());
		e.__path.push(field);
		return e;
	}

	public function setErrorHandler (handler :Dynamic->Void) :Void
	{
	}

	public function call( params : Array<Dynamic>, ?onResult :Null<Dynamic>->Void ) : Void 
	{
		//Notify the client if there is a callback or not
		params.push(onResult != null);
		var s = new haxe.Serializer();
		s.serialize(params);
		var params = s.toString();
		doCall(__path, params, function (data :String) :Void {
			if (onResult != null) {
				onResult(new haxe.Unserializer(data).unserialize());
			}
		});
	}
	
	static function doCall(path : Array<String>, params : String, cb :String->Void) : Void 
	{
		// try {
			var params :Array<Dynamic> = new haxe.Unserializer(params).unserialize();
			var isCallback :Bool = params.pop();
			if (isCallback) {
				var localCallback = function (?ret :Dynamic) :Void {
					var s = new haxe.Serializer();
					s.serialize(ret);
					cb(s.toString());
				}
				params.push(localCallback);
			}
			com.pblabs.util.Assert.isNotNull(serverContext, "No serverContext??");
			serverContext.call(path, params);
		// } catch( e : Dynamic ) {
		// 	trace(e + " path=" + path + " " + com.pblabs.util.Log.getStackTrace());
		// 	trace('serverContext=' + serverContext);
		// 	var s = new haxe.Serializer();
		// 	s.serializeException(e);
		// 	cb(s.toString());
		// }
	}
}
