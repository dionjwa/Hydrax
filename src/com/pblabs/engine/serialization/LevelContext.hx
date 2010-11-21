/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file was derived from the equivalent actionscript PushButton Engine 
 * source file:
 * http://code.google.com/p/pushbuttonengine/
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.serialization;

	import com.pblabs.engine.core.PBContext;
	import com.pblabs.engine.debug.Log;
	import com.pblabs.engine.time.IProcessManager;
	import com.pblabs.engine.time.ProcessManager;
	
	/**
	 * Context which loads itself from a level XML file.
	 */
	class LevelContext extends PBContext {
		
		var _levelUrl:String;
		var _group:String;
		
		[Inject]
		public var templateManager:TemplateManager;
		
		[Inject]
		public var processManager:IProcessManager;
		
		public function new(name:String, levelUrl:String, ?group:String = null)
		{
			
			_group = "DefaultGroup";
			super(name);
			_levelUrl = levelUrl;
			
			if(group)
				_group = group;
		}

		override function initializeManagers():Void
		{
			super.initializeManagers();
			
			// Get our own template manager, separate from game.
			registerManager(TemplateManager, new TemplateManager());
			
			// After this function completes we get injected with our own injector.
		}
		
		public override function startup():Void
		{
			super.startup();
			
			// Pause the game until the level is loaded.
			processManager.timeScale = 0;
			
			// Load the level.
			templateManager.addEventListener(TemplateManager.LOADED_EVENT, onLevelLoaded);
			templateManager.loadFile(_levelUrl);
		}
		
		function onLevelLoaded(e:Dynamic):Void
		{
			Log.print(this, "Loaded " + _levelUrl + ", now instantiating " + _group);
			templateManager.removeEventListener(TemplateManager.LOADED_EVENT, onLevelLoaded);
			
			// Instantiate the default group.
			templateManager.instantiateGroup(this, _group);

			// And resume time.
			processManager.timeScale = 1;
		
		}
		
		public override function shutdown():Void
		{
			templateManager.unloadFile(_levelUrl);
			
			// Nuke our root group.
			super.shutdown();
		}
	}
