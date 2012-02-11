/* Copyright (c) 2011 Michael Baczynski, http://www.polygonal.de, All Rights Reserved. 29.10.2011 11:38 */
package de.polygonal.motor.geom.intersect;

import de.polygonal.core.math.Vec2;

class CollideInfo
{
	public var MTD:Vec2;
	public var normal:Vec2;
	
	public function new()
	{
		MTD = new Vec2();
		normal = new Vec2();
	}
}