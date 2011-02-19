package com.pblabs.components.input;

import com.pblabs.components.Constants;
import com.pblabs.components.scene.BaseScene2DComponent;
import com.pblabs.components.scene.SceneUtil;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.IPBManager;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.geom.Vector2;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

using com.pblabs.engine.util.PBUtil;

class DragManager
	implements IPBManager, implements haxe.rtti.Infos
{
	@inject
	var context :IPBContext;
	@inject
	var input :InputManager;
	
	public var dragSignaler :Signaler<BaseScene2DComponent<Dynamic>>;
	
	var _dragged :BaseScene2DComponent<Dynamic>;
	var _xProp :PropertyReference<Float>;
	var _yProp :PropertyReference<Float>;
	var _startMouse :Vector2;
	var _startObj :Vector2;
	
	public function new ()
	{
		_startMouse = new Vector2();
		_startObj = new Vector2();
		dragSignaler = new DirectSignaler(this);
	}
	
	public function startDragging (comp :BaseScene2DComponent<Dynamic>, ?xProp :PropertyReference<Float> = null, ?yProp :PropertyReference<Float> = null) :Void
	{
		com.pblabs.util.Assert.isNotNull(comp);
		stopDragging();
		_dragged = comp;
		
		_xProp = xProp;
		_yProp = yProp;
		
		//Guess the properties if null
		if (_xProp == null || _yProp == null) {
			//Maybe coordinates?
			if (comp.owner.lookupComponent(com.pblabs.components.base.Coordinates2D) != null) {
				_xProp = Constants.DEFAULT_X_PROP;
				_yProp = Constants.DEFAULT_Y_PROP;
			}
		}
		
		if (_xProp == null || _yProp == null) {
			_xProp = _dragged.componentProp("x");
			_yProp = _dragged.componentProp("y");
		}
		
		com.pblabs.util.Assert.isNotNull(_xProp);
		com.pblabs.util.Assert.isNotNull(_yProp);
		
		// _startMouse.x = mouseLoc.x;
		// _startMouse.y = mouseLoc.y;
		
		_startObj.x = comp.owner.getProperty(_xProp);
		_startObj.y = comp.owner.getProperty(_yProp);
		
	    input.deviceMove.bind(onDeviceMove);
		input.deviceUp.bind(onDeviceUp);
	}
	
	public function stopDragging () :Void
	{
	    _dragged = null;
		// input.deviceMove.unbind(onDeviceMove);
		input.deviceMove.unbind(onDeviceUp);
	}
	
	public function startup () :Void
	{
		com.pblabs.util.Assert.isNotNull(context);
		com.pblabs.util.Assert.isNotNull(input);
		input.deviceMove.bind(onDeviceMove);
	}
	
	public function shutdown () :Void
	{
		stopDragging();
		input.deviceMove.unbind(onDeviceMove);
		context = null;
		input = null;
		_dragged = null;
		_xProp = null;
		_yProp = null;
		
		com.pblabs.util.Assert.isFalse(dragSignaler.isListenedTo);
		dragSignaler = null;
	}
	
	function onDeviceMove (e :InputData) :Void
	{
		// com.pblabs.util.Assert.isNotNull(_dragged, "Dragged entity should not be null if we're listening to mouse moves");
		com.pblabs.util.Assert.isNotNull(e, "No InputData??");
		com.pblabs.util.Assert.isNotNull(e.inputLocation, "No InputData.inputLocation??");
		if (_dragged == null) {
			//No dragging, but record mouse loc for future use.
			_startMouse.x = e.inputLocation.x;
			_startMouse.y = e.inputLocation.y;
			return;
		}
		com.pblabs.util.Assert.isNotNull(_startMouse, "Null _startMouse?");
		com.pblabs.util.Assert.isTrue(_dragged.isRegistered, "Dragged not registered?");
		com.pblabs.util.Assert.isNotNull(_dragged.layer, "No layer?");
		com.pblabs.util.Assert.isNotNull(_dragged.layer.parent, "No layer.parent?");
		var worldStart = SceneUtil.translateScreenToWorld(_dragged.layer.parent, _startMouse);
		var worldNow = SceneUtil.translateScreenToWorld(_dragged.layer.parent, e.inputLocation);
		var worldDiff = worldNow.subtract(worldStart);
		_dragged.owner.setProperty(_xProp, _startObj.x + worldDiff.x);
		_dragged.owner.setProperty(_yProp, _startObj.y + worldDiff.y);
		if (dragSignaler.isListenedTo) {
			dragSignaler.dispatch(_dragged);
		}
	}
	
	function onDeviceUp (e :InputData) :Void
	{
		if (_dragged == null) {
			return;
		}
		stopDragging();
	}
}
