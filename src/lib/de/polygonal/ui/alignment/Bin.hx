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
package de.polygonal.ui.alignment;

import de.polygonal.core.math.Mathematics;
import de.polygonal.core.math.Vec2;
import de.polygonal.motor.geom.primitive.AABB2;

using de.polygonal.core.math.Mathematics;

//contentmode: trim, full, showAll, hideBorder
class Bin implements Boundable
{
	inline public static function AABBToBin(source:AABB2):Bin
	{
		return new Bin(source.minX, source.minY, source.intervalX, source.intervalY);
	}
	
	public var innerBound(default, null):AABB2;
	public var outerBound(default, null):AABB2;
	
	public var gap(_gapGetter, _gapMaxYetter):Float;
	inline function _gapGetter():Float { return gapMinX.fmax(gapMaxX).fmax(gapMinY).fmax(gapMaxY); }
	inline function _gapMaxYetter(x:Float):Float
	{
		gapMinX = gapMaxX = gapMinY = gapMaxY = x;
		return x;
	}
	
	public var gapMinX(_gapMinXGetter, _gapMinXSetter):Float;
	inline function _gapMinXGetter():Float { return innerBound.minX - outerBound.minX; }
	inline function _gapMinXSetter(x:Float):Float
	{
		outerBound.minX = innerBound.minX - x;
		return x;
	}
	
	public var gapMaxX(_gapMaxXGetter, _gapMaxXSetter):Float;
	inline function _gapMaxXGetter():Float { return outerBound.maxX - innerBound.maxX; }
	inline function _gapMaxXSetter(x:Float):Float
	{
		outerBound.maxX = innerBound.maxX + x;
		return x;
	}
	
	public var gapMinY(_gapMinYGetter, _gapMinYSetter):Float;
	inline function _gapMinYGetter():Float { return innerBound.minY - outerBound.minY; }
	inline function _gapMinYSetter(x:Float):Float
	{
		outerBound.minY = innerBound.minY - x;
		return x;
	}
	
	public var gapMaxY(_gapMaxYGetter, _gapMaxYSetter):Float;
	inline function _gapMaxYGetter():Float { return outerBound.maxY - innerBound.maxY; }
	inline function _gapMaxYSetter(x:Float):Float
	{
		outerBound.maxY = innerBound.maxY + x;
		return x;
	}
	
	public var minX(_minXGetter, _minXSetter):Float;
	inline function _minXGetter():Float { return outerBound.minX; }
	inline function _minXSetter(x:Float):Float
	{
		var tmp = gapMinX;
		outerBound.setMinX(x);
		innerBound.setMinX(outerBound.minX + tmp);
		return x;
	}
	
	public var maxX(_maxXGetter, _maxXSetter):Float;
	inline function _maxXGetter():Float { return outerBound.maxX; }
	inline function _maxXSetter(x:Float):Float
	{
		var tmp = gapMaxX;
		outerBound.setMaxX(x);
		innerBound.setMinX(outerBound.minX + tmp);
		return x;
	}
	
	public var minY(_minYGetter, _minYSetter):Float;
	inline function _minYGetter():Float { return outerBound.minY; }
	inline function _minYSetter(x:Float):Float
	{
		var tmp = gapMinY;
		outerBound.setMinY(x);
		innerBound.setMinY(outerBound.minY + tmp);
		return x;
	}
	
	public var maxY(_maxYGetter, _maxYSetter):Float;
	inline function _maxYGetter():Float { return outerBound.maxY; }
	inline function _maxYSetter(x:Float):Float
	{
		var tmp = gapMaxY;
		outerBound.setMaxY(x);
		innerBound.setMinY(outerBound.minY + tmp);
		return x;
	}
	
	public var min(_minGetter, _minSetter):Vec2;
	inline function _minGetter():Vec2
	{
		_tmp.x = outerBound.minX;
		_tmp.y = outerBound.minY;
		return _tmp;
	}
	inline function _minSetter(x:Vec2):Vec2
	{
		minX = x.x;
		minY = x.y;
		return x;
	}
	
	public var max(_maxGetter, _maxSetter):Vec2;
	inline function _maxGetter():Vec2
	{
		_tmp.x = outerBound.maxX;
		_tmp.y = outerBound.maxY;
		return _tmp;
	}
	inline function _maxSetter(x:Vec2):Vec2
	{
		maxX = x.x;
		maxY = x.y;
		return x;
	}
	
	public var centerX(_centerXGetter, _centerXSetter):Float;
	inline function _centerXGetter():Float { return outerBound.centerX; }
	inline function _centerXSetter(x:Float):Float
	{
		innerBound.centerX = x;
		outerBound.centerX = x;
		_adjustInnerContent();
		return x;
	}
	
	public var centerY(_centerYGetter, _centerYSetter):Float;
	inline function _centerYGetter():Float { return outerBound.centerY; }
	inline function _centerYSetter(y:Float):Float
	{
		innerBound.centerY = y;
		outerBound.centerY = y;
		_adjustInnerContent();
		return y;
	}
	
	public var center(_centerGetter, _centerSetter):Vec2;
	inline function _centerGetter():Vec2
	{
		_tmp.x = innerBound.centerX;
		_tmp.y = innerBound.centerY;
		return _tmp;
	}
	inline function _centerSetter(c:Vec2):Vec2
	{
		centerX = c.x;
		centerY = c.y;
		return c;
	}
	
	public var width(_widthGetter, _widthSetter):Float;
	inline function _widthGetter():Float { return outerBound.intervalX; }
	inline function _widthSetter(x:Float):Float
	{
		var w = x - (gapMinX + gapMaxX);
		w = w.fclamp(_minInnerSize.x, _maxInnerSize.x);
		outerBound.maxX = outerBound.minX + gapMinX + w + gapMaxX;
		innerBound.maxX = innerBound.minX + w;
		return x;
	}
	
	public var height(_heightGetter, _heightSetter):Float;
	inline function _heightGetter():Float { return outerBound.intervalY; }
	inline function _heightSetter(x:Float):Float
	{
		var h = x - (gapMaxY + gapMinY);
		h = h.fclamp(_minInnerSize.y, _maxInnerSize.y);
		outerBound.maxY = outerBound.minY + gapMaxY + h + gapMinY;
		innerBound.maxY = innerBound.minY + h;
		return x;
	}
	
	public var minWidth(_minWidthGetter, never):Float;
	inline function _minWidthGetter():Float { return minInnerSizeX + gapMaxX + gapMinX; }
	
	public var maxWidth(_maxWidthGetter, never):Float;
	inline function _maxWidthGetter():Float { return maxInnerSizeX + gapMaxX + gapMinX; }
	
	public var minHeight(_minHeightGetter, never):Float;
	inline function _minHeightGetter():Float { return minInnerSizeY + gapMaxX + gapMinX; }
		
	public var maxHeight(_maxHeightGetter, never):Float;
	inline function _maxHeightGetter():Float { return maxInnerSizeY + gapMaxX + gapMinX; }
	
	public var minInnerSizeX(_minInnerSizeXGetter, _minInnerSizeXSetter):Float;
	inline function _minInnerSizeXGetter():Float { return _minInnerSize.x; }
	inline function _minInnerSizeXSetter(x:Float):Float
	{
		_minInnerSize.x = x;
		return x;
	}
	
	public var maxInnerSizeX(_maxInnerSizeXGetter, _maxInnerSizeXSetter):Float;
	inline function _maxInnerSizeXGetter():Float { return _maxInnerSize.x; }
	inline function _maxInnerSizeXSetter(x:Float):Float
	{
		_maxInnerSize.x = x;
		return x;
	}
	
	public var minInnerSize(_minInnerSizeGetter, _minInnerSizeSetter):Vec2;
	inline function _minInnerSizeGetter():Vec2
	{
		_tmp.x = _minInnerSize.x;
		_tmp.y = _minInnerSize.y;
		return _tmp;
	}
	inline function _minInnerSizeSetter(x:Vec2):Vec2
	{
		_minInnerSize.x = x.x;
		_minInnerSize.y = x.y;
		return x;
	}
	
	public var minInnerSizeY(_minInnerSizeYGetter, _minInnerSizeYSetter):Float;
	inline function _minInnerSizeYGetter():Float { return _minInnerSize.y; }
	inline function _minInnerSizeYSetter(x:Float):Float
	{
		_minInnerSize.y = x;
		return x;
	}
	
	public var maxInnerSizeY(_maxInnerSizeYGetter, _maxInnerSizeYSetter):Float;
	inline function _maxInnerSizeYGetter():Float { return _maxInnerSize.y; }
	inline function _maxInnerSizeYSetter(x:Float):Float
	{
		_maxInnerSize.y = x;
		return x;
	}
	
	public var maxInnerSize(_maxInnerSizeGetter, _maxInnerSizeSetter):Vec2;
	inline function _maxInnerSizeGetter():Vec2
	{
		_tmp.x = _maxInnerSize.x;
		_tmp.y = _maxInnerSize.y;
		return _tmp;
	}
	inline function _maxInnerSizeSetter(x:Vec2):Vec2
	{
		_maxInnerSize.x = x.x;
		_maxInnerSize.y = x.y;
		return x;
	}
	
	var _bound:AABB2;
	var _minInnerSize:Vec2;
	var _maxInnerSize:Vec2;
	var _tmp:Vec2;
	var _content:Boundable;
	
	public function new(x:Float, y:Float, width:Float, height:Float) 
	{
		innerBound = new AABB2(x, y, x + width, y + height);
		outerBound = innerBound.clone();
		_minInnerSize = new Vec2(Mathematics.NEGATIVE_INFINITY, Mathematics.NEGATIVE_INFINITY);
		_maxInnerSize = new Vec2(Mathematics.POSITIVE_INFINITY, Mathematics.POSITIVE_INFINITY);
		_tmp = new Vec2();
		_content = null;
	}
	
	public function free():Void
	{
		innerBound = null;
		outerBound = null;
		_minInnerSize = null;
		_maxInnerSize = null;
		_bound = null;
	}
	
	public function invalidate():Void
	{
		if (getContent() != null) getContent().setBound(innerBound);
	}
	
	public function getBound():AABB2
	{
		if (_bound == null) _bound = new AABB2();
		_bound.set(outerBound);
		return _bound;
	}
	
	public function setBound(a:AABB2):Void
	{
		width  = a.intervalX;
		height = a.intervalY;
		minX = a.minX;
		minY = a.minY;
	}
	
	public function alignBeforeX(target:Bin)
	{
		maxX = target.minX;
	}
	
	public function alignBeforeY(target:Bin)
	{
		maxY = target.minY;
	}
	
	public function alignAfterX(target:Bin)
	{
		minX = target.maxX;
	}
	
	public function alignAfterY(target:Bin)
	{
		minY = target.maxY;
	}
	
	public function stretchMinX(x:Float):Bool
	{
		var tmp1 = gapMinX;
		var tmp2 = gapMaxX;
		var tmp3 = tmp1 + tmp2;
		
		var w = (outerBound.maxX - x) - tmp3;
		var clamped = w < _minInnerSize.x || w > _maxInnerSize.x;
		w = w.fclamp(_minInnerSize.x, _maxInnerSize.x);
		outerBound.minX = outerBound.maxX - (w + tmp3);
		innerBound.minX = outerBound.maxX - (w + tmp2);
		
		return clamped;
	}
	
	public function stretchMinY(y:Float):Bool
	{
		var tmp1 = gapMinY;
		var tmp2 = gapMaxY;
		var tmp3 = tmp1 + tmp2;
		
		var h = (outerBound.maxY - y) - tmp3;
		var clamped = h < _minInnerSize.x || h > _maxInnerSize.x;
		h = h.fclamp(_minInnerSize.y, _maxInnerSize.y);
		
		outerBound.minY = outerBound.maxY - (h + tmp3);
		innerBound.minY = outerBound.maxY - (h + tmp2);
		
		return clamped;
	}
	
	public function stretchMaxX(x:Float):Bool
	{
		var tmp1 = gapMinX;
		var tmp2 = gapMaxX;
		var tmp3 = tmp1 + tmp2;
		
		var w = (x - outerBound.minX) - tmp3;
		var clamped = w < _minInnerSize.x || w > _maxInnerSize.x;
		w = w.fclamp(_minInnerSize.x, _maxInnerSize.x);
		
		outerBound.maxX = outerBound.minX + w + tmp3;
		innerBound.maxX = outerBound.maxX - tmp2;
		
		return clamped;
	}
	
	public function stretchMaxY(x:Float):Bool
	{
		var tmp1 = gapMinY;
		var tmp2 = gapMaxY;
		var tmp3 = tmp1 + tmp2;
		
		var h = (x - outerBound.minY) - tmp3;
		var clamped = h < _minInnerSize.x || h > _maxInnerSize.x;
		h = h.fclamp(_minInnerSize.y, _maxInnerSize.y);
		
		outerBound.maxY = outerBound.minY + h + tmp3;
		innerBound.maxY = outerBound.maxY - tmp2;
		
		return clamped;
	}
	
	public function resize(x:Float, y:Float, anchor:Anchor):Void
	{
		switch (anchor)
		{
			case Anchor.TopLeft:
				stretchMaxX(x);
				stretchMaxY(y);
				
			case Anchor.TopRight:
				stretchMinX(x);
				stretchMinY(y);
				
			case Anchor.BottomLeft:
				stretchMaxX(x);
				stretchMinY(y);
				
			case Anchor.BottomRight:
				stretchMinX(x);
				stretchMaxY(y);
				
			case Anchor.Center:
		}
	}
	
	public function move(x:Float, y:Float, anchor:Anchor)
	{
		switch (anchor)
		{
			case TopLeft:
				minX = x;
				minY = y;
			
			case BottomLeft:
				minX = x;
				maxY = y;
			
			case TopRight:
				maxX = x;
				minY = y;
			
			case BottomRight:
				maxX = x;
				maxY = y;
			
			case Center:
				minX = x - outerBound.intervalX * .5;
				minY = y - outerBound.intervalY * .5;
		}
	}
	
	public function constrainInnerSize(minX:Float, minY:Float, maxX:Float, maxY:Float):Void
	{
		#if debug
		de.polygonal.core.util.Assert.assert(minX < maxX, "minX < maxX");
		de.polygonal.core.util.Assert.assert(minY < maxY, "minY < maxY");
		#end
		
		_minInnerSize.x = minX; 
		_minInnerSize.x = minY;
		
		_maxInnerSize.x = maxX;
		_maxInnerSize.y = maxY;
	}
	
	public function getContent():Boundable
	{
		return _content;
	}
	
	public function setContent(x:Boundable):Void
	{
		_content = x;
		_adjustInnerContent();
	}
	
	inline function _adjustInnerContent()
	{
		if (getContent() != null) getContent().setBound(innerBound);
	}
}