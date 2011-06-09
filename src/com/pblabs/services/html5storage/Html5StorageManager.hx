package com.pblabs.services.html5storage;

/**
  * Requires the Modernizr script executed before this.
  * http://www.modernizr.com/
  */
class Html5StorageManager
	#if js
	implements Html5StorageService
	#end
{
	public static var REMOTING_ID = "html5storage";
	
	#if js
	var _isAvailable :Bool;
	static var ERR_MSG = "No localStorage.  Did you check first?";
	
	public function new ()
	{
		_isAvailable = false;
		try {
			_isAvailable = untyped __js__('Modernizr.localstorage');
		} catch (e :Dynamic) {
			com.pblabs.util.Log.error(ERR_MSG + "\n" + e);
		}
	}
	
	public function isAvailable () :Bool
	{
		return _isAvailable;
	}
	
	public function getItem (key :String) :Dynamic
	{
		check();
		var item = LocalStorage.getItem(key);
		if (item == null) {
			return null;
		}
		try {
			return haxe.Unserializer.run(item);
		} catch (e :Dynamic) {
			com.pblabs.util.Log.error("Error unserializing " + key + ", so removing the item. e=" + e);
			removeItem(key);
			return null;
		}
	}
	
	public function setItem (key :String, val :Dynamic) :Void
	{
		check();
		var itemString = haxe.Serializer.run(val);
		LocalStorage.setItem(key, itemString);
	}
	
	public function removeItem (key :String) :Void
	{
		check();
		LocalStorage.removeItem(key);
	}
	
	public function getLength() :Int
	{
		check();
		return LocalStorage.length; 
	}
	
	public function key(index :Int) :String
	{
		check();
		return LocalStorage.key(index);
	}
	
	inline function check () :Void
	{
		com.pblabs.util.Preconditions.checkArgument(_isAvailable, ERR_MSG);
	}
	#end
}
