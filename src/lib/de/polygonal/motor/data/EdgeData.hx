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

import de.polygonal.core.math.Mathematics;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.collision.shape.EdgeShape;
import de.polygonal.motor.data.ShapeData;
import de.polygonal.core.math.Vec2;

import de.polygonal.motor.collision.shape.ShapeType;

class EdgeData extends ShapeData
{
	/**
	 * The start position of the line segment in object space.
	 */
	public var a:Vec2;

	/**
	 * The end position of the line segment in object space.
	 */
	public var b:Vec2;

	/**
	 * Settings this flag to true will turn the line segment into an
	 * infinite line extending which extends in both directions (aka plane)
	 */
	public var infinite:Bool;

	/**
	 * True = collisions will be detected in the positive & negative
	 * halfspace of the line (the positive halfspace is defined by the
	 * clockwise normal of the vector AB).
	 */
	public var doubleSided:Bool;

	public function new(a:Vec2, b:Vec2, ?infinite = false, ?doubleSided = true, ?userData:Dynamic)
	{
		super(.0, userData);
		
		var dx = b.x - a.x;
		var dy = b.y - a.y;
		
		#if debug
		if (Math.sqrt(dx * dx + dy * dy) <= Mathematics.EPS)
			throw "overlapping vertices detected";
		#end
		
		//transform line so center of a,b is at 0,0
		var offsetx = a.x + (b.x - a.x) * .5;
		var offsety = a.y + (b.y - a.y) * .5;
		
		this.a = new Vec2();
		this.a.x = a.x - offsetx;
		this.a.y = a.y - offsety;
		
		this.b = new Vec2();
		this.b.x = b.x - offsetx;
		this.b.y = b.y - offsety;
		
		this.infinite = infinite;
		this.doubleSided = doubleSided;
	}
	
	override public function getShapeClass():Class<AbstractShape>
	{
		return EdgeShape;
	}
	
	override public function clone():ShapeData
	{
		var copy = new EdgeData(a, b, infinite, doubleSided);
		copy._paste(this);
		return copy;
	}
}