/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.editor;
import com.bit101.components.AccordionExtended;
import com.bit101.components.ComboBox;
import com.bit101.components.HBox;
import com.bit101.components.HUISlider;
import com.bit101.components.Label;
import com.bit101.components.NumericStepper;
import com.bit101.components.Panel;
import com.bit101.components.ScrollPane;
import com.bit101.components.TextArea;
import com.bit101.components.UpdatingLabel;
import com.bit101.components.UpdatingList;
import com.bit101.components.VBox;
import com.bit101.components.Window;

import com.pblabs.components.input.InputManager;
import com.pblabs.components.manager.NodeComponent;
import com.pblabs.editor.CustomEditorPanelComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IEntityComponent;
import com.pblabs.engine.core.IPBObject;
import com.pblabs.engine.core.NameManager;
import com.pblabs.engine.core.PBGameBase;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.core.SetManager;
import com.pblabs.engine.util.PBUtil;
import com.pblabs.util.Comparators;
import com.pblabs.util.DisplayUtils;
import com.pblabs.util.Enumerable;
import com.pblabs.util.Log;
import com.pblabs.util.ReflectUtil;
import com.pblabs.util.SignalVar;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;

import flash.events.Event;
import flash.events.MouseEvent;

import hsl.haxe.Signal;

import net.amago.components.minimalcomp.VBox;

using IterTools;

using Lambda;

using ListTools;

using Reflect;

using Type;

using com.pblabs.engine.core.SetManager;
using com.pblabs.engine.util.PBUtil;
using com.pblabs.geom.bounds.BoundsUtil;
using com.pblabs.util.DisplayUtils;
using com.pblabs.util.IterUtil;
using com.pblabs.util.ReflectUtil;

using de.polygonal.gl.DisplayListIterator;

class EntityPanel extends HBox
{
	public var selectedObject :IPBObject;
	var game :PBGameBase;
	var _accordion :AccordionExtended;
	var _groupComboBox :ComboBox;
	var _customePanelsWindow :Window;
	var _entityList :com.bit101.components.List;
	var _componentList :com.bit101.components.List;
	var _textGutterPanel :Panel;
	
	var _editorFieldsWindow :Window;
	var _editorFieldsScrollPane :ScrollPane;
	var _customEntityPanelsBox :VBox;
	var _sets :SetManager;
	var _componentsWindowBox :VBox;
	
	public function new (root :DisplayObjectContainer, game :PBGameBase)
	{
		super(root);
		this.game = game;
		this.game.newActiveContextSignaler.bind(onContextLoad);
		if (game.currentContext != null) {
			onContextLoad(game.currentContext);
		}
	}
	
	function onContextLoad (c :com.pblabs.engine.core.IPBContext) :Void
	{
		this.removeAllChildren();
		_sets = c.getManager(SetManager);
		
		//Object selection
		_accordion = new AccordionExtended(this);
		_accordion.setSize(160, 450);
		
		var groupSelectorWindow = _accordion.getWindow(ENTITY_CHOOSER_WINDOW);
		groupSelectorWindow.title = "Entity Chooser";
		
		var componentWindow = _accordion.getWindow(COMPONENTS_WINDOW);
		componentWindow.title = "Components";
		_componentsWindowBox = new VBox(componentWindow.content);
		_componentsWindowBox.setSize(componentWindow.content.width, componentWindow.content.height);
		
		
		var groupLabel = new Label(groupSelectorWindow.content, 0, 0, "Group:");
		
		var self = this;
		//Object group selection
		_groupComboBox = new ComboBox(groupSelectorWindow.content, groupLabel.x + groupLabel.width, groupLabel.y, _sets.array());
		_groupComboBox.setSize(_accordion.width - groupLabel.width, _groupComboBox.height);
		_groupComboBox.addEventListener(MouseEvent.MOUSE_DOWN, function (e :Dynamic) :Void {
			self._groupComboBox.removeAll();
			self._groupComboBox.addItem(NONE_GROUP);
			var names = self._sets.array();
			names.sort(Comparators.compareStrings);
			for (n in names) {
				self._groupComboBox.addItem(n);
			}
		});
		_groupComboBox.addEventListener(Event.SELECT, function (e :Event) :Void {
			self.groupSelected(self._groupComboBox.selectedItem);
		});
		
		var entityListLabel = new Label(groupSelectorWindow.content, groupLabel.x, groupLabel.y + groupLabel.height, "Entity:");
		
		//Entity list
		_entityList = new com.bit101.components.List(groupSelectorWindow.content, _groupComboBox.x, entityListLabel.y + 5, getUngroupedObjectNames());
		_entityList.setSize(_groupComboBox.width, _entityList.height);
		_entityList.addEventListener(Event.SELECT, function (e :Event) :Void {
			self.objectNameSelected(self._entityList.selectedItem);
		});
		
		//Component list.  Clicking on a component calls trace(component.toString())
		var compListLabel = new Label(groupSelectorWindow.content, entityListLabel.x, _entityList.y + _entityList.height, "Comps:");
		_componentList = new com.bit101.components.List(groupSelectorWindow.content, _entityList.x, compListLabel.y + 5, []);
		_componentList.setSize(_groupComboBox.width, _entityList.height);
		_componentList.addEventListener(Event.SELECT, function (e :Event) :Void {
			if (Std.is(self.selectedObject, IEntity)) {
				var e = cast(self.selectedObject, IEntity);
				trace(Std.string(e.getComponentByName(self._componentList.selectedItem)));
			}
		});
		
		//Custom window left of the entity window
		_editorFieldsWindow = new Window(this, 0, 0, "Editor fields");
		_editorFieldsWindow.setSize(_accordion.width, _accordion.height);
		// _editorFieldsScrollPane = new ScrollPane(_editorFieldsWindow.content, _accordion.width, _accordion.height); 
		
		// showMouseWindow();
		_customePanelsWindow = new Window(this, 0, 0, "Custom panels from components");
		_customePanelsWindow.setSize(400, _accordion.height);
		
		//TextGutter
		_textGutterPanel = new Panel(_componentsWindowBox);
		_textGutterPanel.setSize(componentWindow.width, 100);
		
	}

	public function objectSelected (obj :IPBObject) :Void
	{
		if (selectedObject == obj) {
			return;
		}
		
		selectedObject = obj;
		
		com.pblabs.util.Assert.isNotNull(_componentsWindowBox);
		DisplayUtils.removeAllChildren(_componentsWindowBox);
		if (selectedObject == null) {
			return;
		}
		
		//Show the entity
		var nameLabel = new Label(_componentsWindowBox, 0, 0, "Object name: " + obj.name);
		var componentLabel = new Label(_componentsWindowBox, nameLabel.x, nameLabel.y + nameLabel.height, "Components: ");
		
		com.pblabs.util.Assert.isNotNull(_editorFieldsWindow);
		com.pblabs.util.Assert.isNotNull(_editorFieldsWindow.content);
		DisplayUtils.removeAllChildren(_editorFieldsWindow.content);
		var scrollPane = new ScrollPane(_editorFieldsWindow.content);
		scrollPane.setSize(_accordion.width, 300);
		var metadataVBox = new VBox(scrollPane.content);
		
		com.pblabs.util.Assert.isNotNull(_customePanelsWindow);
		com.pblabs.util.Assert.isNotNull(_customePanelsWindow.content);
		DisplayUtils.removeAllChildren(_customePanelsWindow.content);
		
		var self = this;
		if (Std.is(selectedObject, IEntity)) {
			var e :IEntity = cast(selectedObject);
			com.pblabs.util.Assert.isNotNull(e);
			var items = e.array().map(PBUtil.componentNameMapping).toArray();
			items.sort(Comparators.compareStrings);
			var componentList = new com.bit101.components.List(_componentsWindowBox, componentLabel.x, componentLabel.y + componentLabel.height, items);
			// componentList.setSize(250, 100);
			//Show component.toString() when selected
			componentList.addEventListener(Event.SELECT, function (d :Dynamic) :Void {
				var c :IEntityComponent = e.getComponentByName(componentList.selectedItem); 
				self.setTextGutter(Std.string(c));
			});
			
			_componentsWindowBox.addChild(_textGutterPanel);
			
			var components = new Array<DisplayObject>();
			com.pblabs.util.Assert.isNotNull(_editorFieldsWindow);
			com.pblabs.util.Assert.isNotNull(_editorFieldsWindow.content);
			showEntityMetaData(metadataVBox, e, new List<IEntity>(), components);
			
			//Add the custom panels, defined in the entity components itself
			_customEntityPanelsBox = new VBox(_customePanelsWindow.content);
			for (ent in NodeComponent.getEntityAndAllParents(e, null)) {
				for (c in ent.getComponentsByType(CustomEditorPanelComponent)) {
					_customEntityPanelsBox.addChildAt(c.panel, _customEntityPanelsBox.numChildren); 
				}
			}
		}
		
		//Show the entity component list
		_componentList.removeAll();
		if (Std.is(selectedObject, IEntity)) {
			var names = [];
			for (c in cast(selectedObject, IEntity)) {
				names.push(c.name);
			}
			names.sort(Comparators.compareStrings);
			for (name in names) {
				_componentList.addItem(name);
			}
		}
	}
	
	function groupSelected (name :String) :Void
	{
		_entityList.removeAll();
		var names = name == NONE_GROUP ? getUngroupedObjectNames() :  _sets.getObjectsInSet(name).map(PBUtil.objectNameMapping).toArray();
		names.sort(Comparators.compareStrings);
		for (name in names) {
			_entityList.addItem(name);
		}
	}
	
	function objectNameSelected (name :String) :Void
	{
		objectSelected(game.currentContext.getManager(NameManager).get(name));
	}
	
	function getUngroupedObjectNames () :Array<String>
	{
		var arr = new Array<String>();
		com.pblabs.util.Assert.isNotNull(game.currentContext);
		com.pblabs.util.Assert.isNotNull(game.currentContext.getManager(NameManager));
		for (obj in game.currentContext.getManager(NameManager)) {
			com.pblabs.util.Assert.isNotNull(obj);
			com.pblabs.util.Assert.isNotNull(obj.getSets(), "obj.getSets()");
			if (obj.getSets().array().length == 0) {
				arr.push(obj.name);
			}
		}
		arr.sort(Comparators.compareStrings);
		return arr;
	}
	
	/** Recursive */
	function showEntityMetaData (root :DisplayObjectContainer, e :IEntity, shown :List<IEntity>, components :Array<DisplayObject>, 
		?processed :Array<Dynamic> = null) :Void
	{
		processed = processed == null ? [] : processed;
		if (e == null || shown.has(e) || processed.has(e)) {
			return;
		}
		shown.add(e);
		processed.push(e);
		
		var cl = components.length;
		//Show the components on this entity
		for (c in e) {
			showEditableMetaData(root, c, components, processed);
		}
		
		if (cl != components.length) {
			components.insert(cl, new Label(root, 0, 0, "------" + e.name));
			root.setChildIndex(components[cl] , cl);
		}
		
		//Show the NodeComponent parents
		for (c in e) {
			if (Std.is(c, NodeComponent)) {
				var n :NodeComponent<NodeComponent<Dynamic, Dynamic>, Dynamic> = cast(c);
				n = cast n.parent;
				while (n != null) {
					components.push(new Label(root, 0, 0, "------" + n.owner.name + "." + n.name));
					showEditableMetaData(root, n, components, processed);
					n = cast n.parent;
				}
			}
		}
	}
	
	function showEditableMetaData (root :DisplayObjectContainer, component :IEntityComponent, 
		components :Array<DisplayObject>, processed :Array<Dynamic>) :Void
	{
		com.pblabs.util.Assert.isNotNull(processed);
		com.pblabs.util.Assert.isNotNull(component);
		if (processed.has(component)) {
			return;
		}
		processed.push(component);
		var cls :Class<Dynamic> = component.getClass();
		
		while (cls != null) {
			var m = haxe.rtti.Meta.getFields(cls);
			if (m != null) {
				var fields = Reflect.fields(m);
				com.pblabs.util.Assert.isNotNull(fields);
				fields.sort(Comparators.compareStrings);
				for (f in fields) {
					com.pblabs.util.Assert.isNotNull(Reflect.field(m, f));
					var injectMeta :Dynamic = Reflect.field(Reflect.field(m, f), "editor");
					if (injectMeta == null) {
						continue;
					}
					com.pblabs.util.Assert.isTrue(Std.is(injectMeta, Array));
					for (editable in cast(injectMeta, Array<Dynamic>)) {
						com.pblabs.util.Assert.isNotNull(editable, "editable is null");
						// var uiElementCls = Type.resolveClass("com.bit101.components." + Reflect.field(editable, "ui"));
						var label = if (Reflect.field(editable, "label") != null) Reflect.field(editable, "label") else f;
						//If the field is a SignalVar, adjust the PropertyReference
						var valueprop :PropertyReference<Dynamic> = SignalVar.checkForSignalVar("#" + component.owner.name + "." + component.name + "." + f, component, f);
						switch (Reflect.field(editable, "ui")) {
							case "HUISlider":
								var slider = new HUISlider(root, 0, 0, label);
								slider.setSize(_editorFieldsWindow.width, slider.height);
								slider.maximum = Reflect.field(editable, "max") == null ? ReflectUtil.field(component, f) == 0 ? 1 :ReflectUtil.field(component, f) * 1.5 : Reflect.field(editable, "max");
								slider.minimum = Reflect.field(editable, "min") == null ? Math.min(0, ReflectUtil.field(component, f)) : Reflect.field(editable, "min");
								slider.value = component.owner.getProperty(valueprop);//component.componentProp(f));
								slider.addEventListener(Event.CHANGE, function (ev :Event) :Void {
									if (!component.isRegistered) return;
									component.owner.setProperty(valueprop, slider.value);
								});
								slider.addEventListener(Event.ENTER_FRAME, function (ev :Event) :Void {
									if (!component.isRegistered) return;
									slider.value = component.owner.getProperty(valueprop);
								});
								
								if (slider.maximum < 0.1) {
									slider.tick = 0.002;
									slider.labelPrecision = 4;
								} else if (slider.maximum < 1) {
									slider.tick = 0.02;
									slider.labelPrecision = 3;
								} else if (slider.maximum < 10) {
									slider.tick = 0.2;
									slider.labelPrecision = 2;
								} else if (slider.maximum < 100) {
									slider.tick = 2;
									slider.labelPrecision = 0;
								}
								components.push(slider);
							case "UpdatingLabel":
								var updatingLabel = new UpdatingLabel(root, 0, 0, 
									label + ": ", PBUtil.createPropertyCallback(component.owner, valueprop));
								components.push(updatingLabel);
							case "UpdatingList":
								components.push(new com.bit101.components.Label(root, 0, 0, label + ": "));
								var list = new UpdatingList(root, 0, 0, PBUtil.createPropertyCallback(component.owner, valueprop));
								list.setSize(_editorFieldsWindow.width, 75);
								components.push(list);
							case "ComboBox":
								
								components.push(new com.bit101.components.Label(root, 0, 0, label + ": "));
								var enumClass = ReflectUtil.getClass(component.owner.getProperty(valueprop));
								var values = Enumerable.names(enumClass) != null ? Enumerable.names(enumClass).toArray() : null;
								
								if (values == null) {
									Log.error("Cannot create a ComboBox for the editable field:" + f + ", there are no Enumerables of type " + enumClass);
									continue;
								}
								
								var combo = new ComboBox(root, 0, 0, "none", values);
								combo.selectedIndex = values.indexOf(cast(component.owner.getProperty(valueprop), Enumerable<Dynamic>).name);
								combo.addEventListener(Event.SELECT, function (e :Event) :Void {
									component.owner.setProperty(valueprop, Enumerable.valueOf(enumClass, combo.selectedItem));
								});
								components.push(combo);
							case "TextArea":
								components.push(new com.bit101.components.Label(root, 0, 0, label + ": "));
								var ta = new TextArea(root);
								ta.setSize(_editorFieldsWindow.width, 80);
								ta.addEventListener(Event.ENTER_FRAME, function (ev :Event) :Void {
									if (!component.isRegistered) return;
									ta.text = component.owner.getProperty(valueprop);
								});
								components.push(ta);
							case "NumericStepper":
								components.push(new com.bit101.components.Label(root, 0, 0, label + ": "));
								var stepper :NumericStepper = null;
								stepper = new NumericStepper(root, 0, 0, function (e :Event) :Void {
									// trace("step changed " + stepper.value);
									ReflectUtil.setField(component, f, stepper.value);
									stepper.value = ReflectUtil.field(component, f);
								});
								stepper.step = 1;
								stepper.minimum = Reflect.hasField(editable, "min") ? Reflect.field(editable, "min") : 0;
								stepper.maximum = Reflect.hasField(editable, "max") ? Reflect.field(editable, "max") : 100;
								stepper.labelPrecision = 0;
								stepper.value = ReflectUtil.field(component, f);
								components.push(stepper);
							default:
								Log.error("editable class field not handled: " + Type.getClassName(cls) + "." + f + ", " + Reflect.field(editable, "ui"));
						}
					}
				}
			}
			//Do the superclass fields
			cls = Type.getSuperClass(cls);
		}
	}
	
	function setTextGutter (t :String) :Void
	{
		DisplayUtils.removeAllChildren(_textGutterPanel.content);
		var textArea = new TextArea(_textGutterPanel.content, 0, 0, t);
		textArea.setSize(_textGutterPanel.width, _textGutterPanel.height);
	}
	
	static var NONE_GROUP :String = "none";
	static var ENTITY_CHOOSER_WINDOW :String = "Section 1";
	static var COMPONENTS_WINDOW :String = "Section 2";
}
