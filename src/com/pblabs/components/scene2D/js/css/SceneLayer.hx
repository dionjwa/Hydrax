/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D.js.css;
import com.pblabs.components.scene2D.SceneUtil;
import com.pblabs.components.scene2D.js.JSLayer;
import com.pblabs.geom.Vector2;
import com.pblabs.util.Preconditions;

import js.Dom;

import js.Lib;

class SceneLayer extends JSLayer<SceneManager, SceneComponent>
{
    public var xOffset (get_xOffset, never) :Float;
    public var yOffset (get_yOffset, never) :Float;
    
    public function new ()
    {
        super();
        _tempPoint = new Vector2();
    }
    
	public function updateTransform () :Void
	{
		scene iew = parentsceneView;
		scene lignment = parent.sceneAlignment;
		// Center it appropriately.
		Preconditions.checkNotNull(_tempPoint);
		Preconditions.checkNotNull.sceneAlignment);
		Preconditions.checkNotNullsceneView);
		SceneUtil.calculateOutPoint(_tempPoint,.sceneAlignment,.sceneView.width,.sceneView.height);
		untyped div.style.webkitTransform = "translate(" + (_tempPoint.x) + "px, " + (_tempPoint.y) + "px) rotate(" + parent.rotation + "rad) scale(" + parent.zoom + ") translate(" + (parent.x * parallaxFactor) + "px, " + (parent.y * parallaxFactor) + "px)";
	}
	
	
    function get_xOffset () :Float
    {
        //TODO: actually compute the offsets.
        return 0;//div.parentNode.offsetLeft;//offsetWidth ;//- Std.parseInt(div.parentNode.style.width);
    }
    
    function get_yOffset () :Float
    {
        return 0;//div.parentNode.offsetTop;//div.offsetHeight ;//- Std.parseInt(div.parentNode.style.height);
        // return div.offsetHeight + div.parentNode.offsetHeight;
    }

    var _tempPoint :Vector2;    
}
