/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util;

import com.pblabs.components.scene2D.BaseSceneLayer;
import com.pblabs.components.scene2D.SceneUtil;
import com.pblabs.engine.core.NameManager;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.geom.Vector2;
import com.pblabs.util.ds.Map;

import de.polygonal.motor2.geom.math.XY;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Graphics;
import flash.display.Sprite;

import flash.geom.Rectangle;

import flash.utils.Dictionary;

import hsl.avm2.translating.AVM2Signaler;

import hsl.haxe.Signaler;

using com.pblabs.engine.util.PBUtil;

class DebugUtil
{
	public static function traceClassName (obj :Dynamic) :Void
	{
		trace(ReflectUtil.getClassName(obj));
	}
	
	public static function applyAllChildren (d :DisplayObjectContainer, f :DisplayObject->Void) :Void
	{
		f(d);
		for (ii in 0...d.numChildren) {
			var child :DisplayObject = d.getChildAt(ii);
			f(child);
			if (Std.is(child, DisplayObjectContainer)) {
				applyAllChildren(cast(child,DisplayObjectContainer), f);
			}
		}
	}

	#if (flash || cpp)
	public static function dictToString (h :Dictionary) :String
	{
		var sb :String = "";

		if (h == null) {
			return sb;
		}
		return sb;
	}
	#end

	public static function createDebugLayer (debugcall :Dynamic, args :Array<Dynamic>) :Sprite
	{
		trace("createDebugLayer args=" + args.join(", "));
		var layer :Sprite = new Sprite();
		args.unshift(layer);
		trace("after adding sprite args=" + args.join(", "));
		debugcall.apply(null, args);
		return layer;
	}
	
	public static function drawBoundingRect (disp :DisplayObject, drawLayer :Sprite, ?color :Int =
		0x000000, ?alpha :Float = 1, lineThickness :Float = 1) :Void
	{
		var bounds :Rectangle = disp.getBounds(drawLayer);
		var g :Graphics = drawLayer.graphics;
		g.lineStyle(lineThickness, color, alpha);
		g.drawRect(bounds.left, bounds.top, bounds.width, bounds.height);
	}

	public static function drawDot (s :Sprite, ?color :Int = 0x00ffff, ?r :Float = 10, ?x :Float = 0, ?y :Float = 0) :Void
	{
		s.graphics.lineStyle(1, color);
		s.graphics.drawCircle(x, y, r);
		s.graphics.lineStyle(0, 0, 0);
	}

	public static function drawLine (s :Sprite, x1 :Float, y1 :Float, x2 :Float, y2 :Float,
		?color :Int = 0x000000, ?linethickness :Float = 1, ?alpha :Float = 1) :Void
	{
		var g :Graphics = s.graphics;
		g.lineStyle(linethickness, color, alpha);
		g.moveTo(x1, y1);
		g.lineTo(x2, y2);
		//		g.lineStyle(0, 0, 0);
	}

	public static function drawRect (layer :Sprite, width :Float, height :Float, ?color :Int = 0x000000,
		?alpha :Float = 1) :Void
	{
		var g :Graphics = layer.graphics;
		g.lineStyle(1, color, alpha);
		g.drawRect(0, 0, width, height);
	}

	public static function drawRectangle (layer :Sprite, rect :Rectangle, ?color :Int = 0x000000,
		?alpha :Float = 1) :Void
	{
		var g :Graphics = layer.graphics;
		g.lineStyle(1, color, alpha);
		g.drawRect(rect.left, rect.top, rect.width, rect.height);
	}

	public static function fillBoundingRect (layer :Sprite, rootContainer :DisplayObjectContainer,
		?color :Int = 0xffffff, ?alpha :Float = 0) :Void
	{
		var bounds :Rectangle = rootContainer.getBounds(rootContainer);
		var g :Graphics = layer.graphics;
		g.clear();
		g.beginFill(color, alpha);
		g.drawRect(bounds.left, bounds.top, bounds.width, bounds.height);
		g.endFill();
	}

	public static function fillDot (s :Sprite, ?color :Int = 0x00ffff, ?r :Float = 10, ?x :Float = 0,
		?y :Float = 0) :Void
	{
		s.graphics.beginFill(color);
		s.graphics.drawCircle(x, y, r);
		s.graphics.endFill();
	}

	public static function fillRect (layer :Sprite, width :Float, height :Float, ?color :Int = 0x000000,
		?alpha :Float = 1) :Void
	{
		var g :Graphics = layer.graphics;
		g.lineStyle(0, 0, 0);
		g.beginFill(color, alpha);
		g.drawRect(0, 0, width, height);
		g.endFill();
	}

	public static function fillRectangle (layer :Sprite, rect :Rectangle, ?color :Int = 0x000000,
		?alpha :Float = 1) :Void
	{
		var g :Graphics = layer.graphics;
		g.beginFill(color, alpha);
		g.drawRect(rect.left, rect.top, rect.width, rect.height);
		g.endFill();
	}

	public static function mapToProp (arr :Array<Dynamic>, propName :String) :List<Dynamic>
	{
		return Lambda.map(arr, function (obj :Dynamic) :Dynamic {
				return Reflect.field(obj, propName);
			});
	}

	public static function traceCallback (s :String) :Void->Void
	{
		return function () :Void { trace(s); };
	}

	public static function traceDisplayChildren (d :DisplayObject, ?space :String = " ") :Void
	{
		if (d == null) {
			return;
		}
		trace(space + extendedDisplayObjectName(d));
		if (Std.is(d, DisplayObjectContainer)) {
			var parent = cast(d, DisplayObjectContainer);

			for (ii in 0...parent.numChildren) {
				if (Std.is(parent.getChildAt(ii), DisplayObject)) {
					traceDisplayChildren(parent.getChildAt(ii), space + "  ");
				}
			}
		}
	}

	public static function traceParentage (d :DisplayObject, ?space :String = " ") :String
	{
		if (d == null) {
			return "";
		}

		var lineage :Array<Dynamic> = [ extendedDisplayObjectName(d)];
		var current :DisplayObject = d.parent;
		while (current != null) {
			lineage.unshift(extendedDisplayObjectName(current));
			current = current.parent;
		}

		for (ii in 0...lineage.length) {
			lineage[ii] = space + lineage[ii];
			space = space + "  ";
		}

		return "Lineage :\n" + lineage.join("\n");
	}

	public static function traceInheritance (obj :Dynamic) :Void
	{
		var sb = new StringBuf();
		var cls = Type.getClass(obj);
		while (cls != null) {
			sb.add(Type.getClassName(cls) + "->");
			cls = Type.getSuperClass(cls);
		}
		trace(sb.toString());
	}
	
	public static function traceInheritanceOfClass (cls :Class<Dynamic>) :Void
	{
		var sb = new StringBuf();
		while (cls != null) {
			sb.add(Type.getClassName(cls) + "->");
			cls = Type.getSuperClass(cls);
		}
		trace(sb.toString());
	}
	
	inline static function extendedDisplayObjectName (d :DisplayObject) :String
	{
		return d + ".name=" + d.name + "  loc=" + d.x + " " + d.y + " size " + d.width + " " + d.height + " alpha=" + d.alpha;
	}
}
