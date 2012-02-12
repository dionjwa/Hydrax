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

import de.polygonal.core.math.Vec2;
import de.polygonal.ds.DA;
import de.polygonal.motor.collision.shape.BoxShape;
import de.polygonal.motor.collision.shape.AbstractShape;

/**
 * A 'blueprint' for creating rectangular shapes.
 */
class BoxData extends ShapeData
{
	public var width:Float;
	
	public var height:Float;
	
	public var isAxisAligned:Bool;
	
	public function new(density:Float, width:Float, height:Float, ?isAxisAligned = false, ?userData:Dynamic)
	{
		super(density, userData);
		
		#if debug
		de.polygonal.core.util.Assert.assert(width > 0 && height > 0, "width > 0 && height > 0");
		#end
		
		this.width = width;
		this.height = height;
		this.isAxisAligned = isAxisAligned;
	}
	
	override public function getVertexList():Array<Vec2>
	{
		#if debug
		de.polygonal.core.util.Assert.assert(width > 0 && height > 0, "width > 0 && height > 0");
		#end
		
		var ex = width / 2;
		var ey = height / 2;
		
		var v = new Array<Vec2>();
		v.push(new Vec2( ex,  ey));
		v.push(new Vec2(-ex,  ey));
		v.push(new Vec2(-ex, -ey));
		v.push(new Vec2( ex, -ey));
		return v;
	}
	
	override public function getShapeClass():Class<AbstractShape>
	{
		return BoxShape;
	}
	
	override public function clone():ShapeData
	{
		var copy = new BoxData(density, width, height, isAxisAligned, userData);
		copy._paste(this);
		return copy;
	}
	
	
}