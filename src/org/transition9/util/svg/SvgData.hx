package org.transition9.util.svg;

import de.polygonal.ds.Cloneable;

import org.transition9.util.StringUtil;
import org.transition9.util.svg.SvgReplace;

using StringTools;

using org.transition9.util.XmlTools;

/**
  * Caches important bits about the Svg data to avoid expensive repeated processing.
  */
class SvgData
	implements org.transition9.ds.Hashable, implements Cloneable<SvgData>
{
	public static function fromXml (xml :Xml) :SvgData
	{
		return new SvgData(null, null, null, xml);
	}
	
	public var id (default, null):String;
	var _replacements :SvgReplacements;
	public var data (get_data, null):String;
	var _data :String;
	function get_data () :String
	{
		if (_data == null) {
			org.transition9.util.Assert.isNotNull(_xml, ' _xml is null and _data is null');
			_data = Std.string(_xml);
			#if js
			/** SVG documents added to the dom via innerHTML are *not* allowed to have any preamble. */
			_data = cleanSvgForInnerHtml(_data);
			#end
			org.transition9.util.Assert.isNotNull(_data, ' _data is null');
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
		org.transition9.util.Assert.isTrue(data != null || xml != null, ' data AND xml are null');
		org.transition9.util.Assert.isTrue(replacements == null || xml == null, "You cannot specify both xml and replacements. ");
		
		_data = data;
		
		if (_data != null) {
			#if js
			/** SVG documents added to the dom via innerHTML are *not* allowed to have any preamble. */
			_data = cleanSvgForInnerHtml(_data);
			#elseif flash
			// _data = _data.replace('xmlns:svg="http://www.w3.org/2000/svg"', "");
			#end
		}
		
		this.id = id;
		_replacements = new SvgReplacements(replacements);
		if (xml != null && replacements == null) {
			_xml = xml.ensureNotDocument();
			#if flash
			// _xml = _xml.removeNamespace("svg"); 
			#end
			#if js
			removeJunk(_xml);
			#end
		}
		if (_data != null && replacements != null && replacements.length > 0) {
			_data = SvgReplace.processReplacements(_data, _replacements);
			org.transition9.util.Assert.isNotNull(this.data, ' this.data is null after replacements');
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
		_data = null;
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
