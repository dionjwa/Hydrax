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
package de.polygonal.gl;

import de.polygonal.ds.Itr;
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;

/**
 * An iterator for traversing the display list.<br/>
 * see <a href="http://lab.polygonal.de/2010/02/02/traversing-the-display-listtraversing-the-display-list/" target="_blank">http://lab.polygonal.de/2010/02/02/traversing-the-display-listtraversing-the-display-list/</a>
 */
class DisplayListIterator implements de.polygonal.ds.Itr<DisplayObject>
{
	inline public static function iterator(root:DisplayObjectContainer):DisplayListIterator
	{
		return new DisplayListIterator(root);
	}
	
	var _root:DisplayObjectContainer;
	var _stack:Array<DisplayObject>;
	var _stackSize:Int;
	
	public function new(root:DisplayObjectContainer) 
	{
		_stack = new Array<DisplayObject>();
		_root = root;
		reset();
	}
	
	public function hasNext():Bool
	{
		return _stackSize > 0;
	}
	
	public function reset():Itr<DisplayObject>
	{
		_stack[0] = _root;
		_stackSize = 1;
		return this;
	}
	
	public function next():DisplayObject
	{
		var o = _stack[--_stackSize];
		if (Std.is(o, DisplayObjectContainer))
		{
			var c:DisplayObjectContainer = untyped o;
			for (i in 0...c.numChildren) _stack[_stackSize++] = c.getChildAt(i);
		}
		return o;
	}
	
	public function remove():Void
	{
		throw 'unsupported operation';
	}
}