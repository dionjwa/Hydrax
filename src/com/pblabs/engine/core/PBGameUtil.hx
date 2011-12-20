package com.pblabs.engine.core;

import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ResourceManager;
import com.pblabs.engine.serialization.Serializer;
import com.pblabs.engine.serialization.TemplateManager;

/**
  * Set up the usually required managers.
  */
class PBGameUtil
{
	public static function addBaseManagers (game :PBGame) :Void
	{
		// Bring in the global managers.
		game.registerManager(SignalBondManager);
		
		#if debug
		org.transition9.util.Assert.isNotNull(game.getManager(SignalBondManager));
		org.transition9.util.Assert.isNotNull(game.getManager(SignalBondManager).game);
		#end
		
		#if (!nodejs && (flash || js || cpp))
		game.registerManager(com.pblabs.components.scene2D.SceneView);
		#end
		game.registerManager(IResourceManager, new ResourceManager());
		game.registerManager(Serializer);
		game.registerManager(TemplateManager);
		game.registerManager(ObjectTypeManager);
		
		#if (js && !nodejs)
		//Sensible default
		game.getManager(com.pblabs.components.scene2D.SceneView).layerId = "haxeSceneView";
		#end
		
		//Input
		game.registerManager(com.pblabs.components.input.MouseInputManager);
		#if js
		game.registerManager(com.pblabs.components.input.TouchInputManager);
		game.registerManager(com.pblabs.components.input.GestureInputManager);
		#end
		game.registerManager(com.pblabs.components.input.InputManager);
	}
	
}
