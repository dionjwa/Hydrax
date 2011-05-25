package com.pblabs.components.minimalcomp;

import com.pblabs.components.spatial.SpatialComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.NameManager;
import com.pblabs.components.minimalcomp.VBox;
/**
  * 'using' functions for Haxe minimal (like) components.
  */
class MCompTools
{
	public static function createVBox (context :IPBContext, ?gap :Float = 2, ?direction :VerticalDirection) :IEntity
	{
		var e = context.allocate(IEntity);
		e.deferring = true;
		SpatialComponent.addToEntity(e);
		var vbox = context.allocate(VBox);
		vbox.flowDirection = direction == null ? VerticalDirection.DOWN : direction;
		vbox.vGap = gap;
		e.addComponent(vbox);
		e.initialize(context.getManager(NameManager).validateName("vbox"));
		return e;
	}
	
	public static function add (container :IEntity, child :IEntity) :Void
	{
		com.pblabs.util.Assert.isNotNull(container);
		com.pblabs.util.Assert.isNotNull(child);
		
		var containerComp = container.getComponentByType(Container);
		var childComp = child.getComponentByType(Component);
		
		if (childComp == null) {
			childComp = child.context.allocate(Component);
			child.addComponent(childComp);
		}
		
		com.pblabs.util.Assert.isNotNull(containerComp, container.name + " has no Container");
		com.pblabs.util.Assert.isNotNull(childComp, child.name + " has no Component");
		
		containerComp.addChild(childComp);
	}
	
	
}
