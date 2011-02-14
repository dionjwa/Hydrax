package com.pblabs.components;

import com.pblabs.engine.core.PropertyReference;

class Constants
{
	/** By default, all components will use these properties if none others are provided */
	public static var DEFAULT_X_PROP :PropertyReference<Float> = new PropertyReference("@Coordinates2D.x");
	public static var DEFAULT_Y_PROP :PropertyReference<Float> = new PropertyReference("@Coordinates2D.y");
	public static var DEFAULT_ANGLE_PROP :PropertyReference<Float> = new PropertyReference("@Coordinates2D.angle");
	public static var DEFAULT_SCALE_PROP :PropertyReference<Float> = new PropertyReference("@ScaleComponent.scale");
}
