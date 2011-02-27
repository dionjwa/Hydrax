package com.pblabs.components.scene;

import com.pblabs.components.manager.NodeComponent;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.util.ReflectUtil;

class SceneManagerList extends NodeComponent<Dynamic, BaseScene2DManager<Dynamic>>
{
	inline public static var NAME :String = ReflectUtil.tinyClassName(SceneManagerList);
	inline public static var PROP = new PropertyReference<SceneManagerList>("#" + NAME + "." + NAME);
	
	public function new ()
	{
		super();
	}
}
