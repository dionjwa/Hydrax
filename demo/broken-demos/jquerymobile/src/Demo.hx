package ;

import com.pblabs.components.input.InputManager;
import com.pblabs.components.input.MouseInputManager;
import com.pblabs.components.iui.IUIScreen;
import com.pblabs.components.jquerymobile.JQueryMobileScreen;
import com.pblabs.components.scene2D.SceneAlignment;
import com.pblabs.components.scene2D.SceneUtil;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.resource.IResourceManager;

import js.Dom;

using JQueryMobile;

using com.pblabs.components.scene2D.ImageTools;
using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.components.tasks.TaskUtil;
using com.pblabs.engine.util.PBUtil;

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
		
		game.getManager(IResourceManager).load(startGame, function (e :Dynamic) {trace("Error loading: " + e);});
	}
	
	function startGame () :Void
	{
		var input = game.getManager(InputManager);
		var screen1 = game.pushContext(DemoScreen1);
		// var screen2 = game.pushContext(DemoScreen2);
		// var screen2 = game.pushContext(DemoScreen3);
		
		//Scene for game elements
		// var gamescene = context.createBaseScene();
		// gamescene.sceneAlignment = SceneAlignment.CENTER;
		// var layer = gamescene.addLayer(SceneUtil.DEFAULT_LAYER_NAME);
		
		// //Scene for the UI
		// var uiscene = context.createBaseScene("UIScene");
		// uiscene.sceneAlignment = SceneAlignment.TOP_LEFT;
		// var uilayer = uiscene.addLayer("uilayer");
		
		// context.createBaseSceneEntity()
			// .
		
	}
	
	public static function main() 
	{
		new Demo();
	}
	
	var game :PBGame;
	
	public static function showLinksTo (root :HtmlDom, classes :Array<Class<Dynamic>>) :Void
	{
		// root.innerHTML = "" + Math.random();
		var list :HtmlDom = js.Lib.document.createElement("ul");
		root.appendChild(list);
		for (cls in classes) {
			// root.nodeValue = "" + Math.random();
			var link :Link = cast js.Lib.document.createElement("a");
			// link.onclick = function (_) :Void {trace("clicked on " + Type.getClassName(cls));};
			link.title = "Link to " + Type.getClassName(cls);
			// link.nodeValue = "NodeValue: " + Type.getClassName(cls);
			link.href = "#" + org.transition9.rtti.ReflectUtil.tinyName(cls);
			// link.innerHTML = "Link to " + Type.getClassName(cls);
			link.appendChild(js.Lib.document.createTextNode("Link to " + Type.getClassName(cls)));
			var listItem = js.Lib.document.createElement("li");
			list.appendChild(listItem);
			listItem.appendChild(link);
		}
	}
}

class DemoScreen1 extends JQueryMobileScreen
{
	public function new ()
	{
		super();
	}
	
	override function get_title () :String
	{
		return "Demo1";
	}
	
	// override function createDiv () :Void
	// {
	// 	super.createDiv();
	// 	// Demo.showLinksTo(_div, cast [DemoScreen2, DemoScreen3]);
	// }
}

// class DemoScreen2 extends IUIScreen
// {
// 	override function get_title () :String
// 	{
// 		return "Demo2";
// 	}
	
// 	public function new ()
// 	{
// 		super();
// 	}
	
// 	override function createDiv () :Void
// 	{
// 		super.createDiv();
// 		Demo.showLinksTo(_div, cast [DemoScreen1, DemoScreen3]);
// 	}
// }

// class DemoScreen3 extends IUIScreen
// {
// 	override function get_title () :String
// 	{
// 		return "Demo3";
// 	}
	
// 	public function new ()
// 	{
// 		super();
// 	}
	
// 	override function createDiv () :Void
// 	{
// 		super.createDiv();
// 		Demo.showLinksTo(_div, cast [DemoScreen2, DemoScreen1]);
// 	}
// }
