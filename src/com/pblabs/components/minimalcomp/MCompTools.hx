package com.pblabs.components.minimalcomp;

import Type;

import com.pblabs.components.minimalcomp.VBox;
import com.pblabs.components.scene2D.BaseSceneComponent;
import com.pblabs.components.scene2D.BaseSceneLayer;
import com.pblabs.components.spatial.SpatialComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.NameManager;
import com.pblabs.util.Comparators;
import com.pblabs.util.Predicates;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;
import com.pblabs.util.ds.maps.MapBuilder;

using Type;

using Lambda;

using com.pblabs.engine.util.PBUtil;
using com.pblabs.util.ArrayUtil;
using com.pblabs.util.IterUtil;

/**
  * 'using' functions for Haxe minimal (like) components.
  */
class MCompTools
{
	public static function sortDisplayOrderByComponents (children :Array<BaseSceneComponent<Dynamic>>) :Void
	{
		var compDisplayOrders :Map<Component, Map<Component, Int>> = new MapBuilder(ValueType.TClass(Component))
			.makeComputing(function (_) :Map<Component, Int> { return Maps.newHashMap(ValueType.TClass(Component));})
			.build();
		
		var index = 0;
		var addToDisplayOrder = function (c :Component) :Void {
			compDisplayOrders.get(c.root).set(c, index++);
		}
		var recurseIntoStructure = null;
		recurseIntoStructure = function (c :Component) :Void {
			addToDisplayOrder(c);
			if (Std.is(c, Container)) {
				for (child in cast(c, Container).children) {
					recurseIntoStructure(child);
				}
			}
		}
		
		var component2SceneComp :Map<Component, BaseSceneComponent<Dynamic>> = Maps.newHashMap(ValueType.TClass(Component));
		var rootOrder = [];
		
		for (child in children) {
			if (child == null) continue;
			if (child.owner.getComponent(Component) != null) {
				component2SceneComp.set(child.owner.getComponent(Component), child);
			}
			
			var container = child.owner.getComponent(Container);
			if (container != null && !compDisplayOrders.exists(container)) {
				index = 0;
				rootOrder.push(container.root);
				recurseIntoStructure(container.root);
			}
		}
		
		var sorter2 = function (c1 :Component, c2 :Component) :Int {
			return Comparators.compareInts(compDisplayOrders.get(c1.root).get(c1), compDisplayOrders.get(c2.root).get(c2));
		}
		
		//Go through each component group, get the children, sort, then add back to the array
		for (rootComponent in rootOrder) {
			if (!compDisplayOrders.exists(rootComponent)){
				continue;
			}
			//Remember the location, splice out children, sort, then splice in
			var componentsToSort = compDisplayOrders.get(rootComponent).keys().toArray();
			componentsToSort.sort(sorter2);
			var sortedSceneObjects = componentsToSort.map(component2SceneComp.get).filter(Predicates.notNull).array();
			var rootIndex = children.indexOf(sortedSceneObjects[0]);
			com.pblabs.util.Assert.isTrue(rootIndex > -1);
			for (c in sortedSceneObjects) {
				children.remove(c);
			}
			for (ii in 0...sortedSceneObjects.length) {
				children.insert(ii + rootIndex, sortedSceneObjects[ii]);
			}
		}
	}
	
	public static function createVBox (context :IPBContext, ?layer :BaseSceneLayer<Dynamic, Dynamic>, ?gap :Float = 2, ?direction :Direction) :IEntity
	{
		var e = context.allocate(IEntity);
		e.deferring = true;
		SpatialComponent.addToEntity(e);
		var vbox = context.allocate(VBox);
		vbox.sceneLayer = layer;
		vbox.flowDirection = direction == null ? Direction.DOWN : direction;
		vbox.gap = gap;
		e.addComponent(vbox);
		e.initialize(context.getManager(NameManager).validateName("vbox"));
		return e;
	}
	
	public static function createHBox (context :IPBContext, ?layer :BaseSceneLayer<Dynamic, Dynamic>, ?gap :Float = 2) :IEntity
	{
		var e = context.allocate(IEntity);
		e.deferring = true;
		SpatialComponent.addToEntity(e);
		var box = context.allocate(HBox);
		box.sceneLayer = layer;
		box.gap = gap;
		e.addComponent(box);
		e.initialize(context.getManager(NameManager).validateName("hbox"));
		return e;
	}
	
	public static function addToComponentParent (child :IEntity, container :IEntity) :IEntity
	{
		com.pblabs.util.Assert.isNotNull(container);
		com.pblabs.util.Assert.isNotNull(child);
		
		var containerComp = container.getComponent(Container);
		com.pblabs.util.Assert.isNotNull(containerComp, container.name + ' has no Container');
		ensureComponent(child);
		var childComp = child.getComponent(Component);
		
		com.pblabs.util.Assert.isNotNull(childComp, child.name + " has no Component");
		
		//Assign the parent property as well as actually adding the parent
		//This way, we can detach and attach without having to explicity get the parent again
		childComp.parentProperty = containerComp.entityProp(); 
		containerComp.addChild(childComp);
		return child;
	}
	
	public static function setComponentId (e :IEntity, id :String) :IEntity
	{
		ensureComponent(e);
		var comp = e.getComponent(Component);
		com.pblabs.util.Assert.isNotNull(comp, ' comp is null');
		comp.id = id;
		return e;
	}
	
	static function ensureComponent (e :IEntity) :Component
	{
		if (e.getComponent(Component) == null) {
			e.addComponent(e.context.allocate(Component));
		}
		return e.getComponent(Component);
	}
}
