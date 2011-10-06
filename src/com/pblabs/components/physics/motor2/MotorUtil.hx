package com.pblabs.components.physics.motor2;

import de.polygonal.motor2.data.BoxData;
import de.polygonal.motor2.data.CircleData;
import de.polygonal.motor2.data.ShapeData;

import com.pblabs.components.physics.ShapeType;

class MotorUtil
{
	public static function createShapeData (shape :ShapeType) :ShapeData
	{
	    switch (shape) {
	    	case CIRCLE(radius):
	    		var data = new CircleData(0, radius);
				data.x = 0;
				data.y = 0;
				data.r = 0;
				return data; 
	    	case BOX(w, h): 
	    		var data = new BoxData(0, w, h);
				data.x = 0;
				data.y = 0;
				data.r = 0;
				return data; 
	    	case FIXED_BOX(x, y, w, h): 
	    		throw "Not implemented"; return null; 
	    }
	}
}
