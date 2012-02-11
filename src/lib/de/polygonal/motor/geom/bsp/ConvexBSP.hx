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
import de.polygonal.ds.BinaryTreeNode;

/**
 * A BSP acceleration structure to get a O(log(n)) support point query for convex polygons.<br/>
 * Based on Morgan Kaufmann "Game Physics" by David H Eberly (Chapter 5, Collision Detection with Convex Polyhedra).
 */
class ConvexBSP<T:Vec2>
#if generic
implements haxe.rtti.Generic
#end
{
	public var tree:BinaryTreeNode<ConvexBSPNode<T>>;
	
	public function new(vertexCount:Int, normals:Array<Vec2>, edges:Array<Vec2>)
	{
		var NIR = new Array<Int>(), AIL = new Array<Array<Int>>();
		var NIL = new Array<Int>(), AIR = new Array<Array<Int>>();
		
		var d0 = 0.0;
		for (i in 1...vertexCount)
		{
			var d1 = edges[0].x * normals[i].x + edges[0].y * normals[i].y;
			if (d1 >= 0)
				NIR.push(i);
			else
				NIL.push(i);
			
			var arc = new Array<Int>();
			arc[0] = i - 1;
			arc[1] = i;
			
			if (d0 >= 0 && d1 >= 0)
				AIR.push(arc);
			else
			if (d0 <= 0 && d1 <= 0)
				AIL.push(arc);
			else
			{
				AIL.push(arc);
				AIR.push(arc);
			}
			
			d0 = d1;
		}
		
		var arc = new Array<Int>();
		arc[0] = vertexCount - 1;
		arc[1] = 0;
		AIL.push(arc);
		
		var R = _createInternalNode(vertexCount, normals, edges, NIR, AIR);
		var L = _createInternalNode(vertexCount, normals, edges, NIL, AIL);
		
		tree = _createNode(0, R, L);
	}
	
	function _createInternalNode(vertexCount:Int, normals:Array<Vec2>, edges:Array<Vec2>, NI:Array<Int>, AI:Array<Array<Int>>):BinaryTreeNode<ConvexBSPNode<T>>
	{
		var NIR = new Array<Int>(), AIL = new Array<Array<Int>>();
		var NIL = new Array<Int>(), AIR = new Array<Array<Int>>();
		
		var k = NI.length;
		var l = AI.length;
		var mid = 0;
		
		if (k > 1)
		{
			if ((l & 1) == 0)
				//even number of arcs, floor
				mid = (NI[0] + NI[k - 1]) >> 1;
			else
			if ((l & 1) == 1)
				//odd number of arcs, ceil
				mid = Std.int((NI[0] + NI[k - 1]) / 2 + 0.5);
		}
		else
			mid = NI[0];
		
		var ex = edges[mid].x;
		var ey = edges[mid].y;
		
		var d = new Array<Float>();
		for (i in 0...k)
		{
			var ni = NI[i];
			
			if (mid == ni)
			{
				d[i] = ni;
				continue;
			}
			
			var N = normals[ni];
			
			var t = ex * N.x + ey * N.y;
			d[i] = t;
			
			if (t >= 0)
				NIR.push(ni);
			else
				NIL.push(ni);
		}
		
		d.unshift(-1);
		d.push(1);
		
		for (i in 0...l)
		{
			if (d[i] >= 0 && d[i + 1] >= 0)
				AIR.push(AI[i]);
			else
				AIL.push(AI[i]);
		}
		
		var LChild:BinaryTreeNode<ConvexBSPNode<T>> = null;
		if (NIL.length > 0)
			LChild = _createInternalNode(vertexCount, normals, edges, NIL, AIL);
		else
		if (AIL.length > 0)
			LChild = _createNode(AIL[0][1]); //leaf node containing arc
		
		var RChild:BinaryTreeNode<ConvexBSPNode<T>> = null;
		if (NIR.length > 0)
			RChild = _createInternalNode(vertexCount, normals, edges, NIR, AIR);
		else
		if (AIR.length > 0)
			RChild = _createNode(AIR[0][1]); //leaf node containing arc
		
		var node:BinaryTreeNode<ConvexBSPNode<T>> = _createNode(mid, RChild, LChild);
		return node;
	}

	function _createNode(I:Int, R:BinaryTreeNode<ConvexBSPNode<T>> = null, L:BinaryTreeNode<ConvexBSPNode<T>> = null):BinaryTreeNode<ConvexBSPNode<T>>
	{
		var val = new ConvexBSPNode<T>();
		val.I = I;
		
		var n = new BinaryTreeNode<ConvexBSPNode<T>>(val);
		n.r = R;
		n.l = L;
		
		return n;
	}
}