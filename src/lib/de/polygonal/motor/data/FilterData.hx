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
package de.polygonal.motor.data;

class FilterData implements de.polygonal.ds.Cloneable<FilterData>
{
	/**
	 * The collision category bits.
	 * Normally you would just set one bit.
	 */
	public var categoryBits:Int;

	/**
	 * The collision mask bits. This states the categories that this
	 * shape would accept for collision.
	 */
	public var maskBits:Int;

	/**
	 * Collision groups allow a certain group of objects to never collide (negative)
	 * or always collide (positive). Zero means no collision group. Non-zero group
	 * filtering always wins against the mask bits.
	 */
	public var groupIndex:Int;
	
	public function new() 
	{
		categoryBits = 0x0001;
		maskBits     = 0xffff;
		groupIndex   = 0;
	}
	
	/** Returns true if this filter accepts a collision with <i>other</i> filter. */
	inline public function collide(other:FilterData):Bool
	{
		if (groupIndex == other.groupIndex && groupIndex != 0)
			return groupIndex > 0;
		else
			return (other.categoryBits & maskBits) != 0 && (categoryBits & other.maskBits) != 0;
	}
	
	public function clone():FilterData
	{
		var copy = new FilterData();
		copy.categoryBits = categoryBits;
		copy.maskBits     = maskBits;
		copy.groupIndex   = groupIndex;
		return copy;
	}
}