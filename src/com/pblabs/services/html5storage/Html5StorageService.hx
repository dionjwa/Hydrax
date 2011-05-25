package com.pblabs.services.html5storage;

/**
  * Platform independent (flash and js) mechanisms for accessing the Html5 localStorage object for storing
  * haxe serialized objects.
  */
interface Html5StorageService
{
	function isAvailable () :Bool;
	function getItem (key :String) :Dynamic;
	function setItem (key :String, val :Dynamic) :Void;
	function removeItem (key :String) :Void;
	function getLength() :Int;
	function key(index :Int) :String;
}
