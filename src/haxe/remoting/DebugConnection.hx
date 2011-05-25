package haxe.remoting;

/**
  * For dummying up remoting connections locally.
  */
class DebugConnection 
	implements Connection, implements Dynamic<Connection>
{
	/** Client side */
	var _context : Context;
	var __path : Array<String>;
	
	public static var serverContext :Context;

	public function new( ctx, ?path) {
		_context = ctx;
		__path = path == null ? [] : path;
	}

	public function resolve(field) : Connection {
		var e = new DebugConnection(_context, __path.copy());
		e.__path.push(field);
		return e;
	}

	public function close() {
	}

	public function call( params : Array<Dynamic> ) : Dynamic 
	{
		var s = new haxe.Serializer();
		s.serialize(params);
		var params = s.toString();
		var data = doCall(__path, params);
		return new haxe.Unserializer(data).unserialize();
	}
	
	static function doCall(path : Array<String>, params : String ) : String 
	{
		try {
			var params = new haxe.Unserializer(params).unserialize();
			var ret = serverContext.call(path, params);
			var s = new haxe.Serializer();
			s.serialize(ret);
			return s.toString();
		} catch( e : Dynamic ) {
			var s = new haxe.Serializer();
			s.serializeException(e);
			return s.toString();
		}
	}
}
