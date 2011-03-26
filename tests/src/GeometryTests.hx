/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.geom.debug;

import com.pblabs.geom.Polygon;
import com.pblabs.geom.Vector2;

import flash.display.Graphics;
import flash.display.Sprite;

/**
  * Currently doesn't work, needs to be fixed for the updated code and testing framework.
  */
class GeometryTests extends Sprite {
	
	public function new()
	{
		super();
		testPolygonPadding();
	}

	public function testPolygonPadding () :Void
	{
		var points:Array<Vector2> = [
								new Vector2(0,0),
								new Vector2(1,0),
								new Vector2(1,1),
								new Vector2(0,1),
							];
		var polygon:Polygon = new Polygon(points);
		trace("Before=" + polygon);
		polygon.padLocal(0.5);
		trace("After=" + polygon);

		points = [
					new Vector2(200, 200),
					new Vector2(400, 200),
					new Vector2(500, 300),
					new Vector2(400, 400),
					new Vector2(300, 400),
				 ];

		polygon = new Polygon(points);
		drawBeforeAndAfterPadPolygon(this.graphics, polygon);
//		trace("Before=" + polygon);
//		polygon.padLocal(100);
//		trace("After=" + polygon);
	}

	public static function drawPolygon (g :Graphics, p :Polygon, color :Int) :Void
	{
		for (line in p.edges) {
			g.lineStyle(1, color);
			g.moveTo(line.a.x, line.a.y);
			g.lineTo(line.b.x, line.b.y);
		};
	}

	public static function drawBeforeAndAfterPadPolygon (g :Graphics, p :Polygon) :Void
	{
		drawPolygon(g, p, 0x000000);
		p.padLocal(100);
		drawPolygon(g, p, 0xff0000);
		p.padLocal(-99);
		drawPolygon(g, p, 0x00ff00);
	}

	public function testAngleStuff () :Void
	{
		//		var v1 :Vector2 = new Vector2(0,0);
//		var v2 :Vector2 = new Vector2(-0.1,1);
//		var v3 :Vector2 = new Vector2(-1,-1);

//		var v1 :Vector2 = new Vector2(0,0);
//		var v2 :Vector2 = new Vector2(1,0);
//		var v3 :Vector2 = new Vector2(-1,1);

//		var v1 :Vector2 = new Vector2(0,0);
//		var v2 :Vector2 = new Vector2(2,1);
//		var v3 :Vector2 = new Vector2(-0.1,-1);

//		trace(Geometry.angleFromVectors(v1, v2), Geometry.angleFromVectors(v1, v3));
//		trace(Geometry.differenceAngles(Geometry.angleFromVectors(v1, v2), Geometry.angleFromVectors(v1, v3)));

	}

	public function testUnion () :Void
	{
//		var p1 :Array = [
//			new Vector2(0,0),
//			new Vector2(-2,0),
//			new Vector2(-2,2),
//			new Vector2(0, 2),
//		];
//
//		var p2 :Array = [
//			new Vector2(-1,-1),
//			new Vector2(-1,1),
//			new Vector2(1,1),
//			new Vector2(1,-1),
//		];
//		trace(Geometry.unionPolygons(p1, p2));
	}

	public function test () :Void
	{
//		var points :Array = [new Vector2(3,-2),
//					new Vector2(-1,1),
//					new Vector2(5,5),
//					new Vector2(5,-5),
//					new Vector2(-5,-5),
//					new Vector2(-5,5),
//					new Vector2(1,1),
//					new Vector2(6,3),
//							];
//		trace(Geometry2.convexHullFromPoints(points).join("   "));
	}

}


