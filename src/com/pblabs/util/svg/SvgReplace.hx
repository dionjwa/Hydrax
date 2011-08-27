package com.pblabs.util.svg;

import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.engine.resource.ResourceType;
import com.pblabs.engine.resource.Source;
import com.pblabs.util.Comparators;
import com.pblabs.util.StringUtil;

/**
  * A text replacement for an Svg.  This class helps to identify and cache modified Svg data
  * so that repeated parsing and modifying is avoided.
  */
class SvgReplace
	implements com.pblabs.util.ds.Hashable
{
	public static function processReplacements(target :String, replacements :SvgReplacements) :String
	{
		com.pblabs.util.Assert.isNotNull(target, ' target is null');
		if (replacements == null) {
			return target;
		}
		for (r in replacements) {
			// trace('r.ereg=' + r.ereg);
			// trace('r.replacement=' + r.replacement);
			com.pblabs.util.Assert.isNotNull(target, ' target is null');
			target = r.ereg.replace(target, r.replacement);
		}
		return target;
	}
	
	/** Default replace pattern */
	public static var TEXT_REPLACE = "$T";
	
	public var replacement (default, null):String;
	public var ereg (default, null):EReg;
	var _hashcode :Int;
	var _name :String;
	
	public function new (eregString :String, replacement :String)
	{
		com.pblabs.util.Assert.isNotNull(eregString, ' eregString is null');
		com.pblabs.util.Assert.isNotNull(replacement, ' replacement is null');
		this.replacement = replacement;
		eregString = eregString != null ? eregString : TEXT_REPLACE;
		this.ereg = new EReg(eregString, "");
		
		_hashcode = StringUtil.hashCode(replacement + ":" + eregString);
		_name = eregString + "->" + replacement;
	}

	inline public function hashCode () :Int
	{
		return _hashcode;
	}
	
	public function toString () :String
	{
		return _name;
	}
}

/** Stores and hashes SvgReplacements for faster identification of svg data */
class SvgReplacements
	implements com.pblabs.util.ds.Hashable
{
	var _hashcode :Int;
	var _replacements (default, null) :Array<SvgReplace>;
	
	public function new (arr :Array<SvgReplace>)
	{
		_replacements = arr != null ? arr : [];
		_replacements.sort(sortOnHashCode);
		_hashcode = StringUtil.hashCode(_replacements.join(","));
	}
	
	inline public function hashCode () :Int
	{
		return _hashcode;
	}
	
	public function iterator () :Iterator<SvgReplace>
	{
		return _replacements.iterator();
	}

	public function toString () :String
	{
		return "[" + _replacements.join(",") + "]";
	}	
	
	static function sortOnHashCode (r1 :SvgReplace, r2 :SvgReplace) :Int
	{
		return Comparators.compareInts(r1.hashCode(), r2.hashCode());
	}

}
