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

import de.polygonal.ds.mem.IntMemory;
import de.polygonal.ds.mem.ShortMemory;

class Raster
{
	public function new()
	{
	}
	
	/**
	 * Uses Bresenham's algorithm for drawing an aliased line from (<i>a1</i>,<i>b1</i>) to (<i>a2</i>,<i>b2</i>) and
	 * stores the pixel coordinates in <i>buffer</i> in the format [x1, y1, x2, y2...xn, yn].
	 */
	public function drawBresenhamLineToArray(a1:Int, b1:Int, a2:Int, b2:Int, buffer:Array<Int>):Int
	{
		var dx = a2 - a1;
		var dy = b2 - b1;
		
		var ax, ay, sx, sy;
		
		if (dx < 0)
		{
			ax =-dx;
			sx =-1;
		}
		else
		{
			ax = dx;
			sx = 1;
		}
		
		if (dy < 0)
		{
			ay =-dy;
			sy =-1;
		}
		else
		{
			ay = dy;
			sy = 1;
		}
		
		ax <<= 1;
		ay <<= 1;
		
		var x = a1;
		var y = b1;
		
		var i = 0;
		
		if (ax > ay)
		{
			var d = ay - (ax >> 1);
			while (x != a2)
			{
				buffer[i++] = x;
				buffer[i++] = y;
				if (d >= 0)
				{
					y += sy;
					d -= ax;
				}
				x += sx;
				d += ay;
			}
		}
		else
		{
			var d = ax - (ay >> 1);
			while (y != b2)
			{
				buffer[i++] = x;
				buffer[i++] = y;
				if (d >= 0)
				{
					x += sx;
					d -= ay;
				}
				y += sy;
				d += ax;
			}
		}
		
		return i;
	}
	
	/**
	 * Uses Bresenham's algorithm for drawing an aliased line from (<i>a1</i>,<i>b1</i>) to (<i>a2</i>,<i>b2</i>).<br/>
	 * Pixel coordinates are stored in <i>buffer</i> in the format <arg>&#091;x1, y1, x2, y2...xn, yn&#093;</arg> starting at index <code>offset</code>.
	 */
	public function drawBresenhamLineToMemory(a1:Int, b1:Int, a2:Int, b2:Int, buffer:ShortMemory, offset:Int):Int
	{
		var dx = a2 - a1;
		var dy = b2 - b1;
		
		var ax, ay, sx, sy;
		
		if (dx < 0)
		{
			ax =-dx;
			sx =-1;
		}
		else
		{
			ax = dx;
			sx = 1;
		}
		
		if (dy < 0)
		{
			ay =-dy;
			sy =-1;
		}
		else
		{
			ay = dy;
			sy = 1;
		}
		
		ax <<= 1;
		ay <<= 1;
		
		var x = a1;
		var y = b1;
		
		#if debug
		var i0 = offset;
		var i = offset;
		#else
		var addr = buffer.getAddr(offset);
		var i = addr;
		#end
		
		if (ax > ay)
		{
			var d = ay - (ax >> 1);
			while (x != a2)
			{
				#if debug
				buffer.set(i++, x);
				buffer.set(i++, y);
				#else
				flash.Memory.setI16(i + 0, x);
				flash.Memory.setI16(i + 2, y);
				i += 4;
				#end
				
				if (d >= 0)
				{
					y += sy;
					d -= ax;
				}
				x += sx;
				d += ay;
			}
		}
		else
		{
			var d = ax - (ay >> 1);
			while (y != b2)
			{
				#if debug
				buffer.set(i++, x);
				buffer.set(i++, y);
				#else
				flash.Memory.setI16(i + 0, x);
				flash.Memory.setI16(i + 2, y);
				i += 4;
				#end
				
				if (d >= 0)
				{
					x += sx;
					d -= ay;
				}
				y += sy;
				d += ax;
			}
		}
		
		#if debug
		return i - i0;
		#else
		return (i - addr) >> 1;
		#end
	}
	
	/**
	 * Uses Bresenham's algorithm for drawing an aliased line from (<i>a1</i>,<i>b1</i>) to (<i>a2</i>,<i>b2</i>).<br/>
	 * Pixel coordinates are stored in <i>buffer</i> in the format <arg>&#091;x1, y1, x2, y2...xn, yn&#093;</arg> starting at index <code>offset</code>.
	 */
	
	/**
	 * Symmetric Double Step Line Algorithm by Brian Wyvill
	 * from "Graphics Gems", Academic Press, 1990
	 * Uses Xialon Wu's algorithm for drawing an aliased line from (<i>a1</i>,<i>b1</i>) to (<i>a2</i>,<i>b2</i>) and
	 * stores the pixel coordinates in <i>output</i> in the format [x1, y1, x2, y2...xn, yn].
	 */
	public function drawXialonWuLine(a1:Int, b1:Int, a2:Int, b2:Int, output:Array<Int>):Int
	{
		var x, y, x1, y1, incr1, incr2, i, j, xend, c, d, pixelsLeft;
		
		var dx = ((a2 - a1) < 0 ? -1 : 1) * (a2 - a1);
		var dy = ((b2 - b1) < 0 ? -1 : 1) * (b2 - b1);
		var sgnX = (a2 - a1) < 0 ? -1 : 1;
		var sgnY = (b2 - b1) < 0 ? -1 : 1;
		var step = (sgnX == sgnY) ? 1 :-1;
		
		var reverse;
		if (dy > dx)
		{
			var tmp;
			tmp = a1; a1 = b1; b1 = tmp;
			tmp = a2; a2 = b2; b2 = tmp;
			tmp = dx; dx = dy; dy = tmp;
			reverse = true;
		}
		else
			reverse = false;
		
		#if debug
		de.polygonal.core.util.Assert.assert(dx != 0, 'dx != 0');
		#end
		
		if (a1 > a2)
		{
			x = a2;
			y = b2;
			x1 = a1;
			y1 = b1;
		}
		else
		{
			x = a1;
			y = b1;
			x1 = a2;
			y1 = b2;
		}
		
		j = 0;
		
		if (reverse)
		{
			xend = (dx - 1) >> 2;
			pixelsLeft = (dx - 1) & 3;
			output[j++] = y;
			output[j++] = x;
			
			if (pixelsLeft >= 0)
			{
				output[j++] = y1;
				output[j++] = x1;
				
				incr2 = 4 * dy - 2 * dx;
				if (incr2 < 0)
				{
					c = 2 * dy;
					incr1 = 2 * c;
					d = incr1 - dx;
					
					for (i in 0...xend)
					{
						++x;
						--x1;
						if (d < 0)
						{
							output[j++] = y;
							output[j++] = x;
							
							output[j++] = y;
							output[j++] = ++x;
							
							output[j++] = y1;
							output[j++] = x1;
							
							output[j++] = y1;
							output[j++] = --x1;
							
							d += incr1;
						}
						else
						{
							if (d < c)
							{
								output[j++] = y;
								output[j++] = x;
								
								output[j++] = y += step;
								output[j++] = ++x;
								
								output[j++] = y1;
								output[j++] = x1;
								
								output[j++] = y1 -= step;
								output[j++] = --x1;
							}
							else
							{
								output[j++] = y += step;
								output[j++] = x;
								
								output[j++] = y;
								output[j++] = ++x;
								
								output[j++] = y1 -= step;
								output[j++] = x1;
								
								output[j++] = y1;
								output[j++] = --x1;
							}
							d += incr2;
						}
					}
					
					if (pixelsLeft != 0)
					{
						if (d < 0)
						{
							output[j++] = y;
							output[j++] = ++x;
							
							if (pixelsLeft > 1)
							{
								output[j++] = y;
								output[j++] = ++x;
								
							}
							if (pixelsLeft > 2)
							{
								output[j++] = y1;
								output[j++] = --x1;
							}
						}
						else
						{
							if (d < c)
							{
								output[j++] = y;
								output[j++] = ++x;
								
								if (pixelsLeft > 1)
								{
									output[j++] = y += step;
									output[j++] = ++x;
								}
								if (pixelsLeft > 2)
								{
									output[j++] = y1;
									output[j++] = --x1;
								}
							}
							else
							{
								output[j++] = y += step;
								output[j++] = ++x;
								
								if (pixelsLeft > 1)
								{
									output[j++] = y;
									output[j++] = ++x;
								}
								if (pixelsLeft > 2)
								{
									output[j++] = y1 -= step;
									output[j++] = --x;
								}
							}
						}
					}
				}
				else
				{
					c = 2 * (dy - dx);
					incr1 = 2 * c;
					d = incr1 + dx;
					
					for (i in 0...xend)
					{
						++x;
						--x1;
						if (d > 0)
						{
							output[j++] = y += step;
							output[j++] = x;
							
							output[j++] = y += step;
							output[j++] = ++x;
							
							output[j++] = y1 -= step;
							output[j++] = x1;
							
							output[j++] = y1 -= step;
							output[j++] = --x1;
							
							d += incr1;
						}
						else
						{
							if (d < c)
							{
								output[j++] = y;
								output[j++] = x;
								
								output[j++] = y += step;
								output[j++] = ++x;
								
								output[j++] = y1;
								output[j++] = x1;
								
								output[j++] = y1 -= step;
								output[j++] = --x1;
							}
							else
							{
								output[j++] = y += step;
								output[j++] = x;
								
								output[j++] = y;
								output[j++] = ++x;
								
								output[j++] = y1 -= step;
								output[j++] = x1;
								
								output[j++] = y1;
								output[j++] = --x1;
							}
							d += incr2;
						}
					}
					if (pixelsLeft != 0)
					{
						if (d > 0)
						{
							output[j++] = y += step;
							output[j++] = ++x;
							if (pixelsLeft > 1)
							{
								output[j++] = y += step;
								output[j++] = ++x;
								
							}
							if (pixelsLeft > 2)
							{
								output[j++] = y1 -= step;
								output[j++] = --x1;
							}
						}
						else
						{
							if (d < c)
							{
								output[j++] = y;
								output[j++] = ++x;
								
								if (pixelsLeft > 1)
								{
									output[j++] = y += step;
									output[j++] = ++x;
								}
								if (pixelsLeft > 2)
								{
									output[j++] = y1;
									output[j++] = --x1;
								}
							}
							else
							{
								output[j++] = y += step;
								output[j++] = ++x;
								
								if (pixelsLeft > 1)
								{
									output[j++] = y;
									output[j++] = ++x;
								}
								if (pixelsLeft > 2)
								{
									if (d > c)
									{
										output[j++] = y1 -= step;
										output[j++] = --x;
									}
									else
									{
										output[j++] = y1;
										output[j++] = --x;
									}
								}
							}
						}
					}
				}
			}
		}
		else
		{
			xend = (dx - 1) >> 2;
			pixelsLeft = (dx - 1) & 3;
			output[j++] = x;
			output[j++] = y;
			
			if (pixelsLeft >= 0)
			{
				output[j++] = x1;
				output[j++] = y1;
				
				incr2 = 4 * dy - 2 * dx;
				if (incr2 < 0)
				{
					c = 2 * dy;
					incr1 = 2 * c;
					d = incr1 - dx;
					
					for (i in 0...xend)
					{
						++x;
						--x1;
						if (d < 0)
						{
							output[j++] = x;
							output[j++] = y;
							
							output[j++] = ++x;
							output[j++] = y;
							
							output[j++] = x1;
							output[j++] = y1;
							
							output[j++] = --x1;
							output[j++] = y1;
							
							d += incr1;
						}
						else
						{
							if (d < c)
							{
								output[j++] = x;
								output[j++] = y;
								
								output[j++] = ++x;
								output[j++] = y += step;
								
								output[j++] = x1;
								output[j++] = y1;
								
								output[j++] = --x1;
								output[j++] = y1 -= step;
							}
							else
							{
								output[j++] = x;
								output[j++] = y += step;
								
								output[j++] = ++x;
								output[j++] = y;
								
								output[j++] = x1;
								output[j++] = y1 -= step;
								
								output[j++] = --x1;
								output[j++] = y1;
							}
							d += incr2;
						}
					}
					
					if (pixelsLeft != 0)
					{
						if (d < 0)
						{
							output[j++] = ++x;
							output[j++] = y;
							
							if (pixelsLeft > 1)
							{
								output[j++] = ++x;
								output[j++] = y;
							}
							if (pixelsLeft > 2)
							{
								output[j++] = --x1;
								output[j++] = y1;
							}
						}
						else
						{
							if (d < c)
							{
								output[j++] = ++x;
								output[j++] = y;
								
								if (pixelsLeft > 1)
								{
									output[j++] = ++x;
									output[j++] = y += step;
									
								}
								if (pixelsLeft > 2)
								{
									output[j++] = --x1;
									output[j++] = y1;
								}
							}
							else
							{
								output[j++] = ++x;
								output[j++] = y += step;
								
								if (pixelsLeft > 1)
								{
									output[j++] = ++x;
									output[j++] = y;
								}
									
								if (pixelsLeft > 2)
								{
									output[j++] = --x1;
									output[j++] = y1 -= step;
								}
							}
						}
					}
				}
				else
				{
					c = 2 * (dy - dx);
					incr1 = 2 * c;
					d = incr1 + dx;
					
					for (i in 0...xend)
					{
						++x;
						--x1;
						if (d > 0)
						{
							output[j++] = x;
							output[j++] = y += step;
							
							output[j++] = ++x;
							output[j++] = y += step;
							
							output[j++] = x1;
							output[j++] = y1 -= step;
							
							output[j++] = --x1;
							output[j++] = y1 -= step;
							
							d += incr1;
						}
						else
						{
							if (d < c)
							{
								output[j++] = x;
								output[j++] = y;
								
								output[j++] = ++x;
								output[j++] = y += step;
								
								output[j++] = x1;
								output[j++] = y1;
								
								output[j++] = --x1;
								output[j++] = y1 -= step;
							}
							else
							{
								output[j++] = x;
								output[j++] = y += step;
								
								output[j++] = ++x;
								output[j++] = y;
								
								output[j++] = x1;
								output[j++] = y1 -= step;
								
								output[j++] = --x1;
								output[j++] = y1;
							}
							d += incr2;
						}
					}
					if (pixelsLeft != 0)
					{
						if (d > 0)
						{
							output[j++] = ++x;
							output[j++] = y += step;
							
							if (pixelsLeft > 1)
							{
								output[j++] = ++x;
								output[j++] = y += step;
							}
							if (pixelsLeft > 2)
							{
								output[j++] = --x1;
								output[j++] = y1 -= step;
							}
						}
						else
						{
							if (d < c)
							{
								output[j++] = ++x;
								output[j++] = y;
								
								if (pixelsLeft > 1)
								{
									output[j++] = ++x;
									output[j++] = y += step;
								}
								if (pixelsLeft > 2)
								{
									output[j++] = --x;
									output[j++] = y1;
								}
							}
							else
							{
								output[j++] = ++x;
								output[j++] = y += step;
								
								if (pixelsLeft > 1)
								{
									output[j++] = ++x;
									output[j++] = y;
									
								}
								if (pixelsLeft > 2)
								{
									if (d > c)
									{
										output[j++] = --x1;
										output[j++] = y1 -= step;
									}
									else
									{
										output[j++] = --x1;
										output[j++] = y1;
									}
								}
							}
						}
					}
				}
			}
		}
		
		return j;
	}
	
	/**
	 * Symmetric Double Step Line Algorithm by Brian Wyvill
	 * from "Graphics Gems", Academic Press, 1990
	 * Uses Xialon Wu's algorithm for drawing an aliased line from (<i>a1</i>,<i>b1</i>) to (<i>a2</i>,<i>b2</i>) and
	 * stores the pixel coordinates in <i>output</i> in the format [x1, y1, x2, y2...xn, yn].
	 */
	public function drawXialonWuLineMem(a1:Int, b1:Int, a2:Int, b2:Int, output:ShortMemory):Int
	{
		var x, y, x1, y1, incr1, incr2, i, j, xend, c, d, pixelsLeft;
		
		var dx = ((a2 - a1) < 0 ? -1 : 1) * (a2 - a1);
		var dy = ((b2 - b1) < 0 ? -1 : 1) * (b2 - b1);
		var sgnX = (a2 - a1) < 0 ? -1 : 1;
		var sgnY = (b2 - b1) < 0 ? -1 : 1;
		var step = (sgnX == sgnY) ? 1 :-1;
		
		var reverse;
		if (dy > dx)
		{
			var tmp;
			tmp = a1; a1 = b1; b1 = tmp;
			tmp = a2; a2 = b2; b2 = tmp;
			tmp = dx; dx = dy; dy = tmp;
			reverse = true;
		}
		else
			reverse = false;
		
		#if debug
		de.polygonal.core.util.Assert.assert(dx != 0, 'dx != 0');
		#end
		
		if (a1 > a2)
		{
			x = a2;
			y = b2;
			x1 = a1;
			y1 = b1;
		}
		else
		{
			x = a1;
			y = b1;
			x1 = a2;
			y1 = b2;
		}
		
		j = 0;
		
		if (reverse)
		{
			xend = (dx - 1) >> 2;
			pixelsLeft = (dx - 1) & 3;
			output.set(j++, y);
			output.set(j++, x);
			
			if (pixelsLeft >= 0)
			{
				output.set(j++, y1);
				output.set(j++, x1);
				
				incr2 = 4 * dy - 2 * dx;
				if (incr2 < 0)
				{
					c = 2 * dy;
					incr1 = 2 * c;
					d = incr1 - dx;
					
					for (i in 0...xend)
					{
						++x;
						--x1;
						if (d < 0)
						{
							output.set(j++, y);
							output.set(j++, x);
							
							output.set(j++, y);
							output.set(j++, ++x);
							
							output.set(j++, y1);
							output.set(j++, x1);
							
							output.set(j++, y1);
							output.set(j++, --x1);
							
							d += incr1;
						}
						else
						{
							if (d < c)
							{
								output.set(j++, y);
								output.set(j++, x);
								
								output.set(j++, y += step);
								output.set(j++, ++x);
								
								output.set(j++, y1);
								output.set(j++, x1);
								
								output.set(j++, y1 -= step);
								output.set(j++, --x1);
							}
							else
							{
								output.set(j++, y += step);
								output.set(j++, x);
								
								output.set(j++, y);
								output.set(j++, ++x);
								
								output.set(j++, y1 -= step);
								output.set(j++, x1);
								
								output.set(j++, y1);
								output.set(j++, --x1);
							}
							d += incr2;
						}
					}
					
					if (pixelsLeft != 0)
					{
						if (d < 0)
						{
							output.set(j++, y);
							output.set(j++, ++x);
							
							if (pixelsLeft > 1)
							{
								output.set(j++, y);
								output.set(j++, ++x);
								
							}
							if (pixelsLeft > 2)
							{
								output.set(j++, y1);
								output.set(j++, --x1);
							}
						}
						else
						{
							if (d < c)
							{
								output.set(j++, y);
								output.set(j++, ++x);
								
								if (pixelsLeft > 1)
								{
									output.set(j++, y += step);
									output.set(j++, ++x);
								}
								if (pixelsLeft > 2)
								{
									output.set(j++, y1);
									output.set(j++, --x1);
								}
							}
							else
							{
								output.set(j++, y += step);
								output.set(j++, ++x);
								
								if (pixelsLeft > 1)
								{
									output.set(j++, y);
									output.set(j++, ++x);
								}
								if (pixelsLeft > 2)
								{
									output.set(j++, y1 -= step);
									output.set(j++, --x);
								}
							}
						}
					}
				}
				else
				{
					c = 2 * (dy - dx);
					incr1 = 2 * c;
					d = incr1 + dx;
					
					for (i in 0...xend)
					{
						++x;
						--x1;
						if (d > 0)
						{
							output.set(j++, y += step);
							output.set(j++, x);
							
							output.set(j++, y += step);
							output.set(j++, ++x);
							
							output.set(j++, y1 -= step);
							output.set(j++, x1);
							
							output.set(j++, y1 -= step);
							output.set(j++, --x1);
							
							d += incr1;
						}
						else
						{
							if (d < c)
							{
								output.set(j++, y);
								output.set(j++, x);
								
								output.set(j++, y += step);
								output.set(j++, ++x);
								
								output.set(j++, y1);
								output.set(j++, x1);
								
								output.set(j++, y1 -= step);
								output.set(j++, --x1);
							}
							else
							{
								output.set(j++, y += step);
								output.set(j++, x);
								
								output.set(j++, y);
								output.set(j++, ++x);
								
								output.set(j++, y1 -= step);
								output.set(j++, x1);
								
								output.set(j++, y1);
								output.set(j++, --x1);
							}
							d += incr2;
						}
					}
					if (pixelsLeft != 0)
					{
						if (d > 0)
						{
							output.set(j++, y += step);
							output.set(j++, ++x);
							if (pixelsLeft > 1)
							{
								output.set(j++, y += step);
								output.set(j++, ++x);
								
							}
							if (pixelsLeft > 2)
							{
								output.set(j++, y1 -= step);
								output.set(j++, --x1);
							}
						}
						else
						{
							if (d < c)
							{
								output.set(j++, y);
								output.set(j++, ++x);
								
								if (pixelsLeft > 1)
								{
									output.set(j++, y += step);
									output.set(j++, ++x);
								}
								if (pixelsLeft > 2)
								{
									output.set(j++, y1);
									output.set(j++, --x1);
								}
							}
							else
							{
								output.set(j++, y += step);
								output.set(j++, ++x);
								
								if (pixelsLeft > 1)
								{
									output.set(j++, y);
									output.set(j++, ++x);
								}
								if (pixelsLeft > 2)
								{
									if (d > c)
									{
										output.set(j++, y1 -= step);
										output.set(j++, --x);
									}
									else
									{
										output.set(j++, y1);
										output.set(j++, --x);
									}
								}
							}
						}
					}
				}
			}
		}
		else
		{
			xend = (dx - 1) >> 2;
			pixelsLeft = (dx - 1) & 3;
			output.set(j++, x);
			output.set(j++, y);
			
			if (pixelsLeft >= 0)
			{
				output.set(j++, x1);
				output.set(j++, y1);
				
				incr2 = 4 * dy - 2 * dx;
				if (incr2 < 0)
				{
					c = 2 * dy;
					incr1 = 2 * c;
					d = incr1 - dx;
					
					for (i in 0...xend)
					{
						++x;
						--x1;
						if (d < 0)
						{
							output.set(j++, x);
							output.set(j++, y);
							
							output.set(j++, ++x);
							output.set(j++, y);
							
							output.set(j++, x1);
							output.set(j++, y1);
							
							output.set(j++, --x1);
							output.set(j++, y1);
							
							d += incr1;
						}
						else
						{
							if (d < c)
							{
								output.set(j++, x);
								output.set(j++, y);
								
								output.set(j++, ++x);
								output.set(j++, y += step);
								
								output.set(j++, x1);
								output.set(j++, y1);
								
								output.set(j++, --x1);
								output.set(j++, y1 -= step);
							}
							else
							{
								output.set(j++, x);
								output.set(j++, y += step);
								
								output.set(j++, ++x);
								output.set(j++, y);
								
								output.set(j++, x1);
								output.set(j++, y1 -= step);
								
								output.set(j++, --x1);
								output.set(j++, y1);
							}
							d += incr2;
						}
					}
					
					if (pixelsLeft != 0)
					{
						if (d < 0)
						{
							output.set(j++, ++x);
							output.set(j++, y);
							
							if (pixelsLeft > 1)
							{
								output.set(j++, ++x);
								output.set(j++, y);
							}
							if (pixelsLeft > 2)
							{
								output.set(j++, --x1);
								output.set(j++, y1);
							}
						}
						else
						{
							if (d < c)
							{
								output.set(j++, ++x);
								output.set(j++, y);
								
								if (pixelsLeft > 1)
								{
									output.set(j++, ++x);
									output.set(j++, y += step);
									
								}
								if (pixelsLeft > 2)
								{
									output.set(j++, --x1);
									output.set(j++, y1);
								}
							}
							else
							{
								output.set(j++, ++x);
								output.set(j++, y += step);
								
								if (pixelsLeft > 1)
								{
									output.set(j++, ++x);
									output.set(j++, y);
								}
									
								if (pixelsLeft > 2)
								{
									output.set(j++, --x1);
									output.set(j++, y1 -= step);
								}
							}
						}
					}
				}
				else
				{
					c = 2 * (dy - dx);
					incr1 = 2 * c;
					d = incr1 + dx;
					
					for (i in 0...xend)
					{
						++x;
						--x1;
						if (d > 0)
						{
							output.set(j++, x);
							output.set(j++, y += step);
							
							output.set(j++, ++x);
							output.set(j++, y += step);
							
							output.set(j++, x1);
							output.set(j++, y1 -= step);
							
							output.set(j++, --x1);
							output.set(j++, y1 -= step);
							
							d += incr1;
						}
						else
						{
							if (d < c)
							{
								output.set(j++, x);
								output.set(j++, y);
								
								output.set(j++, ++x);
								output.set(j++, y += step);
								
								output.set(j++, x1);
								output.set(j++, y1);
								
								output.set(j++, --x1);
								output.set(j++, y1 -= step);
							}
							else
							{
								output.set(j++, x);
								output.set(j++, y += step);
								
								output.set(j++, ++x);
								output.set(j++, y);
								
								output.set(j++, x1);
								output.set(j++, y1 -= step);
								
								output.set(j++, --x1);
								output.set(j++, y1);
							}
							d += incr2;
						}
					}
					if (pixelsLeft != 0)
					{
						if (d > 0)
						{
							output.set(j++, ++x);
							output.set(j++, y += step);
							
							if (pixelsLeft > 1)
							{
								output.set(j++, ++x);
								output.set(j++, y += step);
							}
							if (pixelsLeft > 2)
							{
								output.set(j++, --x1);
								output.set(j++, y1 -= step);
							}
						}
						else
						{
							if (d < c)
							{
								output.set(j++, ++x);
								output.set(j++, y);
								
								if (pixelsLeft > 1)
								{
									output.set(j++, ++x);
									output.set(j++, y += step);
								}
								if (pixelsLeft > 2)
								{
									output.set(j++, --x);
									output.set(j++, y1);
								}
							}
							else
							{
								output.set(j++, ++x);
								output.set(j++, y += step);
								
								if (pixelsLeft > 1)
								{
									output.set(j++, ++x);
									output.set(j++, y);
									
								}
								if (pixelsLeft > 2)
								{
									if (d > c)
									{
										output.set(j++, --x1);
										output.set(j++, y1 -= step);
									}
									else
									{
										output.set(j++, --x1);
										output.set(j++, y1);
									}
								}
							}
						}
					}
				}
			}
		}
		
		return j;
	}
	
	public function drawCircleMem(px:Int, py:Int, r:Int, output:ShortMemory):Int
	{
		var x = 0;
		var y = r;
		var d = 1 - r;
		var j = 0;
		
		output.set(j++, px + x);
		output.set(j++, py + y);
		
		output.set(j++, px + x);
		output.set(j++, py - y);
		
		output.set(j++, px - y);
		output.set(j++, py + x);
		
		output.set(j++, px + y);
		output.set(j++, py + x);
		
		while (y > x)
		{
			if (d < 0)
			{
				d += (x + 3) << 1;
			}
			else
			{
				d += ((x - y) << 1) + 5;
				y--;
			}
			
			x++;
			
			output.set(j++, px+x);
			output.set(j++, py+y);
			
			output.set(j++, px-x);
			output.set(j++, py+y);
			
			output.set(j++, px+x);
			output.set(j++, py-y);
			
			output.set(j++, px-x);
			output.set(j++, py-y);
			
			output.set(j++, px-y);
			output.set(j++, py+x);
			
			output.set(j++, px-y);
			output.set(j++, py-x);
			
			output.set(j++, px+y);
			output.set(j++, py-x);
			
			output.set(j++, px+y);
			output.set(j++, py+x);
		}
		
		return j;
	}
}


