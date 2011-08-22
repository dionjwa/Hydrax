package;

import com.pblabs.components.scene2D.CircleShape;
import com.pblabs.components.scene2D.ImageComponent;
import com.pblabs.components.scene2D.SceneUtil;
import com.pblabs.components.scene2D.SceneView;
import com.pblabs.components.tasks.AngleTask;
import com.pblabs.components.tasks.LocationTask;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ImageResource;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.engine.resource.ResourceType;
import com.pblabs.engine.resource.Source;
import com.pblabs.util.Assert;
using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.components.tasks.TaskUtil;
using com.pblabs.engine.util.PBUtil;

class CanvasDemo
{
	public function new ()
	{
		com.pblabs.engine.debug.Log.setup();
		app = new PBGame();
		Assert.isNotNull(app.getManager(SceneView));
		app.getManager(SceneView).layerId = "haxe:screen";
		var man = new ImageResource("man", Source.url("man.png"));
		var manResource = new ResourceToken("man", Source.url("man.png"), ResourceType.IMAGE, "man.png");
		app.getManager(IResourceManager).add(manResource);
		
		app.getManager(IResourceManager).load(onLoad, function (e :Dynamic) :Void {
			trace("Error loading " + e);
		});
	}
	
	function onLoad () :Void
	{
		var ctx : PBContext = app.pushContext(PBContext);
		Assert.isNotNull(ctx, "WTF, ctx is null");
		Assert.isNotNull(ctx.injector.parent, "Parent injector null");
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
		image.resource = new ResourceToken("man", Source.url("man.png"), ResourceType.IMAGE, "man.png");
		image.parentProperty = manLayer.entityProp();
		man.addComponent(image);
		man.initialize("man object");
		
		man.setLocation(50, 50);
		
		man.addTask(LocationTask.CreateEaseIn(180,  180,  3));
		man.addTask(AngleTask.CreateLinear(4,  1));
	}
	
	public static function main ()
	{
		com.pblabs.engine.debug.Log.setup();
		new CanvasDemo();
	}
	
	var app :PBGame;
}
