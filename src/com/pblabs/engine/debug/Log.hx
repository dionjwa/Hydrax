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

import com.pblabs.util.ReflectUtil;


/**
 * A simple logging mechanism.
 *
 * Log instances are created for modules, and the logging level can be configured per
 * module in a hierarchical fashion.
 *
 * Typically, you should create a module name based on the full path to a class:
 * calling getLog() and passing an object or Class will do this. Alternattely, you
 * may create a Log to share in several classes in a package, in which case the
 * module name can be like "com.foocorp.games.bunnywar". Finally, you can just
 * create made-up module names like "mygame" or "util", but this is not recommended.
 * You really should name things based on your packages, and your packages should be
 * named according to Sun's recommendations for Java packages.
 *
 * Typical usage for creating a Log to be used by the entire class would be:
 * public class MyClass
 * {
 *	 private static const log :Log = Log.getLog(MyClass);
 *	 ...
 *
 * OR, if you just need a one-off Log:
 *	 protected function doStuff (thingy :Thingy) :void
 *	 {
 *		  if (!isValid(thingy)) {
 *			  Log.getLog(this).warn("Invalid thingy specified", "thingy", thingy);
 *			  ....
 */ 
 
 
class Log
 {
	/** Log level constants. */
	public static var DEBUG:Int = 0;
	public static var INFO:Int = 1;
	public static var WARNING:Int = 2;
	public static var ERROR:Int = 3;
	public static var OFF:Int = 4;
	// if you add to this, update LEVEL_NAMES and stringToLevel() at the bottom...

	public static var showDateTime :Bool = true;
	
	#if (flash || cpp)
		static var lines : Array<String> = new Array();
		public static var useHTML : Bool = true;
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
		if (Std.is(moduleSpec, String)) {
			module = cast(moduleSpec, String);
		} else {
			module = Type.getClassName(ReflectUtil.getClass(moduleSpec));
		}
		var log = _logs.get(module);
		log = if (log == null) new Log(module) else log; 
		return log;
	}
	
	public static function testing (?msg :String, ?infos : PosInfos) :Void
	{
		var log :Log = new Log("testing");
		log.error(msg, infos);
	}

	// /**
	//  * A convenience function for quickly printing a stack trace
	//  * to the log, useful for debugging.
	//  */
	// public static function dumpStack (?msg :String = "dumpStack", ?infos : PosInfos) :Void
	// {
	//	 testing(msg + "\n" + Stack.toString(Stack.callStack()), infos);
	// }
	
	public static function getStackTrace () :String
	{
		return Stack.toString(Stack.callStack());
	}

	/**
	 * Add a logging target.
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
	 * Remove a logging target.
	 */
	public static function removeTarget (target :LogTarget) :Void
	{
		_targets.remove(target);
	}

	/**
	 * Set the log level for the specified module.
	 *
	 * @param module The smallest prefix desired to configure a log level.
	 * For example, you can set the global level with Log.setLevel("", Log.INFO);
	 * Then you can Log.setLevel("com.foo.game", Log.DEBUG). Now, everything
	 * logs at INFO level except for modules within com.foo.game, which is at DEBUG.
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

	/**
	 * Parses a String in the form of ":info;com.foo.game:debug;com.bar.util:warning"
	 *
	 * Semicolons separate modules, colons separate a module name from the log level.
	 * An empty string specifies the top-level (global) module.
	 */
	public static function setLevels (settingString :String) :Void
	{
		for (module in settingString.split(";")) {
			var setting:Array<String> = module.split(":");
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
	 * @param args The first argument is the actual message to log. After that, each pair
	 * of parameters is printed in key/value form, the benefit being that if no log
	 * message is generated then toString() will not be called on the values.
	 * If any argument is a function, it is invoked with no args, so that you may avoid
	 * converting detailed data into a String unless the message is actually logged.
	 * A final parameter may be an Error, in which case the stack trace is printed.
	 *
	 * @example
	 * <listing version="3.0">
	 *	log.debug("Message", "key1", value1, "key2", value2, optionalError);
	 * </listing>
	 */
	public function debug (msg :Dynamic, ?args:Array<Dynamic>, ?infos : PosInfos) :Void
	{
		doLog(DEBUG, msg, args, infos);
	}

	/**
	 * Log a message with 'info' priority.
	 *
	 * @param args The first argument is the actual message to log. After that, each pair
	 * of parameters is printed in key/value form, the benefit being that if no log
	 * message is generated then toString() will not be called on the values.
	 * If any argument is a function, it is invoked with no args, so that you may avoid
	 * converting detailed data into a String unless the message is actually logged.
	 * A final parameter may be an Error, in which case the stack trace is printed.
	 *
	 * @example
	 * <listing version="3.0">
	 *	log.info("Message", "key1", value1, "key2", value2, optionalError);
	 * </listing>
	 */
	public function info (msg :Dynamic, ?args:Array<Dynamic>, ?infos : PosInfos) :Void
	{
		doLog(INFO, msg, args, infos);
	}

	/**
	 * Log a message with 'warning' priority.
	 *
	 * @param args The first argument is the actual message to log. After that, each pair
	 * of parameters is printed in key/value form, the benefit being that if no log
	 * message is generated then toString() will not be called on the values.
	 * If any argument is a function, it is invoked with no args, so that you may avoid
	 * converting detailed data into a String unless the message is actually logged.
	 * A final parameter may be an Error, in which case the stack trace is printed.
	 *
	 * @example
	 * <listing version="3.0">
	 *	log.warning("Message", "key1", value1, "key2", value2, optionalError);
	 * </listing>
	 */
	public function warning (msg :Dynamic, ?args:Array<Dynamic>, ?infos : PosInfos) :Void
	{
		doLog(WARNING, msg, args, infos);
	}

	/**
	 * Log a message with 'error' priority.
	 *
	 * @param args The first argument is the actual message to log. After that, each pair
	 * of parameters is printed in key/value form, the benefit being that if no log
	 * message is generated then toString() will not be called on the values.
	 * If any argument is a function, it is invoked with no args, so that you may avoid
	 * converting detailed data into a String unless the message is actually logged.
	 * A final parameter may be an Error, in which case the stack trace is printed.
	 *
	 * @example
	 * <listing version="3.0">
	 *	log.error("Message", "key1", value1, "key2", value2, optionalError);
	 * </listing>
	 */
	public function error (msg :Dynamic, ?args:Array<Dynamic>, ?infos : PosInfos) :Void
	{
		doLog(ERROR, msg, args, infos);
	}

	function doLog (level :Int, msg :Dynamic, args :Array<Dynamic>, infos : PosInfos ) :Void
	{
		if (level < getLevel(_module)) {
			return; // we don't want to log it!
		}
		
		var fontColor = "#000000";
		if (_currentLevel != level) {
			_currentLevel = level;
			switch(level) {
				case 0: 
					fontColor = "#a6a5a5";
				case 1:
					fontColor = "#000000";
				case 2: 
					fontColor = "#ff952a";
				case 3: 
					fontColor = "#ff0000";
				case 4: 
					fontColor = "#000000";
				default: 
					fontColor = "#000000";
			}
		}
		
		if (Std.is(msg, Array)) {
			args = cast(msg, Array<Dynamic>).slice(1);
			msg = cast(msg, Array<Dynamic>)[0];
		}
		
		var logMessage:String = formatMessage(level, msg, args, infos);
		#if (flash || cpp)
		logTraceFlash(logMessage);
		#else
		trace(logMessage);
		#end
		// var htmlLogMessage = "<FONT COLOR=\"" + fontColor + "\">" + logMessage + "</FONT>";
		var htmlLogMessage = logMessage;
		// haxe.Log.trace(htmlLogMessage, infos);
		// possibly also dispatch to any other log targets.
		for (target in _targets) {
			target.log(logMessage);
		}
	}

	function formatMessage (level :Int, msg :Dynamic, args :Array<Dynamic>, infos :PosInfos) :String
	{
		if (infos != null) {
			// msg = LEVEL_NAMES[level] + ": " + infos.className.split(".")[infos.className.split(".").length - 1] + "." + infos.methodName + "." + infos.lineNumber + "  " + Std.string(msg);
			// msg = LEVEL_NAMES[level] + ": " + Std.string(msg);
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
				var ii:Int = 0;
				   while (ii < args.length) {
					msg += if (ii == 0) " [" else ", ";
					msg += argToString(args[ii]) + "=" + argToString(args[ii + 1]);
					ii += 2;
				   }
				msg += "]";
			}
		}
		
		return LEVEL_NAMES[level] + ": " + infos.fileName+":"+infos.lineNumber + "." +infos.methodName +"()  " + msg;
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
		} catch (e :Dynamic){// "Error:";//(e :Error) {
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
		var d:Date = Date.now();
		return d.toString();
	}

	/**
	 * Get the logging level for the specified module.
	 */
	public static function getLevel (module :String) :Int
	{
		// we probably already have the level cached for this module
		var lev = _levels.get(module);
		if (lev == null) {
			// cache miss- copy some parent module's level...
			var ancestor:String = module;
			while (true) {
				lev = _setLevels.get(ancestor);
				if (lev != null || ancestor == "") {
					// bail if we found a setting or get to the top level,
					// but always save the level from _setLevels into _levels
					_levels.set(module, lev); // if lev was null, this will become 0 (DEBUG)
					break;
				}
				var dex:Int = ancestor.lastIndexOf(".");
				ancestor = if (dex == -1) "" else ancestor.substr(0, dex);
			}
		}
		return lev;
	}

	static function stringToLevel (s :String) :Int
	{
		switch (s.toLowerCase()) {
			case "debug": return DEBUG;
			case "info": return INFO;
			case "warning" :return WARNING; 
			case "warn": return WARNING;
			case "error": return ERROR;
			case "off": return OFF;
			default :return DEBUG;
		}
	}
	
	#if (flash || cpp)
	public static function traceWithMethod( v : Dynamic, ?pos : haxe.PosInfos ) {
		var tf = flash.Boot.getTrace();
		var pstr = if( pos == null ) "(null)" else pos.fileName+":"+pos.lineNumber + "." +pos.methodName +"()";
		untyped __global__["trace"](pstr +": "+flash.Boot.__string_rec(v,""));
		if( lines == null ) lines = [];
		lines = lines.concat((pstr +": "+flash.Boot.__string_rec(v,"")).split("\n"));
		tf.text = lines.join("\n");
		var stage = flash.Lib.current.stage;
		if( stage == null )
			return;
		while( lines.length > 1 && tf.height > stage.stageHeight ) {
			lines.shift();
			tf.text = lines.join("\n");
		}
	}
	
	static function logTraceFlash (line :String) :Void
	{
		
		var tf = flash.Boot.getTrace();
		lines.push(line);
		
		if (useHTML) {
			tf.htmlText = lines.join("<br/>\n");
		} else {
			tf.text = lines.join("\n");
		}
		var stage = flash.Lib.current.stage;
		if( stage == null )
		return;
		while( lines.length > 1 && tf.height > stage.stageHeight ) {
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
		#if (flash || cpp)
			_setLevels.set("", if (flash.system.Capabilities.isDebugger) 0 else 4);//Debug or Off (0 or 4)
			haxe.Log.trace = traceWithMethod;
			_targets.add(new FlashLogTarget());
		#else
			_setLevels.set("", 4);//4==OFF, but the static OFF value not known here
		#end
	}
	
	static function debugStatic (msg :Dynamic, ?infos : PosInfos) :Void
	{
		var log = getLog(infos.className);
		log.debug(msg, null, infos);
	}
	
	static function infoStatic (msg :Dynamic, ?infos : PosInfos) :Void
	{
		var log = getLog(infos.className);
		log.info(msg, null, infos);
	}
	
	static function warningStatic (msg :Dynamic, ?infos : PosInfos) :Void
	{
		var log = getLog(infos.className);
		log.warning(msg, null, infos);
	}
	
	static function errorStatic (msg :Dynamic, ?infos : PosInfos) :Void
	{
		var log = getLog(infos.className);
		log.error(msg, null, infos);
	}
	
	public static function setup () :Void
	{
		#if (flash || cpp)
		//Show the method names
		haxe.Log.trace = traceWithMethod;
		#end
		
		#if !no_logging
		Log.showDateTime = false;
		com.pblabs.util.Log.debug = debugStatic;
		com.pblabs.util.Log.info = infoStatic;
		com.pblabs.util.Log.warn = warningStatic;
		com.pblabs.util.Log.error = errorStatic;
		//Basic default, in case the user doesn't set anything
		setLevel("", WARNING);
		#end
	}
	
	/** The module to which this log instance applies. */
	var _module:String;

	/** Other registered LogTargets, besides the trace log. */
	static var _targets :List<LogTarget>;

	/** A cache of log levels, copied from _setLevels. */
	static var _levels :Hash<Int> = new Hash<Int>();

	/** The configured log levels. */
	static var _setLevels:Hash<Int>;
	
	static var _currentLevel :Int = -1;
	
	static var _logs :Hash<Log> = new Hash<Log>();
	
	/** The outputted names of each level. The last one isn't used, it corresponds with OFF. */
	static var LEVEL_NAMES :Array<Dynamic> = [ "debug", "INFO", "WARN", "ERROR", false ];
}

#if (flash || cpp)
class FlashLogTarget implements LogTarget
{
	public function new () {}
	public function log (msg :String) :Void
	{
		untyped __global__["trace"](msg);
	}
}
#end


