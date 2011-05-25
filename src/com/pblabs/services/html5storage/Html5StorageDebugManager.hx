package com.pblabs.services.html5storage;

class Html5StorageDebugManager
	implements Html5StorageService
{
	public function new ()
	{
	}
	
	public function isAvailable () :Bool
	{
		return false;
	}
	
	public function getItem (key :String) :Dynamic
	{
		return null;
	}
	
	public function setItem (key :String, val :Dynamic) :Void
	{
	}
	
	public function removeItem (key :String) :Void
	{
	}
	
	public function getLength() :Int
	{
		return 0; 
	}
	
	public function key(index :Int) :String
	{
		return null;
	}
}
