package js.externs;

import js.Node;

using StringTools;
using Lambda;

typedef RouterApp = {
	function get(path :String, onRequest :ServerRequest->ServerResponse->Dynamic->Void) :Void;
}

typedef OAuth2 = {
	function myHostname (arg :Dynamic) :OAuth2;
	function appId (arg :Dynamic) :OAuth2;
	function appSecret (arg :Dynamic) :OAuth2;
	function entryPath (arg :Dynamic) :OAuth2;
	function scope (arg :Dynamic) :OAuth2;
	function handleAuthCallbackError (arg :Dynamic) :OAuth2;
	function findOrCreateUser (arg :Dynamic) :OAuth2;
	function redirectPath (arg :Dynamic) :OAuth2;
	function apiHost (arg :Dynamic) :OAuth2;
	function configurable () :Dynamic;
}

typedef EveryAuth = {
	var facebook :OAuth2;
	var google :OAuth2;
	// function middleware() :MiddleWare;
	function middleware() :Dynamic;
}

typedef Server = {
	function use (?middlewareMountPoint :Dynamic, middleware :Dynamic) :Server;
	function listen (port :Int, ?address :String) :Void;
}

// typedef Next = Void->MiddleWare;
// typedef MiddleWare = ServerRequest->ServerResponse->Next->Void;
typedef MiddleWare = ServerRequest->ServerResponse->Dynamic->Void;

typedef Connect = {
	function createServer (a1 :Dynamic, ?a2 :Dynamic, ?a3 :Dynamic, ?a4 :Dynamic, ?a5 :Dynamic, ?a6 :Dynamic, ?a7 :Dynamic, ?a8 :Dynamic, ?a9 :Dynamic) :Server;
	function cookieParser() :MiddleWare;
	function bodyParser() :MiddleWare;
	function session(params :Dynamic) :Void;
	function router(routes :Dynamic->Void) :Void;
	function Static (path :String, ?options :Dynamic) :MiddleWare; 
	function errorHandler (options :Dynamic) :MiddleWare;
}

@:native("JSON") 
extern class JSON {
	static function stringify( val :Dynamic ) : String;
}
