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
package de.polygonal.core;

import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.log.Log;
import de.polygonal.core.log.LogHandler;
import haxe.PosInfos;

/**
 * <p>The root of an application.</p>
 */
class Root
{
	/**
	 * Example:<br/><br/>
	 * <pre class="prettyprint">
	 * using de.polygonal.core.Root;
	 * "Hello World!".info();
	 * </pre>
	 */
	public static function info(x:String):Void
		Root.log().info(x)
	
	/**
	 * Example:<br/><br/>
	 * <pre class="prettyprint">
	 * using de.polygonal.core.Root;
	 * "Hello World!".warn();
	 * </pre>
	 */
	public static function warn(x:String):Void
		Root.log().warn(x)
	
	/**
	 * Example:<br/><br/>
	 * <pre class="prettyprint">
	 * using de.polygonal.core.Root;
	 * "Hello World!".error();
	 * </pre>
	 */
	public static function error(x:String):Void
		Root.log().error(x)
	
	static var _log:Log = null;

	/**
	 * A list of log handlers objects that are attached to <em>log</em> upon initialization.
	 */
	public static var initLogHandler = new Array<LogHandler>();
	
	/**
	 * If true, doesn't override native trace output. Default is false.
	 */
	public static var initKeepNativeTrace = false;
	
	/**
	 * Returns the root log.
	 */
	public static function log():Log
	{
		return _log == null ? _log = Log.getLog(Root) : _log;
	}
	
	#if flash
	/**
	 * Returns true if this swf is a remote-swf.
	 */
	public static var isRemote(_isRemoteGetter, never):Bool;
	inline static function _isRemoteGetter():Bool
	{
		return flash.Lib.current.stage.loaderInfo.url.indexOf("file:///") == -1;
	}
	
	/**
	 * Returns the value of the FlashVar with name <code>key</code> or null if the FlashVar does not exist.
	 */
	public static function getFlashVar(key:String):String
	{
		try
		{
			return untyped flash.Lib.current.stage.loaderInfo.parameters[key];
		}
		catch (error:Dynamic) {}
		return null;
	}
	#end
	
	/**
	 * Initializes an application.
	 * @param initCallback called when initialization is complete. This should be the main entry point of the application.
	 */
	public static function init(initCallback:Void->Void, initWindow = true)
	{
		function doInit()
		{
			_onInit();
			initCallback(); 
		}
		
		#if js
		new js.JQuery(js.Lib.document).ready(function(e)
		{
			if (initWindow)
				de.polygonal.gl.Window.init(doInit);
			else
				doInit();
		});
		#else
		if (initWindow)
		{
			#if (flash || cpp)
			de.polygonal.gl.Window.init(doInit);
			#end
		}
		else
			doInit();
		#end
	}
	
	static function _onInit()
	{
		var nativeTrace = function(v:Dynamic, ?infos:PosInfos):Void {};
		if (initKeepNativeTrace) nativeTrace = haxe.Log.trace;
		
		if (initLogHandler != null)
		{
			#if !no_traces
				#if flash
				initLogHandler.push(new de.polygonal.core.log.handler.TraceHandler());
				#elseif cpp
				initLogHandler.push(new de.polygonal.core.log.handler.FileHandler("hxcpp_log.txt"));
				#elseif js
				initLogHandler.push(new de.polygonal.core.log.handler.ConsoleHandler());
				#end
			#end
			for (handler in initLogHandler) log().attach(handler);
		}
		
		haxe.Log.trace = function(x:Dynamic, ?posInfos:PosInfos):Void
		{
			var s = Std.string(x);
			if (posInfos.customParams != null)
			{
				if (~/%(([+\- #0])*)?((\d+)|(\*))?(\.(\d?|(\*)))?[hlL]?[bcdieEfgGosuxX]/g.match(s))
					s = Sprintf.format(s, posInfos.customParams);
				else
					s += "," + posInfos.customParams.join(",");
			}
			
			Root.log().debug(s, posInfos);
			nativeTrace(s, posInfos);
		}
		
		trace('log initialized.');
	}
}