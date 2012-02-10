package com.pblabs.components.scene2D;

import de.polygonal.core.math.Vec2;
using org.transition9.geom.Vec2Tools;

class SceneTransformUtil
{
    public static function translateScreenToWorld (sceneManager :BaseSceneManager, screen :Vec2) :Vec2
	{
		var viewOffset = new Vec2();
		calculateOutPoint(viewOffset, sceneManager.sceneAlignment, sceneManager.sceneView.width, sceneManager.sceneView.height);
		return screen.subtract(viewOffset).scale(1.0 / sceneManager.zoom).rotate(sceneManager.rotation).subtract(new Vec2(sceneManager.x, sceneManager.y));
	}
	
	public static function translateWorldToScreen (sceneManager :BaseSceneManager, world :Vec2) :Vec2
	{
		var viewOffset = new Vec2();
		calculateOutPoint(viewOffset, sceneManager.sceneAlignment, sceneManager.sceneView.width, sceneManager.sceneView.height);
		return world.add(new Vec2(sceneManager.x, sceneManager.y)).rotate(sceneManager.rotation).scale(sceneManager.zoom).add(viewOffset);
	}
	
	public static function calculateOutPoint (outPoint :Vec2, alignment :SceneAlignment, sceneWidth :Float, sceneHeight :Float) :Vec2
	{
		org.transition9.util.Assert.isNotNull(outPoint);
		org.transition9.util.Assert.isNotNull(alignment);
		switch (alignment) {
			case CENTER :
				outPoint.x = sceneWidth * 0.5;
				outPoint.y = sceneHeight * 0.5;
			case TOP_LEFT :
				outPoint.x = outPoint.y = 0;
			case TOP_RIGHT :
				outPoint.x = sceneWidth;
				outPoint.y = 0;
			case BOTTOM_LEFT :
				outPoint.x = 0;
				outPoint.y = sceneHeight;
			case BOTTOM_RIGHT :
				outPoint.x = sceneWidth;
				outPoint.y = sceneHeight;
			default:
				throw "Not implemented";
		}
		return outPoint;
	}
}
