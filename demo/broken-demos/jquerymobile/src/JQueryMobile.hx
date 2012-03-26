package ;

import jQuery.JQuery;

/**
	jQuery mobile
**/

extern class Mobile {
	inline static public function changePage(jQ:JQuery, page :Dynamic, ?options :Dynamic):JQuery untyped {
		return jQ.overlay(configuration);
	}

	inline static public function getMobileAPI(jQ:JQuery):MobileAPI untyped {
		return jQ.data("mobile");
	}
	
	// inline static public var _static = OverlayStatic;
}

// extern class OverlayStatic {
// 	inline static public function addEffect(name:String, loadfunc:Dynamic, closefunc:Dynamic):Void untyped {
// 		JQueryStatic.tools.overlay.addEffect(name, loadfunc, closefunc);
// 	}
// }

extern class MobileAPI {
	/** 
		Closes the overlay.
	**/
	public function changePage(page :Dynamic, ?options :Dynamic):Void;

}
