package com.pblabs.components.base;

import com.pblabs.engine.core.PropertyReference;
using com.pblabs.engine.core.SignalBondManager;

class CoordinatesScaled extends Coordinates
{
	public var scaleFactor :Float;
	public var scaledCoordsProperty :PropertyReference<Coordinates>;
	var _scaledCoords :Coordinates;
	
	public function new() 
	{ 
		super();
		scaleFactor = 1;
	}

	override function set_x (val :Float):Float
	{
		com.pblabs.util.Assert.isNotNull(_scaledCoords);
		return _scaledCoords.x = val / scaleFactor;
   }

	override function set_y (val :Float):Float
	{
		com.pblabs.util.Assert.isNotNull(_scaledCoords);
		return _scaledCoords.y = val / scaleFactor;
   }

   override function set_angle (val :Float):Float
	{
		com.pblabs.util.Assert.isNotNull(_scaledCoords);
		return _scaledCoords.angle = val;
   }
   
	override function onReset () :Void
	{
		super.onReset();
		
		_scaledCoords = _scaledCoords == null && scaledCoordsProperty != null ? owner.getProperty(scaledCoordsProperty) : _scaledCoords;
		com.pblabs.util.Assert.isNotNull(_scaledCoords);
		bindSignal(_scaledCoords.signalerX, onChildXChanged);
		bindSignal(_scaledCoords.signalerY, onChildYChanged);
		bindSignal(_scaledCoords.signalerAngle, onChildAngleChanged);
	}
	
	override public function dispatchX () :Void
	{
		//Depend on changed on the child
	}
	
	override public function dispatchY () :Void
	{
		//Depend on changed on the child
	}
	
	override public function dispatchAngle () :Void
	{
		//Depend on changed on the child
	}
	
	function onChildXChanged (val :Float) :Void
	{
		_vec.x = val * scaleFactor;
		signalerX.dispatch(x);
	}
	
	function onChildYChanged (val :Float) :Void
	{
		_vec.y = val * scaleFactor;
		signalerY.dispatch(y);
	}
	
	function onChildAngleChanged (val :Float) :Void
	{
		_angle = val;
		signalerAngle.dispatch(angle);
	}

}
