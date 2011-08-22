package haxe.remoting;

/**
	Asynchronous (both sides) communication between Flash and Javascript.
	Stores callbacks from the client in an IntHash, and calls them when the 
	server call returns.  
	If the callback isn't called within some time limit, an error is thrown.
**/
class ExternalAsyncConnection implements AsyncConnection
{
	/**
	  * If the supplied callback is not called within 2 seconds, log the error.
	  */
	public static var CALLBACK_TIMEOUT_MS = 2000;
	var __data : { name : String, ctx : Context, #if js flash : String #end };
	var __path : Array<String>;
	var _errorHandler :Dynamic->Void;
	
	static var _callbackHash :Int = 1;
	static var _callbacks = new IntHash<Null<Dynamic>->Void>();
	
	function new( data, path ) {
		__data = data;
		__path = path;
		setErrorHandler( function (err :Dynamic) :Void {
			trace(err);
		});
	}

	public function resolve(field) : AsyncConnection {
		var e = new ExternalAsyncConnection(__data,__path.copy());
		e.__path.push(field);
		return e;
	}

	public function close() {
		connections.remove(__data.name);
		_errorHandler = null;
	}
	
	public function setErrorHandler (handler :Dynamic->Void) :Void
	{
		_errorHandler = handler;
	}

	#if flash9
	static function escapeString( s : String ) {
		return s.split("\\").join("\\\\");
	}
	#elseif flash
	static function escapeString( s : String ) {
		return s.split("\\").join("\\\\").split("&").join("&amp;");
	}
	#else
	static inline function escapeString(s) {
		return s;
	}
	#end

	public function call( params : Array<Dynamic>, ?onResult :Null<Dynamic>->Void ) : Void 
	{
		var callbackHash = ExternalAsyncConnection._callbackHash++; 
		if (onResult != null) {
			//Store the callback, and set a timeout for the callback
			ExternalAsyncConnection._callbacks.set(callbackHash, onResult);
			//If the call takes longer than CALLBACK_TIMEOUT_MS, log the error, and remove the callback
			//(so it can be garbage collected)
			var self = this;
			haxe.Timer.delay(function () :Void {
				if (ExternalAsyncConnection._callbacks.exists(callbackHash)) {
					ExternalAsyncConnection._callbacks.remove(callbackHash);
					var errorText = "call " + callbackHash + " with params " + params + " did not return after " + CALLBACK_TIMEOUT_MS + "ms"; 
					if (self._errorHandler != null) {
						self._errorHandler(errorText);
					} else {
						throw errorText; 
					}
				}
			}, CALLBACK_TIMEOUT_MS);
		}
		var s = new haxe.Serializer();
		s.serialize(params);
		var params = escapeString(s.toString());
		var data = null;
		#if flash
		try {
			data = flash.external.ExternalInterface.call("haxe.remoting.ExternalAsyncConnection.doCall",__data.name,__path.join("."),params, _callbackHash);
		} catch (e :Dynamic) {
			trace("Error calling __data.name=" + __data.name + ", path=" + __path.join(".") + ", params=" + params + "\ne=" + e);
			if (_errorHandler != null) {
				_errorHandler(e);
			}
			ExternalAsyncConnection._callbacks.remove(callbackHash);
			if (onResult != null) {
				onResult(e);
			}
		}
		#elseif js
			var fobj : Dynamic = untyped window.document[__data.flash];
			if( fobj == null ) fobj = untyped window.document.getElementById(__data.flash);
			if( fobj == null ) throw "Could not find flash object '"+__data.flash+"'";
			try	data = fobj.externalRemotingCall(__data.name,__path.join("."),params, _callbackHash) catch( e : Dynamic ) {
				trace("Error calling __data.name=" + __data.name + ", path=" + __path.join(".") + ", params=" + params + "\ne=" + e);
				ExternalAsyncConnection._callbacks.remove(callbackHash);
				if (_errorHandler != null) {
					_errorHandler(e);
				}
				if (onResult != null) {
					onResult(e);
				}
			};
		#end
	}

	static var connections = new Hash<ExternalAsyncConnection>();

	static function doCall( name : String, path : String, params : String, callbackId :Int ) : Void {
		try {
			var cnx = connections.get(name);
			if( cnx == null ) throw "Unknown connection : "+name;
			if( cnx.__data.ctx == null ) throw "No context shared for the connection "+name;
			var params :Array<Dynamic> = new haxe.Unserializer(params).unserialize();
			params.push(function (?ret :Null<Dynamic>) :Void {
				var s = new haxe.Serializer();
				s.serialize(ret);
				#if flash
					flash.external.ExternalInterface.call("haxe.remoting.ExternalAsyncConnection.doCallback", cnx.__data.name, callbackId, escapeString(s.toString()));
				#elseif js
					var fobj : Dynamic = untyped window.document[cnx.__data.flash];
					if( fobj == null ) fobj = untyped window.document.getElementById(cnx.__data.flash);
					if( fobj == null ) throw "Could not find flash object '"+cnx.__data.flash+"'";
					try	fobj.externalRemotingCallback(cnx.__data.name, callbackId, s.toString()+"#") catch( e : Dynamic ) {trace(e);};
				#end
			});
			#if flash
			cnx.__data.ctx.call(path.split("."), params);
			#elseif js
			//Call later, so flash doesn't hang
			//http://www.calypso88.com/?p=25
			var f = function () :Void {
				cnx.__data.ctx.call(path.split("."), params);
			}
			untyped __js__("setTimeout(f, 0)");
			#end
		} catch( e : Dynamic ) {
			trace(e);
			throw e;
		}
	}
	
	static function doCallback(name :String, callbackId :Int, data :String) : Void {
		var cnx = connections.get(name);
		if( cnx == null ) throw "Unknown connection : "+name;
		if( cnx.__data.ctx == null ) throw "No context shared for the connection "+name;
		var cb = ExternalAsyncConnection._callbacks.get(callbackId);
		ExternalAsyncConnection._callbacks.remove(callbackId);
		if (cb != null) {
			var cbData = new haxe.Unserializer(data).unserialize();
			cb(cbData);
		} 
	}

	#if flash

	public static function jsConnect( name : String, ?ctx : Context ) {
		if( !flash.external.ExternalInterface.available )
			throw "External Interface not available";
		#if flash9
		try flash.external.ExternalInterface.addCallback("externalRemotingCall",doCall) catch( e : Dynamic ) {};
		try flash.external.ExternalInterface.addCallback("externalRemotingCallback",doCallback) catch( e : Dynamic ) {};
		#else
		flash.external.ExternalInterface.addCallback("externalRemotingCall",null,doCall);
		flash.external.ExternalInterface.addCallback("externalRemotingCallback",null,doCallback);
		#end
		var cnx = new ExternalAsyncConnection({ name : name, ctx : ctx },[]);
		connections.set(name,cnx);
		return cnx;
	}

	#elseif js

	public static function flashConnect( name : String, flashObjectID : String, ?ctx : Context ) {
		var cnx = new ExternalAsyncConnection({ ctx : ctx, name : name, flash : flashObjectID },[]);
		connections.set(name,cnx);
		return cnx;
	}

	#end

}
