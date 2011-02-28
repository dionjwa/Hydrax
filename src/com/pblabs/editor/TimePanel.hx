/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.editor;
import com.bit101.components.CheckBox;
import com.bit101.components.FPSMeter;
import com.bit101.components.HBox;
import com.bit101.components.InputText;
import com.bit101.components.Label;
import com.bit101.components.PushButton;
import com.bit101.components.Window;

import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.PBGameBase;
import com.pblabs.util.Log;
import com.pblabs.engine.input.InputKey;
import com.pblabs.engine.time.IProcessManager;
import com.pblabs.engine.time.ProcessManager;

import flash.display.DisplayObjectContainer;

import flash.events.KeyboardEvent;
import flash.events.MouseEvent;

/**
  * Shows time related info.
  */
class TimePanel extends Window
{
	var pm :IProcessManager;
	var dtText :InputText;
	var pauseBox :CheckBox;
	
	public function new (parent :DisplayObjectContainer, game :PBGameBase)
	{
		super(parent, 0, 0, "TimePanel");
		//Use the current context IProcessManager 
		this.pm = game.currentContext == null ? null : game.currentContext.getManager(IProcessManager);
		//Also listen for context changes
		game.newActiveContextSignaler.bind(onNewContext);
		this.draggable = false;
		this.minimized = false;
		this.hasMinimizeButton = true;
		this.setSize(300, 50);
		
		var timeBox = new HBox(this.content, 0, 3);
		//Box for pausing the top mode
		var self = this;
		pauseBox = new CheckBox(timeBox, 0, 5, "Pause", function (e :MouseEvent) :Void {
			self.pm.isRunning = !self.pm.isRunning;
			self.pauseBox.selected = !self.pm.isRunning;
		});
		
		new Label(timeBox, 0, 0, "dt:");
		dtText = new InputText(timeBox, 0, 0, "0.03");
		dtText.setSize(pauseBox.width, pauseBox.height * 2);
		//Skip one frame
		new PushButton(timeBox, 0, 0, "Forward one update", callback(forwardOneUpdate));
		//Add the FPS meter after we're added to the stage.  Not the most Logical way to do it.
		haxe.Timer.delay(function () :Void {
			new FPSMeter(timeBox);
		}, 1000);
		
		//Pause on space or p
		flash.Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressed);
	}
	
	function onNewContext (ctx :IPBContext) :Void
	{
		pm = ctx.getManager(IProcessManager);
		com.pblabs.util.Assert.isNotNull(pm, "ProcessManager is null onNewContext");
		
	}
	
	public function forwardOneUpdate () :Void
	{
		if (pm == null) {
			Log.error("pm is null");
			return;
		}
		pm.isRunning = false;
		cast(pm, ProcessManager).advance(Std.parseFloat(dtText.text));
		pauseBox.selected = !pm.isRunning;
	}
	
	function keyPressed (e :KeyboardEvent) :Void
	{
		//Space key pauses or increments one time step if already paused
		if (e.charCode == InputKey.SPACE.keyCode) {
			forwardOneUpdate();
		}
	}
}
