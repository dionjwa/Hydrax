package com.pblabs.services.html5storage;

/**
  * Js implementation of a remoting service that uses HTML5 localStorage.
  * If Modernizr is available, it's used to detect localStorage
  * http://www.modernizr.com/
  */
class Html5StorageManager implements Html5StorageService
{
	#if js
	var _isAvailable :Bool;
	static var ERR_MSG = "No localStorage.  Did you check first?";
	
	public function new ()
	{
		//Attempt localStorage detection
		_isAvailable = false;
		
		#if modernizr
		_isAvailable = Modernizr.localstorage;
		#else
		com.pblabs.util.Log.warn("modernizr is missing, so we cannot safely check for localStorage");
		#end
	}
	
	public function isAvailable (cb :Bool->Void) :Void
	{
		return cb(_isAvailable);
	}
	
	public function getItem (key :String, cb :Dynamic->Void) :Void
	{
		check();
		var item = LocalStorage.getItem(key);
		if (item == null) {
			cb(null);
		}
		try {
			cb(haxe.Unserializer.run(item));
		} catch (e :Dynamic) {
			com.pblabs.util.Log.error("Error unserializing " + key + ", so removing the item. e=" + e);
			removeItem(key, function (_) :Void {
				cb(null);
			});
		}
	}
	
	public function setItem (key :String, val :Dynamic, cb :Bool->Void) :Void
	{
		check();
		var itemString = haxe.Serializer.run(val);
		LocalStorage.setItem(key, itemString);
		cb(true);
	}
	
	public function removeItem (key :String, cb :Bool->Void) :Void
	{
		check();
		LocalStorage.removeItem(key);
		cb(true);
	}
	
	public function getLength(cb :Int->Void) :Void
	{
		check();
		cb(LocalStorage.length); 
	}
	
	public function key(index :Int, cb :String->Void) :Void
	{
		check();
		cb(LocalStorage.key(index));
	}
	
	inline function check () :Void
	{
		com.pblabs.util.Preconditions.checkArgument(_isAvailable, ERR_MSG);
	}
	#end
}
