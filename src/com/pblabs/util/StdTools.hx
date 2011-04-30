package com.pblabs.util;

import Type;

class StdTools
{
	/**
	  * Checking if a value is an Int, Float, or Bool.
	  */
	public static function is (obj :Dynamic, type :ValueType) :Bool
	{
		#if debug
		switch (type) {
	    	case TFloat:
	    	case TBool:
	    	case TInt:
	    	default: 
	    		com.pblabs.util.Log.error("Can only check for Float, Int, and Bool values with this function, type=" + type + ", obj=" + obj);
	    } 
		#end
	    return switch (Type.typeof(obj)) {
	    	case TFloat: (type == ValueType.TFloat);
	    	case TBool: (type == ValueType.TBool);
	    	case TInt: (type == ValueType.TInt);
	    	default: false;
	    }
	}
}
