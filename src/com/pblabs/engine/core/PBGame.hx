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
import com.pblabs.engine.time.IProcessManager;
import com.pblabs.engine.time.ProcessManager;

/**
  * Standard game.  Starts up the most commonly used
  * managers that provide functionality that most games require.
  */
  
#if flash
class PBGame extends PBGameBase 
{
	public function new() 
	{
		super();
		startup();
	}
	
	override function initializeManagers():Void
	{
		super.initializeManagers();

		// Register ourselves.
		registerManager(PBGameBase, this);
		
		// Bring in the standard managers.
		registerManager(NameManager, new NameManager());
		registerManager(IProcessManager, new ProcessManager());
		getManager(IProcessManager).isRunning = true;
		registerManager(SignalBondManager, new SignalBondManager());
		registerManager(SetManager, new SetManager());
		registerManager(com.pblabs.components.scene.SceneView, new com.pblabs.components.scene.SceneView());
		registerManager(IResourceManager, new ResourceManager());
		registerManager(Serializer, new Serializer());
		registerManager(TemplateManager, new TemplateManager());
		registerManager(ObjectTypeManager, new ObjectTypeManager());
	}
	
	public function registerType(clazz:Class<Dynamic>):Void
	{
		// NOP - passing it is enough for it to be linked into the SWF.
	}
}
#elseif js
/**
  * Minimal base game for Javascript games. 
  */
class PBGame extends PBGameBase
{
	public function new ()
	{
		super();
		startup();
	}
	
	override function initializeManagers():Void
	{
		super.initializeManagers();

		// Register ourselves.
		registerManager(PBGameBase, this);
		
		// Bring in the standard managers.
		registerManager(NameManager, new NameManager());
		registerManager(SignalBondManager, new SignalBondManager());
		registerManager(IProcessManager, new ProcessManager());
		getManager(IProcessManager).isRunning = true;
		registerManager(SetManager, new SetManager());
		registerManager(IResourceManager, new ResourceManager());
		registerManager(com.pblabs.components.scene.SceneView, new com.pblabs.components.scene.SceneView());
		registerManager(ObjectTypeManager, new ObjectTypeManager());
		registerManager(Serializer, new Serializer());
		registerManager(TemplateManager, new TemplateManager());
		//Sensible default
		getManager(com.pblabs.components.scene.SceneView).layerId = "screen";
	}
}
#end
