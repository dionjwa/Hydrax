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

import org.transition9.ds.Map;
import org.transition9.ds.Maps;
import org.transition9.ds.Tuple;
import org.transition9.ds.multimaps.SetMultiMap;
import org.transition9.util.BitmapUtil;

using com.pblabs.components.tasks.TaskUtil;
using com.pblabs.engine.core.SignalBondManager;
using com.pblabs.engine.util.PBUtil;

using org.transition9.util.IterUtil;
using org.transition9.util.StringUtil;

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
	
	/** Tasks in a task set that are still in progress  */
	var _taskSetProgress :SetMultiMap<String, String>;
	/** Tasks in a task set that are complete */
	var _taskSetComplete :SetMultiMap<String, String>;
	/** Tasks in a task set that are complete */
	var _manualProgress :Map<String, Tuple<String, Float>>;
	
	public function new ()
	{
		super();
		_taskSetProgress = SetMultiMap.create(ValueType.TClass(String), ValueType.TClass(String));
		_taskSetComplete = SetMultiMap.create(ValueType.TClass(String), ValueType.TClass(String));
		_manualProgress = Maps.newHashMap(ValueType.TClass(String));
	}
	
	override function onAdd () :Void
	{
		super.onAdd();
		
		org.transition9.util.Assert.isNotNull(layerProperty, "No layer property");
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
		org.transition9.util.Assert.isNotNull(disp);
		//Start NOT on the layer.
		disp.removeFromParent();
		
		var dis = context.ensureManager(Dispatcher);
		bindSignal(dis.dispatcher, onDispatcherSignal);
		
		//Center
		org.transition9.util.Assert.isNotNull(layerProperty);
		var layer = owner.getProperty(layerProperty);
		org.transition9.util.Assert.isNotNull(layer, "No layer, prop=" + layerProperty);
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
						_taskSetProgress.clear();
						_taskSetComplete.clear();
						_manualProgress.clear();
					case CLEAR_GROUP(taskGroup):
						_taskSetProgress.remove(taskGroup);
						_taskSetComplete.remove(taskGroup);
						_manualProgress.remove(taskGroup);
					case TASK_STARTED(taskGroup, taskName):
						_taskSetProgress.set(taskGroup, taskName);
					case TASK_COMPLETE(taskGroup, taskName):
						_taskSetProgress.removeEntry(taskGroup, taskName);
						if (_taskSetProgress.sizeOf(taskGroup) == 0) {
							_taskSetComplete.remove(taskGroup);
							_taskSetProgress.remove(taskGroup);
						} else {
							_taskSetComplete.set(taskGroup, taskName);
						}
					case PROGRESS(taskId, text, fractionComplete):
						_manualProgress.set(taskId, new Tuple(text, fractionComplete));
				}
				redraw();
			}
			default://Ignore 
		}
	}
	
	function redraw () :Void
	{
		var disp :BaseSceneComponent<Dynamic> = owner.getComponentByName(DISPLAY_NAME);
		org.transition9.util.Assert.isNotNull(disp, " disp is null");
		if (_taskSetProgress.length == 0) {
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
		org.transition9.util.Assert.isNotNull(shape, " shape is null");
		var g = shape.shape.graphics;
		
		var width = 200;
		var height = 30;
		g.clear();
		var currentY = 0;
		
		
		var drawBar = function (frac :Float, text :String) {
			g.beginFill(0xff0000, 0.5);
			g.drawRect(-width / 2, currentY + -height / 2, width * frac, height);
			g.endFill();
			g.lineStyle(0, 0);
			g.drawRect(-width / 2, currentY + -height / 2, width, height);
			
			//Text
			if (!text.isBlank()) {
				var tf = new flash.text.TextField();
				tf.text = text;
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
		
		
		for (id in _taskSetProgress.keys()) {
			var inProgress :Float = _taskSetProgress.sizeOf(id);
			var complete :Float = _taskSetComplete.sizeOf(id);
			var frac = complete / (inProgress + complete) ;
			drawBar(frac, id);
		}
		
		for (tuple in _manualProgress) {
			drawBar(tuple.v2, tuple.v1);
		}
		#end
	}
}
