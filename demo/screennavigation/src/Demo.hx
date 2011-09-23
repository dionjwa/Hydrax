package ;

import com.pblabs.components.input.InputManager;
import com.pblabs.components.input.MouseInputManager;
import com.pblabs.components.minimalcomp.Container;
import com.pblabs.components.minimalcomp.HBox;
import com.pblabs.components.scene2D.BaseSceneComponent;
import com.pblabs.components.scene2D.BaseSceneLayer;
import com.pblabs.components.scene2D.SceneAlignment;
import com.pblabs.components.scene2D.SceneUtil;
import com.pblabs.components.ui.ScreenTransitions;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.ObjectType;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.core.PBGameBase;
import com.pblabs.engine.resource.BitmapCacheResource;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.engine.resource.ResourceType;
import com.pblabs.engine.resource.Source;
import com.pblabs.engine.resource.SvgResources;
import com.pblabs.util.svg.SvgReplace;

using Lambda;

using StringTools;

using com.pblabs.components.input.InputTools;
using com.pblabs.components.minimalcomp.MCompTools;
using com.pblabs.components.scene2D.HierarchyManager;
using com.pblabs.components.scene2D.ImageTools;
using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.components.tasks.TaskUtil;
using com.pblabs.engine.util.PBUtil;
using com.pblabs.util.StringUtil;

class Demo  
{
	public function new() 
	{
		
		var width = untyped __js__("screen.width");
		// trace('width=' + width);
		com.pblabs.engine.debug.Log.setup();
		game = new PBGame();
		game.registerManager(MouseInputManager, new MouseInputManager());
		
		#if js
		// untyped {
		// 	jo.load();
		// }
		com.pblabs.util.JsDebugUtil.traceToConsole();
		game.registerManager(com.pblabs.components.input.TouchInputManager, new com.pblabs.components.input.TouchInputManager());
		game.registerManager(com.pblabs.components.input.GestureInputManager, new com.pblabs.components.input.GestureInputManager());
		game.registerManager(com.pblabs.components.input.OrientationManager, new com.pblabs.components.input.OrientationManager());
		#end
		game.registerManager(InputManager, new InputManager());
		var input = game.getManager(InputManager);
		
		
		var rsrc = game.getManager(IResourceManager);
		#if flash
		// rsrc.addResource(new com.pblabs.engine.resource.flash.SwfResource("resources", Source.url("../rsrc/resources.swf")));
		#end
		rsrc.addResource(game.allocate(SvgResources));
		rsrc.addResource(game.allocate(BitmapCacheResource));
		Resources.init();
		Resources.all.iter(rsrc.add);
		
		game.getManager(IResourceManager).load(startGame, function (e :Dynamic) {trace(e);});
	}
	
	function startGame () :Void
	{
		var context :DemoPagedScreen = game.pushContext(DemoPagedScreen);
		
		#if flash
		com.pblabs.util.GraphicsUtil.drawGrid(flash.Lib.current.graphics, 0x0000, 100);
		#end
	}
	
	public static function main() 
	{
		new Demo();
	}

	var game :PBGameBase;
}

class DemoPagedScreen extends com.pblabs.components.ui.PagedScreen
{
	static var CONTEXT :Int = 1;
	var _contextVbox :IEntity;
	
	public function new ()
	{
		super();
		name = titleLabel = "Screen " + (CONTEXT++);
	}
	
	override public function setup () :Void
	{
		super.setup();
		
		//Setup the context buttons
		var topCenter = _layerForeground.scene.getAlignedPoint(SceneAlignment.TOP_CENTER);
		topCenter.y += 200;
		var vboxButtons = createVBox(_layerForeground)
			.setLocation(topCenter.x, topCenter.y);
			// .setSceneAlignment(SceneAlignment.TOP_CENTER, _layerBackground);
			
			
		var game = getManager(PBGameBase);
		var jobs :Array<Dynamic> = [
			// "Pop context", callback(game.popContext, ScreenTransitions.scrollBack), 
			"Push context", callback(game.pushContext, DemoPagedScreen, ScreenTransitions.scrollForward),
			// "Push context", callback(game.pushContext, DemoPagedScreen, ScreenTransitions.scrollForward),
		];
		
		
		
		// untyped __js__('var button = new joButton("Awesome!")');
		// untyped __js__('var main = new joCard([ button ])');
		// untyped {
			// .selectEvent.subscribe(function() {
			// 	trace("You clicked a button");
			// });
			
			// dump the controls into a card
			// var main = new joCard([ button ]);
    	// }
		
		var ii = 0;
		while (jobs.length > 0) {
			var label :String = jobs.shift();
			var cb :Void->Void = jobs.shift();
			
			var randId = Std.int(Math.random() * 100000);
			
			createBaseSceneEntity()
				.addSvg(_layerForeground, Resources.list.BUTTON_TEXT_LINE, 
					[
						new SvgReplace("$replace", label),
						// new SvgReplace("fill:url(#linearGradient3800)", "fill:#ffffff"),
						new SvgReplace("fill:url(#linearGradient3291)", "fill:#ffffff"),
						
					], 
					"c1", false)
						
				.addSvg(_layerForeground, Resources.list.BUTTON_TEXT_LINE, 
					[
						new SvgReplace("$replace", label), 
						// new SvgReplace("fill:#ffffff;fill-opacity:1;stroke:#d9d9d9", "fill:#000000;fill-opacity:1;stroke:#d9d9d9"),
						new SvgReplace("text-anchor:start;fill:#000000", "text-anchor:start;fill:#ffffff"),
						// new SvgReplace("linearGradient3794", "linearGradient" + randId),
						// new SvgReplace("linearGradient3800", "linearGradient" + (randId + 5)),
						// new SvgReplace("stop3796", "stop" + (randId + 1)),
						// new SvgReplace("stop3798", "stop" + (randId + 2)),
						// new SvgReplace("id=\"svg2\"", "id=\"svg2" + (randId + 3) + "\""),
						// new SvgReplace("defs4", "defs" + (randId + 4)),
					],
					"c2", false, true)
				// .addSvg(_layerForeground, Resources.list.BUTTON_01, [new SvgReplace("$T", label)], "c1", false)
				// .addSvg(_layerForeground, Resources.list.BUTTON_01_DOWN, [new SvgReplace("$T", label)], "c2", false)
				.makeTwoStateButton()
				.setOnClick(cb)
				.addToComponentParent(vboxButtons)
				.invalidateOnOrientationChange()
				.initializeEntity("button");
			
			ii += 2;
		}
		
		_contextVbox = createVBox(_layerForeground)
			.addToComponentParent(vboxButtons);
			
		createEntity()
			.addSceneComponent(com.pblabs.components.scene2D.js.CustomHtml, _layerForeground)
			.initializeEntity("sdfsdf");
	}
	
	override public function enter () :Void
	{
		super.enter();
		for (childButton in _contextVbox.getComponent(Container).children.copy()) {
			childButton.owner.destroy();
		}
		
		
		//Create a menu for each context
		for (context in getManager(PBGameBase).contexts) {
			if (context == this) continue;
			
			
		}
	}
	
	override function createBackButton () :Void
	{
		if (_backButton != null) {
			_backButton.destroy();
			_backButton = null;
		}
		
		var topLeft = _layerForeground.scene.getAlignedPoint(SceneAlignment.TOP_LEFT);
		
		var text = getBackButtonText();
		
		if (text.isBlank()) {
			return;	
		}
		
		_backButton = createBaseSceneEntity()
			.addSvg(_layerForeground, Resources.list.BUTTON_BACK, [new SvgReplace("$T", text)], "c1", false)
			.addSvg(_layerForeground, Resources.list.BUTTON_BACK_DOWN, [new SvgReplace("$T", text)], "c2", false, true)
			// .addSvg(_layerForeground, Resources.list.BUTTON_BACK, [new SvgReplace("$T", text)], "c1")
			// .addSvg(_layerForeground, Resources.list.BUTTON_BACK_DOWN, [new SvgReplace("$T", text)], "c2")
			.makeTwoStateButton()
			.setOnClick(callback(getManager(PBGameBase).popContext, ScreenTransitions.scrollBack))
			.initializeEntity("backButton");
		_backButton.setLocation(topLeft.x + _backButton.getWidth() / 2 + 10, topLeft.y + _backButton.getHeight() / 2 + 8);
		// _backButton.setLocation(topLeft.x + _backButton.getWidth() / 2 + 100, topLeft.y + _backButton.getHeight() / 2 + 8);
	}
	
	override function setTitle () :Void
	{
		//Vbox for aligning components
		var vboxBackground = createVBox(_layerBackground)
			.setSceneAlignment(SceneAlignment.TOP_CENTER, _layerBackground);
			
		var vboxForeground = createVBox(_layerForeground)
			.setSceneAlignment(SceneAlignment.TOP_CENTER, _layerForeground);
			
		if (_titlePanel != null) {
			_titlePanel.destroy();
			_titlePanel = null;
		}
		_titlePanel = createBaseSceneEntity()
			.addSvg(_layerBackground, Resources.list.TITLEBAR, [new SvgReplace("$T", "")], null, false)
			.addToComponentParent(vboxBackground)
			.stretchToWidth()
			.setXToScreenProportion(0.5)
			.initializeEntity("titlebar");
		
		var titleText = createBaseSceneEntity()
			.addSvg(_layerForeground, Resources.list.TEXT_TITLE, 
				[
					new SvgReplace("$T", titleLabel),
					
				], null, false)
			.addToComponentParent(vboxForeground)
			.setXToScreenProportion(0.5)
			.initializeEntity("titletext");
			
		// var titletext = createBaseSceneEntity()
		// 	.addSvg(_layerBackground, Resources.list.TEXT_TITLE, [new SvgReplace("$T", "wetwetwetwet")], null, false)
		// 	.addToComponentParent(vboxBackground)
		// 	.initializeEntity("titletext");
		
		// var testtext = createBaseSceneEntity()
		// 	.addSvg(_layerBackground, Resources.list.TEXT_TEST, [new SvgReplace("$T", "sdfgsdfgsdfgsfd")], null, false)
		// 	.addToComponentParent(vboxBackground)
		// 	.initializeEntity("titletext");
			
		// _titlePanel.setWidth(_layerBackground.scene.sceneView.width);
	}

}
