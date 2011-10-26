package com.pblabs.components.util;

import com.pblabs.engine.core.EntityComponent;
import com.pblabs.engine.core.IEntity;
using com.pblabs.engine.util.PBUtil;

/**
  * Utility class for storing and removing callbacks that 
  * are called during the 'onReset', but don't belong strongly to a 
  * particular component.
  */
class ResetCallbacks extends EntityComponent
{
	public static function addResetCallback (e :IEntity, cb :IEntity->Void) :IEntity
	{
		var callbacks = e.ensureComponent(ResetCallbacks);
		callbacks.resetCallbacks.push(cb);
		return e;
	}
	
	
	public var resetCallbacks :Array<IEntity->Void>;
	
	public function new ()
	{
		super();
		resetCallbacks = [];
	}
	
	override function onReset () :Void
	{
		super.onReset();
		for (cb in resetCallbacks) {
			cb(owner);
		}
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		resetCallbacks = [];
	}
}
