package com.pblabs.components.scene2D;

import com.pblabs.components.ui.SvgButtonTools;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Tuple;
import com.pblabs.util.ds.maps.MapBuilder;
import com.pblabs.util.svg.SvgReplace;

// class SvgTools
// {
// 	public static var svgCache :Map<Tuple<ResourceToken, Array<SvgReplace>>, String>;
	
// 	/** If a resource is derived, it might be an Image derived from an Svg */
// 	public static function getSvgResource (token :ResourceToken) :ResourceToken
// 	{
// 		return switch (token.source) {
// 			case derived(other): other;
// 			default: token;
// 		}
// 	}
	
// 	public static function createSvgCache (rsrc :IResourceManager) :Void//Map<Tuple<ResourceToken, Array<SvgReplace>>, String>
// 	{
// 		svgCache = new MapBuilder(Type.ValueType.TClass(Tuple))
// 			.makeComputing(
// 				function (key :Tuple<ResourceToken, Array<SvgReplace>>) :String {
// 					return SvgButtonTools.processReplacements(rsrc.get(key.v1), key.v2);
// 				})
// 			.build();
// 	}
// }
