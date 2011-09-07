package ;

import com.pblabs.components.input.InputManager;
import com.pblabs.components.input.MouseInputManager;
import com.pblabs.components.scene2D.BaseSceneComponent;
import com.pblabs.components.scene2D.BaseSceneLayer;
import com.pblabs.components.scene2D.BitmapRenderer;
import com.pblabs.components.scene2D.ImageComponent;
import com.pblabs.components.scene2D.SceneAlignment;
import com.pblabs.components.scene2D.SceneUtil;
import com.pblabs.components.scene2D.SceneView;
import com.pblabs.components.spatial.SpatialComponent;
import com.pblabs.components.tasks.AngleTask;
import com.pblabs.components.tasks.FunctionTask;
import com.pblabs.components.tasks.LocationTask;
import com.pblabs.components.tasks.ParallelTask;
import com.pblabs.components.tasks.SerialTask;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.core.PBGameBase;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ImageResources;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.engine.resource.ResourceType;
import com.pblabs.engine.resource.Source;
import com.pblabs.util.Rand;
import com.pblabs.util.ReflectUtil;
using com.pblabs.components.input.InputTools;
using com.pblabs.components.scene2D.ImageTools;
using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.components.tasks.TaskUtil;
using com.pblabs.engine.util.PBUtil;

class Demo 
{
	public function new() 
	{
		com.pblabs.engine.debug.Log.setup();
		game = new PBGame();
		
		game.registerManager(MouseInputManager, new MouseInputManager());
		#if js
		game.registerManager(com.pblabs.components.input.TouchInputManager, new com.pblabs.components.input.TouchInputManager());
		game.registerManager(com.pblabs.components.input.GestureInputManager, new com.pblabs.components.input.GestureInputManager());
		#end
		
		var images = new ImageResources();
		game.getManager(IResourceManager).addResource(images);
		
		#if flash
		images.add(new ResourceToken("avatar", Source.url("../rsrc/avatar.png"), ResourceType.IMAGE));
		#elseif js
		images.add(new ResourceToken("avatar", Source.url("rsrc/avatar.png"), ResourceType.IMAGE));
		#end
		
		game.registerManager(InputManager, new InputManager());
		
		game.getManager(IResourceManager).load(startGame, function (e :Dynamic) {trace("Error loading: " + e);});
	}
	
	function startGame () :Void
	{
		var input = game.getManager(InputManager);
		
		var context :PBContext = game.pushContext(PBContext);
		
		//Scene for game elements
		#if flash
		var gamescene = context.addSingletonComponent(com.pblabs.components.scene2D.flash.BitmapDataScene, null, true);
		#elseif js
		var gamescene = context.addSingletonComponent(SceneUtil.MANAGER_CLASS, null, true);
		#end
		// var gamescene = context.addSingletonComponent(com.pblabs.components.scene2D.flash.SceneManager, null, true);
		context.registerManager(SceneUtil.MANAGER_CLASS, gamescene, null, true);
		//The spatial component is for panning control
		gamescene.owner.addComponent(context.allocate(SpatialComponent), SpatialComponent.NAME);
		gamescene.owner.deferring = false;
		
		var gamelayer = gamescene.addLayer(SceneUtil.DEFAULT_LAYER_NAME);
		
		//Scene for the UI
		var uiscene = context.createBaseScene("UIScene");
		uiscene.sceneAlignment = SceneAlignment.TOP_LEFT;
		var uilayer = uiscene.addLayer("uilayer");
		
		//Use "using" for creation-method chaining
		var dude = context.createBaseSceneEntity()
			.addImage(gamelayer, new ResourceToken("avatar", Source.none, ResourceType.IMAGE))
			.initializeEntity("dude")
			.setScale(2, 4);
		randMove(dude);
		
		#if flash
		new com.bit101.components.FPSMeter(flash.Lib.current, 10, 10);
		#end
	}
	
	function randMove (e :IEntity) :IEntity 
	{
		var sceneView = e.context.getManager(SceneView);
		var serial = new SerialTask();
		var parallel = new ParallelTask();
		var time = Math.random() * 5;
		time = Math.max(time, 2);
		var sceneComp = e.getComponent(BaseSceneComponent);
		com.pblabs.util.Assert.isNotNull(sceneComp);
		
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
		return e;
	}
	
	public static function main() 
	{
		new Demo();
	}
	
	var game :PBGameBase;
}
