package com.pblabs.services.html5storage;

class Html5StorageDebugManager
	implements Html5StorageService
{
	public function new ()
	{
	}
	
	public function isAvailable (cb :Bool->Void) :Void
	{
		cb(false);
	}
	
	public function getItem (key :String, cb :Dynamic->Void) :Void
	{
		cb(null);
	}
	
	public function setItem (key :String, val :Dynamic, cb :Bool->Void) :Void
	{
		cb(false);
	}
	
	public function removeItem (key :String, cb :Bool->Void) :Void
	{
		cb(false);
	}
	
	public function getLength(cb :Int->Void) :Void
	{
		cb(0); 
	}
	
	public function key(index :Int, cb :String->Void) :Void
	{
		cb(null);
	}
}
