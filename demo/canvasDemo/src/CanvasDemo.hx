package;

import com.pblabs.components.scene.CircleShape;
import com.pblabs.components.scene.ImageComponent;
import com.pblabs.components.scene.SceneUtil;
import com.pblabs.components.scene.SceneView;
import com.pblabs.components.tasks.AngleTask;
import com.pblabs.components.tasks.LocationTask;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ImageResource;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.engine.resource.Source;
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
		var canvas = ctx.createBaseScene();
		
		var backLayer = canvas.addLayer("backlayer");
		var manLayer = canvas.addLayer("manlayer");
		
		var black = SceneUtil.createBaseSceneEntity(ctx);
		var blackDisplay = ctx.allocate(CircleShape);
		blackDisplay.parentProperty = backLayer.entityProp();
		black.addComponent(blackDisplay);
		black.initialize("background object");
		black.addTask(LocationTask.CreateEaseIn(100,  -100,  3));
		
		
		var man  = SceneUtil.createBaseSceneEntity(ctx);
		var image = ctx.allocate(ImageComponent);
		image.resource = cast new ResourceToken("man");
		image.parentProperty = manLayer.entityProp();
		man.addComponent(image);
		man.initialize("man object");
		
		man.setLocation(50, 50);
		
		man.addTask(LocationTask.CreateEaseIn(180,  180,  3));
		man.addTask(AngleTask.CreateLinear(4,  1));
	}
	
	public static function main ()
	{
		com.pblabs.engine.debug.Log.setupPBGameLog();
		new CanvasDemo();
	}
	
	var app :PBGame;
}
