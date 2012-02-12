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
package de.polygonal.ai.pathfinding;

import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.math.Mathematics;
import de.polygonal.ds.GraphNode;
import de.polygonal.ds.Heapable;

class AStarWaypoint implements Heapable<AStarWaypoint>
{
	/**
	 * Cartesian coordinates (by default z=0).
	 */
	public var x:Float;
	public var y:Float;
	public var z:Float;
	
	/** Heapable interface */
	public var position:Int;
	
	/**
	 * The total distance of all the edges that compromise the best path to this node so far.
	 */
	public var distance:Float;
	
	/**
	 * Heuristic estimate of the distance to the target to direct the search towards the target.
	 */
	public var heuristic:Float;
	
	/**
	 * True if this waypoint is contained in the queue.
	 */
	public var onQue:Bool;
	
	/**
	 * The graph node that holds this waypoint.
	 */
	public var node:GraphNode<AStarWaypoint>;
	
	public function new()
	{
		x         = 0;
		y         = 0;
		z         = 0;
		position  = -1;
		distance  = Math.NaN;
		heuristic = Math.NaN;
		onQue     = false;
		node      = null;
	}
	
	inline public function reset():Void
	{
		distance  = 0;
		heuristic = 0;
		onQue     = false;
	}
	
	public function distanceTo(wp:AStarWaypoint):Float
	{
		var dx = wp.x - x;
		var dy = wp.y - y;
		var dz = wp.z - z;
		
		#if (flash10 && alchemy)
		return 1 / Mathematics.invSqrt(dx * dx + dy * dy + dz * dz);
		#else
		return Math.sqrt(dx * dx + dy * dy + dz * dz);
		#end
	}
	
	public function compare(other:AStarWaypoint):Int
	{
		return Mathematics.fsgn(other.heuristic - heuristic);
	}
	
	public function toString():String
	{
		return Sprintf.format("{AStarWaypoint: x=%.2f, y=%.2f}", [x, y]);
	}
}