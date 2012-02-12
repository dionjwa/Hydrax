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
package de.polygonal.core.util;

import de.polygonal.core.fmt.Sprintf;

/**
 * <p>Creates a textual representation of an object or the stack.</p>
 */
class Dump
{
	/**
	 * Dumps the stack.
	 */
	#if flash
	public static function stack():String
	{
		var s = '';
		try
		{
			throw new flash.errors.Error();
		}
		catch (e:flash.errors.Error)
		{
			var frames = e.getStackTrace().split('\n\tat ').slice(2);
			for (i in 0...frames.length) frames[i] = '+ ' + frames[i];
			s = 'STACK\n' + frames.join("\n");
		}
		return s;
	}
	#end
	
	/**
	 * Returns a human-readable representation of the object <code>o</code>.
	 */
	public static function object(o:Dynamic):String
	{
		return _object(o, '');
	}
	
	static function _object(o:Dynamic, ws:String)
	{
		var s = '\n';
		
		var fields = Reflect.fields(o);
		for (field in fields)
		{
			var value:Dynamic = Reflect.field(o, field);
			if (untyped __typeof__(value) == 'object')
			{
				s += ws + '' + field + ':';
				s += _object(value, ws + '|    ');
			}
			else
				s += ws + Sprintf.format('%s: %s [%s]\n', [field, value, untyped __typeof__(value)]);
		}
		
		return s;
	}
}