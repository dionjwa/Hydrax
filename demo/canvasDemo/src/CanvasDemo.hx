package;

import com.pblabs.components.scene.CircleShape;
import com.pblabs.components.scene.ImageComponent;
import com.pblabs.components.scene.SceneUtil;
import com.pblabs.components.scene.SceneView;
import com.pblabs.components.scene.js.canvas.Canvas2DComponent;
import com.pblabs.components.scene.js.canvas.CanvasLayer;
import com.pblabs.components.scene.js.canvas.CanvasScene2D;
import com.pblabs.components.tasks.AngleTask;
import com.pblabs.components.tasks.LocationTask;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ImageResource;
import com.pblabs.engine.resource.ResourceManager;
import com.pblabs.engine.resource.Source;
import com.pblabs.engine.resource.js.ImageResources;
import com.pblabs.engine.util.PBUtil;
import com.pblabs.util.Assert;
using com.pblabs.components.scene.SceneUtil;
using com.pblabs.components.tasks.TaskUtil;
using com.pblabs.engine.util.PBUtil;

class CanvasDemo
{
	public function new ()
	{
		app = new PBGame();
		Assert.isNotNull(app.getManager(SceneView));
		app.getManager(SceneView).layerId = "screen";
		var man = new ImageResource("man", Source.url("man.png"));
		app.getManager(IResourceManager).addResource(man);
		
		app.getManager(IResourceManager).load(onLoad, function (e :Dynamic) :Void {
			trace("Error loading " + e);
		});
	}
	
	function onLoad () :Void
	{
		var ctx = app.allocate(PBContext);
		Assert.isNotNull(ctx, "WTF, ctx is null");
		Assert.isNotNull(ctx.injector.parent, "Parent injector null");
		app.pushContext(ctx);
		var canvas = ctx.addSingletonComponent(CanvasScene2D);
		
		var backLayer = ctx.allocate(CanvasLayer);
		backLayer.parentProperty = canvas.componentProp();
		canvas.owner.addComponent(backLayer, "backlayer");
		
		var manLayer = ctx.allocate(CanvasLayer);
		manLayer.parentProperty = canvas.componentProp();
		canvas.owner.addComponent(manLayer, "manlayer"); 
		
		
		var black = SceneUtil.createBaseSceneEntity(ctx); 
		var blackDisplay = ctx.allocate(CircleShape);
		blackDisplay.parentProperty = backLayer.entityProp();
		black.addComponent(blackDisplay);
		black.initialize("background object");
		
		
		var man  = SceneUtil.createBaseSceneEntity(ctx);
		var image = ctx.allocate(ImageComponent);
		image.resource = cast ctx.getManager(IResourceManager).getResource("man");
		image.parentProperty = manLayer.entityProp();
		man.addComponent(image);
		man.initialize("man object");
		
		man.setLocation(50, 50);
		
		man.addTask(LocationTask.CreateEaseIn(200,  200,  3));
		man.addTask(AngleTask.CreateLinear(4,  1));
	}
	
	public static function main ()
	{
		com.pblabs.engine.debug.Log.setupPBGameLog();
		new CanvasDemo();
	}
	
	var app :PBGame;
	var images :ImageResources;
}
