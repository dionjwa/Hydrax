package com.pblabs.engine.core;

/**
  * Manager that listens for changes in the IPBContext
  */
class PBManagerBase
	implements IPBManager
{
	var context :IPBContext;
	var game :PBGameBase;
	
	public function new (game :PBGameBase)
	{
		com.pblabs.util.Assert.isNotNull(game);
		game.newActiveContextSignaler.bind(contextSwitched);
	}
	
	public function startup () :Void
	{
	    
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
	}
	
	function onContextRemoval () :Void
	{
	}
}
