package com.pblabs.components.ui;

import com.pblabs.components.input.IInputData;
import com.pblabs.components.input.InputManager;
import com.pblabs.components.scene2D.BaseSceneComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.geom.Vector2;
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
	#if flash
	extends com.pblabs.components.scene2D.GraphicsComponent
	#elseif js
	extends com.pblabs.components.scene2D.BitmapRenderer
	#end
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
		com.pblabs.util.Assert.isNotNull(context.getManager(InputManager), ' context.getManager(InputManager) is null');
		var input = context.getManager(InputManager);
		bindSignal(input.deviceDown, deviceDown);
		bindSignal(input.deviceUp, deviceUp);
	}
	
	override function setDefaults () :Void
	{
		super.setDefaults();
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
		com.pblabs.util.Assert.isNotNull(sc, ' sc is null');
		var b = sc.bounds;
		if (b == null || Math.isNaN(b.intervalX) || Math.isNaN(b.intervalY)) {
			return;
		}
		
		x = sc.x;
		y = sc.y;
		registrationPoint = new Vector2((x - b.xmin), (y - b.ymin));
		var round = 10;
		
		#if flash
			var g = graphics;
			g.clear();
			g.beginFill(0x000000);
			g.drawRoundRect(0, 0, b.intervalX, b.intervalY, round);
			g.endFill();
		#elseif js
			var canvas :Canvas = cast js.Lib.document.createElement("canvas");
			canvas.width = Std.int(b.intervalX);
			canvas.height = Std.int(b.intervalY);
			
			var ctx = canvas.getContext('2d');
			
			var w = Std.int(b.intervalX);
			var h = Std.int(b.intervalY);
			
			ctx.beginPath();
			ctx.moveTo(round, 0);
			ctx.lineTo(w-round, 0);
			ctx.quadraticCurveTo(w, 0, w, round);
			ctx.lineTo(w, h-round);
			ctx.quadraticCurveTo(w, h, w-round, h);
			ctx.lineTo(round, h);
			ctx.quadraticCurveTo(0, h, 0, h-round);
			ctx.lineTo(0, round);
			ctx.quadraticCurveTo(0, 0, round, 0);
			
			ctx.fillStyle = "#000000";
			ctx.fill();
			
			bitmapData = canvas;
		#end
		
		addToParent(sc.parent);
		
		#if flash
		onFrame(0);
		#end
	}
}
