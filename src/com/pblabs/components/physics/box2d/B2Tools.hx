package com.pblabs.components.physics.box2d;

import box2D.collision.shapes.B2Shape;

import box2D.dynamics.B2Body;

class B2Tools
{
	public static function getShapes (body :B2Body) :Iterable<B2Shape>
	{
		var list = new List<B2Shape>();
		var shape = body.GetShapeList();
		while (shape != null) {
			list.add(shape);
			shape = shape.GetNext();
		}
		return list;
	}
}
