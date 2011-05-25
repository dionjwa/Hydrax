/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file was derived from the equivalent actionscript PushButton Engine 
 * source file:
 * http://code.google.com/p/pushbuttonengine/
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.core;

import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ResourceManager;
import com.pblabs.engine.serialization.Serializer;
import com.pblabs.engine.serialization.TemplateManager;

/**
  * Standard game.  Starts up the most commonly used
  * managers that provide functionality that most games require.
  */
class PBGame extends PBGameBase 
{
	public function new() 
	{
		super();
	}
	
	override function initializeManagers():Void
	{
		super.initializeManagers();

		// Register ourselves.
		registerManager(PBGameBase, this);
		
		// Bring in the global managers.
		registerManager(SignalBondManager, new SignalBondManager());
		
		registerManager(com.pblabs.engine.pooling.ObjectPoolMgr, new com.pblabs.engine.pooling.ObjectPoolMgr());
		#if (!nodejs && (flash || js || cpp)) 
		registerManager(com.pblabs.components.scene2D.SceneView, new com.pblabs.components.scene2D.SceneView());
		#end
		registerManager(IResourceManager, new ResourceManager());
		registerManager(Serializer, new Serializer());
		registerManager(TemplateManager, new TemplateManager());
		registerManager(ObjectTypeManager, new ObjectTypeManager());
		
		#if (js && !nodejs)
		//Sensible default
		getManager(com.pblabs.components.scene2D.SceneView).layerId = "haxeSceneView";
		#end
	}
}
