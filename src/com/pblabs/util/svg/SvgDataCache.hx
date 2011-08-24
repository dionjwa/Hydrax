package com.pblabs.util.svg;

import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

/**
  * This class stores svg data and modifications, preventing repeated
  * xml parsing and text replacement operations.
  */
class SvgDataCache
{
	var _map :Map<Int, SvgData>;
	
	public function new ()
	{
		_map = Maps.newHashMap(Type.ValueType.TInt);
	}
	
	public function add (svgId :String, data :String) :SvgData
	{
		var svghash = new SvgData(svgId, null, data);
		var hashCode = svghash.hashCode();
		_map.set(hashCode, svghash);
		return svghash;
	}
	
	public function get (svgId :String, replacements :Array<SvgReplace>) :SvgData
	{
		var svghash = new SvgData(svgId, replacements, null);
		var hashCode = svghash.hashCode();
		if (_map.exists(hashCode)) {
			return _map.get(hashCode);
		} else {
			//Get the raw data
			svghash = new SvgData(svgId, null, null);
			hashCode = svghash.hashCode();
			var raw = _map.get(hashCode);
			com.pblabs.util.Assert.isNotNull(raw, 'Missing raw SvgData: ' + svghash);
			var newSvg = new SvgData(svgId, replacements, raw.data);
			_map.set(newSvg.hashCode(), newSvg);
			return newSvg;
		}
	}
}
