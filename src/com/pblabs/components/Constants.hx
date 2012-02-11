/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components;
import com.pblabs.engine.core.PropertyReference;

import de.polygonal.core.math.Vec2;

class Constants
{
	/** By default, all components will use these properties if none others are provided */
	inline public static var SPATIAL_NAME :String = "ISpatialObject2D";
	public static var P_SPATIAL :PropertyReference<Dynamic> = new PropertyReference("@" + Constants.SPATIAL_NAME);
	public static var P_POINT :PropertyReference<Vec2> = new PropertyReference("@" + Constants.SPATIAL_NAME + ".position");
	public static var DEFAULT_X_PROP :PropertyReference<Float> = new PropertyReference("@" + SPATIAL_NAME + ".x");
	public static var DEFAULT_Y_PROP :PropertyReference<Float> = new PropertyReference("@" + SPATIAL_NAME + ".y");
	public static var DEFAULT_ANGLE_PROP :PropertyReference<Float> = new PropertyReference("@" + SPATIAL_NAME + ".angle");
	public static var DEFAULT_SCALE_PROP :PropertyReference<Float> = new PropertyReference("@ScaleComponent.scale");
	
	/** For Type.createInstance args */
	inline public static var EMPTY_ARRAY :Array<Dynamic> = [];
}
