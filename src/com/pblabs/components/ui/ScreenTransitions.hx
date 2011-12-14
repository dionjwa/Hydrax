package com.pblabs.components.ui;

import com.pblabs.components.scene2D.BaseSceneManager;
import com.pblabs.components.scene2D.Direction;
import com.pblabs.components.scene2D.SceneManagerList;
import com.pblabs.components.tasks.AnimateValueTask;
import com.pblabs.components.tasks.FunctionTask;
import com.pblabs.components.tasks.RepeatingTask;
import com.pblabs.components.tasks.SerialTask;
import com.pblabs.components.tasks.TimedTask;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.PBGameBase;
import org.transition9.geom.Vector2;
using com.pblabs.components.tasks.TaskUtil;
using com.pblabs.engine.util.PBUtil;
using Lambda;

/**
  * IPBContext transitions.  
  * It's important that the BaseSceneManagers.autoSceneViewAttach == false.
  */
class ScreenTransitions
{
	public static function scrollBack (inactive :IPBContext, active :IPBContext, cb :Void->Void) :Void
	{
		org.transition9.util.Assert.isNotNull(inactive, ' inactive is null');
		
		if (active == null) {
			cb();
			return;
		}
		
		//Make sure the screens don't automatically attach/detach, since
		//we need to control this for the transitions to work
		for (sm in getAllSceneManagers(inactive)) {
			sm.autoSceneViewAttach = false;
		}
		for (sm in getAllSceneManagers(active)) {
			sm.autoSceneViewAttach = false;
			setScreenOffSceneView(sm, Direction.LEFT);
			sm.update();
		}
		
		var duration = 0.2;
		//Set the current screen and the previous (if present) scrolling right
		
		var scenes = getAllSceneManagers(active);
		org.transition9.util.Assert.isNotNull(scenes, ' scenes is null');
		var activeScene = scenes[0];
		org.transition9.util.Assert.isNotNull(activeScene, ' activeScene is null');
		
		scroll(activeScene.owner, getAllSceneManagers(inactive), Direction.RIGHT, duration, null, function () :Void {
			cb();
		});
		scroll(activeScene.owner, getAllSceneManagers(active), Direction.RIGHT, duration);
	}
	
	public static function scrollForward (inactive :IPBContext, active :IPBContext, cb :Void->Void) :Void
	{
		org.transition9.util.Assert.isNotNull(active, ' active is null');
		if (inactive == null) {
			cb();
			return;
		}
		
		//Make sure the screens don't automatically attach/detach, since
		//we need to control this for the transitions to work
		if (inactive != null) {
			for (sm in getAllSceneManagers(inactive)) {
				sm.autoSceneViewAttach = false;
			}
		}
		for (sm in getAllSceneManagers(active)) {
			sm.autoSceneViewAttach = false;
			setScreenOffSceneView(sm, Direction.RIGHT);
		}
		
		var duration = 0.2;
		//Set the current screen and the previous (if present) scrolling right
		
		var scenes = getAllSceneManagers(active);
		org.transition9.util.Assert.isNotNull(scenes, ' scenes is null');
		var activeScene = scenes[0];
		org.transition9.util.Assert.isNotNull(activeScene, ' activeScene is null');
		
		scroll(activeScene.owner, getAllSceneManagers(active), Direction.LEFT, duration, null, function () :Void {
			cb();
		});
		if (inactive != null) {
			scroll(activeScene.owner, getAllSceneManagers(inactive), Direction.LEFT, duration);
		}
	}
	
	public function getScreenBelow (screen :IPBContext) :IPBContext
	{
		var game = screen.getManager(PBGameBase);
		var contexts = game.contexts;
		return contexts[contexts.length - 2];
	}
	
	public static function getAllSceneManagers (context :IPBContext) :Array<BaseSceneManager<Dynamic>>
	{
		org.transition9.util.Assert.isNotNull(context.getManager(SceneManagerList), ' context.getManager(SceneManagerList) is null');
		return context.getManager(SceneManagerList).children;
	}
	
	public static function setScreenOffSceneView (scene :BaseSceneManager<Dynamic>, direction :Direction) :Void
	{
		var delta = switch (direction) {
			case LEFT: new Vector2(-scene.sceneView.width, 0);
			case RIGHT: new Vector2(scene.sceneView.width, 0);
			case UP: new Vector2(0, -scene.sceneView.height);
			case DOWN: new Vector2(0, scene.sceneView.height);
		}
		scene.x = delta.x;
		scene.y = delta.y;
	}
	
	
	public static function scroll (activeEntity :IEntity, 
		scenes :Array<BaseSceneManager<Dynamic>>, 
		direction :Direction, 
		duration :Float, 
		?easing :Dynamic, ?cb :Void->Void) :Void
	{
		if (cb != null) {
			activeEntity.addTask(new SerialTask(
				new TimedTask(duration),
				new FunctionTask(cb)));
		}
		
		var updateTaskName = "updater " + (scenes.length > 0 ? scenes[0].context.key : 0);
		
		activeEntity.addNamedTask(updateTaskName, new RepeatingTask(
			new FunctionTask(function () :Void {
				for (sm in scenes) {
					sm.update();	
				}
			})));
			
		activeEntity.addTask(new SerialTask(
				new TimedTask(duration),
				new FunctionTask(function () :Void {
					activeEntity.removeNamedTasks(updateTaskName);
				})));
			
		for (scene in scenes) {
			org.transition9.util.Assert.isNotNull(scene, ' scene is null');
			var delta = switch (direction) {
				case LEFT: new Vector2(-scene.sceneView.width, 0);
				case RIGHT: new Vector2(scene.sceneView.width, 0);
				case UP: new Vector2(0, -scene.sceneView.height);
				case DOWN: new Vector2(0, scene.sceneView.height);
			}
			if (delta.x != 0) {
				activeEntity.addTask(new AnimateValueTask(scene, "x", scene.x + delta.x, duration, easing));
			}
			if (delta.y != 0) {
				activeEntity.addTask(new AnimateValueTask(scene, "y", scene.y + delta.y, duration, easing));
			}
		}
	}
	
}
