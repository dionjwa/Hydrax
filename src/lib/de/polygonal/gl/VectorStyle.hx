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

import de.polygonal.gl.color.ARGB;

#if flash
import flash.display.CapsStyle;
import flash.display.GraphicsEndFill;
import flash.display.GraphicsSolidFill;
import flash.display.GraphicsStroke;
import flash.display.IGraphicsData;
import flash.display.JointStyle;
import flash.display.LineScaleMode;
import flash.display.IGraphicsFill;
#end

using de.polygonal.gl.color.ARGB;

/**
 * Defines a line style and solid fill for the <i>VectorRenderer</i>.
 */
class VectorStyle
{
	/** The line color. */
	public var lineColor:Int;
	
	/** The line alpha in the range &#091;0,1&#093;. */
	public var lineAlpha:Float;
	
	/** The line thickness. Assigning NaN disables line drawing. */
	public var lineThickness:Float;
	
	/** See flash.display.LineScaleMode */
	#if flash10
	public var lineScaleMode:LineScaleMode;
	#end
	
	/** See flash.display.GraphicsStroke.pixelHinting */
	public var linePixelHinting:Bool;
	
	#if flash10
	/** See flash.display.GraphicsStroke.caps */
	public var lineCaps:CapsStyle;
	#end
	
	#if flash10
	/** See flash.display.GraphicsStroke.joints */
	public var lineJoints:JointStyle;
	#end
	
	/** See flash.display.GraphicsStroke.miterLimit */
	public var lineMiterLimit:Float;
	
	/**
	 * If false, <i>linePixelHinting</i>, <i>lineCaps</i>, <i>lineJoints</i>, 
	 * <i>lineScaleMode</i> and <i>lineMiterLimit</i> have no effect.
	 */
	public var useComplexStroke:Bool;
	
	/** The fill color. */
	public var fillColor:Int;
	
	/** The fill alpha in the range &#091;0,1&#093;. */
	public var fillAlpha:Float;
	
	public function new()
	{
		lineColor        = 0x0;
		lineAlpha        = 0.0;
		lineThickness    = Math.NaN;
		
		#if flash
		lineScaleMode    = LineScaleMode.NORMAL;
		linePixelHinting = false;
		lineCaps         = CapsStyle.NONE;
		lineJoints       = JointStyle.BEVEL;
		#end
		lineMiterLimit   = 3.0;
		useComplexStroke = false;
		fillColor        = 0x0;
		fillAlpha        = 0.0;
	}
	
	/** Nullifies references for GC'ing used resources. */
	public function free():Void
	{
		#if flash
		lineScaleMode = null;
		lineCaps      = null;
		lineJoints    = null;
		#end
	}
	
	/** Disables line drawing by setting <i>lineThickness</i> to NaN. */
	inline public function clearStroke():Void
	{
		lineThickness = Math.NaN;
	}
	
	/** Assigns a line color and line alpha. */
	inline public function setLineColor(rgb:Int, ?alpha = 1., ?thickness = .0):Void
	{
		lineColor = rgb;
		lineAlpha = alpha;
		lineThickness = thickness;
	}
	
	/** Assigns a fill color and fill alpha using an ARGB object. */
	inline public function setLineColorARGB(argb:ARGB, ?thickness = .0):Void
	{
		lineColor = argb.get24();
		lineAlpha = argb.a;
		lineThickness = thickness;
	}
	
	/** Assigns a fill color and fill alpha using a 32 bit unsigned integer. */
	inline public function setLineColorARGBh(argb:Int, ?thickness = .0):Void
	{
		lineColor = argb.getRGB();
		lineAlpha = argb.getAf();
		lineThickness = thickness;
	}
	
	/** Assigns a fill color and fill alpha. */
	inline public function setFillColor(rgb:Int, alpha:Float):Void
	{
		fillColor = rgb;
		fillAlpha = alpha;
	}
	
	/** Assigns a fill color and fill alpha using an ARGB object. */
	inline public function setFillColorARGB(argb:ARGB):Void
	{
		fillColor = argb.get24();
		fillAlpha = argb.a;
	}
	
	/** Assigns a fill color and fill alpha using a 32 bit unsigned integer. */
	inline public function setFillColorARGBh(argb:Int):Void
	{
		fillColor = argb.getRGB();
		fillAlpha = argb.getAf();
	}
	
	/** Duplicates this object. */
	public function copy():VectorStyle
	{
		var copy:VectorStyle = new VectorStyle();
		copy.lineColor        = lineColor;
		copy.lineAlpha        = lineAlpha;
		copy.lineThickness    = lineThickness;
		#if flash
		copy.lineScaleMode    = lineScaleMode;
		copy.linePixelHinting = linePixelHinting;
		copy.lineCaps         = lineCaps;
		copy.lineJoints       = lineJoints;
		copy.lineMiterLimit   = lineMiterLimit;
		copy.useComplexStroke = useComplexStroke;
		#end
		copy.fillColor        = fillColor;
		copy.fillAlpha        = fillAlpha;
		return copy;
	}
	
	/** Copies the values from the specified <i>style</i> object into this style.*/
	public function paste(style:VectorStyle):Void
	{
		lineColor        = style.lineColor;
		lineAlpha        = style.lineAlpha;
		lineThickness    = style.lineThickness;
		#if flash
		lineScaleMode    = style.lineScaleMode;
		linePixelHinting = style.linePixelHinting;
		lineCaps         = style.lineCaps;
		lineJoints       = style.lineJoints;
		#end
		lineMiterLimit   = style.lineMiterLimit;
		useComplexStroke = style.useComplexStroke;
		fillColor        = style.fillColor;
		fillAlpha        = style.fillAlpha;
	}
}