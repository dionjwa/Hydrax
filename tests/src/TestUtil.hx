package ;

import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGame;

class TestUtil
{
	public static function createContext () :PBContext
	{
		var game = new PBGame();
		var ctx :PBContext = game.allocate(PBContext);
		game.pushContext(ctx);
		com.pblabs.util.Assert.isTrue(ctx == game.currentContext);
		return ctx;
	}
	
}
