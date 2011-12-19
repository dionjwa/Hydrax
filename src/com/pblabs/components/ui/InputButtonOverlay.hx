package com.pblabs.components.ui;

import com.pblabs.components.input.IInputData;
import com.pblabs.components.input.InputManager;
import com.pblabs.components.scene2D.BaseSceneComponent;
import com.pblabs.engine.core.IEntity;

import de.polygonal.motor.geom.math.Vec2;

using com.pblabs.components.util.DataComponent;
using com.pblabs.engine.core.SignalBondManager;
using com.pblabs.engine.util.PBUtil;

/**
  * Shows a grey (default) transparent box over the button selected.
  * 
  * Usage: on the entity you want to show the gray mouse-down box over,
  * use (possibly in conjustion with method chaining):
  *
  * using com.pblabs.components.ui.InputButtonOverlay;
  *	 entity.showOverlay();  
  */
class InputButtonOverlay
	// #if flash
	// extends com.pblabs.components.scene2D.GraphicsComponent
	// #elseif js
	extends com.pblabs.components.scene2D.RectangleShape
	// #end
{
	static var OVERLAY_KEY :String = "InputButtonOverlayActive";
	
	public static function showOverlay (e :IEntity) :IEntity
	{
		setOverlay(e, true);
		return e;
	}
	
	static function setOverlay (e :IEntity, active :Bool) :Void
	{
		e.setEntityData(OVERLAY_KEY, active);
	}
	
	static function isOverlay (e :IEntity) :Bool
	{
		var val :Null<Bool> = e.getEntityData(OVERLAY_KEY);
		return val != null && val;
	}
	
	public function new ()
	{
		super();
	}
	
	override function onReset () :Void
	{
		spatialProperty = null;
		parentProperty = null;
		autoAddToScene = false;
		super.onReset();
		org.transition9.util.Assert.isNotNull(context.getManager(InputManager), ' context.getManager(InputManager) is null');
		var input = context.getManager(InputManager);
		bindSignal(input.deviceDown, deviceDown);
		bindSignal(input.deviceUp, deviceUp);
	}
	
	override function setDefaults () :Void
	{
		super.setDefaults();
		borderRadius = 10;
		fillColor = 0x000000;
		lineStroke = 0;
		alpha = 0.33;
	}
	
	function deviceDown (input :IInputData) :Void
	{
		if (!context.isTopContext) {
			return;
		}
		var underMouse = input.firstObjectUnderPoint();
		if (underMouse != null && isOverlay(underMouse.owner)) {
			drawOverlay(underMouse);
		}
	}

	function deviceUp (input :IInputData) :Void
	{
		removeFromParent();
	}
	
	function drawOverlay (sc :BaseSceneComponent<Dynamic>) :Void
	{
		org.transition9.util.Assert.isNotNull(sc, ' sc is null');
		var b = sc.bounds;
		if (b == null || Math.isNaN(b.intervalX) || Math.isNaN(b.intervalY)) {
			return;
		}
		
		x = sc.x;
		y = sc.y;
		width = b.intervalX;
		height = b.intervalY;
		registrationPoint = new Vec2((x - b.xmin), (y - b.ymin));
		
		addToParent(sc.parent);
		
		#if flash
		onFrame(0);
		#elseif js
		if (!isOnCanvas) {
			onFrame(0);
		}
		#end
	}
}
