package com.pblabs.editor;

import com.bit101.components.AccordionExtended;
import com.bit101.components.ComboBox;
import com.bit101.components.HBox;
import com.bit101.components.HUISlider;
import com.bit101.components.Label;
import com.bit101.components.Panel;
import com.bit101.components.ScrollPane;
import com.bit101.components.TextArea;
import com.bit101.components.UpdatingLabel;
import com.bit101.components.UpdatingList;
import com.bit101.components.VBox;
import com.bit101.components.Window;

import com.pblabs.components.input.InputData;
import com.pblabs.components.input.InputManager;
import com.pblabs.components.manager.NodeComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IEntityComponent;
import com.pblabs.engine.core.IPBObject;
import com.pblabs.engine.core.NameManager;
import com.pblabs.engine.core.PBGameBase;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.core.SetManager;
import com.pblabs.util.Log;
import com.pblabs.engine.util.PBUtil;
import com.pblabs.util.Comparators;
import com.pblabs.util.DisplayUtils;
import com.pblabs.util.Enumerable;
import com.pblabs.util.ReflectUtil;
import com.pblabs.util.SignalVar;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;

import flash.events.Event;
import flash.events.MouseEvent;

import hsl.haxe.Signal;

import net.amago.components.minimalcomp.VBox;

import com.pblabs.editor.CustomEditorPanelComponent;

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
		
		//Do this first, so we recieve the events first and can stop
		//propagation if needed
		game.getManager(InputManager).deviceClick.bindAdvanced(onClick);
		
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
		// DisplayUtils.removeAllChildren(_editorFieldsScrollPane.content);
		
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
				var c :IEntityComponent = e.lookupComponentByName(componentList.selectedItem); 
				self.setTextGutter(Std.string(c));
			});
			
			_componentsWindowBox.addChild(_textGutterPanel);
			
			var components = new Array<DisplayObject>();
			com.pblabs.util.Assert.isNotNull(_editorFieldsWindow);
			com.pblabs.util.Assert.isNotNull(_editorFieldsWindow.content);
			showEntityMetaData(_editorFieldsWindow.content, e, new List<IEntity>(), components);
			// showEntityMetaData(_editorFieldsScrollPane.content, e, new List<IEntity>(), components);
			
		
			DisplayUtils.distributeChildrenVertically(_editorFieldsWindow.content, 0, 0);
			
			//Add the custom panels, defined in the entity components itself
			_customEntityPanelsBox = new VBox(_customePanelsWindow.content);
			new Label(_customEntityPanelsBox, 0, 0, "Fucking test");
			for (ent in NodeComponent.getEntityAndAllParents(e, null)) {
				for (c in ent.lookupComponentsByType(CustomEditorPanelComponent)) {
					_customEntityPanelsBox.addChildAt(c.panel, _customEntityPanelsBox.numChildren); 
				}
			}
		}
	}
	
	function groupSelected (name :String) :Void
	{
		_entityList.removeAll();
		if (name == NONE_GROUP) {
			for (name in getUngroupedObjectNames()) {
				_entityList.addItem(name);
			}
		} else {
			for (name in _sets.getObjectsInSet(name).map(PBUtil.objectNameMapping)) {
				_entityList.addItem(name);
			}
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
	
	function onClick (signal :Signal<InputData>) :Void
	{
		Log.debug("Editor detects click " + signal.data1);
		//Since we're the editor, stop regular game event propagation
		signal.stopImmediatePropagation();
		objectSelected(signal.data.inputComponent.owner);
	}
	
	/** Recursive */
	function showEntityMetaData (root :DisplayObjectContainer, e :IEntity, shown :List<IEntity>, components :Array<DisplayObject>) :Void
	{
		if (e == null || shown.has(e)) {
			return;
		}
		shown.add(e);
		
		var cl = components.length;
		//Show the components on this entity
		for (c in e) {
			showEditableMetaData(root, c, components);
		}
		
		if (cl != components.length) {
			components.insert(cl, new Label(root, 0, 0, "------" + e.name));
			root.setChildIndex(components[cl] , cl);
		}
		
		for (c in e) {
			if (Std.is(c, NodeComponent)) {
				var n :NodeComponent<NodeComponent<Dynamic, Dynamic>, Dynamic> = cast(c);
				if (n.parent != null) {
					showEntityMetaData(root, n.parent.owner, shown, components);
				}
			}
		}
	}
	
	function showEditableMetaData (root :DisplayObjectContainer, component :IEntityComponent, components :Array<DisplayObject>) :Void
	{
		var cls = component.getClass();
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
							var maxFieldName = if (Reflect.field(editable, "maximum") == null) f + "Max" else Reflect.field(editable, "maximum"); 
							var maxvalueprop = SignalVar.checkForSignalVar("#" + component.owner.name + "." + component.name + "." + maxFieldName, component, maxFieldName);
							var minimum = if (Reflect.field(editable, "minimum") != null) Reflect.field(editable, "minimum") else 0;
							var slider = new HUISlider(root, 0, 0, label);
							slider.setSize(_editorFieldsWindow.width, slider.height);
							slider.maximum = component.owner.getProperty(maxvalueprop);//component.componentProp(Reflect.field(editable, "maximum")));
							slider.minimum = 0;
							slider.value = component.owner.getProperty(valueprop);//component.componentProp(f));
							slider.addEventListener(Event.CHANGE, function (ev :Event) :Void {
								if (!component.isRegistered) return;
								component.owner.setProperty(valueprop, slider.value);
							});
							slider.addEventListener(Event.ENTER_FRAME, function (ev :Event) :Void {
								if (!component.isRegistered) return;
								slider.value = component.owner.getProperty(valueprop);
							});
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
							var values = Enumerable.names(enumClass).toArray();
							
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
						default:
							Log.error("editable class type not handled");
					}
				}
			}
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
