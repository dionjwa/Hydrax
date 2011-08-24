package com.pblabs.util.svg;

import com.pblabs.util.StringUtil;
import com.pblabs.util.svg.SvgReplace;
using com.pblabs.util.XmlUtil;

/**
  * Caches important bits about the Svg data to avoid expensive repeated processing.
  */
class SvgData
	implements com.pblabs.util.ds.Hashable
{
	public var replacements (default, null):SvgReplacements;
	public var data (get_data, null):String;
	var _rawData :String;
	var _data :String;
	function get_data () :String
	{
		if (_data == null) {
			_data = SvgReplace.processReplacements(_rawData, replacements);
		}
		return _data;
	}
	// public var id (default, null) :String;
	public var xml (get_xml, null) :Xml;
	var _xml :Xml;
	function get_xml () :Xml
	{
		if (_xml == null) {
			_xml = Xml.parse(data).ensureNotDocument();
		}
		return _xml;
	}
	var _hashcode :Int;
	
	public function new (id :String, replacements :Array<SvgReplace>, data :String)
	{
		// this.id = id;
		_rawData = data;
		this.replacements = new SvgReplacements(replacements);
		_hashcode = StringUtil.hashCode(id + ":" +this.replacements.hashCode());
	}
	
	inline public function hashCode () :Int
	{
		return _hashcode;
	}
	
	public function destroy () :Void
	{
		_xml = null;
		_data = null;
		_rawData = null;
		replacements = null;
	}

}
