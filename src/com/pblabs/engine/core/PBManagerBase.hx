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
	implements IPBManager, implements haxe.rtti.Infos, implements de.polygonal.ds.Hashable
{
	var context :IPBContext;
	
	@inject("com.pblabs.engine.core.PBGameBase")
	var game :PBGameBase;
	
	/** Key for hashing. Don't modify. */
	public var key :Int;
	
	public function new () 
	{
		key = com.pblabs.engine.util.PBUtil.KEY_COUNT++;
	}
	
	public function startup () :Void
	{
		com.pblabs.util.Assert.isNotNull(game, "No PBGameBase?");
		game.signalContextEnter.bind(onNewContextInternal);
		game.signalContextExit.bind(onContextRemovedInternal);
		
		if (game.currentContext != null) {
			onNewContextInternal(game.currentContext);
		}
	}
	
	public function shutdown () :Void
	{
		com.pblabs.util.Assert.isNotNull(game);
		com.pblabs.util.Assert.isNotNull(game.signalContextEnter);
		com.pblabs.util.Assert.isNotNull(game.signalContextExit);
		game.signalContextEnter.unbind(onNewContextInternal);
		game.signalContextExit.unbind(onContextRemovedInternal);
		//Destroy signal bonds
		if (game.getManager(SignalBondManager) != null) {
			game.getManager(SignalBondManager).destroyBonds(this);
		}
		game = null;
		context = null;
		// com.pblabs.util.Assert.isTrue(context == null);
	}
	
	function onNewContextInternal (c :IPBContext) :Void
	{
		// com.pblabs.util.Assert.isNull(context, "onNewContextInternal, our current context should be null");
		if (context != null) {
			onContextRemovedInternal(context);
		}
		context = c;
		onNewContext();
	}
	
	function onContextRemovedInternal (c :IPBContext) :Void
	{
		com.pblabs.util.Assert.isNotNull(context, "onContextRemovedInternal, our current context should NOT be null");
		com.pblabs.util.Assert.isTrue(context == c, "Our local context var should match the removed context");
		onContextRemoval();
		context = null;
	}
	
	/** Subclasses override */
	function onContextRemoval () :Void
	{
	}
	
	/** Subclasses override */
	function onNewContext () :Void
	{
	}
}
