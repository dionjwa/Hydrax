package com.pblabs.components.input;

import com.pblabs.components.Constants;
import com.pblabs.components.scene.BaseScene2DComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.IPBManager;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.geom.Vector2;
using com.pblabs.engine.util.PBUtil;

class DragManager
	implements IPBManager, implements haxe.rtti.Infos
{
	@inject
	var context :IPBContext;
	@inject
	var input :InputManager;
	
	var _dragged :BaseScene2DComponent<Dynamic>;
	var _xProp :PropertyReference<Float>;
	var _yProp :PropertyReference<Float>;
	var _startMouse :Vector2;
	var _startObj :Vector2;
	
	public function new ()
	{
		_startMouse = new Vector2();
		_startObj = new Vector2();
	}
	
	public function startDragging (comp :BaseScene2DComponent<Dynamic>, ?xProp :PropertyReference<Float> = null, ?yProp :PropertyReference<Float> = null) :Void
	{
		com.pblabs.util.Assert.isNotNull(comp);
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
		
		_startObj.x = comp.owner.getProperty(_xProp);
		_startObj.y = comp.owner.getProperty(_yProp);
		
	    input.deviceMove.bind(onDeviceMove);
		input.deviceMove.bind(onDeviceUp);
	}
	
	public function stopDragging () :Void
	{
		input.deviceMove.unbind(onDeviceMove);
		input.deviceMove.unbind(onDeviceUp);
	    _dragged = null;
	}
	
	public function startup () :Void
	{
		com.pblabs.util.Assert.isNotNull(context);
		com.pblabs.util.Assert.isNotNull(input);
		input.deviceDown.bind(onDeviceDown);
		// input.deviceMove.bind(onDeviceMove);
	}
	
	public function shutdown () :Void
	{
		input.deviceDown.unbind(onDeviceDown);
		stopDragging();
		context = null;
		input = null;
		_dragged = null;
		_xProp = null;
		_yProp = null;
	}
	
	function onDeviceDown (e :InputData) :Void
	{
		_startMouse.x = e.inputLocation.x;
		_startMouse.y = e.inputLocation.y;
	}
	
	function onDeviceMove (e :InputData) :Void
	{
		com.pblabs.util.Assert.isNotNull(_dragged, "Dragged entity should not be null if we're listening to mouse moves");
		var diff = e.inputLocation.subtract(_startMouse);
		var worldChange = _dragged.layer.scene.translateScreenToWorld(diff);
		_dragged.owner.setProperty(_xProp, worldChange.x);
		_dragged.owner.setProperty(_yProp, worldChange.y);
	}
	
	function onDeviceUp (e :InputData) :Void
	{
		if (_dragged == null) {
			return;
		}
		stopDragging();
	}
}
