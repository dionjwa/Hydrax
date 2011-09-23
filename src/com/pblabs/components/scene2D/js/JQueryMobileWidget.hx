package com.pblabs.components.scene2D.js;

import com.pblabs.components.scene2D.BaseSceneComponent;

class HtmlWidget extends BaseSceneComponent<JSLayer>
{
	public var html :HtmlDom;
	
	public function new ()
	{
		super();
	}
	
	override public function addedToParent () :Void
	{
		super.addedToParent();
		com.pblabs.util.Assert.isNotNull(html, ' html is null');
		cast(layer, JSLayer).div.appendChild(html);
	}
	
	override public function removingFromParent () :Void
	{
		super.removingFromParent();
		#if debug
		com.pblabs.util.Assert.isNotNull(html);
		#end
		parent.div.removeChild(html);
	}
	
	override function set_visible (val :Bool) :Bool
	{
		super.set_visible(val);
		_isContentsDirty = true;
		div.style.visibility = _visible ? "visible" : "hidden";
		return val;
	}
}
