package com.pblabs.components.scene2D.js;

import js.Dom;

class CustomHtml extends SceneComponent
{
	public var html (get_html, set_html) :HtmlDom;
	var _html :HtmlDom;
	function get_html () :HtmlDom
	{
		return _html;
	}
	
	function set_html (val :HtmlDom) :HtmlDom
	{
		com.pblabs.util.Assert.isNotNull(val, ' val is null');
		if (hasParent()) {
			parent.div.replaceChild(_html, val);
		}
		_html = val;
		return val;
	}
	
	public function new ()
	{
		super();
	}
	
	override function setDefaults () :Void
	{
		super.setDefaults();
		spatialProperty = null;
		_html = SceneComponent.createDiv();
		_html.setAttribute("bgcolor", "#ff0000");
		_html.setAttribute("border", "3px coral solid");
		_html.setAttribute("id", "fucku");
		_html.setAttribute("position", "relative");
		_html.style.width = "100%";
		_html.style.height = "50px";
	}
	
	override function set_cacheAsBitmap (val :Bool) :Bool
	{
		com.pblabs.util.Assert.isFalse(val, "You cannot use cacheAsBitmap, this is a Dom only component");
		return super.set_cacheAsBitmap(val);
	}
	
	override public function addedToParent () :Void
	{
		super.addedToParent();
		com.pblabs.util.Assert.isFalse(isOnCanvas);
		cast(layer, JSLayer).div.appendChild(_html);
	}
	
	override public function removingFromParent () :Void
	{
		super.removingFromParent();
		parent.div.removeChild(_html);
	}
}
