package com.pblabs.editor;

import com.bit101.components.ComboBox;
import com.bit101.components.HBox;
import com.bit101.components.Label;
import com.bit101.components.VBox;

import com.pblabs.components.scene.SceneUtil;
import com.pblabs.components.spatial.SpatialComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IPBObject;
import com.pblabs.engine.core.NameManager;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGameBase;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.util.Comparators;
import com.pblabs.util.Log;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

import flash.display.DisplayObjectContainer;

import flash.events.Event;

using Lambda;

using com.pblabs.engine.util.PBUtil;
using com.pblabs.util.IterUtil;

/**
  * Create new objects
  */
class CreationPanel extends VBox
{
	var creationComboBox :ComboBox;
	var _imageCreationComboBox :ComboBox;
	var game :PBGameBase;
	var creationCallbacks :Map<String, PropertyReference<Void->IEntity>>;
	
	public function new (parent :DisplayObjectContainer, game :PBGameBase)
	{
		super(parent);
		this.game = game;
		new Label(this, 0, 0, "Create custom type:");
		creationComboBox = new ComboBox(this, 0, 0, "none", []);
		var self = this;
		creationComboBox.addEventListener(Event.SELECT, function (e :Event) :Void {
			self.createObject(self.creationComboBox.selectedItem);
		});
		
		new Label(this, 0, 0, "Create image:");
		_imageCreationComboBox = new ComboBox(this, 0, 0, "none", []);
		var self = this;
		_imageCreationComboBox.addEventListener(Event.SELECT, function (e :Event) :Void {
			self.createImage(self._imageCreationComboBox.selectedItem);
		});
		
		
		creationCallbacks = Maps.newHashMap(String);
	}
	
	public function setImageIds (imageIds :Array<String>) :Void
	{
	    _imageCreationComboBox.removeAll();
	    imageIds.sort(com.pblabs.util.Comparators.compareStrings);
	    for (id in imageIds) {
	    	_imageCreationComboBox.addItem(id);	
	    }
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
	
	function createImage (objectKey :String) :Void
	{
		var context :PBContext = cast game.currentContext;
		
		var e = context.allocate(IEntity);
		e.deferring = true;
		e.addComponent(context.allocate(SpatialComponent));
		var image = context.allocate(com.pblabs.components.scene.ImageComponent);
		
		var scene = context.getManager(SceneUtil.MANAGER_CLASS);
		com.pblabs.util.Assert.isNotNull(scene, "No scene");
		com.pblabs.util.Assert.isNotNull(scene.getLayerAt(0), "No layer at index=0");
		
		image.parentProperty = com.pblabs.engine.util.PBUtil.entityProp(scene.getLayerAt(0));
		image.resource = cast context.getManager(IResourceManager).getResource(objectKey);
		//Start the image with the same scale factor as the scene, to help with large scale factors
		image.scale = 1 / scene.zoom;
		e.addComponent(image);
		
		e.initialize(context.getManager(NameManager).validateName(objectKey));
		
		com.pblabs.util.Assert.isNotNull(image.layer, "After creating the image, no layer");
		com.pblabs.util.Assert.isNotNull(image.layer.parent, "After creating the image, no layer.parent");
		com.pblabs.util.Assert.isNotNull(image.layer.scene, "After creating the image, no layer.scene");
		
		//Place in the middle of the screen?
		objectSelected(e);
	}
}
