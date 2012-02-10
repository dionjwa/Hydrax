package com.pblabs.components.ui;

import com.pblabs.components.scene2D.BaseSceneLayer;
import com.pblabs.components.scene2D.BaseSceneManager;
import com.pblabs.components.scene2D.SceneAlignment;
import com.pblabs.components.scene2D.SceneUtil;
import com.pblabs.components.tasks.FunctionTask;
import com.pblabs.components.tasks.LocationTask;
import com.pblabs.components.tasks.SerialTask;
import com.pblabs.components.tasks.TaskComponent;
import com.pblabs.components.tasks.TaskComponentTicked;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGame;

using Lambda;

using StringTools;

using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.components.tasks.TaskUtil;
using com.pblabs.engine.util.PBUtil;
using org.transition9.util.StringUtil;

/**
  * A screen where you can scroll back, designed with smartphones in mind
  */
class PagedScreen extends PBContext
{
	public var titleLabel :String;
	/** If the titleLabel is too long */
	public var backLabel :String;
	
	var _backButton :IEntity;
	var _titlePanel :IEntity;
	var _layerBackground :BaseSceneLayer;
	var _layerForeground :BaseSceneLayer;
	
	public var scene (default, null) :BaseSceneManager;
	
	public function new ()
	{
		super();
		titleLabel = "Default Title";
		backLabel = titleLabel;
	}
	
	override public function setup () :Void
	{
		super.setup();
		
		scene = createBaseScene();
		
		#if js
		//For performance, menu scenes should use css layers, since most of the images are not moving.
		_layerBackground = scene.addLayer("background", com.pblabs.components.scene2D.js.css.SceneLayer);
		_layerForeground = scene.addLayer("foreground", com.pblabs.components.scene2D.js.css.SceneLayer);
		// _layerBackground = scene.addLayer("background");
		// _layerForeground = scene.addLayer("foreground");
		#elseif flash
		_layerBackground = scene.addLayer("background");
		_layerForeground = scene.addLayer("foreground");
		#end
		
		org.transition9.util.Assert.isNotNull(scene, ' scene is null');
		scene.owner.getTaskComponent();
		scene.autoSceneViewAttach = false;
		scene.sceneAlignment = SceneAlignment.TOP_LEFT;
		scene.visible = false;
		#if js
		if (getManager(PBGame).contexts.length > 0) {
			scene.x = 1000;
		}
		#end
		scene.update();
		
		
		// setupUI();
	}
	
	// function setupUI () :Void
	// {
	// 	createScene();
	// 	org.transition9.util.Assert.isNotNull(scene, ' scene is null');
	// 	scene.owner.getTaskComponent();
	// 	scene.autoSceneViewAttach = false;
	// 	scene.sceneAlignment = SceneAlignment.TOP_LEFT;
	// 	scene.visible = false;
	// 	#if js
	// 	scene.x = 1000;
	// 	#end
	// 	scene.update();
	// }
	
	// function createScene () :Void
	// {
	// 	scene = createBaseScene();
		
	// 	#if js
	// 	// _layerBackground = scene.addLayer("background", com.pblabs.components.scene2D.js.css.SceneLayer);
	// 	// _layerForeground = scene.addLayer("foreground", com.pblabs.components.scene2D.js.css.SceneLayer);
	// 	_layerBackground = scene.addLayer("background");
	// 	_layerForeground = scene.addLayer("foreground");
	// 	#elseif flash
	// 	_layerBackground = scene.addLayer("background");
	// 	_layerForeground = scene.addLayer("foreground");
	// 	#end
	// }
	
	override public function enter () :Void
	{
		super.enter();
		//Why?  Because inline svgs aren't automatically placed at the right position, so there is a 'flicker' of them at (0, 0)
		//This is a hack, if you haven't realized
		haxe.Timer.delay(function () :Void {
			scene.visible = true;
		}, 100);
		setTitle();
		createBackButton();
	}
	
	override function shutdown () :Void
	{
		super.shutdown();
		_backButton = null;
		_layerBackground = null;
		_layerForeground = null;
		scene = null;
	}
	
	function getBackButtonText () :String
	{
		var contextBelow = getPageBelow();
		if (contextBelow != null ) {
			return contextBelow.backLabel.isBlank() ? contextBelow.titleLabel : contextBelow.backLabel;
		} else {
			return "";
		}
	}
	
	public function getPageBelow () :PagedScreen
	{
		var game = getManager(PBGame);
		var contexts = game.contexts;
		
		var contextBelow = contexts[contexts.length - 2];
		if (contextBelow != null && Std.is(contextBelow, PagedScreen)) {
			return cast contextBelow;
		} else {
			return null;
		}
	}
	
	function setTitle () :Void
	{
		org.transition9.util.Log.error("subclasses must implement");
	}
	
	function createBackButton () :Void
	{
		
	}
}
