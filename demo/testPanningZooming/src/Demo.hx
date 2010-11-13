package ;

import com.pblabs.components.debug.BlobDisplayComponent;
import com.pblabs.components.input.GestureInputManager;
import com.pblabs.components.input.IInteractiveComponent;
import com.pblabs.components.input.InputManager;
import com.pblabs.components.input.MouseInputComponent;
import com.pblabs.components.input.MouseInputManager;
import com.pblabs.components.input.TouchInputManager;
import com.pblabs.components.scene.BaseScene2DManager;
import com.pblabs.components.scene.SceneUtil;
import com.pblabs.components.tasks.LocationTask;
import com.pblabs.components.tasks.SerialTask;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.core.SetManager;
import com.pblabs.geom.Vector2;
import com.pblabs.util.ReflectUtil;
import com.pblabs.util.ds.Tuple;
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
        var game = new PBGame();
        
        game.registerManager(MouseInputManager, new MouseInputManager());
        game.registerManager(TouchInputManager, new TouchInputManager());
        game.registerManager(GestureInputManager, new GestureInputManager());
        game.registerManager(InputManager, new InputManager());
        var input = game.getManager(InputManager);
        
        var context = game.allocate(PBContext);
        game.pushContext(context);
        var scene2D = context.addSingletonComponent(SceneUtil.getPlatformSceneManagerClass());
        // scene2D.sceneAlignment = SceneAlignment.TOP_LEFT;
        var layerCls = SceneUtil.getBasePlatformLayerClass();
        var layer = scene2D.addLayer(layerCls, "defaultLayer");

        #if jscss        
        var man  = SceneUtil.createBaseSceneEntity(context, "man");
        // var c = context.allocate(com.pblabs.components.scene.js.css.Circle);
        var c = context.allocate(BlobDisplayComponent);
        c.parentProperty = layer.entityProp();
        man.addComponent(c);
        man.deferring = false;
        var serial = new SerialTask();
        var width = cast(layer.parent, BaseScene2DManager<Dynamic>).sceneView.width;
        var height = cast(layer.parent, BaseScene2DManager<Dynamic>).sceneView.height;
        serial.addTask(LocationTask.CreateEaseOut(width, 0, 3));
        serial.addTask(LocationTask.CreateEaseOut(width, height, 3));
        serial.addTask(LocationTask.CreateEaseOut(0, height, 3));
        serial.addTask(LocationTask.CreateEaseOut(0, 0, 3));
        man.addTask(serial);
        #end
        
        
        
        var onclick = function () :Void {
            trace("clicked via the function");
        }
        
        layer.createZoomWidget(layer.parent, new Vector2(200, 350));
        layer.createRotateWidget(layer.parent, new Vector2(0, 0));
        layer.createScrollWidget(layer.parent, new Vector2(-250, 250));
        
    }
    
    public static function main() 
    {
        #if flash
        flash.Lib.current.addChild(new Demo());
        #else
        new Demo();
        #end
    }
}
