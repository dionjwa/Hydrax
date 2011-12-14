package ;

import com.pblabs.components.input.DragManager;
import com.pblabs.components.input.IInputData;
import com.pblabs.components.input.InputManager;
import com.pblabs.components.input.MouseInputComponent;
import com.pblabs.components.input.MouseInputManager;
import com.pblabs.components.scene2D.BaseSceneComponent;
import com.pblabs.components.scene2D.BaseSceneLayer;
import com.pblabs.components.scene2D.BaseSceneManager;
import com.pblabs.components.scene2D.CircleShape;
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
import com.pblabs.components.tasks.TaskComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.core.PBGameBase;
import com.pblabs.engine.core.SetManager;
import com.pblabs.engine.injection.Injector;
import com.pblabs.engine.resource.BitmapCacheResource;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ImageResources;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.engine.resource.ResourceType;
import com.pblabs.engine.resource.Source;
import org.transition9.geom.Rectangle;
import org.transition9.geom.Vector2;
import org.transition9.util.Rand;
import org.transition9.util.ReflectUtil;
import org.transition9.ds.MultiMap;
import org.transition9.ds.Tuple;
import org.transition9.ds.multimaps.ArrayMultiMap;
using com.pblabs.components.tasks.TaskUtil;
using com.pblabs.engine.util.PBUtil;

class Demo  
{
	public function new() 
	{
		com.pblabs.engine.debug.Log.setup();
		game = new PBGame();
		
		#if js
		game.getManager(SceneView).layerId = "haxeSceneView";
		#end
		
		
		game.registerManager(MouseInputManager, new MouseInputManager());
		
		var rsrc = game.getManager(IResourceManager);
		rsrc.addResource(game.allocate(ImageResources));
		rsrc.addResource(game.allocate(BitmapCacheResource));
		#if js
		game.registerManager(com.pblabs.components.input.TouchInputManager, new com.pblabs.components.input.TouchInputManager());
		game.registerManager(com.pblabs.components.input.GestureInputManager, new com.pblabs.components.input.GestureInputManager());
		rsrc.add(new Resource("face", Source.url("../rsrc/face.png"), ResourceType.IMAGE));
		// rsrc.addResource(new ImageResource("face", Source.url("../rsrc/face.png")));
		#elseif flash
		rsrc.add(new Resource("face", Source.url("../rsrc/face.png"), ResourceType.IMAGE));
		rsrc.addResource(new ImageResource("face", Source.embedded("FACE")));
		#end
		game.registerManager(InputManager, new InputManager());
		
		rsrc.load(startGame, function (e :Dynamic) {trace("Error loading: " + e);});
	}
	
	function startGame () :Void
	{
		var input = game.getManager(InputManager);
		var context = game.pushContext(PBContext);
		
		#if flash
		//Lets use the Bitmap renderer for flash.
		// var gamescene = context.createBaseScene(null, false, true, com.pblabs.components.scene2D.flash.BitmapDataScene);
		var gamescene = SceneUtil.createBaseScene(context);
		#else
		var gamescene = SceneUtil.createBaseScene(context);
		#end
		var lowerLayer = gamescene.addLayer("lowerLayer");
		lowerLayer.parallaxFactor = 0.5;
		var layer = gamescene.addLayer("defaultLayer");
		
		//Scene for the UI
		var uiscene = SceneUtil.createBaseScene(context, "UIScene");
		uiscene.sceneAlignment = SceneAlignment.TOP_LEFT;
		var uilayer = uiscene.addLayer("uilayer");
		
		//FPS
		#if flash
		new com.bit101.components.FPSMeter(flash.Lib.current, 10, 10);
		#end
		
		
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
		org.transition9.util.Assert.isNotNull(sceneView, "??");
		#end
		SceneUtil.calculateOutPoint(outpoint, gamescene.sceneAlignment, sceneView.width, sceneView.height);
		var rect = new Rectangle(-outpoint.x, -outpoint.y, sceneView.width, sceneView.height);
		serial.addTask(LocationTask.CreateEaseOut(rect.left, rect.top, 3));
		serial.addTask(LocationTask.CreateEaseOut(rect.right, rect.top, 3));
		serial.addTask(LocationTask.CreateEaseOut(rect.right, rect.bottom, 3));
		serial.addTask(LocationTask.CreateEaseOut(rect.left, rect.bottom, 3));
		man.addTask(serial);
		SceneUtil.setAngle(man, 0.4);
		man.addTask(AngleTask.CreateLinear(3, 4));
		
		
		//Create a field of objects
		var men = 10;
		for (i in 0...men) {
			randMove(createBlob("man " + i, layer), Rand.nextBoolean());	
		}
		for (i in 0...men) {
			randMove(createBlob("man lower" + i, lowerLayer), Rand.nextBoolean());	
		}
		
		var panner = context.registerManager(DragManager);
		
		//Start scene panning on mouse down
		var input = context.getManager(InputManager);
		input.deviceDown.bind(function (d :IInputData) :Void {
			panner.panScene(gamescene);
		});
		
		#if flash
		//Keyboard input, flash only ATM
		hsl.avm2.plugins.KeyboardShortcuts.getKeyPressedDownSignaler(flash.Lib.current.stage).bind(
		function (k :hsl.haxe.data.keyboard.KeyCombination) :Void {
			if (k.keyCode == 90) {//z
				gamescene.zoom *= 1.1;
			} else if (k.keyCode == 88) {//x
				gamescene.zoom *= 0.9;
			}  
		});
		#end
		
	}
	
	function randMove (e :IEntity, continuous :Bool) :Void 
	{
		var sceneView = e.context.getManager(SceneView);
		var scene = e.getComponent(BaseSceneComponent).layer.scene;
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
		
		var c = context.allocate(ImageComponent);
		c.resource = cast new ResourceToken("face");
		
		c.parentProperty = layer.entityProp();
		man.addComponent(c);
	
		man.initialize(name);
		return man;
	}
	
	public static function main() 
	{
		new Demo();
	}
	
	var game :PBGameBase;
}
