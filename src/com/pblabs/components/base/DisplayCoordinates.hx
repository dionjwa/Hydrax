package com.pblabs.components.base;

import com.pblabs.engine.core.PropertyReference;
import com.pblabs.geom.Vector2;

using com.pblabs.engine.core.SignalBondManager;
using com.pblabs.engine.util.PBUtil;
using com.pblabs.util.XMLUtil;

/**
  * Coordinate information used by display related components.  
  * Separate from the Coordinates2D class that is used for non-display
  * coord data.  The Coordinates2D class is optional.
  */
class DisplayCoordinates2D extends Coordinates2D
{
	public static var P_X :PropertyReference<Float> = new PropertyReference("@Coordinates2D.x");
	public static var P_Y :PropertyReference<Float> = new PropertyReference("@Coordinates2D.y");
	
	public var scaleFactor :Float;
	public var scaledCoords :Coordinates2D;
	public var scaledCoordsProperty :PropertyReference<Coordinates2D>;
	
	public function new ()
	{
		super();
		scaleFactor = 1;
		scaledCoordsProperty = Coordinates2D.componentProp();
	}
	
	override public function dispatch () :Void
	{
		super.dispatch();
		if (scaledCoords != null) {
			scaledCoords.setLocation(x / scaleFactor, y / scaleFactor);
		}
	}
	
	override public function dispatchAngle () :Void
	{
		super.dispatchAngle();
		if (scaledCoords != null) {
			scaledCoords.angle = angle;
		}
	}
	
	override function onReset () :Void
	{
		super.onReset();
		scaledCoords = scaledCoords == null && scaledCoordsProperty != null ? owner.getProperty(scaledCoordsProperty) : scaledCoords;
		if (scaledCoords != null) {
			this.bindSignal(scaledCoords.signalerLocation, onChildLocationChanged);
			this.bindSignal(scaledCoords.signalerAngle, onChildAngleChanged);
			onChildLocationChanged(scaledCoords.point);
			onChildAngleChanged(scaledCoords.angle);
		} else {
			com.pblabs.util.Log.debug("DisplayCoordinates2D have no scaledCoords field set.  Check the property reference");
		}
	}
	
	function onChildLocationChanged (val :Vector2) :Void
	{
		point = val.scale(scaleFactor);
	}
	
	function onChildAngleChanged (val :Float) :Void
	{
		set_angle(val);
	}

}
