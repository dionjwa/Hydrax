package com.pblabs.components.jquerymobile;

import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGame;
import org.transition9.rtti.ReflectUtil;

import js.Dom;

using org.transition9.util.ArrayUtil;

using JQueryMobile;

/**
  * Manages the creation and removal of the dom elements.
  */
class JQueryMobileScreen extends PBContext
{
	public static function getScreenId (screen :Dynamic) :String
	{
		org.transition9.util.Assert.isTrue(Type.getClass(screen) != JQueryMobileScreen, "You must subclass JQueryMobileScreen");
		return ReflectUtil.getClassName(screen);
	}

	public var id (get_id, never) :String;
	function get_id () :String
	{
		return getScreenId(this);
	}
	
	public var title (get_title, never) :String;
	function get_title () :String
	{
		return id;
	}
	
	var _div :HtmlDom;	
	
	public function new ()
	{
		super();
	}
	
	override public function setup () :Void
	{
		super.setup();
		createDiv();
		
		// var containerDiv :HtmlDom = cast js.Lib.document.createElement("div");
		// containerDiv.appendChild(_div);
		
		// trace("iui.insertPages");
		
		// var afterInsert = function (?_) :Void {
		// 	trace("after insert " + _);
		// }
		// untyped js.Lib.document.body.addEventListener("afterinsert", afterInsert);
		
		// untyped iui.insertPages(containerDiv);
	}
	
	override public function shutdown () :Void
	{
		super.shutdown();
		removeDiv();
	}
	
	/** Set this div as the top page */
	override public function enter () :Void
	{
		super.enter();
		//$.mobile.changePage( $page, options );
		trace("change to page");
		new JQuery("").changePage(id);
	}
	
	function createDiv () :Void
	{
		_div = js.Lib.document.createElement("div");
		_div.id = id;
		_div.setAttribute("data-role", "page");
		
		//Header
		var header = js.Lib.document.createElement("div");
		header.setAttribute("data-role", "header");
		_div.appendChild(header);
		
		//Footer
		var footer = js.Lib.document.createElement("div");
		footer.setAttribute("data-role", "footer");
		_div.appendChild(footer);
		
		//Content
		var content = js.Lib.document.createElement("div");
		content.setAttribute("data-role", "content");
		_div.appendChild(content);
		
		org.transition9.util.Assert.isNull(js.Lib.document.getElementById(_div.id), 	"An element with id of this class name already exists");
	}
	
	function removeDiv () :Void
	{
		trace("removeDiv");
		//Delay the removal of the div to allow for transitions 
		haxe.Timer.delay(removeDivInternal, 1000);
	}
	
	function removeDivInternal () :Void
	{
		if (_div != null && _div.parentNode != null) {
			_div.parentNode.removeChild(_div);
		}
		_div = null;
	}
}
