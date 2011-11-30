package com.pblabs.services.html5storage;

/**
  * Platform independent (flash and js) mechanisms for accessing the Html5 localStorage object for storing
  * haxe serialized objects.
  */
@remoteId("html5Storage")
interface Html5StorageService
{
	function isAvailable (cb :Bool->Void) :Void;
	function getItem (key :String, cb :Dynamic->Void) :Void;
	function setItem (key :String, val :Dynamic, cb :Bool->Void) :Void;
	function removeItem (key :String, cb :Bool->Void) :Void;
	function getLength(cb :Int->Void) :Void;
	function key(index :Int, cb :String->Void) :Void;
}
