/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.geom;

import com.pblabs.engine.debug.Log;

import com.pblabs.util.Assert;
import com.pblabs.util.Cloneable;

import com.pblabs.geom.Circle;
import com.pblabs.geom.LineSegment;
import com.pblabs.geom.Rectangle;
import com.pblabs.geom.Vector2;
import com.pblabs.geom.VectorTools;
import com.pblabs.util.ArrayUtil;
import com.pblabs.util.NumberUtil;
// import com.pblabs.util.Util;
using com.pblabs.geom.CircleUtil;
using com.pblabs.geom.PolygonTools;
using com.pblabs.geom.VectorTools;

class Polygon
	implements Cloneable<Polygon>
 {
	public var boundingBox(getBoundingBox, null) : Rectangle;
	public var boundingCircle(getBoundingCircle, null) : Circle;
	public var center(get_center, null) : Vector2;
	public var edges(getEdges, null) : Array<LineSegment>;
	public var vertices(getVertices, null) : Array<Vector2>;

	public static function createPolygon (sides :Int, radius :Float) :Polygon
	{
		if (sides < 3) {
			throw "A polygon needs at least 3 sides";
		}

		var vertices:Array<Vector2> = [];
		for (ii in 0...sides) {
			var angle = ((Math.PI*2) / sides) * ii;
			vertices.push(angle.angleToVector2(radius));
		}
		return new Polygon(vertices);
	}

	public function new (vertices :Array<Vector2>) //<Vector2>
	{
		if (vertices == null || vertices.length < 3) {
			throw "Cannot create a polygon with < 3 vertices=" + vertices;
		}
		_vertices = vertices;
		// polygon = _vertices;

		_edges = [];
		for (ii in 0..._vertices.length - 1) {
			_edges.push(new LineSegment(_vertices[ii], _vertices[ii + 1]));
		}
		_edges.push(new LineSegment(_vertices[_vertices.length - 1], _vertices[0]));
	}

	public function getEdges ():Array<LineSegment>
	{
		return _edges;
	}

	//Don't modify!
	public function getVertices ():Array<Vector2>
	{
		return _vertices;
	}

	public function clone () :Polygon
	{
		var vert = [];
		for (v in _vertices) {
			vert.push(v.clone());
		}
		return new Polygon(vert);
	}

	public function closestEdge (P :Vector2) :LineSegment
	{
		var smallestDistance = Math.POSITIVE_INFINITY;
		var distance:Float;
		var closestLine:LineSegment = null;
		for (line in _edges) {
			distance = line.dist(P);
			var closestPoint:Vector2 = new Vector2();
			if (distance < smallestDistance) {
				smallestDistance = distance;
				closestLine = line;
			}
		}
		return closestLine;
	}

	public function closestPoint (v :Vector2) :Vector2
	{
		return _vertices.closestPoint(v);
	}

	public function closestPointOnPerimeter (v :Vector2) :Vector2
	{
		var p :Vector2 = null;
		var closestDistanceSq = Math.POSITIVE_INFINITY;
		var i = 1;
		for (line in _edges) {
			var distanceSq = line.distSq(v);
			if (distanceSq < closestDistanceSq) {
				closestDistanceSq = distanceSq;
				p = line.closestPointTo(v);
			}
		}
		return p;
	}

	public function contains (p :Polygon) :Bool
	{
		for (v in p._vertices) {
			if (_vertices.isPointInPolygon2(v)) {
				return false;
			}
		}
		return true;
	}

	/**
	 * Assumes polygons are not overlapping.
	 * Could be made more efficient with sorting of vertices.
	 * Untested.
	 */
	public function distance (P :Polygon) :Float
	{
		if (contains(P)) {
			return 0;
		}
		var closestDistance = Math.POSITIVE_INFINITY;
		var distance:Float;
		for (line1 in P.edges) {
			for (line2 in edges) {
				distance = line1.distanceToLineSq(line2);
				if (distance < closestDistance) {
					closestDistance = distance;
				}
			}
		}
		return Math.sqrt(closestDistance);
	}

	/**
	 * Assumes polygons are not overlapping.
	 * Could be made more efficient with sorting of vertices.
	 * Untested.
	 */
	public function distanceToLine (line1 :LineSegment) :Float
	{
		var closestDistance = Math.POSITIVE_INFINITY;
		var distance:Float;
		for (line2 in edges) {
			distance = line1.distanceToLineSq(line2);
			if (distance < closestDistance) {
				closestDistance = distance;
			}
		}
		return Math.sqrt(closestDistance);
	}

	public function distToPolygonEdge (P :Vector2) :Float
	{
		var closestDistance = Math.POSITIVE_INFINITY;
		var distance:Float;
		for (line in _edges) {
			distance = line.distSq(P);
			if (distance < closestDistance) {
				closestDistance = distance;
			}
		}
		return Math.sqrt(closestDistance);
	}

	// public function draw (g :Graphics, ?color :Int = 0) :Void
	// {
	//	 g.lineStyle(1, color);
	//	 for (line in edges) {
	//		 g.moveTo(line.a.x, line.a.y);
	//		 g.lineTo(line.b.x, line.b.y);
	//	 }
		
	//	 // edges.forEach(Util.adapt(function (line :LineSegment) :Void {
			
	//	 // }));
	// }

	//TODO: move this to another class to remove the graphics depency
	#if flash
	public function fill (g :flash.display.Graphics, ?color :Int = 0) :Void
	{
		g.beginFill(color);
		var firstVertex = vertices[0];
		g.moveTo(firstVertex.x, firstVertex.y);

		for (i in 1...vertices.length) {
			g.lineTo(vertices[i].x, vertices[i].y);
		}
		// vertices.slice(1).forEach(Util.adapt(function (v :Vector2) :Void {
		//	 g.lineTo(v.x, v.y);
		// }));

		g.lineTo(firstVertex.x, firstVertex.y);
		g.endFill();
	}
	#end

	public function getClosestPoint (P :Vector2) :Vector2
	{
		var distanceSq = Math.POSITIVE_INFINITY;
		var closestVector :Vector2 = null;
		for (edge in _edges) {
			var v:Vector2 = edge.closestPointTo(P);
			var d = VectorTools.distanceSq(P, v);
			if (d < distanceSq) {
				distanceSq = d;
				closestVector = v;
			}
		}
		return closestVector;
	}

	public function getIntersectionPolygon (p :Polygon) :Polygon
	{
		var vs:Array<Vector2> = _vertices.getIntersection(p.vertices);
//		vs = convexHullFromPoints(vs);
		if (vs != null && vs.length > 2) {
			return new Polygon(vs);
		}
		return null;
	}

//	public function getIntersectionPoints (line :LineSegment) :Array
	public function getIntersectionPoints (v1 :Vector2, v2 :Vector2) :Array<Vector2>
	{
		var points:Array<Vector2> = [];
		for (edge in _edges) {
			var v:Vector2 = edge.intersectionPointLinePoints(v1, v2);
			points.push(v);
		}
		// ArrayUtil.removeAll(points, null);
		return points;
	}

	public function isCircleIntersecting (P :Vector2, radius :Float) :Bool
	{
		var closestPointOnPolygon:Vector2 = getClosestPoint(P);
		return VectorTools.distance(closestPointOnPolygon, P) <= radius;
	}

	public function isEdge (A :Vector2, B :Vector2) :Bool
	{
		for (ii in 0..._vertices.length) {
			if (A.equals(_vertices[ii])) {
				//Before current
				var idx = ii > 0 ? ii - 1 : _vertices.length - 1;
				if (B.equals(_vertices[idx])) {
					return true;
				}
				//After current
				idx = ii == _vertices.length - 1 ? 0 : ii + 1;
				if (B.equals(_vertices[idx])) {
					return true;
				}
			}
		}
		return false;
	}

	public function isEdgesIntersecting (p :Polygon) :Bool
	{
		for (line in p.getEdges()) {
			if (isLineIntersecting(line.a, line.b)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * Given two polygons, returns true if they intersect on the x axis.  Note, the y axis is
	 * INGORED, so the polygons may not actually intersect in 2D space.
	 *
	 * @param p1 a polygon as an array of points, with the first vertex also in the last position
	 * @param p1 a polygon as an array of points, with the first vertex also in the last position
	 * @return true if the x spaces intersect.
	 *
	 */
	public function isHorizontalIntersection (p :Polygon) :Bool
	{
		var pBounds:Rectangle = p.boundingBox;
		var bounds:Rectangle = boundingBox;
		var minX1 = bounds.left;
		var maxX1 = bounds.right;

		var minX2 = pBounds.left;
		var maxX2 = pBounds.right;

		if (NumberUtil.isNumberWithinRange(minX2, minX1, maxX1) ||
			NumberUtil.isNumberWithinRange(maxX2, minX1, maxX1) ||
			NumberUtil.isNumberWithinRange(minX1, minX2, maxX2) ||
			NumberUtil.isNumberWithinRange(maxX1, minX2, maxX2)) {
				return true;
			}

		return false;

	}

	public function isHorizontallyContained (p :Polygon) :Bool
	{
		var pBounds:Rectangle = p.boundingBox;
		var bounds:Rectangle = boundingBox;
		var minX1 = bounds.left;
		var maxX1 = bounds.right;

		var minX2 = pBounds.left;
		var maxX2 = pBounds.right;

		if((NumberUtil.isNumberWithinRange(minX2, minX1, maxX1) &&
			NumberUtil.isNumberWithinRange(maxX2, minX1, maxX1)) ||
			(NumberUtil.isNumberWithinRange(minX1, minX2, maxX2) &&
			NumberUtil.isNumberWithinRange(maxX1, minX2, maxX2))) {
				return true;
			}

		return false;

	}

	/**
	 * Returns true if any two edges of two polygons intersect, or if any points of one
	 * polygon are inside the other polygon.
	 * @param P1 Array of Vector2 points, with the first point also last in the array.
	 * @param P2 Array of Vector2 points, with the first point also last in the array.
	 */
	public function isIntersection (polygon :Polygon) :Bool
	{
		if (isEdgesIntersecting(polygon)) {
			return true;
		}
		//Vertices exactly on edges are missed.  Check for this.
		if(isHorizontalIntersection(polygon) && isVerticalIntersection(polygon)) {
			return true;
		}

//		var v :Vector2;
//		for each (v in P1) {
//			if (isPointInPolygon2(v, P2)) {
//				return true;
//			}
//		}
//		for each (v in P2) {
//			if (isPointInPolygon2(v, P1)) {
//				return true;
//			}
//		}

		return false;
	}

	public function isLineEnclosed (line :LineSegment) :Bool
	{
		return isPointInside(line.a) && isPointInside(line.b);
	}

	public function isLineIntersecting (v1 :Vector2, v2 :Vector2) :Bool
	{
		for (line in _edges) {

			if (LineSegment.isConnected(v1, v2, line.a, line.b)) {
				continue;
			}

			if (line.isIntersected(v1, v2)) {
				return true;
			}
		}
		return false;
	}

	public function getFirstIntersectingEdge (line :LineSegment) :LineSegment
	{
		for (ln in _edges) {
			if (ln.isIntersectedByLine(line)) {
				return ln;
			}
		}
		return null;
	}

	/**
	 * Returns true if any points are an edge of the polygon.
	 * @param P1 Array of Vector2 points, with the first point also last in the array.
	 */
	public function isLineOnPolygonEdge(P1 :Vector2, P2 :Vector2) :Bool
	{
		for (edge in _edges) {
			if (edge.dist(P1) == 0 && edge.dist(P2) == 0) {
				return true;
			}
		}
		return false;
	}

	public function isLineOverlapping (line :LineSegment) :Bool
	{
		return isLineIntersecting(line.a, line.b) || isLineEnclosed(line);
	}

	public function isPointInside (P :Vector2) :Bool
	{
		return _vertices.isPointInPolygon(P);
		// return isPointInPolygon2(P, _vertices);
	}

	public function isPointOnEdge (P :Vector2) :Bool
	{
		for (line in _edges) {
			if (line.dist(P) == 0) {
				return true;
			}
		}
		return false;
	}

	public function isPointsAnEdge (p1 :Vector2, p2 :Vector2) :Bool
	{
		for (edge in _edges) {
			if (edge.equalToPoints(p1, p2)) {
				return true;
			}
		}
		return false;
	}

	public function isPolygonVertex (P :Vector2) :Bool
	{
		for (polygonPoint in _vertices) {
			if(polygonPoint.x == P.x && polygonPoint.y == P.y) {
				return true;
			}
		}
		return false;
	}

	public function isVerticalContained (p :Polygon) :Bool
	{
		var pBounds:Rectangle = p.boundingBox;
		var bounds:Rectangle = boundingBox;
		var minY1 = bounds.top;
		var maxY1 = bounds.bottom;

		var minY2 = pBounds.top;
		var maxY2 = pBounds.bottom;

		if ((NumberUtil.isNumberWithinRange(minY2, minY1, maxY1) &&
			NumberUtil.isNumberWithinRange(maxY2, minY1, maxY1)) ||
			(NumberUtil.isNumberWithinRange(minY1, minY2, maxY2) &&
			NumberUtil.isNumberWithinRange(maxY1, minY2, maxY2))) {
				return true;
			}

		return false;

	}

	/**
	 * Given two polygons, returns true if they intersect on the y axis.  Note, the x axis is
	 * INGORED, so the polygons may not actually intersect in 2D space.
	 *
	 * @param p1 a polygon as an array of points, with the first vertex also in the last position
	 * @param p1 a polygon as an array of points, with the first vertex also in the last position
	 * @return true if the y spaces intersect.
	 *
	 */
	public function isVerticalIntersection (p :Polygon) :Bool
	{
		var pBounds:Rectangle = p.boundingBox;
		var bounds:Rectangle = boundingBox;
		var minY1 = bounds.top;
		var maxY1 = bounds.bottom;

		var minY2 = pBounds.top;
		var maxY2 = pBounds.bottom;

		if(NumberUtil.isNumberWithinRange(minY2, minY1, maxY1) ||
			NumberUtil.isNumberWithinRange(maxY2, minY1, maxY1) ||
			NumberUtil.isNumberWithinRange(minY1, minY2, maxY2) ||
			NumberUtil.isNumberWithinRange(maxY1, minY2, maxY2)) {
				return true;
			}

		return false;

	}

	public function pad (padding :Float) :Polygon
	{
		return this.clone().padLocal(padding);
	}

	public function padLocal (padding :Float) :Polygon
	{
		//Copy the edges so that the edge vertices are independent
		var lines = new Array<LineSegment>(); 
		for (line in _edges) {
			lines.push(line.clone());
		}

		//Move each line in the direction of the line normal (anti-clockwise).
		for (line in lines) {
			var normal = line.normalVector;
			var transform = normal.angle.angleToVector2(padding);
			line.a.addLocal(transform);
			line.b.addLocal(transform);
		}

		//Add the first line to the end
		lines.push(lines[0]);
		//Go though the line pairs and get the intersections as the new polygon vertices
		var newVertices:Array<Vector2> = [];
		for (ii in 0...lines.length - 1) {
			var line1 = lines[ii];
			var line2 = lines[ii + 1];
			var intersectPoint = LineSegment.lineIntersectLine(line1.a, line1.b, line2.a, line2.b, false); 
			if (intersectPoint == null) {
				if (line1.b.equals(line2.a)) {
					newVertices.push(line2.a.clone());
				} else {
					throw "Lines " + line1 + ", " + line2 + " don't intersect, not do they touch";
				}
			} else {
				newVertices.push(LineSegment.lineIntersectLine(line1.a, line1.b, line2.a, line2.b, false));
			}
		}

		//Set the polygon vertices to the new values
		for (ii in 0...newVertices.length) {
			var newV = newVertices[ii];
			var oldV = _vertices[ii];
			oldV.x = newV.x;
			oldV.y = newV.y;
		}
		clearCache();
		return this;
	}

	public function toString () :String
	{
		return "Polygon[" + _vertices.join(",	") + "]";
	}

	public function translate (dx :Float, dy :Float) :Polygon
	{
		return this.clone().translateLocal(dx, dy);
	}

	public function translateLocal (dx :Float, dy :Float) :Polygon
	{
		for (v in _vertices) {
			v.x += dx;
			v.y += dy;
		}
		clearCache();
		return this;
	}
	
	public function rotateLocal (angle :Float, ?rotationPoint :Vector2) :Polygon
	{
		rotationPoint = rotationPoint != null ? rotationPoint : center;
		for (v in _vertices) {
			v.subtractLocal(rotationPoint).rotateLocal(angle).addLocal(rotationPoint);
		}
		return this;
	}
	
	public function rotate (angle :Float, ?rotationPoint :Vector2) :Polygon
	{
		return clone().rotateLocal(angle, rotationPoint);
	}

	public function scale (scaleX :Float, scaleY :Float) :Polygon
	{
		return this.clone().scaleLocal(scaleX, scaleY);
	}

	public function scaleLocal (scaleX :Float, scaleY :Float) :Polygon
	{
		for (v in _vertices) {
			v.x *= scaleX;
			v.y *= scaleY;
		}
		clearCache();
		return this;
	}

	public function union (p :Polygon) :Polygon
	{
		if (!isIntersection(p)) {
			Log.debug(["union, no intersection", "poly1", this, "poly2", p]);
			return new Polygon([]);
		}

		var points:Array<Vector2> = _vertices.union(p.vertices);
		if (points != null && points.length > 2) {
			return new Polygon(points);
		}
		return null;
	}
	
	inline function getBoundingBox () :Rectangle
	{
		if (_bounds == null) {
			_bounds = _vertices.getBounds();
		}
		return _bounds;
	}
	
	inline function getBoundingCircle () :Circle
	{
		if (_boundCircle == null) {
			var f = _vertices.furthestPoint(center);
			_boundCircle = new Circle(center.distance(f), center.x, center.y);
		}
		return _boundCircle;
	}
	
	inline function get_center () :Vector2
	{
		if (_center == null) {
			_center = _vertices.get_center();
		}
		return _center;
	}
	
	function clearCache () :Void
	{
		_center = null;
		_bounds = null;
		_boundCircle = null;
	}
	
	var _edges :Array<LineSegment>;
	var _vertices :Array<Vector2>;
	var _bounds :Rectangle;
	var _boundCircle :Circle;
	var _center :Vector2;
}


