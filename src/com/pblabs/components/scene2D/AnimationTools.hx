package com.pblabs.components.scene2D;

import com.pblabs.components.tasks.AnimateValueTask;
import com.pblabs.components.tasks.ParallelTask;
import com.pblabs.engine.core.IEntity;
using com.pblabs.components.tasks.TaskUtil;

class AnimationTools
{
	public static function scale (e :IEntity, time :Float, beginscale :Float, endscale :Float) :IEntity
	{
		for (sc in e.getComponents(BaseSceneComponent)) {
			sc.scaleX = sc.scaleY = beginscale;
			e.addTask(
			// new SerialTask(
				new ParallelTask(
					AnimateValueTask.CreateSmooth(sc, "scaleX", endscale, time),
					AnimateValueTask.CreateSmooth(sc, "scaleY", endscale, time))
				// new FunctionTask()
				// )
				);
		}
		
		return e;
	}
	
}
