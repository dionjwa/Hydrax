package;

import com.pblabs.components.scene.CircleShape;
import com.pblabs.components.tasks.LocationTask;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGame;
using com.pblabs.components.scene.SceneUtil;
using com.pblabs.components.tasks.TaskUtil;
using com.pblabs.engine.util.PBUtil;

class Demo #if (flash || cpp) extends flash.display.Sprite #end 
{
	public function new() 
	{
		#if (flash || cpp)
		super();
		#end
		
		#if (flash || cpp)
		flash.Lib.current.addChild(this);
		#end
	
		
		
		
		//Setup logging.
		com.pblabs.engine.debug.Log.setup();
		// com.pblabs.engine.debug.Log.setLevel(com.pblabs.engine.injection.Injector, com.pblabs.engine.debug.Log.DEBUG);
		
		var game = new PBGame();
		//The main "context".  This is equivalent to a level, or a menu screen.
		var context = game.allocate(PBContext);
		game.pushContext(context);
		var scene2D = context.createBaseScene();
		var layer = scene2D.addLayer("defaultLayer");
		
		//Create our blob that we will move around.
		var so = context.createBaseSceneEntity();
		var blob  = context.allocate(CircleShape);
		blob.parentProperty = layer.entityProp();
		so.addComponent(blob);
		so.initialize("SomeSceneObj");
		
		//Prevents the first frame have the location at (0,0)
		scene2D.update();
		so.addTask(LocationTask.CreateEaseOut(100, 200, 3));
	}

	public static function main() 
	{
		#if (flash || js)
		new Demo();
		#elseif cpp
		nme.Lib.create(function(){new Demo();},640,480,60,0xccccff,(1*nme.Lib.HARDWARE) | nme.Lib.RESIZABLE);
		#end
	}
}
