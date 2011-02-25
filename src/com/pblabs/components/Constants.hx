package com.pblabs.components;

import com.pblabs.engine.core.PropertyReference;

class Constants
{
	/** By default, all components will use these properties if none others are provided */
	public static var DEFAULT_X_PROP :PropertyReference<Float> = com.pblabs.components.spatial.SpatialComponent.P_X;
	public static var DEFAULT_Y_PROP :PropertyReference<Float> = com.pblabs.components.spatial.SpatialComponent.P_Y;
	public static var DEFAULT_ANGLE_PROP :PropertyReference<Float> = com.pblabs.components.spatial.SpatialComponent.P_ANGLE;
	public static var DEFAULT_SCALE_PROP :PropertyReference<Float> = new PropertyReference("@ScaleComponent.scale");
}
