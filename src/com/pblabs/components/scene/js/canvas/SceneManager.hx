/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
#if !nodejs
package com.pblabs.components.scene.js.canvas;
import com.pblabs.components.scene.js.JSSceneManager;

class SceneManager extends JSSceneManager<SceneLayer>
{
	public function new ()
	{
		super();
	}
	
	override function updateTransform () :Void
	{
		for (layer in children) {
		    layer.isTransformDirty = true;
		}
		_transformDirty = false;
	}
}
#end
