package com.pblabs.engine.core;

/**
  * Set up the usually required managers.
  */
class PBGameUtil
{
	public static function addBaseManagers (game :PBGame) :Void
	{
		// // Bring in the global managers.
		game.registerManager(SignalBondManager);
		
		// #if debug
		// org.transition9.util.Assert.isNotNull(game.getManager(SignalBondManager));
		// org.transition9.util.Assert.isNotNull(game.getManager(SignalBondManager).game);
		// #end
		
		#if (!nodejs && (flash || js || cpp))
		// game.registerManager(com.pblabs.components.scene2D.SceneView);
		#end
		game.registerManager(com.pblabs.engine.resource.IResourceManager, new com.pblabs.engine.resource.ResourceManager());
		game.registerManager(com.pblabs.engine.serialization.Serializer);
		game.registerManager(com.pblabs.engine.serialization.TemplateManager);
		game.registerManager(ObjectTypeManager);
		
		// #if (js && !nodejs)
		// //Sensible default
		// game.getManager(com.pblabs.components.scene2D.SceneView).layerId = "haxeSceneView";
		// #end
		
		//Input
		// game.registerManager(com.pblabs.components.input.MouseInputManager);
		// #if js
		// game.registerManager(com.pblabs.components.input.GestureInputManager);
		// game.registerManager(com.pblabs.components.input.TouchInputManager);
		// #end
		// game.registerManager(com.pblabs.components.input.InputManager);
	}
	
}
