package com.pblabs.editor;

import com.bit101.components.ComboBox;
import com.bit101.components.HBox;

import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IPBObject;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGameBase;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.util.Log;
import com.pblabs.util.Comparators;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

import flash.display.DisplayObjectContainer;

import flash.events.Event;

using Lambda;

using com.pblabs.util.IterUtil;

/**
  * Create new objects
  */
class CreationPanel extends HBox
{
	var creationComboBox :ComboBox;
	var game :PBGameBase;
	var creationCallbacks :Map<String, PropertyReference<Void->IEntity>>;
	
	public function new (parent :DisplayObjectContainer, game :PBGameBase)
	{
		super(parent);
		this.game = game;
		
		creationComboBox = new ComboBox(this, 0, 0, "none", []);
		var self = this;
		creationComboBox.addEventListener(Event.SELECT, function (e :Event) :Void {
			self.createObject(self.creationComboBox.selectedItem);
		});
		
		creationCallbacks = Maps.newHashMap(String);
	}
	
	/** The prop avoids a reference that would change when the context changes */
	public function addCreateEntityProperty (key :String, callbackProp :PropertyReference<Void->IEntity>) :Void
	{
	    creationCallbacks.set(key, callbackProp);
	    var keys = creationCallbacks.keys().toArray();
	    keys.sort(Comparators.compareStrings);
	    creationComboBox.items = keys;
	}
	
	dynamic public function objectSelected (obj :IPBObject) :Void
	{
		
	}
	
	function createObject (objectKey :String) :Void
	{
		var context :PBContext = cast game.currentContext;
		var prop = creationCallbacks.get(objectKey);
		if (prop == null) {
			Log.error("No creation callback for " + objectKey);
			return;
		}
		
		var createCallback = context.getProperty(prop);
		
		if (createCallback == null) {
			Log.error("No creation callback for property ref " + prop);
			return;
		}
		
		var e = createCallback();
		
		if (e == null) {
			Log.error("No entity created for prop " + prop);
			return;
		}
		
		//Place in the middle of the screen?
		objectSelected(e);
	}
}
