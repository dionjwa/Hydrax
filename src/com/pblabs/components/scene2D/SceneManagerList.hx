/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D;
import com.pblabs.components.manager.NodeComponent;
import com.pblabs.engine.core.PropertyReference;
import org.transition9.rtti.ReflectUtil;

class SceneManagerList extends NodeComponent<Dynamic, BaseSceneManager<Dynamic>>
{
	inline public static var NAME :String = ReflectUtil.tinyName(SceneManagerList);
	inline public static var PROP = new PropertyReference<SceneManagerList>("#" + NAME + "." + NAME);
	
	public function new ()
	{
		super();
	}
}
