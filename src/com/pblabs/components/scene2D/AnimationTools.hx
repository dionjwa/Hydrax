package com.pblabs.components.scene2D;

import com.pblabs.components.tasks.AnimateValueTask;
import com.pblabs.components.tasks.FunctionTask;
import com.pblabs.components.tasks.ParallelTask;
import com.pblabs.components.tasks.SerialTask;
import com.pblabs.components.tasks.TaskUtil;
import com.pblabs.engine.core.IEntity;
using com.pblabs.components.tasks.TaskUtil;

class AnimationTools
{
	public static function scale (e :IEntity, time :Float, beginscale :Float, endscale :Float) :IEntity
	{
		for (sc in e.getComponents(BaseSceneComponent)) {
			sc.scaleX = sc.scaleY = beginscale;
			e.addTask(
				new ParallelTask(
					AnimateValueTask.CreateSmooth(sc, "scaleX", endscale, time),
					AnimateValueTask.CreateSmooth(sc, "scaleY", endscale, time))
				);
		}
		return e;
	}
	
	public static function scaleLayer (layer :BaseSceneLayer, beginscale :Float, endscale :Float, time :Float, 
		?onFinish :Void->Void) :Void
	{
		layer.scaleX = beginscale;
		layer.scaleY = beginscale;
		layer.owner.addTask(
			new SerialTask(
				new ParallelTask(
					AnimateValueTask.CreateSmooth(layer, "scaleX", endscale, time),
					AnimateValueTask.CreateSmooth(layer, "scaleY", endscale, time)
				),
				new FunctionTask (function () :Void {
					if (onFinish != null) {
						onFinish();
					}
				})
			)
		);
	}
	
	public static function fadeLayer (layer :BaseSceneLayer, beginAlpha :Float, endAlpha :Float, time :Float, 
		?onFinish :Void->Void, ?easing :EasingFunc) :Void
	{
		layer.alpha = beginAlpha;
		layer.owner.addTask(
			new SerialTask(
				new AnimateValueTask(layer, "alpha", endAlpha, time, easing),
				new FunctionTask (function () :Void {
					if (onFinish != null) {
						onFinish();
					}
				})
			)
		);
	}
	
}
