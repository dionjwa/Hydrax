package com.pblabs.components.iui;

import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGameBase;
import org.transition9.rtti.ReflectUtil;

import js.Dom;

using org.transition9.util.ArrayUtil;

/**
  * A screen in the IUI library.
  * http://www.iui-js.org/
  * Manages the creation and removal of the dom elements.
  */
class IUIScreen extends PBContext
{
	public static function getScreenId (screen :Dynamic) :String
	{
		org.transition9.util.Assert.isTrue(Type.getClass(screen) != IUIScreen, "You must subclass IUIScreen");
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
		
		var containerDiv :HtmlDom = cast js.Lib.document.createElement("div");
		containerDiv.appendChild(_div);
		
		trace("iui.insertPages");
		
		var afterInsert = function (?_) :Void {
			trace("after insert " + _);
		}
		untyped js.Lib.document.body.addEventListener("afterinsert", afterInsert);
		
		untyped iui.insertPages(containerDiv);
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
		trace("enter");
		org.transition9.util.Assert.isNotNull(_div, ' _div is null, did you call super.setup()?');
		var title = title;
		untyped _div.addEventListener("focus", function (?_) :Void {
			trace("focused on " + title);
		});
		var self = this;
		haxe.Timer.delay(function () :Void {
			trace("selected = true");
			_div.setAttribute("selected", "true");
			// untyped iui.showPageById(self.id);
		}, 40);
		// var backButton :HtmlDom = js.Lib.document.getElementById("backButton");
		// org.transition9.util.Assert.isNotNull(backButton, ' backButton is null');
		// var contexts = getManager(PBGameBase).contexts;
		// var index = contexts.indexOf(this);
		// if (index > 0) {
		// 	backButton.nodeValue = ReflectUtil.tinyClassName(contexts[index - 1]); 
		// }
	}
	
	function createDiv () :Void
	{
		_div = cast js.Lib.document.createElement("div");
		_div.id = id;
		_div.setAttribute("title", title);
		_div.setAttribute("selected", "false");
		// _div.className = "panel";
		org.transition9.util.Assert.isNull(js.Lib.document.getElementById(_div.id), 	"An element with id of this class name already exists");
		
		// var head :HtmlDom = cast js.Lib.document.getElementsByTagName("body")[0]; 
		// head.appendChild(_div);
		// trace("adding " + _div.id + " to the head"); 
		// return _div;
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
