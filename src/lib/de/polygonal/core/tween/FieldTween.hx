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
package de.polygonal.core.tween;

import de.polygonal.core.tween.ease.Ease;
import de.polygonal.ds.ArrayUtil;

using de.polygonal.ds.BitFlags;

class FieldTween extends Tween, implements TweenTarget
{
	var _object:Dynamic;
	var _fields:Array<String>;
	
	public function new(?key:String, object:Dynamic, field:Dynamic, ease:Ease, to:Float, duration:Float, ?interpolateState = true)
	{
		_object = object;
		if (Std.is(field, String))
			_fields = cast [field];
		else
		if (Std.is(field, Array))
		{
			_fields = ArrayUtil.alloc(field.length);
			_fields = ArrayUtil.copy(field, _fields);
		}
		else
			throw 'invalid field';
		
		super(key, this, ease, to, duration, interpolateState);
	}
	
	override public function free():Void 
	{
		super.free();
		_object = null;
		_fields = null;
	}
	
	public function set(x:Float):Void
	{
		for (field in _fields) Reflect.setField(_object, field, x);
	}
	
	public function get():Float
	{
		return Reflect.field(_object, _fields[0]);
	}
}