package ;

import com.pblabs.components.input.InputManager;
import com.pblabs.components.input.MouseInputManager;
import com.pblabs.components.minimalcomp.Component;
import com.pblabs.components.minimalcomp.Container;
import com.pblabs.components.scene2D.BaseSceneComponent;
import com.pblabs.components.scene2D.CircleShape;
import com.pblabs.components.scene2D.ImageTools;
import com.pblabs.components.scene2D.SceneAlignment;
import com.pblabs.components.ui.BoxPanelImage;
import com.pblabs.components.ui.ScreenTransitions;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.ObjectType;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.core.PBGameBase;
import com.pblabs.engine.resource.BitmapCacheResource;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.Source;
import com.pblabs.engine.resource.SvgResources;
import org.transition9.util.svg.SvgReplace;

using Lambda;

using StringTools;

using com.pblabs.components.input.InputTools;
using com.pblabs.components.minimalcomp.MCompTools;
using com.pblabs.components.scene2D.HierarchyManager;
using com.pblabs.components.scene2D.ImageTools;
using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.components.tasks.TaskUtil;
using com.pblabs.components.ui.InputButtonOverlay;
using com.pblabs.components.util.ResetCallbacks;
using com.pblabs.engine.core.SignalBondManager;
using com.pblabs.engine.util.PBUtil;
using org.transition9.util.StringUtil;

class Demo  
{
	public function new() 
	{
		#if js
		haxe.Firebug.redirectTraces();
		// org.transition9.util.JsDebugUtil.traceToConsole(false);
		// trace("");
		// trace("");
		// trace("");
		// trace('js.Lib.window.screen.width=' + js.Lib.window.screen.width);
		// trace('js.Lib.window.screen.height=' + js.Lib.window.screen.height);
		#end
		
		com.pblabs.engine.debug.Log.setup();
		// org.transition9.util.Log.setLevel(com.pblabs.engine.time.ProcessManager, org.transition9.util.Log.DEBUG); 
		game = new PBGame();
		game.registerManager(MouseInputManager, new MouseInputManager());
		
		#if js
		game.registerManager(com.pblabs.components.input.TouchInputManager, new com.pblabs.components.input.TouchInputManager());
		game.registerManager(com.pblabs.components.input.GestureInputManager, new com.pblabs.components.input.GestureInputManager());
		
		#end
		game.registerManager(com.pblabs.components.input.OrientationManager, new com.pblabs.components.input.OrientationManager());
		game.registerManager(InputManager, new InputManager());
		var input = game.getManager(InputManager);
		
		var rsrc = game.getManager(IResourceManager);
		rsrc.addResource(game.allocate(SvgResources));
		rsrc.addResource(game.allocate(BitmapCacheResource));
		Resources.init();
		Resources.all.iter(rsrc.add);
		
		game.getManager(IResourceManager).load(startGame, function (e :Dynamic) {trace(e);});
		
		#if flash
		// haxe.Timer.delay(callback(org.transition9.util.DebugUtil.traceDisplayChildren, flash.Lib.current, " "), 2000);
		#end
	}
	
	function startGame () :Void
	{
		var context :DemoPagedScreen = game.pushContext(DemoPagedScreen);
		
		#if flash
		org.transition9.util.GraphicsUtil.drawGrid(flash.Lib.current.graphics, 0x0000, 100);
		#end
	}
	
	public static function main() 
	{
		new Demo();
	}

	var game :PBGameBase;
}


