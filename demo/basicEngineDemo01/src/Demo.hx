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
import com.pblabs.engine.core.SignalBondManager;

import de.polygonal.motor2.geom.math.XY;

using Lambda;

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
		var context :PBContext = game.pushContext(PBContext);
		//This method is via 'using' SceneUtil
		var scene2D = context.createBaseScene();
		scene2D.sceneAlignment = SceneAlignment.TOP_LEFT;
		var layer = scene2D.addLayer("defaultLayer");
		var layer_ = scene2D.addLayer("prev");
		
		//Create our blob that we will move around.
		var so = context.createBaseSceneEntity();
		// var blob  = context.allocate(com.pblabs.components.scene2D.RectangleShape);
		var blob  = context.allocate(com.pblabs.components.scene2D.CircleShape);
		blob.radius = 30;
		
		// blob.width = 100;
		// blob.height = 300;
		blob.parentProperty = layer.entityProp();
		so.addComponent(blob);
		so.initialize("SomeSceneObj");
		
		var topLeft = scene2D.getAlignedPoint(SceneAlignment.TOP_LEFT);
		var topRight = scene2D.getAlignedPoint(SceneAlignment.TOP_RIGHT);
		var bottomRight = scene2D.getAlignedPoint(SceneAlignment.BOTTOM_RIGHT);
		var bottomLeft = scene2D.getAlignedPoint(SceneAlignment.BOTTOM_LEFT);
		
		//This method is via 'using' SceneUtil
		so.setLocation(50, 100);
		//This method is via 'using' TaskUtil
		so.addTask(new RepeatingTask(
			new SerialTask(
				// LocationTask.CreateEaseOut(topLeft.x + blob.width / 2, topLeft.y + blob.height / 2, 2),
				// LocationTask.CreateEaseOut(topRight.x - blob.width / 2, topRight.y + blob.height / 2, 2),
				// LocationTask.CreateEaseOut(bottomRight.x - blob.width / 2, bottomRight.y - blob.height / 2, 2),
				// LocationTask.CreateEaseOut(bottomLeft.x + blob.width / 2, bottomLeft.y - blob.height / 2, 2)
				
				LocationTask.CreateEaseOut(topLeft.x, topLeft.y , 2),
				LocationTask.CreateEaseOut(topRight.x, topRight.y, 2),
				LocationTask.CreateEaseOut(bottomRight.x, bottomRight.y, 2),
				LocationTask.CreateEaseOut(bottomLeft.x, bottomLeft.y, 2)
				
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
