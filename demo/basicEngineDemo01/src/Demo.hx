package ;

import com.pblabs.components.scene2D.CircleShape;
import com.pblabs.components.scene2D.SceneAlignment;
import com.pblabs.components.spatial.SpatialComponent;
import com.pblabs.components.tasks.FunctionTask;
import com.pblabs.components.tasks.LocationTask;
import com.pblabs.components.tasks.RepeatingTask;
import com.pblabs.components.tasks.SerialTask;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGame;

import de.polygonal.motor2.geom.math.XY;

import com.pblabs.engine.core.SignalBondManager;

using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.components.tasks.TaskUtil;
using com.pblabs.engine.util.PBUtil;

using Lambda;

class Demo 
{
	public function new() 
	{
		//Setup logging.
		com.pblabs.engine.debug.Log.setup();
		
		
		var game = new PBGame();
		//The main "context".  This is equivalent to a level, or a menu screen.
		var context :PBContext = game.pushContext(PBContext);
		//This method is via 'using' SceneUtil
		var scene2D = context.createBaseScene();
		scene2D.sceneAlignment = SceneAlignment.TOP_LEFT;
		 var layer = scene2D.addLayer("defaultLayer");
		
		//Create our blob that we will move around.
		var so = context.createBaseSceneEntity();
		// var blob  = context.allocate(com.pblabs.components.scene2D.RectangleShape);
		var blob  = context.allocate(com.pblabs.components.scene2D.CircleShape);
		blob.radius = 30;
		blob.parentProperty = layer.entityProp();
		so.addComponent(blob);
		so.initialize("SomeSceneObj");
		
		//This method is via 'using' SceneUtil
		so.setLocation(50, 100);
		//This method is via 'using' TaskUtil
		so.addTask(new RepeatingTask(
			new SerialTask(
				LocationTask.CreateEaseOut(300, 300,3),
				LocationTask.CreateEaseOut(50, 300, 3)
			)
			));
			
		//Prevents the first frame have the location at (0,0)
		scene2D.update();
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
