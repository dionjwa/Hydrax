package com.pblabs.components.scene.js;

import com.pblabs.components.scene.BaseScene2DComponent;
import com.pblabs.components.scene.BaseScene2DLayer;

import js.Dom;

import js.Lib;

class JSLayer <Scene :JSSceneManager<Dynamic>, Component :BaseScene2DComponent<Dynamic>> extends BaseScene2DLayer<Scene, Component>
{
    public var div (default, null) :HtmlDom;
    
    public function new ()
    {
        super();
    }
    
    public function fixPosition () :Void
    {
        //Make sure the layers have an adjusted offset
        var offsetHeight = 0;
        var offsetWidth = 0;
        var sib = div.previousSibling;
        while (sib != null || sib == div) {
            offsetHeight += sib.offsetHeight;
            offsetWidth += sib.offsetWidth;
            sib = sib.previousSibling;
        }
        untyped div.style.webkitTransform = "translate(0px, -" + offsetHeight + "px)";
    }
    
    override function addedToParent () :Void
    {
        super.addedToParent();
        //Add to the HtmlDom container
        parent.setLayerIndex(this, parent.getLayerIndex(this));
        fixPosition();
    }
    
    override function removingFromParent () :Void
    {
        super.removingFromParent();
        if (div.parentNode == parent.container) { 
            parent.container.removeChild(div);
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
        div = cast js.Lib.document.createElement("DIV");
        div.style.cssText = "position:relative;left:0px;top:0px;";
    }
}


