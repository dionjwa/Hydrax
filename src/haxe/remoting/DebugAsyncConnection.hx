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
		try {
			var params :Array<Dynamic> = new haxe.Unserializer(params).unserialize();
			params.push(function (?ret :Dynamic) :Void {
				var s = new haxe.Serializer();
				s.serialize(ret);
				cb(s.toString());
			});
			serverContext.call(path, params);
		} catch( e : Dynamic ) {
			var s = new haxe.Serializer();
			s.serializeException(e);
			cb(s.toString());
		}
	}
}
