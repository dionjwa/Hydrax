package ;

import com.pblabs.components.input.IInputData;
import com.pblabs.components.input.InputManager;
import com.pblabs.components.input.MouseInputComponent;
import com.pblabs.components.input.MouseInputManager;
import com.pblabs.components.input.PanManager;
import com.pblabs.components.scene.BaseSceneComponent;
import com.pblabs.components.scene.BaseSceneLayer;
import com.pblabs.components.scene.BaseSceneManager;
import com.pblabs.components.scene.CircleShape;
import com.pblabs.components.scene.ImageComponent;
import com.pblabs.components.scene.RectangleShape;
import com.pblabs.components.scene.SceneUtil;
import com.pblabs.components.scene.SceneView;
import com.pblabs.components.tasks.AngleTask;
import com.pblabs.components.tasks.FunctionTask;
import com.pblabs.components.tasks.LocationTask;
import com.pblabs.components.tasks.ParallelTask;
import com.pblabs.components.tasks.SerialTask;
import com.pblabs.components.tasks.TaskComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.core.PBGameBase;
import com.pblabs.engine.core.SetManager;
import com.pblabs.engine.injection.Injector;
import com.pblabs.engine.resource.EmbeddedResource;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ImageResource;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.engine.resource.Source;
import com.pblabs.geom.Rectangle;
import com.pblabs.geom.Vector2;
import com.pblabs.util.Rand;
import com.pblabs.util.ReflectUtil;
import com.pblabs.util.ds.MultiMap;
import com.pblabs.util.ds.Tuple;
import com.pblabs.util.ds.multimaps.ArrayMultiMap;
using com.pblabs.components.input.InputUtil;
using com.pblabs.components.scene.SceneUtil;
using com.pblabs.components.tasks.TaskUtil;
using com.pblabs.components.ui.UIUtil;
using com.pblabs.engine.util.PBUtil;

class Demo #if flash extends flash.display.Sprite #end 
{
	public function new() 
	{
		#if (flash || cpp)
		super();
		this.name = "Demo";
		#end
		
		com.pblabs.engine.debug.Log.setupPBGameLog();
		// com.pblabs.util.Log.setLevel(Injector, com.pblabs.util.Log.DEBUG);
		game = new PBGame();
		
		#if css
		game.getManager(SceneView).layerId = "haxe:screencss";
		#elseif js
		game.getManager(SceneView).layerId = "haxe:screencanvas";
		#end
		
		
		game.registerManager(MouseInputManager, new MouseInputManager());
		#if js
		game.registerManager(com.pblabs.components.input.TouchInputManager, new com.pblabs.components.input.TouchInputManager());
		game.registerManager(com.pblabs.components.input.GestureInputManager, new com.pblabs.components.input.GestureInputManager());
		game.getManager(IResourceManager).addResource(new ImageResource("face", Source.url("../rsrc/face.png")));
		#elseif flash
		game.getManager(IResourceManager).addResource(new ImageResource("face", Source.embedded("face")));
		#end
		game.registerManager(InputManager, new InputManager());
		
		game.getManager(IResourceManager).load(startGame, function (e :Dynamic) {trace("Error loading: " + e);});
	}
	
	function startGame () :Void
	{
		var input = game.getManager(InputManager);
		
		var context = game.allocate(PBContext);
		game.pushContext(context);
		
		var gamescene = context.createBaseScene();
		var lowerLayer = gamescene.addLayer("lowerLayer");
		lowerLayer.parallaxFactor = 0.5;
		var layer = gamescene.addLayer("defaultLayer");
		
		var man  = SceneUtil.createBaseSceneEntity(context);
		var c = context.allocate(ImageComponent);
		c.resource = cast new ResourceToken("face");
		c.parentProperty = layer.entityProp();
		man.addComponent(c);
		var manmouse = context.allocate(MouseInputComponent);
		manmouse.isRotatable = true;
		manmouse.isTranslatable = true;
		manmouse.isScalable = false;
		man.addComponent(manmouse);
		man.initialize("man");
		var serial = new SerialTask();
		
		var outpoint = new Vector2();
		var sceneView = gamescene.sceneView;
		#if debug
		com.pblabs.util.Assert.isNotNull(sceneView, "??");
		#end
		
		SceneUtil.calculateOutPoint(outpoint, gamescene.sceneAlignment, sceneView.width, sceneView.height);
		var rect = new Rectangle(-outpoint.x, -outpoint.y, sceneView.width, sceneView.height);
		serial.addTask(LocationTask.CreateEaseOut(rect.left, rect.top, 3));
		serial.addTask(LocationTask.CreateEaseOut(rect.right, rect.top, 3));
		serial.addTask(LocationTask.CreateEaseOut(rect.right, rect.bottom, 3));
		serial.addTask(LocationTask.CreateEaseOut(rect.left, rect.bottom, 3));
		man.addTask(serial);
		man.setAngle(0.4);
		man.addTask(AngleTask.CreateLinear(3, 4));
		
		
		//Create a field of objects
		var men = 10;
		for (i in 0...men) {
			randMove(createBlob("man " + i, layer), Rand.nextBoolean());	
		}
		for (i in 0...men) {
			randMove(createBlob("man lower" + i, lowerLayer), Rand.nextBoolean());	
		}
		
		var panner = context.registerManager(PanManager);
		
		//Start scene panning on mouse down
		var input = context.getManager(InputManager);
		input.deviceDown.bind(function (d :IInputData) :Void {
			panner.panScene(gamescene);
		});
		
	}
	
	function randMove (e :IEntity, continuous :Bool) :Void 
	{
		var sceneView = e.context.getManager(SceneView);
		var scene = e.getComponent(BaseSceneComponent).parent.parent;
		var serial = new SerialTask();
		var parallel = new ParallelTask();
		var time = Math.random() * 5;
		time = Math.max(time, 2);
		
		var outpoint = new Vector2();
		SceneUtil.calculateOutPoint(outpoint, scene.sceneAlignment, sceneView.width, sceneView.height);
		var randX = Rand.nextFloatInRange(-outpoint.x, -outpoint.x + sceneView.width);
		var randY = Rand.nextFloatInRange(-outpoint.y, -outpoint.y + sceneView.height);
		parallel.addTask(LocationTask.CreateSmooth(randX, randY,  time));
		parallel.addTask(AngleTask.CreateLinear(Math.random() * 6, time));
		serial.addTask(parallel);
		var self = this;
		if (continuous) {
			serial.addTask(new FunctionTask(function () :Void {
				self.randMove(e, continuous);
			}));
		}
		e.addTask(serial);
	}

	function createBlob (name :String, layer :BaseSceneLayer<Dynamic, Dynamic>) :IEntity
	{
		var context = layer.context;
		var man  = SceneUtil.createBaseSceneEntity(context);
		
		// var c = context.allocate(CircleShape);
		// var c = context.allocate(RectangleShape);
		// c.fillColor = Std.int(Rand.nextFloat() * 0xffffff);
		var c = context.allocate(ImageComponent);
		c.resource = cast new ResourceToken("face");
		
		c.parentProperty = layer.entityProp();
		man.addComponent(c);
	
		man.initialize(name);
		return man;
	}
	
	public static function main() 
	{
		#if flash
		flash.Lib.current.addChild(new Demo());
		#else
		new Demo();
		#end
	}
	
	var game :PBGameBase;
}
