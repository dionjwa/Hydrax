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
package de.polygonal.core.log.handler;

#if (!neko && !cpp)
"The FileHandler class is only available for neko/cpp"
#end

import de.polygonal.core.log.LogHandler;

using de.polygonal.ds.BitFlags;

/**
 * <p>Writes logging messages to a text file.</p>
 */
class FileHandler extends LogHandler
{
	var _fileName:String;
	
	public function new(fileName:String)
	{
		super();
		
		_fileName = fileName;
		
		#if neko
		var fout = neko.io.File.write(_fileName, false);
		#else
		var fout = cpp.io.File.write(_fileName, false);
		#end
		
		fout.close();
	}
	
	override function init():Void
	{
		setf(LogHandler.ID | LogHandler.TIME | LogHandler.LEVEL | LogHandler.LINE | LogHandler.CLASS | LogHandler.CLASS_SHORT | LogHandler.NAME_SHORT | LogHandler.METHOD);
	}
	
	override function output(message:String):Void
	{
		#if neko
		var fout = neko.io.File.append(_fileName, false);
		#else
		var fout = cpp.io.File.append(_fileName, false);
		#end
		fout.writeString(message + "\r\n");
		fout.close();
	}
}