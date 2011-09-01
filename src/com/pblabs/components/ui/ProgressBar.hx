package com.pblabs.components.ui;

import Type;

import com.pblabs.components.base.Dispatcher;
import com.pblabs.components.scene2D.BaseSceneComponent;
import com.pblabs.components.scene2D.BaseSceneLayer;
import com.pblabs.components.scene2D.BaseSceneManager;
import com.pblabs.components.scene2D.SceneAlignment;
import com.pblabs.components.scene2D.SceneUtil;
import com.pblabs.components.spatial.SpatialComponent;
import com.pblabs.components.tasks.TaskComponent;
import com.pblabs.components.tasks.TaskComponentTicked;
import com.pblabs.engine.core.EntityComponent;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.util.BitmapUtil;
import com.pblabs.util.ds.multimaps.SetMultiMap;
using com.pblabs.components.tasks.TaskUtil;
using com.pblabs.engine.core.SignalBondManager;
using com.pblabs.util.IterUtil;
using com.pblabs.util.StringUtil;

/**
  * Listends for progress events on the Dispatcher,
  * and shows relevent progress.  Can show multiple progress bars.
  * 
  * TODO :make js compatible.
  */
class ProgressBar extends EntityComponent
{
	static var DISPLAY_NAME = "display";

	public var persistTimeAfterComplete :Float;
	public var layerProperty :PropertyReference<BaseSceneLayer<BaseSceneManager<Dynamic>, BaseSceneComponent<Dynamic>>>;
	
	var _inProgress :SetMultiMap<String, String>;
	var _complete :SetMultiMap<String, String>;
	
	public function new ()
	{
		super();
		_inProgress = SetMultiMap.create(ValueType.TClass(String), ValueType.TClass(String));
		_complete = SetMultiMap.create(ValueType.TClass(String), ValueType.TClass(String));
	}
	
	override function onAdd () :Void
	{
		super.onAdd();
		
		com.pblabs.util.Assert.isNotNull(layerProperty, "No layer property");
		owner.deferring = true;
		SpatialComponent.addToEntity(owner);
		owner.addComponent(context.allocate(TaskComponentTicked), TaskComponent.NAME);
		
		#if (flash || cpp)
		var shape = context.allocate(com.pblabs.components.scene2D.flash.SceneComponentShape);
		shape.parentProperty = cast layerProperty;
		owner.addComponent(shape, DISPLAY_NAME);
		#end
		
		owner.deferring = false;
	}
	
	override function onReset () :Void
	{
		super.onReset();
		var disp :BaseSceneComponent<Dynamic> = owner.getComponentByName(DISPLAY_NAME);
		com.pblabs.util.Assert.isNotNull(disp);
		//Start NOT on the layer.
		disp.removeFromParent();
		
		var dis = context.getManager(Dispatcher);
		com.pblabs.util.Assert.isNotNull(dis, "Dispatcher required");
		bindSignal(dis.dispatcher, onDispatcherSignal);
		
		//Center
		com.pblabs.util.Assert.isNotNull(layerProperty);
		var layer = owner.getProperty(layerProperty);
		com.pblabs.util.Assert.isNotNull(layer, "No layer, prop=" + layerProperty);
		var p = SceneUtil.getAlignedPoint(layer.scene, SceneAlignment.CENTER);
		SceneUtil.setLocation(owner, p.x, p.y - layer.scene.sceneView.height / 4);
	}
	
	function onDispatcherSignal (msg :Dynamic) :Void
	{
		switch (Type.typeof(msg)) {
			case TEnum(e):
			if (e == ProgressEvent) {
				switch (cast(msg, ProgressEvent)) {
					case CLEAR_ALL_EVENTS:
						_inProgress.clear();
						_complete.clear();
					case CLEAR_GROUP(taskGroup):
						_inProgress.remove(taskGroup);
						_complete.remove(taskGroup);
					case TASK_STARTED(taskGroup, taskName):
						_inProgress.set(taskGroup, taskName);
					case TASK_COMPLETE(taskGroup, taskName):
						_inProgress.removeEntry(taskGroup, taskName);
						if (_inProgress.sizeOf(taskGroup) == 0) {
							_complete.remove(taskGroup);
							_inProgress.remove(taskGroup);
						} else {
							_complete.set(taskGroup, taskName);
						}
				}
				redraw();
			}
			default://Ignore 
		}
	}
	
	function redraw () :Void
	{
		var disp :BaseSceneComponent<Dynamic> = owner.getComponentByName(DISPLAY_NAME);
		com.pblabs.util.Assert.isNotNull(disp, " disp is null");
		if (_inProgress.length == 0) {
			if (disp.layer != null) {
				disp.removeFromParent();
			}
		} else {
			if (disp.layer == null) {
				disp.addToParent();
			}
		}
		
		#if (flash || cpp)
		var shape :com.pblabs.components.scene2D.flash.SceneComponentShape = owner.getComponentByName(DISPLAY_NAME);
		com.pblabs.util.Assert.isNotNull(shape, " shape is null");
		var g = shape.shape.graphics;
		
		var width = 200;
		var height = 30;
		g.clear();
		var currentY = 0;
		
		for (id in _inProgress.keys()) {
			var inProgress :Float = _inProgress.sizeOf(id);
			var complete :Float = _complete.sizeOf(id);
			var frac = complete / (inProgress + complete) ;
			
			
			g.beginFill(0xff0000, 0.5);
			g.drawRect(-width / 2, currentY + -height / 2, width * frac, height);
			g.endFill();
			g.lineStyle(0, 0);
			g.drawRect(-width / 2, currentY + -height / 2, width, height);
			
			//Text
			if (!id.isBlank()) {
				var tf = new flash.text.TextField();
				tf.text = id;
				tf.border = false;
				tf.background = false;
				tf.width = 200;
				tf.height = 20;
				
				var format = new flash.text.TextFormat();
				format.align = flash.text.TextFormatAlign.CENTER;
				format.size = 14;
				tf.setTextFormat(format);
				
				var bd = BitmapUtil.createBitmapData(tf);
				var m = new flash.geom.Matrix();
				m.translate(-bd.width / 2, currentY + -bd.height / 2);
				g.beginFill(0, 0);
				g.beginBitmapFill(bd, m, false);
				g.drawRect(-width / 2, currentY + -height / 2, width, height);
				g.endFill();
			}
			
			currentY += height + 10;
		}
		#end
	}
}
