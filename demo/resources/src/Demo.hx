package ;

import com.pblabs.components.scene.BaseScene2DLayer;
import com.pblabs.components.scene.ImageComponent;
import com.pblabs.components.scene.RectangleShape;
import com.pblabs.components.scene.SceneAlignment;
import com.pblabs.components.scene.SceneUtil;
import com.pblabs.components.scene.SceneView;
import com.pblabs.components.scene.js.canvas.CanvasLayer;
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
import com.pblabs.engine.resource.ImageResource;
import com.pblabs.engine.resource.ResourceManager;
import com.pblabs.engine.resource.Source;
import com.pblabs.util.ds.Tuple;
using com.pblabs.components.scene.SceneUtil;
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
		
		com.pblabs.util.Log.setupPBGameLog();
		com.pblabs.util.Log.setLevel("", com.pblabs.util.Log.WARNING);
		com.pblabs.util.Log.setLevel(ResourceManager, com.pblabs.util.Log.DEBUG);
		com.pblabs.util.Log.setLevel(ImageResource, com.pblabs.util.Log.DEBUG);
		
		#if (flash || cpp)
		game = new PBGame();
		#elseif js
		game = new com.pblabs.engine.core.JSGame();
		#end
		
		trace("Loading");
		// game.getManager(IResourceManager).addResource(new ImageResource("face", Source.embedded("face")));
		game.getManager(IResourceManager).addResource(new ImageResource("face", Source.url("../rsrc/face.png")));
		game.getManager(IResourceManager).load(startGame, function (e :Dynamic) {trace("Error loading: " + e);});
	}
	
	function startGame () :Void
	{
		trace("Resources loaded");
		var context = game.allocate(PBContext);
		game.pushContext(context);
		
		//Scene for game elements
		var gamescene = context.addSingletonComponent(SceneUtil.getPlatformSceneManagerClass());
		gamescene.sceneAlignment = SceneAlignment.CENTER;
		var layerCls = SceneUtil.getBasePlatformLayerClass();
		var backgroundlayer = gamescene.addLayer(layerCls, "background");
		var layer = gamescene.addLayer(layerCls, "defaultLayer");

		// randMove(createImage("image", backgroundlayer));
		// createImage("image", backgroundlayer);
		// randMove(createImage("image", layer));
		randMove(createRect("rect", layer));
		// createRect("rect", layer);
		gamescene.update();
		
		gamescene.rotation = 0.3;
		gamescene.zoom = 1.4;
		
	}
	
	function randMove (e :IEntity) :Void 
	{
		var sceneView = e.context.getManager(SceneView);
		var serial = new SerialTask();
		var parallel = new ParallelTask();
		var time = Math.random() * 5;
		time = Math.max(time, 2);
		parallel.addTask(LocationTask.CreateSmooth(Math.random() * sceneView.width,  Math.random() * sceneView.height,  time));
		parallel.addTask(AngleTask.CreateLinear(Math.random() * 6, time));
		serial.addTask(parallel);
		var self = this;
		serial.addTask(new FunctionTask(function () :Void {
			self.randMove(e);
		}));
		e.addTask(serial);
	}
	
	function createRect (name :String, layer :BaseScene2DLayer<Dynamic, Dynamic>) :IEntity
	{
		var context = layer.context;
		var e = context.createBaseSceneEntity(name);
		var c = context.allocate(RectangleShape);
		c.parentProperty = layer.entityProp();
		e.addComponent(c);
		e.deferring = false;
		return e;
	}
	
	function createImage (name :String, layer :BaseScene2DLayer<Dynamic, Dynamic>) :IEntity
	{
		var context = layer.context;
		var e = context.createBaseSceneEntity(name);
		var c = context.allocate(ImageComponent);
		c.resource = cast context.getManager(IResourceManager).getResource("face");
		c.parentProperty = layer.entityProp();
		e.addComponent(c);
		e.deferring = false;
		return e;
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
