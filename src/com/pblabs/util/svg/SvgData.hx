package com.pblabs.util.svg;

import com.pblabs.util.StringUtil;
import com.pblabs.util.svg.SvgReplace;
using com.pblabs.util.XmlTools;

/**
  * Caches important bits about the Svg data to avoid expensive repeated processing.
  */
class SvgData
	implements com.pblabs.util.ds.Hashable, implements Cloneable<SvgData>
{
	public var id (default, null):String;
	var _replacements :SvgReplacements;
	public var data (get_data, null):String;
	var _data :String;
	function get_data () :String
	{
		if (_data == null) {
			com.pblabs.util.Assert.isNotNull(_xml, ' _xml is null and _data is null');
			_data = Std.string(_xml);
			#if js
			/** SVG documents added to the dom via innerHTML are *not* allowed to have any preamble. */
			_data = cleanSvgForInnerHtml(_data);
			#end
		}
		return _data;
	}
	public var xml (get_xml, null) :Xml;
	var _xml :Xml;
	function get_xml () :Xml
	{
		if (_xml == null) {
			_xml = Xml.parse(data).ensureNotDocument();
			#if js
			removeJunk(_xml);
			#end
		}
		return _xml;
	}
	var _hashcode :Int;
	
	public function new (id :String, data :String, ?replacements :Array<SvgReplace>, ?xml :Xml)
	{
		com.pblabs.util.Assert.isTrue(data != null || xml != null, ' data AND xml are null');
		com.pblabs.util.Assert.isTrue(replacements == null || xml == null, "You cannot specify both xml and replacements. ");
		
		_data = data;
		
		#if js
		if (_data != null) {
			/** SVG documents added to the dom via innerHTML are *not* allowed to have any preamble. */
			_data = cleanSvgForInnerHtml(_data);
		}
		#end
		
		this.id = id;
		_replacements = new SvgReplacements(replacements);
		if (xml != null && replacements == null) {
			_xml = xml.ensureNotDocument();
			#if js
			removeJunk(_xml);
			#end
		}
		if (_data != null && replacements != null && replacements.length > 0) {
			_data = SvgReplace.processReplacements(_data, _replacements);
			com.pblabs.util.Assert.isNotNull(this.data, ' this.data is null after replacements');
		}
		
		_hashcode = StringUtil.hashCode(id + ":" + _replacements.hashCode());
	}
	
	public function clone () :SvgData
	{
		return new SvgData(id, data);
	}
	
	inline public function hashCode () :Int
	{
		return _hashcode;
	}
	
	public function destroy () :Void
	{
		_xml = null;
		data = null;
		_replacements = null;
	}
	
	public function toString () :String
	{
		return "[id=" + id + ", xmlId=" + xml.get("id") + ", " + (data != null ? data.substr(0, 20) : "null") + "]";
	}
	
	#if js
	/**
	* If these elements are not removed, canvg fills up the log with errors.
	*/
	  static function removeJunk (xml :Xml) :Void
	  {
		for (junkElementName in ["metadata", "sodipodi:namedview"]) {
			var junk = xml.findElement(junkElementName);
			if (junk != null && junk.parent != null) {
				junk.parent.removeChild(junk);
			}
		}
	}
	
	/**
	  * innerHTML does not allow the svg prelude junk.
	  */
	inline public static function cleanSvgForInnerHtml (svg :String) :String
	{
		return svg.substr(svg.indexOf("<svg"));
	}
	#end

}
