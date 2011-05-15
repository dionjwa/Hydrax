package ;

import com.pblabs.components.scene2D.CircleShape;
import com.pblabs.components.scene2D.SceneAlignment;
import com.pblabs.components.tasks.LocationTask;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGame;
using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.components.tasks.TaskUtil;
using com.pblabs.engine.util.PBUtil;

class Demo 
{
	public function new() 
	{
		//Setup logging.
		com.pblabs.engine.debug.Log.setup();
		
		var game = new PBGame();
		//The main "context".  This is equivalent to a level, or a menu screen.
		var context = game.allocate(PBContext);
		game.pushContext(context);
		var scene2D = context.createBaseScene();
		scene2D.sceneAlignment = SceneAlignment.CENTER;
		 var layer = scene2D.addLayer("defaultLayer");
		
		//Create our blob that we will move around.
		var so = context.createBaseSceneEntity();
		var blob  = context.allocate(com.pblabs.components.scene2D.RectangleShape);
		blob.parentProperty = layer.entityProp();
		so.addComponent(blob);
		so.initialize("SomeSceneObj");
		
		//Prevents the first frame have the location at (0,0)
		scene2D.update();
		so.addTask(LocationTask.CreateEaseOut(100, 200, 3));
		
		#if cpp
		var timer = new haxe.Timer(50);
		timer.run = function () :Void {
			trace(blob.x + ", " + blob.y);
		}
		#end
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
