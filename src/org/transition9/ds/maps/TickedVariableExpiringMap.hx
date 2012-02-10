package org.transition9.ds.maps;

import com.pblabs.engine.time.IProcessManager;
import com.pblabs.engine.time.ITickedObject;
import org.transition9.util.Log;
import org.transition9.util.Preconditions;
import org.transition9.ds.Set;
import org.transition9.ds.maps.ExpiringEntry;
import org.transition9.ds.maps.LinkedMap;

/**
  * A map where keys expire at arbitrary times. 
  */
class TickedVariableExpiringMap<K, V> extends LinkedMap<K, V>,
	implements ITickedObject
{
	public var priority :Int;
	var _computeExpireTime :K->V->Int;
	var _expireHandler :K->V->Void;
	var _processManager :IProcessManager;
	var _addedToProcessManager :Bool;
	
	public static function createTickedVariableExpiringMapFunction <K, V>(processManager :IProcessManager, computeExpireTime :K->V->Int, ?expireHandler :K->V->Void = null) :Map<K, V>->Map<K, V>
	{
		return function (source :Map<K, V>) :Map<K, V> {
			return new TickedVariableExpiringMap(source, processManager, computeExpireTime, expireHandler); 
		}
	}
	
	public static function createTickedVariableExpiringSetFunction <T>(processManager :IProcessManager, computeExpireTime :Dynamic->Int, ?expireHandler :Dynamic->Void = null) :Map<T, Bool>->Map<T, Bool>
	{
		var setComputeExpireTime = function (val :T, Bool) :Int {
			return computeExpireTime(val);
		}
		var setExpireHandler = expireHandler != null ? function (key :T, val :Bool) :Void {
			expireHandler(key);
		} : function (key :T, val :Bool) :Void {};
		
		return function (source :Map<T, Bool>) :Map<T, Bool> {
			return new TickedVariableExpiringMap(source, processManager, setComputeExpireTime, setExpireHandler); 
		}
	}
	
	public function new (source :Map<K, V>, processManager :IProcessManager, computeExpireTime :K->V->Int, ?expireHandler :K->V->Void = null)
	{
		super(source);
		priority = 0;
		Preconditions.checkNotNull(computeExpireTime);
		Preconditions.checkNotNull(processManager);
		_processManager = processManager;
		_addedToProcessManager = false;
		_computeExpireTime = computeExpireTime;
		_expireHandler = expireHandler;
	}
	
	override public function remove (key :K) :V
	{
		if (!exists(key)) {
			trace("cannot remove non-existent key " + key);
			return null;
		}
	    var v = super.remove(key);
	    checkForEmptyMap();
	    return v;
	}
	
	override public function clear () :Void
	{
	    super.clear();
	    checkForEmptyMap();
	}
	
	override function newEntry (key :K, value :V) :LinkedEntry<K, V>
	{
		var ee = new ExpiringEntry<K, V>(key, value, _computeExpireTime(key, value));
		return ee;
	}
	
	override function addNewEntry (e :LinkedEntry<K, V>) :Void
	{
		var entry :ExpiringEntry<K, V> = cast e;
		//Add in order
		if (_anchor.after == _anchor) {
			entry.addBefore(_anchor);
		} else if (cast(_anchor.before, ExpiringEntry<Dynamic, Dynamic>).expireTime <= entry.expireTime) {
			//After previous entries
			entry.addAfter(_anchor.before);
		} else {
			var current = _anchor.after;
			while (current != _anchor) {
				var exp :ExpiringEntry<K, V> = cast current;
				if (entry.expireTime <= exp.expireTime) {
					entry.addBefore(exp);
					break;
				}
				current = current.after;
			}
		}
		addToTimer();
	}
	
	public function onTick (dt :Float) :Void
	{
		var now = getNow();
		var entry = _anchor.after;
		
		while (entry != _anchor) {
			var exp :ExpiringEntry<K, V> = cast entry;
			var untilExpire = exp.expireTime - now;
			if (untilExpire <= 0) {
				remove(exp.key);
				if (_expireHandler != null) {
					try {
						_expireHandler(exp.key, exp.value);
					} catch (e :Dynamic) {
						Log.warn("Error calling expire handler " + e);
					}
				} 
				else {
					trace("no expire handler");
				}

			}
			entry = entry.after;
	   }
	   checkForEmptyMap();
	}
	
	inline function checkForEmptyMap () :Void
	{
		if (_addedToProcessManager && _anchor.after == _anchor) {
	   	   _processManager.removeTickedObject(this);
	   	   _addedToProcessManager = false;
	   }
	}
	
	inline function addToTimer () :Void
	{
		if (!_addedToProcessManager && _anchor.after != _anchor) {
	   	   _processManager.addTickedObject(this);
	   	   _addedToProcessManager = true;
	   }
	}
	
	inline function getNow () :Int
	{
		return _processManager.virtualTime;	
	}
}
