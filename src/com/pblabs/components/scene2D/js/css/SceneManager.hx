/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D.js.css;

import com.pblabs.components.scene2D.SceneView;
import com.pblabs.components.scene2D.js.JSSceneManager;
import com.pblabs.util.Preconditions;
import com.pblabs.util.Predicates;

import js.Dom;

import js.Lib;

using Lambda;

/**
  * Currently this is a placeholder class.
  */
class SceneManager extends JSSceneManager<SceneLayer>
{
    public function new ()
    {
        super();
    }
    
    override function updateTransform () :Void
	{
		for (layer in children) {
		    layer.updateTransform();
		}
		_transformDirty = false;
	}
}


