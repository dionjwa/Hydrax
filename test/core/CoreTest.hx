package core;

import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.core.PBObject;
import com.pblabs.engine.core.SignalBondManager;

import org.transition9.util.Assert;

using Lambda;

using StringTools;

using com.pblabs.engine.core.PBGameUtil;

/**
 * Serialization tests
 */
class CoreTest 
{
	public function new() 
	{
		com.pblabs.engine.debug.Log.setup();
		org.transition9.util.Log.setLevel("", org.transition9.util.Log.WARN);
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
		var game = new PBGame();
		
		game.registerManager(SignalBondManager);
		
		var signals :SignalBondManager = game.getManager(SignalBondManager);
		
		Assert.isNotNull(signals);
		Assert.isNotNull(signals.game);
		Assert.isTrue(signals == game.getManager(SignalBondManager));
		
		var context :IPBContext = game.pushContext(PBContext);
		
		var obj = context.allocate(PBObject);
		Assert.isNotNull(obj.context);
		Assert.isTrue(obj.context == context);
	}
	
	@Test
	public function testPBGameBaseInjection2 () :Void
	{
		var game = new PBGame();
		
		game.addBaseManagers();
		
		var signals = game.getManager(SignalBondManager);
		
		Assert.isNotNull(signals);
		Assert.isNotNull(signals.game);
		Assert.isTrue(signals == game.getManager(SignalBondManager));
	}
}
