package ;

import com.pblabs.components.input.InputManager;
import com.pblabs.components.input.MouseInputManager;
import com.pblabs.components.minimalcomp.Container;
import com.pblabs.components.scene2D.CircleShape;
import com.pblabs.components.scene2D.SceneAlignment;
import com.pblabs.components.ui.ScreenTransitions;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.core.PBGameBase;
import com.pblabs.engine.resource.BitmapCacheResource;
import com.pblabs.engine.resource.IResourceManager;
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
using com.pblabs.components.ui.InputButtonOverlay;
using com.pblabs.engine.util.PBUtil;
using com.pblabs.util.StringUtil;

class Demo  
{
	public function new() 
	{
		#if js
		com.pblabs.util.JsDebugUtil.traceToConsole(false);
		#end
		
		com.pblabs.engine.debug.Log.setup();
		game = new PBGame();
		game.registerManager(MouseInputManager, new MouseInputManager());
		
		#if js
		game.registerManager(com.pblabs.components.input.TouchInputManager, new com.pblabs.components.input.TouchInputManager());
		game.registerManager(com.pblabs.components.input.GestureInputManager, new com.pblabs.components.input.GestureInputManager());
		
		#end
		game.registerManager(com.pblabs.components.input.OrientationManager, new com.pblabs.components.input.OrientationManager());
		game.registerManager(InputManager, new InputManager());
		var input = game.getManager(InputManager);
		
		
		var rsrc = game.getManager(IResourceManager);
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
		
		addSingletonComponent(com.pblabs.components.ui.InputButtonOverlay);
		
		//Setup the context buttons
		var topCenter = _layerForeground.scene.getAlignedPoint(SceneAlignment.TOP_CENTER);
		topCenter.y += 200;
		_contextVbox = createVBox(_layerForeground)
			.addSceneComponent(BoxPanelImage, _layerForeground)
			
			.setLocation(topCenter.x, topCenter.y);
		_contextVbox.getComponent(BoxPanelImage).color = 0x000000;
		_contextVbox.getComponent(BoxPanelImage).dividerLineWidth = 0.5;
			
		var game = getManager(PBGameBase);
		var jobs :Array<Dynamic> = [
			"Push context", callback(game.pushContext, DemoPagedScreen, ScreenTransitions.scrollForward),
			"Pop context", callback(game.popContext, ScreenTransitions.scrollBack),
		];
		
		var ii = 0;
		while (jobs.length > 0) {
			var label :String = jobs.shift();
			var cb :Void->Void = jobs.shift();
			
			var randId = Std.int(Math.random() * 100000);
			
			//Button
			var button = createBaseSceneEntity()
				.addSvg(_layerForeground, Resources.list.BUTTON_ICON_LEFT,
					[
						new SvgReplace("$replace", label),
					], 
					"c1", false)
				.addSvg(_layerForeground, Resources.list.BUTTON_ICON_LEFT,
					[
						new SvgReplace("$replace", label), 
					],
					"c2", false, true)
				.makeTwoStateButton()
				.setOnClick(cb)
				.addToComponentParent(_contextVbox)
				.invalidateOnOrientationChange()
				.showOverlay()
				.initializeEntity("button");
			
			//Button icon
			createBaseSceneEntity()
				.addSceneComponent(CircleShape, _layerForeground)
				.initializeEntity("icon")
				.setEntityAsDisplayChildOf(button, Resources.list.BUTTON_ICON_LEFT, "anchor");
				
			ii += 2;
		}
		
		#if flash
		//Prevent flicker
		_layerForeground.scene.update();
		#end
		
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
			.makeTwoStateButton()
			.setOnClick(callback(getManager(PBGameBase).popContext, ScreenTransitions.scrollBack))
			.initializeEntity("backButton");
		_backButton.setLocation(topLeft.x + _backButton.getWidth() / 2 + 10, topLeft.y + _backButton.getHeight() / 2 + 8);
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
			.addToComponentParent(vboxBackground)
			.addSvg(_layerBackground, Resources.list.TITLEBAR, [new SvgReplace("$T", "")], null, false)
			.stretchToWidth()
			.initializeEntity("titlebar");
		
		var titleText = createBaseSceneEntity()
			.addSvg(_layerForeground, Resources.list.TEXT_TITLE, 
				[
					new SvgReplace("$T", titleLabel),
					
				], null, false)
			.addToComponentParent(vboxForeground)
			.setXToScreenProportion(0.5)
			.initializeEntity("titletext");
	}
}
