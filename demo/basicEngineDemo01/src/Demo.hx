package;

import com.pblabs.components.base.AngleComponent;
import com.pblabs.components.base.LocationComponent;
import com.pblabs.components.debug.BlobDisplayComponent;
import com.pblabs.components.scene.flash.Scene2DManager;
import com.pblabs.components.tasks.LocationTask;
import com.pblabs.components.tasks.TaskComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.input.InputKey;
using com.pblabs.components.tasks.TaskUtil;
using com.pblabs.engine.util.PBUtil;

class Demo extends flash.display.Sprite 
{
    
    public function new() 
    {
        super();
        var game = new PBGame();
        game.startup();
        
        var context = game.allocate(PBContext);
        game.pushContext(context);
        
        var scene2D = context.addSingletonComponent(Scene2DManager);
        context.injector.mapValue(Scene2DManager, new PropertyReference("#Scene2DManager.Scene2DManager"), "Scene2DManager");
        
        var so = context.allocate(IEntity);
        so.initialize("SomeSceneObj");
        so.deferring = true;
        so.addComponent(context.allocate(LocationComponent));
        so.addComponent(context.allocate(AngleComponent));
        so.addComponent(context.allocate(BlobDisplayComponent));
        so.addComponent(context.allocate(TaskComponent));
        so.deferring = false;
        
        so.addTask(LocationTask.CreateEaseOut(100, 100, 3));
    }

    public static function main() 
    {
        flash.Lib.current.addChild(new Demo());
    }

}


