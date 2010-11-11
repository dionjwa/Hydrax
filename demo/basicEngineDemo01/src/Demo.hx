package;

import com.pblabs.components.base.AngleComponent;
import com.pblabs.components.base.LocationComponent;
import com.pblabs.components.debug.BlobDisplayComponent;
import com.pblabs.components.scene.flash.Scene2DManager;
import com.pblabs.components.scene.flash.SceneLayer;
import com.pblabs.components.tasks.LocationTask;
import com.pblabs.components.tasks.TaskComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.input.InputKey;
using com.pblabs.components.scene.SceneComponentUtil;
using com.pblabs.components.tasks.TaskUtil;
using com.pblabs.engine.util.PBUtil;

class Demo extends flash.display.Sprite 
{
    
    public function new() 
    {
        super();
        this.name = "Demo";
        var game = new PBGame();
        
        
        var context = game.allocate(PBContext);
        game.pushContext(context);
        var scene2D = context.addSingletonComponent(Scene2DManager);
        context.injector.mapValue(Scene2DManager, new PropertyReference("#Scene2DManager.Scene2DManager"), "Scene2DManager");
        var layer = scene2D.addLayer(SceneLayer, "defaultLayer");
        #if debug
        com.pblabs.util.Assert.isTrue(scene2D.owner.deferring == false);
        #end
        
        
        var so = context.createBaseSceneEntity("SomeSceneObj");
        // so.deferring = true;
        // so.addComponent(context.allocate(LocationComponent));
        // so.addComponent(context.allocate(AngleComponent));
        var blob  = context.allocate(BlobDisplayComponent);
        blob.parentProperty = layer.entityProp();
        so.addComponent(blob);
        
        // so.addComponent(context.allocate(TaskComponent));
        so.deferring = false;
        
        so.addTask(LocationTask.CreateEaseOut(100, 100, 3));
    }

    public static function main() 
    {
        flash.Lib.current.addChild(new Demo());
    }

}


