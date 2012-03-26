package com.pblabs.engine.injection;

/**
  * Interface for injectors/maps
  */
interface IInjector
{
	var parentInjector (get_parentInjector, set_parentInjector) :IInjector;
	var isParentInjector (get_isParentInjector, never) :Bool;
	function mapValue (type :Class<Dynamic>, value :Dynamic, ?optionalName :String) :Void;
	function getMapping (key :Class<Dynamic>, ?name :String) :Dynamic;
	function hasMapping (key :Class<Dynamic>, ?name :String) :Bool;
	function unmap (cls :Class<Dynamic>, ?name :String) :Void;
	function injectInto (obj :Dynamic) :Void;
	function shutdown () :Void;
}
