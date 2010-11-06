package;

import com.pblabs.components.scene.SceneComponentUtil;
import com.pblabs.components.scene.SceneView;
import com.pblabs.components.scene.js.Canvas2DComponent;
import com.pblabs.components.scene.js.CanvasScene2D;
import com.pblabs.components.scene.js.CircleSprite;
import com.pblabs.components.scene.js.FilledSprite;
import com.pblabs.components.scene.js.ImageSprite;
import com.pblabs.components.tasks.AngleTask;
import com.pblabs.components.tasks.LocationTask;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ResourceManager;
import com.pblabs.engine.resource.js.ImageResources;
import com.pblabs.engine.util.PBUtil;
import com.pblabs.util.Assert;
using com.pblabs.components.scene.SceneComponentUtil;
using com.pblabs.components.tasks.TaskUtil;
using com.pblabs.engine.util.PBUtil;

class CanvasDemo
{
    public function new ()
    {
        app = new PBGame();
        Assert.isNotNull(app.getManager(SceneView));
        app.getManager(SceneView).layerId = "screen";
        var rsrc = new ResourceManager();
        app.registerManager(IResourceManager, rsrc);
        images = new ImageResources("jsimages", "./", [ "man.png" ]);
        rsrc.addResource(images);
        
        rsrc.load(onLoad, function (e :Dynamic) :Void {
            trace("Error loading " + e);
        });
    }
    
    function onLoad () :Void
    {
        var ctx = app.allocate(PBContext);
        Assert.isNotNull(ctx, "WTF, ctx is null");
        Assert.isNotNull(ctx.injector.parent, "Parent injector null");
        app.pushContext(ctx);
        app.run();
        var jsCanvas = ctx.addSingletonComponent(CanvasScene2D);
        var topLayer = "manlayer";
        jsCanvas.addLayer(topLayer);
        
        
        var black = SceneComponentUtil.createBaseSceneEntity(ctx, "background object"); 
        // ctx.allocate(AbstractSceneObject);
        // black.initialize("background object");
        var blackDisplay = ctx.allocate(Canvas2DComponent);
        blackDisplay.parentProperty = PBUtil.entityProp(jsCanvas);
        blackDisplay.sprite = new FilledSprite("#000000");
        black.addComponent(blackDisplay);
        black.deferring = false;
        
        
        var man  = SceneComponentUtil.createBaseSceneEntity(ctx, "man object");
        var manSprite = new ImageSprite(images.get("man.png"));
        manSprite.centerX = manSprite.width/2;
        manSprite.centerY = manSprite.height/2;
        var c = ctx.allocate(Canvas2DComponent);
        c.sprite = manSprite;
        c.layerName = topLayer;
        man.addComponent(c);
        man.deferring = false;
        man.setLocation(50, 50);
        
        man.addTask(LocationTask.CreateEaseIn(200,  200,  3));
        man.addTask(AngleTask.CreateLinear(4,  1));
        
        
        var circle = new CircleSprite(30);
        var circleObj  = SceneComponentUtil.createBaseSceneEntity(ctx, "circle");
        
        circle.fillStyle = "#0000ff";
        var circleComp = ctx.allocate(Canvas2DComponent);
        circleComp.sprite = circle;
        circleObj.addComponent(circleComp);
        circleObj.deferring = false;
        circleObj.setLocation(100, 50);
        return;
    }
    
    public static function main ()
    {
        com.pblabs.util.Log.setupPBGameLog();
        com.pblabs.util.Log.setLevel("", com.pblabs.util.Log.WARNING);
        // Log.setLevel("", Log.WARNING);
        new CanvasDemo();
    }
    
    var app :PBGame;
    var images :ImageResources;
}


