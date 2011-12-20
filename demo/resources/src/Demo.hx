package ;

import com.pblabs.components.scene2D.BaseSceneComponent;
import com.pblabs.components.scene2D.BaseSceneLayer;
import com.pblabs.components.scene2D.ImageComponent;
import com.pblabs.components.scene2D.RectangleShape;
import com.pblabs.components.scene2D.SceneAlignment;
import com.pblabs.components.scene2D.SceneUtil;
import com.pblabs.components.scene2D.SceneView;
import com.pblabs.components.tasks.AngleTask;
import com.pblabs.components.tasks.FunctionTask;
import com.pblabs.components.tasks.LocationTask;
import com.pblabs.components.tasks.ParallelTask;
import com.pblabs.components.tasks.SerialTask;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.NameManager;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.core.SetManager;
import com.pblabs.engine.core.SignalBondManager;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ImageResources;
import com.pblabs.engine.resource.ResourceManager;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.engine.resource.ResourceType;
import com.pblabs.engine.resource.Source;
import com.pblabs.engine.time.IProcessManager;
import com.pblabs.engine.time.ProcessManager;
import Vec2;
import org.transition9.util.Rand;
import org.transition9.ds.Tuple;

using com.pblabs.components.input.InputTools;
using com.pblabs.components.scene2D.ImageTools;
using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.components.tasks.TaskUtil;
using com.pblabs.engine.util.PBUtil;

class Demo #if flash extends flash.display.Sprite #end 
{
	public function new() 
	{
		#if (flash || cpp)
		super();
		this.name = "Demo Template";
		#end
		
		com.pblabs.engine.debug.Log.setup();
		
		game = new PBGame();
		
		var images = new ImageResources();
		game.getManager(IResourceManager).addResource(images);
		
		#if flash
		images.add(new ResourceToken("face", Source.url("../rsrc/face.png"), ResourceType.IMAGE));
		#elseif js
		images.add(new ResourceToken("face", Source.url("rsrc/face.png"), ResourceType.IMAGE));
		#end
		game.getManager(IResourceManager).load(startGame, function (e :Dynamic) {trace("Error loading: " + e);});
	}
	
	function startGame () :Void
	{
		var context :PBContext = game.pushContext(PBContext);
		
		//Scene for game elements
		var gamescene = context.createBaseScene();
		gamescene.sceneAlignment = SceneAlignment.TOP_LEFT;
		var backgroundlayer = gamescene.addLayer("background");
		var layer = gamescene.addLayer("defaultLayer");

		//Create image by loading a bitmap image		
		randMove(context.createBaseSceneEntity()
			.addImage(layer, new ResourceToken("face", Source.none, ResourceType.IMAGE))
			.initializeEntity("image"));
		
		randMove(context.createBaseSceneEntity()
			.addSceneComponentToEntity(RectangleShape, layer)
			.initializeEntity("rect"));
		
		gamescene.update();
	}
	
	function randMove (e :IEntity) :Void 
	{
		var sceneView = e.context.getManager(SceneView);
		var serial = new SerialTask();
		var parallel = new ParallelTask();
		var time = Math.random() * 5;
		time = Math.max(time, 2);
		var sceneComp = e.getComponent(BaseSceneComponent);
		org.transition9.util.Assert.isNotNull(sceneComp);
		
		var minX = sceneComp.layer.scene.getAlignedPoint(SceneAlignment.TOP_LEFT).x;
		var maxX = sceneComp.layer.scene.getAlignedPoint(SceneAlignment.TOP_RIGHT).x;
		var minY = sceneComp.layer.scene.getAlignedPoint(SceneAlignment.TOP_RIGHT).y;
		var maxY = sceneComp.layer.scene.getAlignedPoint(SceneAlignment.BOTTOM_RIGHT).y;
		
		var targetX = Rand.nextFloatInRange(minX, maxX);
		var targetY = Rand.nextFloatInRange(minY, maxY);
		
		parallel.addTask(LocationTask.CreateSmooth(targetX,  targetY,  time));
		parallel.addTask(AngleTask.CreateLinear(Math.random() * 6, time));
		serial.addTask(parallel);
		var self = this;
		serial.addTask(new FunctionTask(function () :Void {
			self.randMove(e);
		}));
		e.addTask(serial);
	}
	
	public static function main() 
	{
		new Demo();
	}
	
	var game :PBGame;
}
