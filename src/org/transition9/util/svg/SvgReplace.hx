package org.transition9.util.svg;

import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.engine.resource.ResourceType;
import com.pblabs.engine.resource.Source;
import org.transition9.util.Comparators;
import org.transition9.util.StringUtil;

using StringTools;

/**
  * A text replacement for an Svg.  This class helps to identify and cache modified Svg data
  * so that repeated parsing and modifying is avoided.
  */
class SvgReplace
	implements org.transition9.ds.Hashable
{
	public static function processReplacements(target :String, replacements :SvgReplacements) :String
	{
		org.transition9.util.Assert.isNotNull(target, ' target is null');
		if (replacements == null) {
			return target;
		}
		for (r in replacements) {
			org.transition9.util.Assert.isNotNull(target, ' target is null');
			target = target.replace(r.pattern, r.replacement);
		}
		return target;
	}
	
	/** Default replace pattern */
	public static var TEXT_REPLACE = "$T";
	
	public var replacement (default, null):String;
	public var pattern (default, null):String;
	var _hashcode :Int;
	var _name :String;
	
	public function new (pattern :String, replacement :String)
	{
		org.transition9.util.Assert.isNotNull(pattern, ' pattern is null');
		org.transition9.util.Assert.isNotNull(replacement, ' replacement is null');
		this.pattern = pattern;
		this.replacement = replacement;
		
		_hashcode = StringUtil.hashCode(pattern + ":" + replacement);
		_name = pattern + "->" + replacement;
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
	implements org.transition9.ds.Hashable
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
