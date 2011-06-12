package ;

import com.pblabs.components.input.InputManager;
import com.pblabs.components.input.MouseInputComponent;
import com.pblabs.components.input.MouseInputManager;
import com.pblabs.components.scene2D.BaseSceneComponent;
import com.pblabs.components.scene2D.BaseSceneLayer;
import com.pblabs.components.scene2D.HierarchyManager;
import com.pblabs.components.scene2D.ImageComponent;
import com.pblabs.components.scene2D.SVGComponent;
import com.pblabs.components.scene2D.SceneAlignment;
import com.pblabs.components.scene2D.SceneUtil;
import com.pblabs.components.scene2D.SvgCache;
import com.pblabs.components.tasks.AngleTask;
import com.pblabs.components.tasks.LocationTask;
import com.pblabs.components.tasks.RepeatingTask;
import com.pblabs.components.tasks.SerialTask;
import com.pblabs.engine.core.ObjectType;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.core.PBGameBase;
import com.pblabs.engine.resource.EmbeddedResource;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ImageResource;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.engine.resource.Source;
import com.pblabs.util.ds.Tuple;

using StringTools;

using com.pblabs.components.input.InputUtil;
using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.components.tasks.TaskUtil;
using com.pblabs.components.ui.UIUtil;
using com.pblabs.engine.util.PBUtil;
using com.pblabs.util.StringUtil;
using com.pblabs.util.XMLUtil;

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
		
		game.getManager(IResourceManager).addResource(new com.pblabs.engine.resource.EmbeddedResource());
		
		//Add the embedded resources
		// com.pblabs.util.PBMacros.embedBinaryDataResource("rsrc/anchors.svg", "anchors");
		com.pblabs.util.PBMacros.embedBinaryDataResource("rsrc/anchors.svg", "anchors");
		
		com.pblabs.util.PBMacros.embedBinaryDataResource("rsrc/button_01.svg", "button");
		com.pblabs.util.PBMacros.embedBinaryDataResource("rsrc/button_01_down.svg", "button_down");
		com.pblabs.util.PBMacros.embedBinaryDataResource("rsrc/icon.svg", "button_icon");
		com.pblabs.util.PBMacros.embedBinaryDataResource("rsrc/text_center.svg", "text");
		com.pblabs.util.PBMacros.embedBinaryDataResource("../../lib/gm2d/samples/2-Svg/tiger.svg", "tiger");
		
		// com.pblabs.util.PBMacros.embedBinaryDataResource("rsrc/text_left.svg", "text");
		// com.pblabs.util.PBMacros.embedBinaryDataResource("rsrc/text_right.svg", "text");
		
		game.getManager(IResourceManager).load(startGame, function (e :Dynamic) {trace(e);});
		
	}
	
	function startGame () :Void
	{
		trace("start game");
		
		// trace(com.pblabs.util.ds.MapUtil.toString(SvgCache.parseAnchors(Xml.parse(haxe.Resource.getString("anchors")))));
		// return;
		// trace(Type.resolveClass("com.lorentz.SVG.display.SVGDocument"));
		// var svg = Type.createInstance(Type.resolveClass("com.lorentz.SVG.display.SVGDocument"), []);
		
		// var d = new xinf.xml.Document();
		// trace(haxe.Resource.getString("tiger"));
		// var svg = new gm2d.svg.SVG2Gfx(Xml.parse(haxe.Resource.getString("anchors")));
		// trace("adding svg");
		// var shape = svg.CreateShape();
		// flash.Lib.current.stage.addChild(shape);
      // shape.scaleX = shape.scaleY = 0.5;
		// shape.cacheAsBitmap = true;
		// addChild(shape);
      // makeCurrent();
		
		
		
		// return;
		var context :PBContext = game.pushContext(PBContext);
		var scene = context.addSingletonComponent(SceneUtil.MANAGER_CLASS);
		scene.sceneAlignment = SceneAlignment.TOP_LEFT;
		// scene.sceneView.layer.parent.removeChild(scene.sceneView.layer);
		#if flash
		var layer :BaseSceneLayer<Dynamic, Dynamic> = scene.addLayer();
		#elseif js
		//Comment one of these to switch between css and canvas SVG rendering
		// var layer :BaseSceneLayer<Dynamic, Dynamic> = scene.addLayer(null, com.pblabs.components.scene2D.js.css.SceneLayer);
		var layer :BaseSceneLayer<Dynamic, Dynamic> = scene.addLayer();
		// var layer :BaseSceneLayer<Dynamic, Dynamic> = scene.addLayer(null, com.pblabs.components.scene2D.js.canvas.SceneLayer);
		#end
		
		context.registerManager(SvgCache, new SvgCache());
		//The hierarchy manager
		var hm :HierarchyManager = context.addSingletonComponent(HierarchyManager);
		
		//Create some widget that is automatically placed relative
		var uiblob = SceneUtil.createBaseSceneEntity(cast context);
		var c = context.allocate(SVGComponent);
		c.objectMask = ObjectType.NONE;
		c.resources = [EmbeddedResource.token("anchors")];
		
		
		var svg1 = EmbeddedResource.token("button");
		var svg2 = EmbeddedResource.token("button_down");
		var svg3 = EmbeddedResource.token("button_icon");
		var svgtext = EmbeddedResource.token("text");
		
		c.parentProperty = layer.entityProp();
		uiblob.addComponent(c);
		uiblob.initialize("uilblob");
		// c.removeFromParent();
		// c.addToParent();
		uiblob.setLocation(uiblob.getWidth() / 2 + 30 + 300, uiblob.getHeight() / 2);
		// c.visible = true;
		
		
		
		
		var button1 = layer.createTwoStateSVGButton([svg1, svg3], [svg2, svg3], "testButton1", function () :Void {});
		hm.setAsChild(c, "anchor1", button1.getComponent(BaseSceneComponent));
		
		var button2 = layer.createTwoStateSVGButton([svg1], [svg2], "testButton2", function () :Void {});
		hm.setAsChild(c, "anchor2", button2.getComponent(BaseSceneComponent));
		
		var button3 = layer.createTwoStateSVGButton([svg1], [svg2], "testButton3", function () :Void {});
		hm.setAsChild(c, "anchor3", button3.getComponent(BaseSceneComponent));
		
		// var button3 = layer.createText(svgtext, "testButtonfockmen");
		
		// #if flash
		// drawGrid(flash.Lib.current.graphics, 100);
		// #end
		// hm.setAsChild(c, "anchor3", button3.getComponent(BaseSceneComponent));
		
		// c.owner.addTask(LocationTask.CreateLinear(c.x + 100, c.y + 100, 5));
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
	
	var game :PBGameBase;
}
