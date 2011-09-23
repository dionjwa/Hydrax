package com.pblabs.components.input;

import com.pblabs.components.scene2D.Direction;
import com.pblabs.engine.core.EntityComponent;
import com.pblabs.engine.core.SignalBondManager;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

using com.pblabs.engine.util.PBUtil;

class InputListener extends EntityComponent
{
	
	var orientationSignaler (get_orientationSignaler, null) :Signaler<Int>;
	var _orientationSignaler :Signaler<Int>;
	function get_orientationSignaler () :Signaler<Int>
	{
		if (_orientationSignaler == null) {
			_orientationSignaler = new DirectSignaler(this);
		}
		return _orientationSignaler;
	}
	
	var _bonds :Array<hsl.haxe.Bond>;
	
	public function new ()
	{
		super();
		_bonds = [];
	}
	
	public function bindOrientationChange (callBack :Int->Void) :InputListener
	{
		com.pblabs.util.Assert.isNotNull(callBack);
		com.pblabs.util.Assert.isNotNull(orientationSignaler);
		_bonds.push(orientationSignaler.bind(callBack));
		return this;
	}

	public function clearListeners () :Void
	{
		for (bond in _bonds) {
			bond.destroy();
		}
		_bonds = [];
	}
	
	override function onReset () :Void
	{
		super.onReset();
		var input = context.ensureManager(OrientationManager);
		com.pblabs.util.Assert.isNotNull(input, "No OrientationManager?");
		SignalBondManager.bindSignal(this, input.orientationChange, onOrientationChangeInternal);
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		clearListeners();
	}
	
	
	function onOrientationChangeInternal (degrees :Int) :Void
	{
		_orientationSignaler.dispatch(degrees);
	}
	
	
	#if debug
	override public function toString () :String
	{
		return cast(owner, com.pblabs.engine.core.Entity).toString();
	}
	
	override public function postDestructionCheck () :Void
	{
		super.postDestructionCheck();
		if (_orientationSignaler != null) {
			com.pblabs.util.Assert.isFalse(_orientationSignaler.isListenedTo);
		}
	}
	#end
}
