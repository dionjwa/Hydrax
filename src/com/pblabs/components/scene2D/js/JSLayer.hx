/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D.js;
import com.pblabs.components.scene2D.BaseSceneLayer;

class JSLayer extends BaseSceneLayer<JSSceneManager, SceneComponent>
{
	public var isDirty :Bool;
	public var isTransformDirty :Bool;
	
	public var div (default, null) :js.Dom.HtmlDom;
	
	public function new ()
	{
		super();
		isTransformDirty = true;
		isDirty = true;	
		div = cast js.Lib.document.createElement("DIV");
	}
	
	public function fixPosition () :Void
	{
		com.pblabs.util.Assert.isNotNull(div, "div is null");
		
		//Make sure the layers have an adjusted offset
		var offsetHeight = 0;
		var offsetWidth = 0;
		var sib = div.previousSibling;
		while (sib != null && sib != div) {
			offsetHeight += sib.offsetHeight;
			offsetWidth += sib.offsetWidth;
			sib = sib.previousSibling;
		}
		if (SceneView.isWebkitBrowser) {
			untyped div.style.webkitTransform = "translate(0px, -" + offsetHeight + "px)";
		} else {
			untyped div.style.MozTransform = "translate(0px, -" + offsetHeight + "px)";
		}
		
	}
	
	override function addedToParent () :Void
	{
		super.addedToParent();
		//Add to the HtmlDom container
		scene.setLayerIndex(this, scene.getLayerIndex(this));
	}
	
	override function removingFromParent () :Void
	{
		super.removingFromParent();
		if (div.parentNode != null) { 
			div.parentNode.removeChild(div);
		}
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		div = null;
	}
	
	override function onAdd () :Void
	{
		super.onAdd();
		div.id = name;
		div.style.cssText = "position:absolute;left:0px;top:0px;";
	}
}
