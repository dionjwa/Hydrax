package ;

import com.pblabs.components.input.InputManager;
import com.pblabs.components.input.MouseInputManager;
import com.pblabs.components.scene2D.BaseSceneComponent;
import com.pblabs.components.scene2D.BaseSceneLayer;
import com.pblabs.components.scene2D.SceneAlignment;
import com.pblabs.components.scene2D.SceneUtil;
import com.pblabs.engine.core.ObjectType;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.resource.BitmapCacheResource;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.engine.resource.ResourceType;
import com.pblabs.engine.resource.Source;
import com.pblabs.engine.resource.SvgResources;
import org.transition9.util.svg.SvgReplace;

using StringTools;

using com.pblabs.components.input.InputTools;
using com.pblabs.components.scene2D.HierarchyManager;
using com.pblabs.components.scene2D.ImageTools;
using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.components.tasks.TaskUtil;
using com.pblabs.engine.util.PBUtil;
using org.transition9.util.StringUtil;

class Demo  
{
	public function new() 
	{
		com.pblabs.engine.debug.Log.setup();
		game = new PBGame();
		
		
		game.registerManager(MouseInputManager, new MouseInputManager());
		#if js
		game.registerManager(com.pblabs.components.input.TouchInputManager, new com.pblabs.components.input.TouchInputManager());
		game.registerManager(com.pblabs.components.input.GestureInputManager, new com.pblabs.components.input.GestureInputManager());
		#end
		game.registerManager(InputManager, new InputManager());
		var input = game.getManager(InputManager);
		
		var svgs = game.allocate(SvgResources);
		game.getManager(IResourceManager).addResource(svgs);
		game.getManager(IResourceManager).addResource(game.allocate(BitmapCacheResource));
		
		//Add the embedded resources
		// org.transition9.util.Macros.embedBinaryDataResource("rsrc/anchors.svg", "anchors");
		org.transition9.util.Macros.embedBinaryDataResource("rsrc/anchors.svg", "anchors");
		svgs.add(new ResourceToken("anchors", Source.embedded("anchors"), ResourceType.SVG));
		
		org.transition9.util.Macros.embedBinaryDataResource("rsrc/button_01.svg", "button");
		svgs.add(new ResourceToken("button", Source.embedded("button"), ResourceType.SVG));

		org.transition9.util.Macros.embedBinaryDataResource("rsrc/button_01_down.svg", "button_down");
		svgs.add(new ResourceToken("button_down", Source.embedded("button_down"), ResourceType.SVG));

		org.transition9.util.Macros.embedBinaryDataResource("rsrc/icon.svg", "button_icon");
		svgs.add(new ResourceToken("button_icon", Source.embedded("button_icon"), ResourceType.SVG));

		org.transition9.util.Macros.embedBinaryDataResource("rsrc/text_center.svg", "text");
		svgs.add(new ResourceToken("text", Source.embedded("text"), ResourceType.SVG));

		org.transition9.util.Macros.embedBinaryDataResource("rsrc/tiger.svg", "tiger");
		svgs.add(new ResourceToken("tiger", Source.embedded("tiger"), ResourceType.SVG));

		org.transition9.util.Macros.embedBinaryDataResource("rsrc/ui_complete.svg", "ui_complete");
		svgs.add(new ResourceToken("ui_complete", Source.embedded("ui_complete"), ResourceType.SVG));
		
		game.getManager(IResourceManager).load(startGame, function (e :Dynamic) {trace(e);});
	}
	
	function startGame () :Void
	{
		var context :PBContext = game.pushContext(PBContext);
		var scene = context.addSingletonComponent(SceneUtil.MANAGER_CLASS);
		scene.sceneAlignment = SceneAlignment.TOP_LEFT;
		#if flash
		var layer :BaseSceneLayer<Dynamic, Dynamic> = scene.addLayer();
		#elseif js
		//Comment one of these to switch between css and canvas SVG rendering
		// var layer :BaseSceneLayer<Dynamic, Dynamic> = scene.addLayer(null, com.pblabs.components.scene2D.js.css.SceneLayer);
		var layer :BaseSceneLayer<Dynamic, Dynamic> = scene.addLayer();
		// var layer :BaseSceneLayer<Dynamic, Dynamic> = scene.addLayer(null, com.pblabs.components.scene2D.js.canvas.SceneLayer);
		#end
		
		var rootSvgToken = new ResourceToken("anchors", Source.embedded("anchors"), ResourceType.SVG);
		var uiblob = context.createBaseSceneEntity()
			.addImage(layer, rootSvgToken)
			.setObjectMask(ObjectType.NONE)
			.initializeEntity("uiblob")
			.setSceneAlignment(SceneAlignment.CENTER);
			
		for (ii in 1...4) {
			context.createBaseSceneEntity()
				.addSvg(layer, new ResourceToken("button", Source.embedded("button"), ResourceType.SVG), [new SvgReplace("\\$T", "Test" + ii)])
				.addSvg(layer, new ResourceToken("button_down", Source.embedded("button_down"), ResourceType.SVG), [new SvgReplace("\\$T", "Test" + ii + " Down")])
				.makeTwoStateButton()
				.initializeEntity("button" + ii)
				.setEntityAsDisplayChildOf(uiblob, rootSvgToken, "anchor" + ii);
		}
			
		
		#if flash
		drawGrid(flash.Lib.current.graphics, 100);
		#end
	}
	
	public static function main() 
	{
		new Demo();
	}

	#if flash	
	public static function drawGrid (graphics :flash.display.Graphics, size :Int, ?color :Int = 0x000000) :Void
    {
        var bars:Int = 10;
        graphics.lineStyle(1, color, 0.3);
        for( i in 0...bars) {
            graphics.moveTo( i * size, 0);
            graphics.lineTo( i * size, size * bars);

            graphics.moveTo(0, i * size);
            graphics.lineTo(size * bars, i * size);
        }
    }
    #end
	
	var game :PBGame;
}
