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
package de.polygonal.motor.geom.bsp;

import de.polygonal.core.math.Vec2;
import de.polygonal.motor.collision.shape.feature.Vertex;

class ConvexBSPNode<T:Vec2>
#if generic
implements haxe.rtti.Generic
#end
{
	/** Either normal index (interior node) or vertex index (leaf node). */
	public var I:Int;

	/** If Dot(E,D) >= 0, D gets propagated to this child (D=query direction, E=edge). */
	public var R:ConvexBSPNode<T>;

	/** If Dot(E,D) >= 0, D gets propagated to this child (D=query direction, E=edge). */
	public var L:ConvexBSPNode<T>;

	/** Normal that is extremal at index I. */
	public var N:T;
	
	/** Vertex that is extremal at index I. */
	public var V:T;
	
	public function new()
	{
		I = -1;
	}
	
	public function free():Void
	{
		var stack = new Array<ConvexBSPNode<T>>();
		var top = 0;
		stack[top++] = this;
		while (top != 0)
		{
			var node = stack[--top];
			if (node.R != null) stack[top++] = node.R;
			if (node.L != null) stack[top++] = node.L;
			node.R = null;
			node.L = null;
		}
		
		L = null;
		R = null;
		
		N = null;
		V = null;
	}
}