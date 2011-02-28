/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.core;
/**
  * Manager that listens for changes in the IPBContext.
  * Designed to be initialized in the PBGame, not the PBContext 
  */
class PBManagerBase
	implements IPBManager, implements haxe.rtti.Infos
{
	// @inject
	var context :IPBContext;
	@inject
	var game :PBGameBase;
	
	public function new ()
	{
		
	}
	
	public function startup () :Void
	{
	    com.pblabs.util.Assert.isNotNull(game, "No PBGameBase?");
		game.newActiveContextSignaler.bind(contextSwitched);
	}
	
	public function shutdown () :Void
	{
		onContextRemoval();
	    game.newActiveContextSignaler.unbind(contextSwitched);
	    game = null;
	    context = null;
	}
	
	function contextSwitched (c :IPBContext) :Void
	{
		if (context != null && context != c) {
			onContextRemoval();
		}
		context = c;
		if (context != null) {
			onNewContext();
		}
	}
	
	function onContextRemoval () :Void
	{
	}
	
	function onNewContext () :Void
	{
	}
}
