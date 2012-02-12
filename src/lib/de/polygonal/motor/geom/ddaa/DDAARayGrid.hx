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
package de.polygonal.motor.geom.ddaa;

import de.polygonal.core.math.Mathematics;
import de.polygonal.core.math.Vec2;
import de.polygonal.motor.geom.primitive.Ray2;

using de.polygonal.core.math.Mathematics;

/**
 * Implementation of the 'Fast Voxel Traversal Algorithm for Ray Tracing' by John Amanatides and
 * Andrew Woo. The algorithm finds all cells intersecting a given segment. The traversal runs until
 * the <i>visitor</i> returns 'false'. This is basically a 3DDDA in 2D.<br/>
 * see <a href="http://www.cs.yorku.ca/~amana/research/grid.pdf" target="_blank">http://www.cs.yorku.ca/~amana/research/grid.pdf</a>
 */
class DDAARayGrid
{
	/**
	 * Casts a ray <i>R</i> through the grid with cell size <i>s</i>.
	 * Calls <i>visitor</i>.visit(...) for every visited cell.
	 */
	inline public static function shoot3(R:Ray2, s:Vec2, visitor:DDAAVisitor):Void
	{
		shoot4(R.p, R.d, s, visitor);
	}
	
	/**
	 * Casts a ray r = <i>p</i> + t*<i>d</i>, |<i>d</i>| = 1 through the grid with cell size <i>s</i>.
	 * Calls <i>visitor</i>.visit(...) for every visited cell.
	 */
	inline public static function shoot4(p:Vec2, d:Vec2, s:Vec2, visitor:DDAAVisitor):Void
	{
		shoot7(p.x, p.y, d.x, d.y, s.x, s.y, visitor);
	}
	
	/**
	 * Casts a ray r = (<i>px</i>,<i>py</i>) + t*(<i>dx</i>,<i>dy</i>), |(<i>dx</i>,<i>dy</i>)| = 1 through the grid with cell size (<i>xSize</i>,<i>ySize</i>).
	 * Calls <i>visitor</i>.visit(...) for every visited cell.
	 */
	public static function shoot7(px:Float, py:Float, dx:Float, dy:Float, xSize:Float, ySize:Float, visitor:DDAAVisitor, ?userData:Dynamic = null):Void
	{
		var x0 = Std.int(px / xSize - (px < .0 ? 1. : .0));
		var y0 = Std.int(py / ySize - (py < .0 ? 1. : .0));
		
		var XSTEP:Int;
		var YSTEP:Int;
		
		var tMaxX = .0, tDeltaX = .0;
		var tMaxY = .0, tDeltaY = .0;
		
		var i = 0;
		var j = 0;
		
		if (dx.fabs() < Mathematics.EPS)
		{
			YSTEP = dy.fsgn();
			if (YSTEP >= 0)
			{
				tMaxY   = ((y0 * ySize + ySize) - py) / dy;
				tDeltaY = ySize / dy;
			}
			else
			if (YSTEP < 0)
			{
				tMaxY   = (y0 * ySize - py) / dy;
				tDeltaY =-ySize / dy;
			}
			
			while (true)
			{
				if (!visitor.visit(x0, y0, j++, userData)) return;
				
				tMaxY += tDeltaY;
				   y0 += YSTEP;
			}
		}
		else
		if (dy.fabs() < Mathematics.EPS)
		{
			XSTEP = dx.fsgn();
			if (XSTEP > 0)
			{
				tMaxX   = ((x0 * xSize + xSize) - px) / dx;
				tDeltaX = xSize / dx;
			}
			else
			if (XSTEP < 0)
			{
				tMaxX   = (x0 * xSize - px) / dx;
				tDeltaX =-xSize / dx;
			}
			
			while (true)
			{
				if (!visitor.visit(x0, y0, j++, userData)) return;
				
				tMaxX += tDeltaX;
				   x0 += XSTEP;
			}
		}
		else
		{
			XSTEP = dx.fsgn();
			YSTEP = dy.fsgn();
			
			if (XSTEP > 0)
			{
				tMaxX   = ((x0 * xSize + xSize) - px) / dx;
				tDeltaX = xSize / dx;
			}
			else
			{
				tMaxX   = (x0 * xSize - px) / dx;
				tDeltaX =-xSize / dx;
			}
			
			if (YSTEP > 0)
			{
				tMaxY   = ((y0 * ySize + ySize) - py) / dy;
				tDeltaY = ySize / dy;
			}
			else
			{
				tMaxY   = (y0 * ySize - py) / dy;
				tDeltaY =-ySize / dy;
			}
			
			while (true)
			{
				if (!visitor.visit(x0, y0, j++, userData)) return;
				
				if (tMaxX < tMaxY)
				{
					tMaxX += tDeltaX;
					x0 += XSTEP;
				}
				else
				{
					tMaxY += tDeltaY;
					y0 += YSTEP;
				}
			}
		}
	}
}