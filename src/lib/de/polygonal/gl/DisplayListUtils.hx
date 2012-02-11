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

import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.fmt.StringUtil;
import de.polygonal.core.util.Assert;
import de.polygonal.ds.ArrayedStack;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.MovieClip;
import flash.display.Stage;
import flash.Lib;

/**
 * Helper methods for working with the flash display list.
 */
class DisplayListUtils
{
	/**
	 * Prints out the display list tree.
	 * @param root The display object to start with.
	 * @param depth The maximum recursion depth.
	 */
	public static function dump(root:DisplayObjectContainer, ?depth:Int = 256):String
	{
		var stack = new ArrayedStack<DisplayObject>(512);
		var level = new ArrayedStack<Int>(512);
		var s = '';
		
		level.push(0);
		stack.push(root);
		
		while (stack.size() > 0)
		{
			var o = stack.pop();
			var l = level.pop();
			
			if (l > depth)
				continue;
			
			var t = '';
			for (i in 0...l)
			{
				if (i == l - 1)
					t += "+---";
				else
					t += "|   ";
			}
			
			s += Sprintf.format("%s%02d %s [%s]\n", [t, o.parent != null ? o.parent.getChildIndex(o) : 0, Std.is(o, Stage) ? "stage" : o.name, StringUtil.getUnqualifiedClassName(o)]);
			if (Std.is(o, DisplayObjectContainer))
			{
				var c:DisplayObjectContainer = untyped o;
				for (i in 0...c.numChildren)
				{
					var child = c.getChildAt(i);
					stack.push(untyped child);
					level.push(l + 1);
				}
			}
		}
		return s;
	}
	
	/** Adds <i>x</i> to the display list. */
	inline public static function attach(x:DisplayObject, parent:DisplayObjectContainer):Void
	{
		if (x.parent == null) parent.addChild(x);
	}
	
	/** Removes <i>x</i> from the display list. */
	inline public static function detach(x:DisplayObject):Void
	{
		if (x.parent != null) x.parent.removeChild(x);
	}
	
	/** Removes all children of <i>x</i> from the display list. */
	inline public static function detachChildren(x:DisplayObjectContainer):Void
	{
		#if debug
		var c = x.numChildren;
		#end
		
		while (x.numChildren > 0)
		{
			x.removeChildAt(0);
			
			#if debug
			de.polygonal.core.util.Assert.assert(x.numChildren != c, 'x.numChildren != c');
			#end
		}
	}
	
	/** Removes <i>x</i> and all children of <i>x</i> from the display list. */
	inline public static function detachAll(x:DisplayObjectContainer):Void
	{
		detachChildren(x);
		detach(x);
	}
	
	/**
	 * Replaces <i>x</i> with <i>other</i> by attaching <i>other</i> to the parent of <i>x</i> and
	 * removing <i>x</i> from the display list.
	 * @throws de.polygonal.core.util.AssertionError <i>x</i> has no parent <i>(if debug flag ist set</i>).
	 */
	inline public static function replace(x:DisplayObject, other:DisplayObject):Void
	{
		#if debug
		Assert.assert(x.parent != null, "x.parent != null");
		#end
		
		var name = x.name;
		attachSibling(x, other);
		detach(x);
		other.name = name;
	}
	
	/**
	 * Attaches <i>y</i> to the parent of <i>x</i>.
	 * @throws de.polygonal.core.util.AssertionError <i>x</i> has no parent <i>(if debug flag ist set</i>).
	 */
	inline public static function attachSibling(x:DisplayObject, y:DisplayObject):Void
	{
		#if debug
		Assert.assert(x.parent != null, "x.parent != null");
		#end
		
		x.parent.addChild(y);
	}
	
	/**
	 * Moves <i>x</i> to the foreground.
	 * @throws de.polygonal.core.util.AssertionError <i>x</i> has no parent <i>(if debug flag ist set</i>).
	 */
	inline public static function toFront(x:DisplayObject):Void
	{
		#if debug
		Assert.assert(x.parent != null, "x.parent != null");
		#end
		
		return x.parent.setChildIndex(x, x.parent.numChildren - 1);
	}
	
	/**
	 * Moves <i>x</i> to the background.
 	 * @throws de.polygonal.core.util.AssertionError <i>x</i> has no parent <i>(if debug flag ist set</i>).
	 */
	inline public static function toBack(x:DisplayObject):Void
	{
		#if debug
		Assert.assert(x.parent != null, "x.parent != null");
		#end
		
		return x.parent.setChildIndex(x, 0);
	}
	
	#if flash
	/**
	 * Moves the playhead of <i>x</i> to the previous frame.
	 * @param wrap Moves the playhead to the last frame once it goes beyond the first frame.
	 */
	inline public static function prevFrame(x:MovieClip, wrap:Bool):Void
	{
		if (x.currentFrame == 1 && wrap)
			x.gotoAndStop(x.totalFrames);
		else
			x.prevFrame();
	}
	
	/**
	 * Moves the playhead of <i>x</i> to the next frame.
	 * @param wrap Moves the playhead to the first frame once it goes beyond the last frame.
	 */
	inline public static function nextFrame(mc:MovieClip, wrap:Bool):Void
	{
		if (mc.currentFrame == mc.totalFrames && wrap)
			mc.gotoAndStop(1);
		else
			mc.nextFrame();
	}
	#end
}