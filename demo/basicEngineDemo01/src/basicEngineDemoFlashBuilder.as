package
{
	import com.pblabs.components.scene2D.BaseSceneLayer;
	import com.pblabs.components.scene2D.BaseSceneManager;
	import com.pblabs.components.scene2D.CircleShape;
	import com.pblabs.components.scene2D.SceneAlignment;
	import com.pblabs.components.scene2D.SceneUtil;
	import com.pblabs.components.tasks.LocationTask;
	import com.pblabs.components.tasks.RepeatingTask;
	import com.pblabs.components.tasks.SerialTask;
	import com.pblabs.components.tasks.TaskUtil;
	import com.pblabs.engine.core.IEntity;
	import com.pblabs.engine.core.PBContext;
	import com.pblabs.engine.core.PBGame;
	import com.pblabs.engine.core.PBGameUtil;
	import com.pblabs.engine.debug.Log;
	import com.pblabs.engine.util.PBUtil;
	
	import de.polygonal.core.math.Vec2;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	public class basicEngineDemoFlashBuilder extends Sprite
	{
		public function basicEngineDemoFlashBuilder()
		{
			var clip :MovieClip = new MovieClip();
			this.addChild(clip);
			haxe.init(clip);
			//Setup logging.
			com.pblabs.engine.debug.Log.setup();
			
			var game :PBGame = new PBGame();
			PBGameUtil.addBaseManagers(game);
			
			//The main "context".  This is equivalent to a level, or a menu screen.
			var context :PBContext = game.pushContext(PBContext) as PBContext;
			//This method is via 'using' SceneUtil
			var scene2D :BaseSceneManager = SceneUtil.createBaseScene(context);
			scene2D.sceneAlignment = SceneAlignment.TOP_LEFT;
			var layer :BaseSceneLayer = scene2D.addLayer("defaultLayer");
			
			
			
			//Create our blob that we will move around.
			var so :IEntity = SceneUtil.createBaseSceneEntity(context);
			// var blob  = context.allocate(com.pblabs.components.scene2D.RectangleShape);
			// blob.borderRadius = 10;
			var blob :CircleShape = context.allocate(com.pblabs.components.scene2D.CircleShape) as CircleShape;
			// blob.radius = 30;
			
			
			blob.fillColor = 0x00ff00;
			blob.width = 100;
			// blob.height = 300;
			blob.set_parentProperty(PBUtil.entityProp(layer));
			trace("blob.parentProperty=" + blob.parentProperty);
			so.addComponent(blob);
			so.initialize("SomeSceneObj");
			
			var topLeft :Vec2 = SceneUtil.getAlignedPoint(scene2D, SceneAlignment.TOP_LEFT);
			var topRight :Vec2 = SceneUtil.getAlignedPoint(scene2D, SceneAlignment.TOP_RIGHT);
			var bottomRight :Vec2 = SceneUtil.getAlignedPoint(scene2D, SceneAlignment.BOTTOM_RIGHT);
			var bottomLeft :Vec2 = SceneUtil.getAlignedPoint(scene2D, SceneAlignment.BOTTOM_LEFT);
			
			//This method is via 'using' SceneUtil
			SceneUtil.setLocation(so, 50, 100);
			//This method is via 'using' TaskUtil
			TaskUtil.addTask(so, new RepeatingTask(
				new SerialTask(
					LocationTask.CreateEaseOut(topLeft.x + blob.width / 2, topLeft.y + blob.height / 2, 2),
					LocationTask.CreateEaseOut(topRight.x - blob.width / 2, topRight.y + blob.height / 2, 2),
					LocationTask.CreateEaseOut(bottomRight.x - blob.width / 2, bottomRight.y - blob.height / 2, 2),
					LocationTask.CreateEaseOut(bottomLeft.x + blob.width / 2, bottomLeft.y - blob.height / 2, 2)
				)
			));
			
			//Prevents the first frame have the location at (0,0)
			scene2D.update();
			
			
		}
	}
}