/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.debug;

import haxe.FastList;

import haxe.PosInfos;

import haxe.Stack;

import org.transition9.rtti.ReflectUtil;


/**
 * A simple Logging mechanism.
 *
 * Log instances are created for modules, and the Logging level can be configured per
 * module in a hierarchical fashion.
 *
 * Typically, you should create a module name based on the full path to a class :
 * calling getLog() and passing an object or Class will do this. Alternattely, you
 * may create a Log to share in several classes in a package, in which case the
 * module name can be like "com.foocorp.games.bunnywar". Finally, you can just
 * create made-up module names like "mygame" or "util", but this is not recommended.
 * You really should name things based on your packages, and your packages should be
 * named according to Sun's recommendations for Java packages.
 *
 * Typical usage for creating a Log to be used by the entire class would be :
 * public class MyClass
 * {
 *	 private static const Log :Log = Log.getLog(MyClass);
 *	 ...
 *
 * OR, if you just need a one-off Log :
 *	 protected function doStuff (thingy :Thingy) :void
 *	 {
 *		  if (!isValid(thingy)) {
 *			  Log.getLog(this).warn("Invalid thingy specified", "thingy", thingy);
 *			  ....
 */ 
 
typedef LogTarget = {
	function log (msg :String) :Void;
}

class Log
{
	// public static var traces = new Array<String->Void>();
	
	/** Log level constants. */
	public static var DEBUG :Int = 0;
	public static var INFO :Int = 1;
	public static var WARN :Int = 2;
	public static var ERROR :Int = 3;
	public static var OFF :Int = 4;
	// if you add to this, update LEVEL_NAMES and stringToLevel() at the bottom...

	public static var showDateTime :Bool = true;
	
	#if flash
		static var lines :Array<String> = new Array();
		public static var useHTML :Bool = true;
	#end

	
	/**
	 * Retrieve a Log for the specified module.
	 *
	 * @param moduleSpec can be a String of the module name, or any Object or Class to
	 * have the module name be the full package and name of the class (recommended).
	 */
	public static function getLog (moduleSpec :Dynamic) :Log
	{
		var module :String;
		if (moduleSpec == null ) {
			module = "";
		} else if (Std.is(moduleSpec, String)) {
			module = cast(moduleSpec, String);
		} else {
			module = Type.getClassName(ReflectUtil.getClass(moduleSpec));
		}
		var Log = _Logs.get(module);
		Log = if (Log == null) new Log(module) else Log; 
		return Log;
	}
	
	public static function testing (?msg :String, ?infos :PosInfos) :Void
	{
		var Log :Log = new Log("testing");
		Log.error(msg, infos);
	}

	// /**
	//  * A convenience function for quickly printing a stack trace
	//  * to the Log, useful for debugging.
	//  */
	// public static function dumpStack (?msg :String = "dumpStack", ?infos :PosInfos) :Void
	// {
	//	 testing(msg + "\n" + Stack.toString(Stack.callStack()), infos);
	// }
	
	public static function getStackTrace () :String
	{
		return Stack.toString(Stack.callStack());
	}

	/**
	 * Add a Logging target.
	 */
	public static function addTarget (target :LogTarget) :Void
	{
		//WTF won't lambda work???
		var contains :Bool = false;
		for (t in _targets) {
			if (t == target) {
				contains = false;
			}
		}
		
		if (!contains) {
			_targets.add(target);
		}
	}

	/**
	 * Remove a Logging target.
	 */
	public static function removeTarget (target :LogTarget) :Void
	{
		_targets.remove(target);
	}

	/**
	 * Set the Log level for the specified module.
	 *
	 * @param module The smallest prefix desired to configure a Log level.
	 * For example, you can set the global level with Log.setLevel("", Log.INFO);
	 * Then you can Log.setLevel("com.foo.game", Log.DEBUG). Now, everything
	 * Logs at INFO level except for modules within com.foo.game, which is at DEBUG.
	 */
	public static function setLevel (module :Dynamic, level :Int) :Void
	{
		
		if (Std.is(module, String)) {
			_setLevels.set(cast(module), level);
		} else {
			_setLevels.set(ReflectUtil.getClassName(module), level);
		}
		_levels = new Hash<Int>(); // reset cached levels
	}
	
	static function setLevelStatic (module :Dynamic, level :org.transition9.util.Log.LogLevel) :Void
	{
		setLevel (module, Type.enumIndex(level));
	}

	/**
	 * Parses a String in the form of ":info;com.foo.game :debug;com.bar.util :warn"
	 *
	 * Semicolons separate modules, colons separate a module name from the Log level.
	 * An empty string specifies the top-level (global) module.
	 */
	public static function setLevels (settingString :String) :Void
	{
		for (module in settingString.split(";")) {
			var setting :Array<String> = module.split(":");
			_setLevels.set(setting[0], stringToLevel(setting[1]));
		}
		_levels = new Hash<Int>(); // reset cached levels
	}

	/**
	 * Use Log.getLog();
	 */
	private function new (module :String)
	{
		if (module == null) {
			module = "";
		}
		_module = module;
	}

	/**
	 * Log a message with 'debug' priority.
	 *
	 * @param args The first argument is the actual message to Log. After that, each pair
	 * of parameters is printed in key/value form, the benefit being that if no Log
	 * message is generated then toString() will not be called on the values.
	 * If any argument is a function, it is invoked with no args, so that you may avoid
	 * converting detailed data into a String unless the message is actually Logged.
	 * A final parameter may be an Error, in which case the stack trace is printed.
	 *
	 * @example
	 * <listing version="3.0">
	 *	Log.debug("Message", "key1", value1, "key2", value2, optionalError);
	 * </listing>
	 */
	public function debug (msg :Dynamic, ?args :Array<Dynamic>, ?infos :PosInfos) :Void
	{
		doLog(DEBUG, msg, args, infos);
	}

	/**
	 * Log a message with 'info' priority.
	 *
	 * @param args The first argument is the actual message to Log. After that, each pair
	 * of parameters is printed in key/value form, the benefit being that if no Log
	 * message is generated then toString() will not be called on the values.
	 * If any argument is a function, it is invoked with no args, so that you may avoid
	 * converting detailed data into a String unless the message is actually Logged.
	 * A final parameter may be an Error, in which case the stack trace is printed.
	 *
	 * @example
	 * <listing version="3.0">
	 *	Log.info("Message", "key1", value1, "key2", value2, optionalError);
	 * </listing>
	 */
	public function info (msg :Dynamic, ?args :Array<Dynamic>, ?infos :PosInfos) :Void
	{
		doLog(INFO, msg, args, infos);
	}

	/**
	 * Log a message with 'warn' priority.
	 *
	 * @param args The first argument is the actual message to Log. After that, each pair
	 * of parameters is printed in key/value form, the benefit being that if no Log
	 * message is generated then toString() will not be called on the values.
	 * If any argument is a function, it is invoked with no args, so that you may avoid
	 * converting detailed data into a String unless the message is actually Logged.
	 * A final parameter may be an Error, in which case the stack trace is printed.
	 *
	 * @example
	 * <listing version="3.0">
	 *	Log.warn("Message", "key1", value1, "key2", value2, optionalError);
	 * </listing>
	 */
	public function warn (msg :Dynamic, ?args :Array<Dynamic>, ?infos :PosInfos) :Void
	{
		doLog(WARN, msg, args, infos);
	}

	/**
	 * Log a message with 'error' priority.
	 *
	 * @param args The first argument is the actual message to Log. After that, each pair
	 * of parameters is printed in key/value form, the benefit being that if no Log
	 * message is generated then toString() will not be called on the values.
	 * If any argument is a function, it is invoked with no args, so that you may avoid
	 * converting detailed data into a String unless the message is actually Logged.
	 * A final parameter may be an Error, in which case the stack trace is printed.
	 *
	 * @example
	 * <listing version="3.0">
	 *	Log.error("Message", "key1", value1, "key2", value2, optionalError);
	 * </listing>
	 */
	public function error (msg :Dynamic, ?args :Array<Dynamic>, ?infos :PosInfos) :Void
	{
		doLog(ERROR, msg, args, infos);
	}

	function doLog (level :Int, msg :Dynamic, args :Array<Dynamic>, infos :PosInfos ) :Void
	{
		if (level < getLevel(_module)) {
			return; // we don't want to Log it!
		}
		
		var fontColor = "#000000";
		if (_currentLevel != level) {
			_currentLevel = level;
			switch(level) {
				case 0 :
					fontColor = "#a6a5a5";
				case 1 :
					fontColor = "#000000";
				case 2 :
					fontColor = "#ff952a";
				case 3 :
					fontColor = "#ff0000";
				case 4 :
					fontColor = "#000000";
				default :
					fontColor = "#000000";
			}
		}
		
		if (Std.is(msg, Array)) {
			args = cast(msg, Array<Dynamic>).slice(1);
			msg = cast(msg, Array<Dynamic>)[0];
		}
		
		var LogMessage :String = formatMessage(level, msg, args, infos);
		#if flash
		LogTraceFlash(LogMessage);
		#else
		trace(LogMessage);
		#end
		// var htmlLogMessage = "<FONT COLOR=\"" + fontColor + "\">" + LogMessage + "</FONT>";
		var htmlLogMessage = LogMessage;
		// haxe.Log.trace(htmlLogMessage, infos);
		// possibly also dispatch to any other Log targets.
		for (target in _targets) {
			target.log(LogMessage);
		}
	}

	function formatMessage (level :Int, msg :Dynamic, args :Array<Dynamic>, infos :PosInfos) :String
	{
		if (infos != null) {
			// msg = LEVEL_NAMES[level] + ":" + infos.className.split(".")[infos.className.split(".").length - 1] + "." + infos.methodName + "." + infos.lineNumber + "  " + Std.string(msg);
			// msg = LEVEL_NAMES[level] + ":" + Std.string(msg);
			msg = Std.string(msg);
		}
		if (showDateTime) {
			msg = getTimeStamp()  + " " + msg;
		}
		if (args != null && args.length > 0) {
			if (args.length % 2 == 1) { // there's one extra arg
				var lastArg :Dynamic = args.pop();
				if (lastArg == null) { // assume it's an error that's just null
					args.push("error"); // print "error=null"
					args.push(lastArg); 
				} else {
					args.push(lastArg); // what? Well, cope by pushing it back with a ""
					args.push("");
				}
			}
			if (args.length > 1) {
				var ii :Int = 0;
				   while (ii < args.length) {
					msg += if (ii == 0) " [" else ", ";
					msg += argToString(args[ii]) + "=" + argToString(args[ii + 1]);
					ii += 2;
				   }
				msg += "]";
			}
		}
		
		if (infos != null) {
			return LEVEL_NAMES[level] + ":" + infos.fileName+":"+infos.lineNumber + "." +infos.methodName +"()  " + msg;
		} else {
			return LEVEL_NAMES[level] + ": " + msg;
		}
	}

	/**
	 * Safely format the argument to a String, calling the function if it is one.
	 */
	function argToString (arg :Dynamic) :String
	{
		try {
			if (Reflect.isFunction(arg)) {
				return Std.string((cast arg)());
			} else {
				return Std.string(arg);
			}
		} catch (e :Dynamic){// "Error :";//(e :Error) {
			try {
				return "<" + Std.string(e) + ">";
			} catch (unknown :Dynamic) {
				// return value at end of method...
			}
		}
		return "<Error>";
	}

	function getTimeStamp () :String
	{
		var d :Date = Date.now();
		return d.toString();
	}

	/**
	 * Get the Logging level for the specified module.
	 */
	public static function getLevel (module :String) :Int
	{
		// we probably already have the level cached for this module
		var lev = _levels.get(module);
		if (lev == null) {
			// cache miss- copy some parent module's level...
			var ancestor :String = module;
			while (true) {
				lev = _setLevels.get(ancestor);
				if (lev != null || ancestor == "") {
					// bail if we found a setting or get to the top level,
					// but always save the level from _setLevels into _levels
					_levels.set(module, lev); // if lev was null, this will become 0 (DEBUG)
					break;
				}
				var dex :Int = ancestor.lastIndexOf(".");
				ancestor = if (dex == -1) "" else ancestor.substr(0, dex);
			}
		}
		return lev;
	}

	static function stringToLevel (s :String) :Int
	{
		switch (s.toLowerCase()) {
			case "debug":return DEBUG;
			case "info":return INFO;
			case "warn" :return WARN; 
			case "warning":return WARN;
			case "error":return ERROR;
			case "off":return OFF;
			default :return DEBUG;
		}
	}
	
	#if flash
	public static function traceWithMethod(v :Dynamic, ?pos :haxe.PosInfos ) {
		var tf = flash.Boot.getTrace();
		var pstr = if(pos == null ) "(null)" else pos.fileName+":"+pos.lineNumber + "." +pos.methodName +"()";
		untyped __global__["trace"](pstr +":"+flash.Boot.__string_rec(v,""));
		if(lines == null ) lines = [];
		lines = lines.concat((pstr +":"+flash.Boot.__string_rec(v,"")).split("\n"));
		tf.text = lines.join("\n");
		var stage = flash.Lib.current.stage;
		if(stage == null )
			return;
		while(lines.length > 1 && tf.height > stage.stageHeight ) {
			lines.shift();
			tf.text = lines.join("\n");
		}
	}
	
	static function LogTraceFlash (line :String) :Void
	{
		
		var tf = flash.Boot.getTrace();
		lines.push(line);
		
		if (useHTML) {
			tf.htmlText = lines.join("<br/>\n");
		} else {
			tf.text = lines.join("\n");
		}
		var stage = flash.Lib.current.stage;
		if(stage == null )
		return;
		while(lines.length > 1 && tf.height > stage.stageHeight ) {
			lines.shift();
			if (useHTML) {
				tf.htmlText = lines.join("<br/>\n");
			} else {
				tf.text = lines.join("\n");
			}
		}
	}
	#end
	
	static function __init__ () :Void
	{
		_setLevels = new Hash<Int>();
		_targets = new List<LogTarget>();
		#if flash
			_setLevels.set("", if (flash.system.Capabilities.isDebugger) 0 else 4);//Debug or Off (0 or 4)
			haxe.Log.trace = traceWithMethod;
			_targets.add(new FlashLogTarget());
		#else
			_setLevels.set("", 4);//4==OFF, but the static OFF value not known here
		#end
		
		#if (js && !nodejs)
		haxe.Firebug.redirectTraces();
		#end
	}
	
	static function debugStatic (msg :Dynamic, ?infos :PosInfos) :Void
	{
		var Log = getLog(validateInfosClassName(infos));
		Log.debug(msg, null, infos);
	}
	
	static function infoStatic (msg :Dynamic, ?infos :PosInfos) :Void
	{
		var Log = getLog(validateInfosClassName(infos));
		Log.info(msg, null, infos);
	}
	
	static function warnStatic (msg :Dynamic, ?infos :PosInfos) :Void
	{
		var Log = getLog(validateInfosClassName(infos));
		Log.warn(msg, null, infos);
	}
	
	static function errorStatic (msg :Dynamic, ?infos :PosInfos) :Void
	{
		var Log = getLog(validateInfosClassName(infos));
		Log.error(msg, null, infos);
	}
	
	inline static function validateInfosClassName(infos :PosInfos) :String
	{
		return infos != null ? infos.className : null;
	}
	
	public static function setup () :Void
	{
		#if flash
		//Show the method names
		haxe.Log.trace = traceWithMethod;
		#end
		
		#if (js && !nodejs)
		haxe.Firebug.redirectTraces();
		#end
		
		#if !no_logging
		Log.showDateTime = false;
		org.transition9.util.Log.debug = debugStatic;
		org.transition9.util.Log.info = infoStatic;
		org.transition9.util.Log.warn = warnStatic;
		org.transition9.util.Log.error = errorStatic;
		org.transition9.util.Log.setLevel = setLevelStatic;
		//Basic default, in case the user doesn't set anything
		setLevel("", WARN);
		#end
	}
	
	/** The module to which this Log instance applies. */
	var _module :String;

	/** Other registered LogTargets, besides the trace Log. */
	static var _targets :List<LogTarget>;

	/** A cache of Log levels, copied from _setLevels. */
	static var _levels :Hash<Int> = new Hash<Int>();

	/** The configured Log levels. */
	static var _setLevels :Hash<Int>;
	
	static var _currentLevel :Int = -1;
	
	static var _Logs :Hash<Log> = new Hash<Log>();
	
	/** The outputted names of each level. The last one isn't used, it corresponds with OFF. */
	static var LEVEL_NAMES :Array<Dynamic> = [ "debug", "INFO", "WARN", "ERROR", false ];
}


#if flash
class FlashLogTarget// implements LogTarget
{
	public function new () {}
	public function log (msg :String) :Void
	{
		untyped __global__["trace"](msg);
	}
}
#end


