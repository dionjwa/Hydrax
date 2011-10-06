package com.pblabs.components.physics.debug; 

import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.NameManager;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGame;
import com.pblabs.geom.Vector2;
import com.pblabs.util.DebugUtil;

import flash.display.Sprite;

import com.pblabs.components.physics.ShapeType;

using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.engine.util.PBUtil;

class PhysicsComponentDemo extends Sprite
{
	var game :PBGame;
	
	public function new ()
	{
		super();
		
		#if flash
		flash.system.Security.allowDomain("*");
		#end
		com.pblabs.engine.debug.Log.setup();
		com.pblabs.engine.debug.Log.setLevel("", com.pblabs.engine.debug.Log.WARNING);
		
		game = new PBGame();
		game.pushContext(new PhysicsDemoGameMode());
	}
}

class PhysicsDemoGameMode extends PBContext
{
	public function new () 
	{
		super();
	}
	
	override function startup () :Void
	{
		super.startup();
		// _modeSprite.mouseChildren = true;
		
		// _drawLayer = new Sprite();
		// _drawLayer.mouseEnabled = false;
		// _modeSprite.addChild(_drawLayer);
		
		// _mouseLayer = new Sprite();
		// _mouseLayer.mouseEnabled = true;
		// _modeSprite.addChild(_mouseLayer);
		
		// DebugUtil.fillRect(_mouseLayer, 800, 800, 1, 0.1);
		
		// addSingletonComponent(new PhysicsManagerPhysaxe());
		addSingletonComponent(com.pblabs.components.physics.PhysicsManagerPhysaxe);
		addSingletonComponent(DrawWorldComponent);
		
		// Const.DEFAULT_MATERIAL.friction = 0.9;
		// Const.DEFAULT_MATERIAL.density = 0.9;
		// Const.DEFAULT_MATERIAL.restitution = 0.1;
		
		// Const.DEFAULT_PROPERTIES.angularFriction = 0.5;
		
		
		var radius = 30.0;
		for (i in 0...10) {
			var ball = createPhysicsEntity(ShapeType.CIRCLE(radius), new Vector2(Math.random() * 100, Math.random() * 100));
		}
		
		createPhysicsEntity(ShapeType.FIXED_BOX(0,280, 270,50));
	}
	
	function createPhysicsEntity (shape :ShapeType, ?loc :Vector2 = null) :IEntity
	{
		var ball = createBaseSceneEntity();
		
		var physics = allocate(com.pblabs.components.physics.motor2.PhysicsComponent);
		physics.shapeType = shape;
		// physics.xProperty = LocationComponent.P_X;
		// physics.yProperty = LocationComponent.P_Y;
		// physics.angleProperty = AngleComponent.P_ANGLE;
		if (loc != null) {
			physics.x = loc.x;
			physics.y = loc.y;
		}
			
		ball.addComponent(physics);
		
		var renderer :SceneComponent;
		
		
		// switch (shape) {
		// 	case CIRCLE (r):
		// 		var c = allocate(CircleShape);
		// 		c.
		// 		(r),  "Render");
		// 	case BOX (w, h): ball.addComponent(new RectDisplayComponent(0, 0, w, h),  "Render");
		// 	case FIXED_BOX (x, y, w, h): ball.addComponent(new RectDisplayComponent(x, y, w, h),  "Render");
		// }
		
		addObject(ball);
		var nm = getManager(NameManager);
		ball.initialize(nm.validateName("ball "));
		return ball;
	}
		
	var _mouseLayer :Sprite;
	var _drawLayer :Sprite;
}
