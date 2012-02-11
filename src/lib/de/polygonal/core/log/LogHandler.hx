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

import de.polygonal.core.event.IObservable;
import de.polygonal.core.event.IObserver;
import de.polygonal.core.event.Observable;
import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.fmt.StringUtil;
import de.polygonal.core.log.LogLevel;
import de.polygonal.core.log.LogMessage;
import de.polygonal.ds.Bits;

using de.polygonal.ds.BitFlags;
using de.polygonal.ds.Bits;

/**
 * <p>A log handler receives log messages from a log and exports them to various output devices.</p>
 */
class LogHandler implements IObserver
{
	/**
	 * Adds the message id.<br/>
	 * This is a bit flag to be used with <em>setFormat()</em>.
	 */
	inline public static var ID = Bits.BIT_01;
	
	/**
	 * Adds a prefix string to the logging message.<br/>
	 * This is a bit flag to be used with <em>setFormat()</em>.
	 */
	inline public static var PREFIX = Bits.BIT_02;
	
	/**
	 * Adds a time stamp to the logging message.<br/>
	 * This is a bit flag to be used with <em>setFormat()</em>.
	 */
	inline public static var TIME = Bits.BIT_03;
	
	/**
	 * Adds the name of the log level to the logging message.<br/>
	 * This is a bit flag to be used with <em>setFormat()</em>.
	 */
	inline public static var LEVEL = Bits.BIT_04;
	
	/**
	 * Adds the fully qualified log name to the logging message.<br/>
	 * This is a bit flag to be used with <em>setFormat()</em>.
	 */
	inline public static var NAME = Bits.BIT_05;
	
	/**
	 * Adds the short log name to the logging message.<br/>
	 * This is a bit flag to be used with <em>setFormat()</em>.
	 */
	inline public static var NAME_SHORT = Bits.BIT_06;
	
	/**
	 * Adds the line number that contains the log statement to the logging message.<br/>
	 * This is a bit flag to be used with <em>setFormat()</em>.
	 */
	inline public static var LINE = Bits.BIT_07;
	
	/**
	 * Adds the fully qualified class name of the class containing the log statement to the logging message.<br/>
	 * This is a bit flag to be used with <em>setFormat()</em>.
	 */
	inline public static var CLASS = Bits.BIT_08;
	
	/**
	 * Adds the short name of the class containing the log statement to the logging message.<br/>
	 * This is a bit flag to be used with <em>setFormat()</em>.
	 */
	inline public static var CLASS_SHORT = Bits.BIT_09;
	
	/**
	 * Adds the name of the method containing the log statement to the logging message.<br/>
	 * This is a bit flag to be used with <em>setFormat()</em>.
	 */
	inline public static var METHOD = Bits.BIT_10;
	
	var _level:Int;
	var _mask:Int;
	var _prefix:String;
	var _separator:String;
	var _message:LogMessage;

	var _bits:Int;

	function new()
	{
		_level     = 0;
		_mask      = 0;
		_prefix    = '';
		_separator = '';
		_message   = null;
		_bits      = 0;
		
		setLevel(LogLevel.DEBUG);
		setFormat(0, ':');
		init();
	}
	
	/**
	 * Destroys this object by explicitly nullifying all references for GC'ing used resources.
	 */
	public function free():Void {}
	
	/**
	 * Returns the active output level(s) encoded as a bitfield.
	 */
	public function getLevel():Int
	{
		return _level;
	}
	
	/**
	 * Returns the name(s) of the active output level(s).<br/>
	 * @see <em>Log#getLevelName()</em>.
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
			return a.join('|');
		}
		
		return LogLevel.getName(_level);
	}
	
	/**
	 * Sets the log level <code>x</code> specifying which message levels will be ultimately handled.<br/>
	 * Example:<br/><br/>
	 * <pre class="prettyprint">
	 * import de.polygonal.core.log.LogLevel;
	 * import de.polygonal.core.log.Log;
	 * import de.polygonal.core.log.handler.TraceHandler;
	 * class Main
	 * {
	 *     static function main() {
	 *         var log = Log.getLog("Foo");
	 *         log.setLevel(LogLevel.DEBUG); //print DEBUG, INFO, WARN and ERROR logging messages
	 *         var handler = new TraceHandler();
	 *         handler.setLevel(Level.WARN); //log allows all levels, but the handler filters out everything except Level.WARN.
	 *     }
	 * }</pre>
	 * @throws de.polygonal.core.util.AssertionError invalid log level (debug only).
	 */
	public function setLevel(x:Int):Void
	{
		#if debug
		de.polygonal.core.util.Assert.assert((x & LogLevel.ALL) > 0, '(x & LogLevel.ALL) > 0');
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
	 * Defines a prefix string that is included in every log message.<br/>
	 * Only used if the <em>LogHandler.PREFIX</em> flag is set.
	 */
	public function setPrefix(x:String):Void
	{
		_prefix = x;
		setf(PREFIX);
	}
	
	/**
	 * Adds extra information to a logging message.<br/>
	 * Example:<br/><br/>
	 * <pre class="prettyprint">
	 * import de.polygonal.core.log.LogHandler;
	 * import de.polygonal.core.log.handler.TraceHandler;
	 * class Main
	 * {
	 *     static function main() {
	 *         var handler = new TraceHandler();
	 *         //add a time stamp and log name to a logging message, separated by a single SPACE character.
	 *         handler.setFormat(LogHandler.TIME | LogHandler.NAME, " ");</pre>
	 *     }
	 * }</pre>
	 */
	public function setFormat(flags:Int, ?sep = ':'):Void
	{
		if (flags == 0) nulf();
		else setf(flags);
		_separator = sep;
	}
	
	public function update(type:Int, source:IObservable, userData:Dynamic):Void
	{
		if (type == LogEvent.LOG_MESSAGE)
		{
			_message = cast userData;
			if (_mask.hasBits(_message.outputLevel))
				output(format());
		}
	}

	function format():String
	{
		var data = _message.data;
		
		if (data.indexOf('\n') != -1)
		{
			if (data.indexOf('\r') != -1) data = data.split('\r').join('');
			
			var tmp = [];
			for (i in data.split('\n'))
			{
				if (i != '') tmp.push(i);
			}
			
			data = '\n' + tmp.join('\n');
		}
		
		var idFormat = '%s';
		var id = '';
		if (hasf(ID)) id = Sprintf.format("%03d ", [_message.id]);
		
		var prefix = '';
		var prefixFormat = '%s';
		
		if (hasf(PREFIX))
		{
			prefix = _prefix;
			prefixFormat = '%s ';
		}
		
		var time = '';
		var timeFormat = '%s';
		
		if (hasf(TIME))
		{
			time = Date.now().toString();
			time = time.substr(time.lastIndexOf(' ') + 1);
			timeFormat = '%s ';
		}
		
		var level = '';
		var levelFormat = '%s';
		
		if (hasf(LEVEL))
		{
			level = LogLevel.getName(_message.outputLevel);
			levelFormat = '%-5s ';
		}
		
		var name = '';
		var nameFormat = '%s';
		
		if (hasf(NAME))
		{
			name = _message.log.getName();
			nameFormat = '%-20s ';
			if (hasf(NAME_SHORT))
			{
				var i = name.lastIndexOf('.');
				if (i != -1) name = name.substr(i + 1);
			}
			if (name.length > 20)
				name = StringUtil.ellipsis(name, 20, true);
		}
		
		var line = '';
		var lineFormat = '%s';
		
		if (hasf(LINE))
			line = Sprintf.format('line %04d ', [_message.posInfos.lineNumber]);
		
		var classMethod = '';
		var classMethodFormat = '%s';
		
		if (hasf(CLASS | METHOD))
		{
			classMethodFormat = '%-30s';
			classMethod = _message.posInfos.className;
			if (hasf(CLASS_SHORT))
				classMethod = classMethod.substr(classMethod.lastIndexOf('.') + 1);
			
			if (incf(CLASS | METHOD))
				classMethod = classMethod + '::' + _message.posInfos.methodName + '() ';
			else
			if (hasf(CLASS))
				classMethod = classMethod + ' ';
			else
				classMethod = _message.posInfos.methodName + '() ';
				
			if (classMethod.length > 30)
				classMethod = StringUtil.ellipsis(classMethod, 30, true);
		}
		
		var format = Sprintf.format('%s%s%s%s%s%s%s%%s', [idFormat, prefixFormat, timeFormat, levelFormat, nameFormat, lineFormat, classMethodFormat]);
		return Sprintf.format(format, [id, prefix, time, level, name, line, classMethod, data]);
	}

	function output(data:String):Void
	{
	}

	function init():Void
	{
	}
}