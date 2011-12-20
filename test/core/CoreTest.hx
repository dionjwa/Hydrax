package core;

import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.core.PBGameBase;
import com.pblabs.engine.core.SignalBondManager;

import org.transition9.util.Assert;

using Lambda;

using StringTools;

/**
 * Serialization tests
 */
class CoreTest 
{
	public function new() 
	{
	}
	
	@Before
	public function setup (cb :Void->Void) :Void
	{
		cb();
	}
	
	@After
	public function tearDown (cb :Void->Void) :Void
	{
		cb();
	}
	
	@Test
	public function testPBGameBaseInjection () :Void
	{
		com.pblabs.engine.debug.Log.setup();
		org.transition9.util.Log.setLevel("", org.transition9.util.Log.WARN);
		var game = new PBGameBase();
		
		game.registerManager(SignalBondManager);
		
		var signals :SignalBondManager = game.getManager(SignalBondManager);
		
		Assert.isNotNull(signals);
		Assert.isNotNull(signals.game);
		Assert.isTrue(signals == game.getManager(SignalBondManager));
	}
}
