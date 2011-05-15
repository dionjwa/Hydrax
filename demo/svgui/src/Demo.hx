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
		var s = com.pblabs.util.PBMacros.embedBinaryDataResource("rsrc/anchors.svg", "anchors");
		com.pblabs.util.PBMacros.embedBinaryDataResource("rsrc/button_01.svg", "button");
		com.pblabs.util.PBMacros.embedBinaryDataResource("rsrc/button_01_down.svg", "button_down");
		com.pblabs.util.PBMacros.embedBinaryDataResource("rsrc/icon.svg", "button_icon");
		
		game.getManager(IResourceManager).load(startGame, function (e :Dynamic) {trace(e);});
		
	}
	
	function startGame () :Void
	{
		var context = game.allocate(PBContext);
		game.pushContext(context);
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
		
		//The hierarchy manager
		var hm = context.addSingletonComponent(HierarchyManager);
		
		//Create some widget that is automatically placed relative
		var uiblob = SceneUtil.createBaseSceneEntity(context);
		var c = context.allocate(SVGComponent);
		c.objectMask = ObjectType.NONE;
		c.resources = [EmbeddedResource.token("anchors")];
		
		c.parentProperty = layer.entityProp();
		uiblob.addComponent(c);
		uiblob.initialize("uilblob");
		uiblob.setLocation(uiblob.getWidth() / 2 + 30, uiblob.getHeight() / 2);
		c.visible = true;
		
		var svg1 = EmbeddedResource.token("button");
		var svg2 = EmbeddedResource.token("button_down");
		var svg3 = EmbeddedResource.token("button_icon");
		
		
		var button1 = layer.createTwoStateSVGButton([svg1, svg3], [svg2, svg3], "testButton", function () :Void {}, "Button 1", "!CLICKED");
		hm.setAsChild(c, "anchor1", button1.getComponent(BaseSceneComponent));
		
		var button2 = layer.createTwoStateSVGButton([svg1], [svg2], "testButton", function () :Void {}, "Button 2", "!CLICKED");
		hm.setAsChild(c, "anchor2", button2.getComponent(BaseSceneComponent));
		
		var button3 = layer.createTwoStateSVGButton([svg1], [svg2], "testButton", function () :Void {}, "Button 3", "!CLICKED");
		hm.setAsChild(c, "anchor3", button3.getComponent(BaseSceneComponent));
	}
	
	public static function main() 
	{
		new Demo();
	}
	
	var game :PBGameBase;
}
