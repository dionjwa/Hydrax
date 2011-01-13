/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.geom;

import com.pblabs.geom.Vector2;

class Rectangle
{
   public var x : Float;
   public var y : Float;
   public var width : Float;
   public var height : Float;

   // public function new(?inX : Float = 0, ?inY : Float = 0, ?inWidth : Float = 0, ?inHeight : Float = 0)
   public function new(?inX : Float = 0, ?inY : Float = 0, ?inWidth : Float = 0, ?inHeight : Float = 0)
   {
	  x = inX;
	  y = inY;
	  width = inWidth;
	  height = inHeight;
   }

   public var left(get_left,set_left) : Float;
   function get_left() { return x; }
   function set_left(l:Float) { x=l; return l;}

   public var right(get_right,set_right) : Float;
   function get_right() { return x+width; }
   function set_right(r:Float) { width = r-x; return r;}

   public var top(get_top,set_top) : Float;
   function get_top() { return y; }
   function set_top(t:Float) { y=t; return t;}

   public var bottom(get_bottom,set_bottom) : Float;
   function get_bottom() { return y+height; }
   function set_bottom(b:Float) { height = b-y; return b;}

   public var topLeft(get_topLeft,set_topLeft) : Vector2;
   function get_topLeft() { return new Vector2(x,y); }
   function set_topLeft(p:Vector2) { x=p.x;y=p.y; return p.clone(); }

   public var size(get_topLeft,set_topLeft) : Vector2;
   function get_size() { return new Vector2(width,height); }
   function set_size(p:Vector2) { width=p.x;height=p.y; return p.clone(); }

   public var bottomRight(get_bottomRight,set_bottomRight) : Vector2;
   function get_bottomRight() { return new Vector2(x+width,y+height); }
   function set_bottomRight(p:Vector2)
   {
	  width = p.x-x;
	  height = p.y-y;
	  return p.clone();
   }
   
   public var center (get_center, set_center) :Vector2;
   function get_center() { return new Vector2(x+width / 2,y+height / 2); }
   function set_center(p:Vector2)
   {
   	   x = p.x - width / 2;
   	   y = p.y - height / 2;
	  return p.clone();
   }
   
   public function clone() : com.pblabs.geom.Rectangle
   {
	  return new Rectangle(x,y,width,height);
   }
   public function contains(inX : Float, inY : Float) : Bool
   {
	  return inX>=x && inY>=y && inX<right && inY<bottom;
   }
   public function containsPoint(point : Vector2) : Bool
   {
	  return contains(point.x,point.y);
   }
   public function containsRect(rect : com.pblabs.geom.Rectangle) : Bool
   {
	 return contains(rect.x,rect.y) && containsPoint(rect.bottomRight);
   }
   public function equals(toCompare : com.pblabs.geom.Rectangle) : Bool
   {
	  return x==toCompare.x && y==toCompare.y &&
			 width==toCompare.width && height==toCompare.height;
   }
   public function inflate(dx : Float, dy : Float) : Void
   {
	  x-=dx; width+=dx*2;
	  y-=dy; height+=dy*2;
   }
   public function inflatePoint(point : Vector2) : Void
   {
	  inflate(point.x,point.y);
   }
   public function intersection(toIntersect : com.pblabs.geom.Rectangle) : com.pblabs.geom.Rectangle
   {
	  var x0 = x<toIntersect.x ? toIntersect.x : x;
	  var x1 = right>toIntersect.right ? toIntersect.right : right;
	  if (x1<=x0)
		 return new Rectangle();

	  var y0 = y<toIntersect.y ? toIntersect.x : y;
	  var y1 = bottom>toIntersect.bottom ? toIntersect.bottom : bottom;
	  if (y1<=y0)
		 return new Rectangle();

	  return new Rectangle(x0,y0,x1-x0,y1-y0);
   }

   public function intersects(toIntersect : com.pblabs.geom.Rectangle) : Bool
   {
	  var x0 = x<toIntersect.x ? toIntersect.x : x;
	  var x1 = right>toIntersect.right ? toIntersect.right : right;
	  if (x1<=x0)
		 return false;

	  var y0 = y<toIntersect.y ? toIntersect.x : y;
	  var y1 = bottom>toIntersect.bottom ? toIntersect.bottom : bottom;
	  return y1>y0;
   }

   public function union(toUnion : com.pblabs.geom.Rectangle) : com.pblabs.geom.Rectangle
   {
	  var x0 = x>toUnion.x ? toUnion.x : x;
	  var x1 = right<toUnion.right ? toUnion.right : right;
	  var y0 = y>toUnion.y ? toUnion.x : y;
	  var y1 = bottom<toUnion.bottom ? toUnion.bottom : bottom;
	  return new Rectangle(x0,y0,x1-x0,y1-y0);
   }

   public function isEmpty() : Bool { return width==0 && height==0; }
   public function offset(dx : Float, dy : Float) : Void
   {
	  x+=dx;
	  y+=dy;
   }

   public function offsetPoint(point : Vector2) : Void
   {
	  x+=point.x;
	  y+=point.y;
   }

   public function setEmpty() : Void { x = y = width = height = 0; }

   // public function transform(m:Matrix)
   // {
   //	var tx0 = m.a*x + m.c*y;
   //	var tx1 = tx0;
   //	var ty0 = m.b*x + m.d*y;
   //	var ty1 = tx0;

   //	var tx = m.a*(x+width) + m.c*y;
   //	var ty = m.b*(x+width) + m.d*y;
   //	if (tx<tx0) tx0 = tx;
   //	if (ty<ty0) ty0 = ty;
   //	if (tx>tx1) tx1 = tx;
   //	if (ty>ty1) ty1 = ty;

   //	tx = m.a*(x+width) + m.c*(y+height);
   //	ty = m.b*(x+width) + m.d*(y+height);
   //	if (tx<tx0) tx0 = tx;
   //	if (ty<ty0) ty0 = ty;
   //	if (tx>tx1) tx1 = tx;
   //	if (ty>ty1) ty1 = ty;

   //	tx = m.a*x + m.c*(y+height);
   //	ty = m.b*x + m.d*(y+height);
   //	if (tx<tx0) tx0 = tx;
   //	if (ty<ty0) ty0 = ty;
   //	if (tx>tx1) tx1 = tx;
   //	if (ty>ty1) ty1 = ty;

   //	return new Rectangle(tx0+m.tx,ty0+m.ty, tx1-tx0, ty1-ty0);
   // }

   public function extendBounds(r:Rectangle)
   {
	  var dx = x-r.x;
	  if (dx>0)
	  {
		 x-=dx;
		 width+=dx;
	  }
	  var dy = y-r.y;
	  if (dy>0)
	  {
		 y-=dy;
		 height+=dy;
	  }
	  if (r.right>right)
		 right = r.right;
	  if (r.bottom>bottom)
		 bottom = r.bottom;
   }
   
   public function toString () :String
   {
	   return "[x=" + x + ", y=" + y + ", w=" + width + ", h=" + height + "]";
   }
}

