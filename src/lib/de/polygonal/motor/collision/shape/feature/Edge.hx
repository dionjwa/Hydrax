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
package de.polygonal.motor.collision.shape.feature;

import de.polygonal.core.math.Vec2;

class Edge
{
	/** The next edge in the list. */
	public var next:Edge;
	
	/** The previous edge in the list. */
	public var prev:Edge;
	
	/** First edge vertex. */
	public var a:Vertex;
	
	/** First edge vertex. */
	public var b:Vertex;
	
	/** Edge index. */
	public var i:Int;
	
	/** Edge unit normal in world space. */
	public var normal:Vertex;
	
	/** Edge direction (normalized) in local space. */
	public var dir:Vec2;
	
	/** Vector from local center to edge center parallel to the edge. */
	public var offset:Vec2;
	
	/** Distance polygon centroid->edge along perpendicular bisector. */
	public var height:Float;
	
	/** The edge length. */
	public var length:Float;
	
	/** The halfedge length. */
	public var extent:Float;
	
	public function new() {}
	
	public function free():Void
	{
		next   = null;
		prev   = null;
		a      = null;
		b      = null;
		normal = null;
		dir    = null;
		offset = null;
	}
}