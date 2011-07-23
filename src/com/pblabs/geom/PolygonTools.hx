/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.geom;

import com.pblabs.geom.Geometry;
import com.pblabs.geom.LineSegment;
import com.pblabs.geom.Polygon;
import com.pblabs.geom.Rectangle;
import com.pblabs.geom.Vector2;
import com.pblabs.util.ArrayUtil;
import com.pblabs.util.Comparators;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

import de.polygonal.motor2.geom.math.XY;

import Type;

using com.pblabs.geom.Geometry;
using com.pblabs.geom.PolygonTools;
using com.pblabs.geom.VectorTools;

/**
 * Static method operating on an iterable of XY objects.
 * Designed to be used with the "using" keyword.
 */
class PolygonTools
{
	
	public static function deepCopy (arr :Array<XY>) :Array<XY>
	{
		var a = new Array<XY>();
		for (v in arr) {
			a.push(v.clone());
		}
		return a;
	}
	
	public static function toPolygon (rect :Rectangle) :Polygon
	{
		var arg = new Array<XY>();
		arg.push(new Vector2(rect.left, rect.top));
		arg.push(new Vector2(rect.right, rect.top));
		arg.push(new Vector2(rect.right, rect.bottom));
		arg.push(new Vector2(rect.left, rect.bottom));
		
		// [new Vector2(rect.left, rect.top), new Vector2(rect.right, rect.top),
			// new Vector2(rect.right, rect.bottom), new Vector2(rect.left, rect.bottom)];
		return new Polygon(arg);
	}
	
	#if (flash || cpp)
	public static function convertToPolygon (rect :flash.geom.Rectangle) :Polygon
	{
		var arg = new Array<XY>();
		arg.push(new Vector2(rect.left, rect.top));
		arg.push(new Vector2(rect.right, rect.top));
		arg.push(new Vector2(rect.right, rect.bottom));
		arg.push(new Vector2(rect.left, rect.bottom));
		
		return new Polygon(arg);
	}
	#end
	
	#if (flash || cpp)
	public static function draw (p :Polygon, g :flash.display.Graphics, ?color :Int = 0x000000, ?alpha :Float = 1, ?lineWidth :Float = 1.0) :Void
	{
		g.beginFill(color, alpha);
		g.lineStyle(lineWidth, color, alpha);
		for (line in p.edges) {
			g.moveTo(line.a.x, line.a.y);
			g.lineTo(line.b.x, line.b.y);
		}
	}
	
	public static function drawPoly (arr :Array<XY>, g :flash.display.Graphics, ?color :Int = 0x000000, ?alpha :Float = 1, ?lineWidth :Float = 1) :Void
	{
		g.lineStyle(lineWidth, color, alpha);
		g.moveTo(arr[arr.length - 1].x, arr[arr.length - 1].y);
		g.lineTo(arr[0].x, arr[0].y);
		for (i in 1...arr.length) {
			g.moveTo(arr[i - 1].x, arr[i - 1].y);
			g.lineTo(arr[i].x, arr[i].y);
		}
	}
	
	public static function fillPoly (arr :Array<XY>, g :flash.display.Graphics, ?color :Int = 0x000000, ?alpha :Float = 1) :Void
	{
		g.beginFill(color, alpha);
		g.moveTo(arr[arr.length - 1].x, arr[arr.length - 1].y);
		g.lineTo(arr[0].x, arr[0].y);
		for (i in 1...arr.length) {
			g.moveTo(arr[i - 1].x, arr[i - 1].y);
			g.lineTo(arr[i].x, arr[i].y);
		}
		g.endFill();
	}
	#end
	
	public static function isPointInPolygon2 (poly :Array<XY>, p :XY) :Bool
	{
		var polySides = poly.length;
		var i = polySides - 1;
		var j = i;
		var oddNodes:Bool = false;

		for (i in 0...polySides) {
			if (poly[i].y < p.y && poly[j].y >= p.y ||  poly[j].y < p.y && poly[i].y >= p.y) {
				if (poly[i].x + (p.y - poly[i].y) / (poly[j].y - poly[i].y) * (poly[j].x - poly[i].x) < p.x) {
					oddNodes = !oddNodes;
				}
			}
			j = i;
		}

		return oddNodes;

	}
	
	public static function union (poly1 :Array<XY>, poly2 :Array<XY>) :Array<XY>
	{
		throw "Not implemented";
		return null;
//		 var p1Idx = 0;
//		 var p2Idx = 0;
//		 var isCurrentPoly1:Bool = true;

//		 //Make sure both polygons are clockwise
//		 if (!poly1.isClockwise()) {
//			 poly1.reverse();
//		 }
//		 if (!poly2.isClockwise()) {
//			 poly2.reverse();
//		 }
//		 // poly1 = if (Polygon.isClockwisePolygon(poly1)) poly1 else poly1.reverse();
//		 // poly2 = if (Polygon.isClockwisePolygon(poly2)) poly2 else poly2.reverse();

//		 var arr :Array<XY> = null;
//		 var vectors2SequentialPairs = function (index :Int, v :XY) :Array<XY> {
//			 var index2 = if (index + 1 >= arr.length) 0 else index + 1;
//			 return [v, arr[index2]];
//		 }

//		 arr = poly1;
//		 var poly1VectorPairs = Lambda.mapi(poly1, vectors2SequentialPairs);
//		 arr = poly2;
//		 var poly2VectorPairs = Lambda.mapi(poly2, vectors2SequentialPairs);

// //		trace("poly1VectorPairs=" + poly1VectorPairs.join("|"));

//		 var union = new Array<XY>();

//		 //While the union is too small and isn't closed
//		 var iterations = 0;
//		 var maxIteractions = poly1.length * poly2.length + 2;
//		 while (union.length < 2 || !union[0].equals(union[union.length - 1])) {
// //			trace("\niteration=" + iterations + ", union=" + union);
//			 iterations++;
//			 if (iterations > maxIteractions) {
//				 break;
//			 }
//			 //Alternate between the polygons as we trace the union edges from the composite
//			 //boundary
//			 var currentPoly = isCurrentPoly1 ? poly1 : poly2;
//			 var otherPoly = isCurrentPoly1 ? poly2 : poly1;
//			 var idx = isCurrentPoly1 ? p1Idx : p2Idx;

//			 function (otherIdx :Int, isPoly1 :Bool) :Void {

//			 }

//			 var A = currentPoly[idx];
//			 var B = currentPoly[if (idx + 1 >= currentPoly.length) 0 else idx + 1];

// //			trace("p1Idx=" + p1Idx);
// //			trace("p2Idx=" + p2Idx);
// //			trace("isCurrentPoly1=" + isCurrentPoly1);
// //			trace("A B=" + [A, B]);

//			 var closestIntersectionPair :Array<XY> = null;
//			 var closestIntersection :XY = null;
//			 var closestIntersectionDistanceToFirstPoint = Math.POSITIVE_INFINITY;
//			 var vectorPairs = if (isCurrentPoly1) poly2VectorPairs else poly1VectorPairs;

//			 //Find the intersection with the closest intersection point to A
//			 for (pair in vectorPairs) {
//				 var A2 = pair[0];
//				 var B2 = pair[1];
//				 var intersection:XY = LineSegment.lineIntersectLine(A, B, A2, B2);
//				 if (intersection != null) {
//					 var dist = VectorTools.distance(intersection, A);
//					 if (dist < closestIntersectionDistanceToFirstPoint) {
//						 closestIntersectionDistanceToFirstPoint = dist;
//						 closestIntersectionPair = pair;
//						 closestIntersection = intersection;
//					 }
//				 }
//			 }

//			 if (!otherPoly.isPointInPolygon2(A)) {
//				 union.push(A);
//			 }

//			 if (closestIntersectionPair != null) {
//				 var A2 = closestIntersectionPair[0];
//				 var B2 = closestIntersectionPair[1];
//				 union.push(closestIntersection);
//				 var idxB2 = ArrayUtil.indexOf(otherPoly, B2);
// //				trace("  idxB2=" + idxB2 + ", B2=" + B2);
// //				trace("  intersection " + closestIntersection + " found between " + [A, B, A2, B2]);
//				 if (currentPoly.isPointInPolygon2(B2)) {
//					 if (isCurrentPoly1) {
//						 p1Idx = p1Idx + 1 >= poly1.length ? 0 : p1Idx + 1;
//					 } else {
//						 p2Idx = p2Idx + 1 >= poly2.length ? 0 : p2Idx + 1;
//					 }
// //					trace("	B2 is in this, so incrementing this polygon");
//				 }
//				 else {
//					 isCurrentPoly1 = !isCurrentPoly1;
//					 if (isCurrentPoly1) {
//						 p1Idx = idxB2;
//					 } else {
//						 p2Idx = idxB2;
//					 }
// //					trace("	switching polygons");
//				 }
//			 }
//			 else {//No intersections, continue walking around
// //				trace("  no intersections, continuing ");
//				 if (isCurrentPoly1) {
//					 p1Idx = p1Idx + 1 >= poly1.length ? 0 : p1Idx + 1;
//				 } else {
//					 p2Idx = p2Idx + 1 >= poly2.length ? 0 : p2Idx + 1;
//				 }
//			 }

//		 }

//		 return union;
	}
	
	/**
	 * Does not check if a point is ON the polygon edge.
	 *
	 */
	public static function isPointInPolygon (arrayOfPolygonPoints :Array<XY>, P :XY) :Bool
	{
		return isPointInPolygon2(arrayOfPolygonPoints, P);
		throw "This method is buggy, use isPointInPolygon2 for now (until I fix it)";
		//First check if the point is one of the vertices
		for (v in arrayOfPolygonPoints) {
			if(P.x == v.x && P.y == v.y) {
				return true;
			}
		}

		//Get details of the polygon
		var minX = Math.POSITIVE_INFINITY;
		var maxX = Math.NEGATIVE_INFINITY;
		var minY = Math.POSITIVE_INFINITY;
		var maxY = Math.NEGATIVE_INFINITY;

		for (v in arrayOfPolygonPoints) {
			minX = Math.min(minX, v.x);
			maxX = Math.max(maxX, v.x);
			minY = Math.min(minY, v.y);
			maxY = Math.max(maxY, v.y);
		}

		if(P.x < minX ||
			P.x > maxX ||
			P.y < minY ||
			P.y > maxY) {
				return false;
			}

		var width = maxX - minX;
		var height = maxY - minY;
		var center = new Vector2(minX + width / 2, minY + height / 2);

		var angleFromPtoCenter = center.subtract(P).angle();
		//We're lazy: instead of making sure our ray doesn't intersect a vertex,
		//(which would lead to two edge intersections, which would wrongly return the
		//point as outside the polygon), we add a tiny amount to the angle to the
		//center, so as to make the chance of exactly hitting a vertex very remote.
		angleFromPtoCenter += 0.000000123;

		//From P to a point outside the polygon
		// var point2:XY = XY.fromAngle(angleFromPtoCenter, Math.max(width, height) *2);
		var point2 = angleFromPtoCenter.angleToVector2(Math.max(width, height) *2);

		var polygon = arrayOfPolygonPoints.copy();
		if(arrayOfPolygonPoints[0] != arrayOfPolygonPoints[ arrayOfPolygonPoints.length - 1]) {
			polygon.push(polygon[0]);
		}

		var intersectionsCount = 0;
		//If there are an even number of intersections of the ray and the polygon
		//edges, the point lies outside the polygon.
		for(k in 0...polygon.length - 1) {
			if(LineSegment.isLinesIntersecting(P, point2, polygon[k], polygon[k + 1])) {
				intersectionsCount++;
			}
		}
		return !(intersectionsCount % 2 == 0);
	}
	
	/**
	 * Tests two polygons for intersection. *does not check for enclosure*
	 * @param object1 an array of Vector points comprising polygon 1
	 * @param object2 an array of Vector points comprising polygon 2
	 * @return true is intersection occurs
	 *
	 */
	public static function isOverlapping (object1 :Array<XY>, object2 :Array<XY>) :Bool
	{
		for (i in 0...object1.length){
			for (j in 0...object2.length){
				if(LineSegment.lineIntersectLine(object2[j], object2[j+1], object1[i],
					object1[i+1]) != null) {

					return true;
				}
			}
		}
		return false;
	}
	
	
	/**
	 * Assumes a convex polygon
	 */
	public static function isClockwise (P :Array<XY>) :Bool
	{
		var A = P[0];
		var B = P[1];
		var C = P[2];

		var angleAB = A.angleTo(B);
		var angleAC = A.angleTo(C);

		//If the polygon has vectors in a straight line, choose a different starting vector
		//This could infinitely recurse if P is not a polygon, or made of points that fall
		//on a line
		if (angleAB == angleAC) {
			var differentStartVector = P.copy();
			differentStartVector.unshift(differentStartVector.pop());
			return isClockwise(differentStartVector);
		}
		else {
			var diff = VectorTools.differenceAngles(angleAB, angleAC);
			return diff > 0;
		}
	}
	
	/**
	 * Pad polygon, i.e. enlarge by <padding>.  This ensures that
	 * a big fat pathfinder will not hit the walls.  This can be a negative number to unpad.
	 */
	static function padPolygon(polygon :Array<XY>, padding :Float) :Void
	{
		var padEdge = function ( v1 :XY, v2 :XY, center :XY) :Void
		{
			//Get the normal
			// var normalAngle = Geometry.normalizeRadians( VectorTools.angleFrom(v1.x, v1.y, v2.x, v2.y) + Math.PI / 2 );
			var normalAngle = (v1.angleTo(v2) + Math.PI / 2).normalizeRadians();
			//Create the transform vector from the normal angle and the padding
			var transform = normalAngle.angleToVector2();
			//Check if the angle is pointing the wrong way (to the center instead of away)
			var middlePoint:XY = new Vector2( v1.x + (v2.x - v1.x) / 2, v1.y + (v2.y - v1.y) / 2);

			if(center.distance(middlePoint) > center.distance(middlePoint.add(transform))) {
				transform = (normalAngle + Math.PI).normalizeRadians().angleToVector2();
			}
			transform.scale( padding );
			//Change the vertex positions
			v1.addLocal( transform );
			v2.addLocal( transform );
		}

		var center:XY = get_center(polygon);
		//Go through all edges.
		for( k in 0...polygon.length - 1) {
			padEdge( polygon[k], polygon[ k + 1 ], center);
		}
	}
	
	public static function closestPointOnPolygon (p :Array<XY>, P:XY):XY
	{
		var polygon = p.copy();
		if(p[0] != p[ p.length - 1]) {
			polygon.push(polygon[0]);
		}

		var distance = Math.POSITIVE_INFINITY;
		var closestVector :XY = null;
		for(k in 0...polygon.length - 1) {
			var point:XY = new Vector2();
			var currentDistance = LineSegment.distToLineSegment(polygon[k], polygon[k + 1], P, point);
			if( currentDistance < distance) {
				distance = currentDistance;
				closestVector = point;
			}
		}
		return closestVector;

	}

	public static function getBounds (p :Array<XY>) :Rectangle
	{
		if (p == null || p.length == 0) {
			return new Rectangle(0, 0, 0, 0);
		}
		var maxX = Math.NEGATIVE_INFINITY;
		var minX = Math.POSITIVE_INFINITY;
		var maxY = Math.NEGATIVE_INFINITY;
		var minY = Math.POSITIVE_INFINITY;
		for (v in p) {
			maxX = Math.max(maxX, v.x);
			minX = Math.min(minX, v.x);
			maxY = Math.max(maxY, v.y);
			minY = Math.min(minY, v.y);
		}
		var width = maxX - minX;
		var height = maxY - minY;
		var rect = new Rectangle(minX, minY, width, height);

		return rect;
	}
	
	/**
	 * Returns true if any points are an edge of the polygon.
	 * @param P1 Array of XY points, with the first point also last in the array.
	 */
	public static function isPolygonEdge(polygon :Array<XY>, P1 :XY, P2 :XY) :Bool
	{
		for(k in 0...polygon.length - 1) {

			var p1:XY = cast( polygon[k], XY);
			var p2:XY = cast( polygon[k + 1], XY);

			if((P1.x == p1.x && P1.y == p1.y && P2.x == p2.x && P2.y == p2.y) ||
				(P2.x == p1.x && P2.y == p1.y && P1.x == p2.x && P1.y == p2.y)) {
					return true;
				}
		}
		return false;
	}
	
	public static function closestPoint (p :Array<XY>, P:XY) :XY
	{
		var distance = Math.POSITIVE_INFINITY;
		var closestVector :XY = null;
		for (v in p) {
			var currentDistance = v.distanceSq(P);
			if( currentDistance < distance) {
				distance = currentDistance;
				closestVector = v;
			}
		}
		return closestVector;
	}
	
	public static function furthestPoint (p :Array<XY>, P:XY) :XY
	{
		var distance = Math.NEGATIVE_INFINITY;
		var furthest :XY = null;
		for (v in p) {
			var currentDistance = v.distanceSq(P);
			if( currentDistance > distance) {
				distance = currentDistance;
				furthest = v;
			}
		}
		return furthest;
	}
	
	/**
	 * Warning: the points arg may be modified!
	 * http://notejot.com/2008/11/convex-hull-in-2d-andrews-algorithm/
	 */
	public static function toConvexHull (points :Array<XY>) :Array<XY>
	{
		var topHull = new Array<Int>();
		var bottomHull = new Array<Int>();
		var convexHull = new Array<Int>();

		if(points.length <= 3) {
			return points;
		}
		else {
			// lexicographic sort, get rid of special cases
			var fieldComp :XY -> XY -> Int = Comparators.createFields(["x", "y"]); 
			points.sort(fieldComp);
			// points.sortOn(["x", "y"], Array.NUMERIC);

			// compute top part of hull
			topHull.push(0);
			topHull.push(1);

			for(i in 2...points.length) {
				if(towardsLeft(points[topHull[topHull.length - 2]], points[topHull[topHull.length - 1]], points[i])) {
					topHull.pop();

					while(topHull.length >= 2) {
						if(towardsLeft(points[topHull[topHull.length - 2]], points[topHull[topHull.length - 1]], points[i])) {
							topHull.pop();
						}
						else {
							topHull.push(i);
							break;
						}
					}
					if(topHull.length == 1)
						topHull.push(i);
				}
				else {
				   topHull.push(i);
				}
			}

			// compute bottom part of hull
			bottomHull.push(0);
			bottomHull.push(1);

			for(i in 2...points.length) {
				if(!towardsLeft(points[bottomHull[bottomHull.length - 2]], points[bottomHull[bottomHull.length - 1]], points[i])) {
					bottomHull.pop();

					while(bottomHull.length >= 2) {
						if(!towardsLeft(points[bottomHull[bottomHull.length - 2]], points[bottomHull[bottomHull.length - 1]], points[i])) {
							bottomHull.pop();
						}
						else {
							bottomHull.push(i);
							break;
						}
					}
					if(bottomHull.length == 1)
					   bottomHull.push(i);
				}
				else {
				   bottomHull.push(i);
				}
			}

			bottomHull.reverse();
			bottomHull.shift();
			convexHull = topHull.concat(bottomHull);

			var convexPoints:Array<XY> = Lambda.array(Lambda.map(convexHull, function (idx :Int) :XY {
				return points[idx];
			}));

			//Remove the duplicate end point.
			convexPoints.splice(convexPoints.length - 1, 1);

			return convexPoints;
		}
	}
	
	static function towardsLeft (origin :XY, p1 :XY, p2 :XY) :Bool
	{
		var tmp1 = new Vector2(p1.x - origin.x, p1.y - origin.y);
		var tmp2 = new Vector2(p2.x - origin.x, p2.y - origin.y);

		if(((tmp1.x * tmp2.y) - (tmp1.y * tmp2.x)) < 0) {
			return true;
		}
		return false;
	}
	
	/**
	 * Given two polygons, returns all intersection points and points contained in the other polygon.
	 * NB: the returned list of points is not a true polygon because the order is arbitrary.
	 * @param p1 a polygon as an array of points, with the first vertex also in the last position
	 * @param p1 a polygon as an array of points, with the first vertex also in the last position
	 * @return an Array containing all points contained in the other polygon and all intersection points.
	 *
	 */
	public static function getIntersection (p1 :Array<XY>, p2 :Array<XY>) :Array<XY>
	{
		var containedPoints = new Array<XY>();
		var v:XY;
		var k;
		var kk;

		//Get the vertices within the other polygon
		for(k in 0...p1.length - 1) {
			v = p1[k];
			if(p2.isPointInPolygon2(v) && !Lambda.has(containedPoints, v) && v != null) {
				containedPoints.push(v);
			}
		}
		for(k in 0...p2.length - 1) {
			v = p2[k];
			if(p1.isPointInPolygon2(v) && !Lambda.has(containedPoints, v) && v != null) {
				containedPoints.push(v);
			}
		}

		var intersectionPoints = new Array<XY>();
		//Create the intersection points
		for(k in 0...p1.length - 1) {
			for(kk in 0...p2.length - 1) {
				if(LineSegment.isLinesIntersecting(p1[k], p1[k + 1], p2[kk], p2[kk + 1])) {
					var intersectingPoint = LineSegment.lineIntersectLine(p1[k], p1[k + 1], p2[kk], p2[kk + 1]);
					if(intersectingPoint != null) {
						intersectionPoints.push(intersectingPoint);
					}
				}
			}
		}

		containedPoints = containedPoints.concat(intersectionPoints);
		return containedPoints;
	}
	
	public static function getPointsWhereLineIntersectsPolygon(polygon:Array<XY>, A:XY, B:XY):Array<XY>
	{
		var intersectingPoints = new Array<XY>();
		for (i in 0...polygon.length - 1){
			var point:XY = LineSegment.lineIntersectLine(A, B, polygon[i], polygon[i+1]);
			if(point != null) {
				if(!point.equals(A) && !point.equals(B)) {
					intersectingPoints.push(point);
				}
			}
		}
		return intersectingPoints;
	}

	public static function get_center (arrayOfPolygonPoints :Array<XY>, ?center :XY) :XY
	{
		var minX = Math.POSITIVE_INFINITY;
		var maxX = Math.NEGATIVE_INFINITY;
		var minY = Math.POSITIVE_INFINITY;
		var maxY = Math.NEGATIVE_INFINITY;

		for (v in arrayOfPolygonPoints) {
			minX = Math.min(minX, v.x);
			maxX = Math.max(maxX, v.x);
			minY = Math.min(minY, v.y);
			maxY = Math.max(maxY, v.y);
		}

		if(center == null) {
			center = new Vector2(minX + (maxX - minX) / 2, minY + (maxY - minY) / 2);
		}
		else {
			center.x = minX + (maxX - minX) / 2;
			center.y = minY + (maxY - minY) / 2;
		}
		return center;
	}

	public static function isCircleIntersecting (polygon :Array<XY>, P :XY, radius :Float) :Bool
	{
		var closestPointOnPolygon:XY = closestPointOnPolygon(polygon, P);
		return closestPointOnPolygon.distance(P) <= radius;
	}

	/**
	 * @initialLocations : an Array of XY objects.
	 * @initialAngle : the angle from the center of the locations in which the sweep starts.
	 * @radiusFunction : takes a XY and returns a radius. Must be > 0.  Small values mean
	 *				   smaller sweep intervals and thus longer computation time.
	 */
	inline public static function sortVectorsBySweep (initialLocations :Array<XY>, initialAngle :Float,
		radiusFunction :Dynamic->Float) :Array<XY>
	{
		var v:XY;
		var bounds = initialLocations.getBounds();
		com.pblabs.util.Log.debug(["bounds", bounds]);

		var maxFormationRadius = Math.max(bounds.width, bounds.height) * Geometry.SQRT2;

		com.pblabs.util.Log.debug(["maxFormationRadius", maxFormationRadius]);

		var center = new Vector2(bounds.x + bounds.width / 2, bounds.y + bounds.height / 2);

		//New simpler sorting
		//Rotate so the angle is zero
		var vvMap :Map<XY, XY> = Maps.newHashMap(ValueType.TClass(XY));
		for (v in initialLocations) {
			vvMap.set(v.subtract(center), v);
		}
		// initialLocations.forEach(function (v :XY, ignored:Array<Dynamic>) :Void {
		//	 vvMap.put(v.subtract(center), v);
		// } );
		// var test = vvMap.keys();
		// var test2 = Lambda.array(test);
		var relVs = new Array<XY>();
		for (v in vvMap.keys()) {
			relVs.push(v.rotateLocal(initialAngle));
		}
		// relVs.forEach(function (v :XY, ignored:Array<Dynamic>) :Void {
		//	 v.rotateLocal(initialAngle);
		// });
		// ArrayUtil.stableSort(relVs, function (v1 :XY, v2 :XY) :Int {
		//	 return (v1.x > v2.x ? -1 : 1);
		// });
		relVs.sort(function (v1 :XY, v2 :XY) :Int {
			return (v1.x > v2.x ? -1 : 1);
		});
		return Lambda.array(Lambda.map(relVs, vvMap.get));
		// return relVs.map(Util.adapt(vvMap.get));

		// var smallestRadius:Float = Math.POSITIVE_INFINITY;
		// initialLocations.forEach(function (v :XY) :Void {
		//	 var radius:Float = cast( radiusFunction(v), Float);
		//	 if (radius < smallestRadius) {
		//		 smallestRadius = radius;
		//	 }
		// });

		// log.debug("sortVectorsBySweep", "smallestRadius", smallestRadius);

		// //Starting from in front of the front-most unit, move a line backwards.  As the units
		// //touch the line, they are added to the squad in that order.  Thus, it gives a
		// //order from front to back.
		// var radiusForComputingSqadOrder:Int = Math.max(bounds.width, bounds.height) * Math.SQRT2/2;
		// var normalP1:XY = XY.fromAngle(initialAngle + Math.PI/4, radiusForComputingSqadOrder);
		// normalP1.addLocal(center);
		// var normalP2:XY = XY.fromAngle(initialAngle - Math.PI/4, radiusForComputingSqadOrder);
		// normalP2.addLocal(center);
		// //The normal line segment is incremented by the transform.
		// var normalTransformIncrement:XY = XY.fromAngle(initialAngle, -1);
		// //This should be really small in case there are +1 units on the first pass.
		// var incrementLength:Int = smallestRadius / 4;
		// normalTransformIncrement.scaleLocal(incrementLength);

		// //The distance the line has moved.
		// var totalNormalLineSegmentTransformed:Int = 0;
		// var unitsPlacedInFormation:Set = Sets.newSetOf(XY);//Don't check these locations anymore

		// var orderOfUnitsInFormation:Array<Dynamic> = new Array();//The order in which to place units in formation

		// //Move the line backwards until it hits the rear bounds.
		// while (totalNormalLineSegmentTransformed < radiusForComputingSqadOrder * 2 &&
		//	 orderOfUnitsInFormation.length < initialLocations.length) {

		//	 //Increment the line
		//	 normalP1.addLocal(normalTransformIncrement);
		//	 normalP2.addLocal(normalTransformIncrement);
		//	 totalNormalLineSegmentTransformed += incrementLength;

		//	 //Check all units whether they intersect the line
		//	 //If >1 units are found in a single pass, order them by proximity to the center
		//	 var unitsFoundThisPass:Array<Dynamic> = [];
		//	 for (v in initialLocations) {
		//		 //Ingore units we have already placed
		//		 if (unitsPlacedInFormation.contains(v)) {
		//			 continue;
		//		 }
		//		 //If the circle for the unit overlaps the moving line, add it to the order
		//		 if (Geometry.isCircleOverlappingSegment(normalP1, normalP2, v, radiusFunction(v))) {
		//			 unitsFoundThisPass.push(v);
		//		 }
		//	 }
		//	 if (unitsFoundThisPass.length == 1) {
		//		 orderOfUnitsInFormation.push(unitsFoundThisPass[0]);
		//		 unitsPlacedInFormation.add(unitsFoundThisPass[0]);
		//	 }
		//	 //Ok more than one unit found.  Order them by proximty to the center
		//	 else if (unitsFoundThisPass.length > 1) {
		//		 //Sort
		//		 unitsFoundThisPass.sort(function (vecA :XY, vecB :XY) :Int {

		//			 var distA:Int = VectorTools.distanceSq(vecA, center);
		//			 var distB:Int = VectorTools.distanceSq(vecB, center);
		//			 if (distA < distB) {
		//				 return -1;
		//			 }
		//			 else if (distA > distB) {
		//				 return 1;
		//			 }
		//			 return 0;
		//		 });
		//		 //Now add them
		//		 for (sortedUnit in unitsFoundThisPass) {
		//			 orderOfUnitsInFormation.push(sortedUnit);
		//			 unitsPlacedInFormation.add(sortedUnit);
		//		 }
		//	 }
		// }

		// if (orderOfUnitsInFormation.length == 0) {
		//	 log.error("orderOfUnitsInFormation.length == 0, meaning the position scanner failed to scan the units of squad ");
		//	 log.error("initialLocations=" + initialLocations);
		// }
		// return orderOfUnitsInFormation;
	}
}
