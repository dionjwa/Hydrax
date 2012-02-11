/*
 *                            _/                                                    _/   
 *       _/_/_/      _/_/    _/  _/    _/    _/_/_/    _/_/    _/_/_/      _/_/_/  _/    
 *      _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/     
 *     _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/      
 *    _/_/_/      _/_/    _/    _/_/_/    _/_/_/    _/_/    _/    _/    _/_/_/  _/       
 *   _/                            _/        _/                                          
 *  _/                        _/_/      _/_/                                             
 *                                                                                       
 * POLYGONAL - A HAXE LIBRARY FOR GAME DEVELOPERS
 * Copyright (c) 2009-2010 Michael Baczynski, http://www.polygonal.de
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
package de.polygonal.core.log;

import de.polygonal.core.event.IObserver;
import de.polygonal.core.event.Observable;
import de.polygonal.core.fmt.StringUtil;
import de.polygonal.core.log.LogEvent;
import haxe.PosInfos;

using de.polygonal.core.fmt.StringUtil;
using de.polygonal.ds.Bits;

private typedef LogFriend = 
{
	private var _observable:Observable;
}

/**
 * <p>A lightweight log.</p>
 * <p>Logging messages are passed to registered <em>LogHandler</em> objects.</p>
 */
class Log
{
	static var _logger:Hash<Log> = null;
	static var _counter = 0;
	
	/**
	 * Creates a new log or returns an existing one.<br/>
	 * Example:<br/><br/>
	 * <pre class="prettyprint">
	 * package a;
	 * class Foo 
	 * {
	 *     public function new() {
	 *         var log = de.polygonal.core.log.Log.getLog(a.Foo);
	 *         log.attach(new de.polygonal.core.log.handler.TraceHandler());
	 *         log.info("Hello from a.Foo constructor");
	 *     }
	 * }
	 * ...
	 * package a.b.c;
	 * class Foo 
	 * {
	 *     public function new() {
	 *         var log = de.polygonal.core.log.Log.getLog(a.b.c.Foo, true);
	 *         log.info("Hello from a.b.c.Foo constructor"); //output bubbles up the package tree until handled by a.Foo
	 *     }
	 * }
	 * ...
	 * class Main 
	 * {
	 *     static function main() {
	 *         new a.Foo();
	 *         new a.b.c.Foo();
	 *     }
	 * }</pre>
	 * 
	 * @param x the name of the log or a class object.
	 * In the latter case the fully qualified class name is used for identifying the log and the log output is forwarded to the log handlers (if any) of all log objects found in the hierarchical dot-separated namespace.
	 */
	public static function getLog(x:Dynamic):Log
	{
		if (_logger == null) _logger = new Hash<Log>();
		
		var name:String = null;
		var h = new Array<IObserver>();
		if (Std.is(x, Class))
		{
			name = Type.getClassName(x);
			var packages = StringUtil.getPackageName(x).split(".");
			var i = packages.length;
			while (i >= 0)
			{
				var p = packages.join(".");
				for (log in _logger)
				{
					var friend:LogFriend = log;
					if (friend._observable.size() > 0)
					{
						if (StringUtil.getPackageName(log.getName()) == p)
						{
							for (handler in friend._observable.getObserverList())
								h.push(handler);
						}
					}
				}
				
				i--;
				packages.pop();
			}
		}
		else
			name = Std.string(x);
		
		if (_logger.exists(name))
			return _logger.get(name);
		else
		{
			var log = new Log(name);
			for (i in h) log.attach(cast i);
			return log;
		}
	}
	
	var _observable:Observable;
	var _mask:Int;
	var _name:String;
	var _level:Int;
	var _logMessage:LogMessage;
	
	function new(name:String)
	{
		_mask = 0;
		_level = 0;
		_name = name;
		_logger.set(name, this);
		_observable = new Observable();
		_logMessage = new LogMessage();
		setLevel(LogLevel.DEBUG);
	}
	
	/**
	 * Adds the handler <code>x</code> to this log.<br/>
	 * Once registered, <code>x</code> receives logging messages.
	 */
	public function attach(x:LogHandler):Void
	{
		for (observer in _observable)
			if (observer == x) return;
		_observable.attach(x, 0);
	}

	/**
	 * Removes the handler <code>x</code> from this log.
	 */
	public function detach(x:LogHandler):Void
	{
		_observable.detach(x);
	}
	
	/**
	 * Removes all handlers  from this log.
	 */
	public function detachAll():Void
	{
		for (handler in _observable.getObserverList())
			detach(cast handler);
	}
	
	/**
	 * A list of all registered log handlers.
	 */
	public function getLogHandler():Array<LogHandler>
	{
		return cast _observable.getObserverList();
	}
	
	/**
	 * Returns the name of this log.
	 */
	public function getName():String
	{
		return _name;
	}
	
	/**
	 * Returns the name(s) of the active log level(s).<br/>
	 * Example:<br/><br/>
	 * <pre class="prettyprint">
	 * class Main 
	 * {
	 *     static function main() {
	 *         var log = de.polygonal.core.log.Log.getLog("Foo");
	 *         log.setLevel(LogLevel.INFO);
	 *         trace(log.getLevelName()); //INFO
	 *         log.setLevel(LogLevel.INFO | LogLevel.WARN);
	 *         trace(log.getLevelName()); //INFO|WARN
	 *     }
	 * }</pre>
	 */
	public function getLevelName():String
	{
		if (_level.ones() > 1)
		{
			var a = new Array<String>();
			var i = LogLevel.DEBUG;
			while (i < LogLevel.ALL)
			{
				if ((_level & i) > 0)
					a.push(LogLevel.getName(i));
				i <<= 1;
			}
			return a.join("|");
		}
		
		return LogLevel.getName(_level);
	}
	
	/**
	 * Returns the active log level(s) encoded as a bitfield.
	 */
	public function getLevel():Int
	{
		return _level;
	}
	
	/**
	 * Sets the log level <code>x</code> for controlling logging output.<br/>
	 * Enabling logging at a given level also enables logging at all higher levels.<br/>
	 * Each log level is specified by a bit flag in the range 0x01 (<em>LogLevel.DEBUG</em>) to 0x08 (<em>LogLevel.ERROR</em>).<br/>
	 * LogLevel.OFF can be used to turn off logging. The default log level is <em>LogLevel.DEBUG</em>.<br/>
	 * Example:<br/><br/>
	 * <pre class="prettyprint">
	 * import de.polygonal.core.log.LogLevel;
	 * class Main 
	 * {
	 *     static function main() {
	 *         var log = de.polygonal.core.log.Log.getLog("Foo");
	 *         log.setLevel(LogLevel.DEBUG);                 //print DEBUG, INFO, WARN and ERROR log messages
	 *         log.setLevel(LogLevel.WARN);                  //print WARN and ERROR log messages
	 *         log.setLevel(LogLevel.INFO | LogLevel.ERROR); //print INFO and ERROR log messages
	 *         log.setLevel(LogLevel.OFF);                   //print nothing
	 *     }
	 * }</pre>
	 * @throws de.polygonal.core.util.AssertionError invalid log level (debug only).
	 */
	public function setLevel(x:Int):Void
	{
		#if debug
		de.polygonal.core.util.Assert.assert((x & LogLevel.ALL) > 0, "(x & LogLevel.ALL) > 0");
		#end
		
		_level = x;
		
		if (x.ones() > 1)
		{
			_mask = x;
			return;
		}
		
		_mask = LogLevel.ALL;
		while (x > LogLevel.DEBUG)
		{
			x >>= 1;
			_mask = _mask.clrBits(x);
		}
	}
	
	/**
	 * Logs a <em>LogLevel.DEBUG</em> message.
	 * @param x the log message.
	 */
	public function debug(x:Dynamic, ?posInfos:PosInfos):Void
	{
		#if !no_log
		if (_observable.size() > 0)
			if (_mask.hasBits(LogLevel.DEBUG)) output(LogLevel.DEBUG, x, posInfos);
		#end
	}
	
	/**
	 * Logs a <em>LogLevel.INFO</em> message.
	 * @param x the log message.
	 */
	public function info(x:Dynamic, ?posInfos:PosInfos):Void
	{
		#if !no_log
		if (_observable.size() > 0)
			if (_mask.hasBits(LogLevel.INFO)) output(LogLevel.INFO, x, posInfos);
		#end
	}
	
	/**
	 * Logs a <em>LogLevel.WARN</em> message.
	 * @param x the log message.
	 */
	public function warn(x:Dynamic, ?posInfos:PosInfos):Void
	{
		#if !no_log
		if (_observable.size() > 0)
			if (_mask.hasBits(LogLevel.WARN)) output(LogLevel.WARN, x, posInfos);
		#end
	}
	
	/**
	 * Logs a <em>LogLevel.ERROR</em> message.
	 * @param x the log message.
	 */
	public function error(x:Dynamic, ?posInfos:PosInfos):Void
	{
		#if !no_log
		if (_observable.size() > 0)
			if (_mask.hasBits(LogLevel.ERROR)) output(LogLevel.ERROR, x, posInfos);
		#end
	}

	inline function output(level:Int, x:Dynamic, ?posInfos:PosInfos):Void
	{
		var s = Std.string(x);
		
		_counter++; if (_counter == 1000) _counter = 0;
		
		_logMessage.id          = _counter;
		_logMessage.data        = s;
		_logMessage.log         = this;
		_logMessage.outputLevel = level;
		_logMessage.posInfos    = posInfos;
		_observable.notify(LogEvent.LOG_MESSAGE, _logMessage);
	}
}