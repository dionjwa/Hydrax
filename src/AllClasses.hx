/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package;
import com.pblabs.components.tasks.FunctionTask;

import com.pblabs.components.tasks.LocationTask;
import com.pblabs.components.tasks.ParallelTask;
import com.pblabs.components.tasks.RepeatingTask;
import com.pblabs.components.tasks.SelfDestructTask;
import com.pblabs.components.tasks.SerialTask;
import com.pblabs.components.tasks.TaskContainer;
import com.pblabs.components.tasks.TimedTask;


import com.pblabs.engine.core.Entity;
import com.pblabs.engine.core.EntityComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IEntityComponent;
import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.IPBManager;
import com.pblabs.engine.core.IPBObject;
import com.pblabs.engine.core.IPropertyBag;
import com.pblabs.engine.core.NameManager;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.core.PBGameBase;
import com.pblabs.engine.core.PBGroup;
import com.pblabs.engine.core.PBObject;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.debug.Profiler;
import com.pblabs.engine.input.InputKey;
import com.pblabs.engine.time.IAnimatedObject;
import com.pblabs.engine.time.IProcessManager;
import com.pblabs.engine.time.IQueuedObject;
import com.pblabs.engine.time.ITickedObject;
import com.pblabs.engine.time.ProcessManager;
import com.pblabs.engine.time.ScheduleObject;
import com.pblabs.engine.time.Timer;
import com.pblabs.engine.util.IPrioritizable;
import com.pblabs.util.Sprintf;
import com.pblabs.components.base.AlphaComponent;
import com.pblabs.components.base.AngleComponent;
import com.pblabs.components.base.BoundedComponent;

import com.pblabs.components.base.HealthComponent;
import com.pblabs.components.base.LocationComponent;
import com.pblabs.components.base.NotifyingValueComponent;
import com.pblabs.components.debug.BlobDisplayComponent;

import com.pblabs.components.debug.ValueComponent;
import com.pblabs.components.manager.NodeComponent;

import com.pblabs.components.tasks.AngleTask;
import com.pblabs.components.tasks.AnimatePropertyTask;
import com.pblabs.components.tasks.AnimateValueTask;
import com.pblabs.components.tasks.DelayTicksTask;
import com.pblabs.components.tasks.IEntityTask;
import com.pblabs.components.tasks.InterpolatingTask;
import com.pblabs.components.tasks.TaskComponent;
import com.pblabs.components.tasks.TaskUtil;
import com.pblabs.components.util.DataComponent;
import com.pblabs.engine.core.IPBGroup;
import com.pblabs.engine.core.SetManager;
import com.pblabs.engine.core.SignalBondManager;
import com.pblabs.engine.debug.Log;
import com.pblabs.engine.injection.Attributes;
import com.pblabs.engine.injection.ComponentInjector;
import com.pblabs.engine.injection.Injector;
import com.pblabs.components.input.InputManager;
import com.pblabs.engine.resource.IResource;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ResourceBase;
import com.pblabs.engine.resource.ResourceManager;
import com.pblabs.engine.resource.XMLResource;


import com.pblabs.engine.util.PBUtil;
import com.pblabs.geom.Circle;
import com.pblabs.geom.CircleUtil;
import com.pblabs.geom.Geometry;
import com.pblabs.geom.LineSegment;
import com.pblabs.geom.LineSegmentTools;
import com.pblabs.geom.Polygon;
import com.pblabs.geom.PolygonTools;
import com.pblabs.geom.Rectangle;
import com.pblabs.geom.RectangleTools;
import com.pblabs.geom.Vector2;
import com.pblabs.geom.VectorTools;
import com.pblabs.geom.bounds.AbstractBounds;
import com.pblabs.geom.bounds.BoundsCircle;
import com.pblabs.geom.bounds.BoundsForwarding;
import com.pblabs.geom.bounds.BoundsHighLowRes;
import com.pblabs.geom.bounds.BoundsLine;
import com.pblabs.geom.bounds.BoundsNone;
import com.pblabs.geom.bounds.BoundsPoint;
import com.pblabs.geom.bounds.BoundsPolygon;
import com.pblabs.geom.bounds.BoundsRectangle;
import com.pblabs.geom.bounds.BoundsUtil;
import com.pblabs.geom.bounds.IBounds;

import com.pblabs.util.ArrayUtil;
import com.pblabs.util.Assert;
import com.pblabs.util.Cloneable;

import com.pblabs.util.Enumerable;
import com.pblabs.util.EqualableUtil;
import com.pblabs.util.IterUtil;
import com.pblabs.util.MathUtil;
import com.pblabs.util.NumberUtil;
import com.pblabs.util.PBMacros;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ReflectUtil;
import com.pblabs.util.SignallingVar;
import com.pblabs.util.XMLUtil;
import com.pblabs.util.ds.Hashable;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;
import com.pblabs.util.ds.MapUtil;
import com.pblabs.util.ds.MultiMap;
import com.pblabs.util.ds.MultiSet;
import com.pblabs.util.ds.Set;
import com.pblabs.util.ds.Sets;
import com.pblabs.util.ds.Triple;
import com.pblabs.util.ds.Tuple;
import com.pblabs.util.ds.maps.AbstractMap;
import com.pblabs.util.ds.maps.BiMap;
import com.pblabs.util.ds.maps.DynamicMap;
import com.pblabs.util.ds.maps.ForwardingMap;
import com.pblabs.util.ds.maps.HashableMap;
import com.pblabs.util.ds.maps.HashMap;
import com.pblabs.util.ds.maps.ImmutableMap;
import com.pblabs.util.ds.maps.IntHashMap;
import com.pblabs.util.ds.maps.KeyListMap;
import com.pblabs.util.ds.maps.SortedMap;
import com.pblabs.util.ds.maps.StringMap;
import com.pblabs.util.ds.multimaps.AbstractMultiMap;
import com.pblabs.util.ds.multimaps.ArrayMultiMap;
import com.pblabs.util.ds.multimaps.ListMultiMap;
import com.pblabs.util.ds.multimaps.SetMultiMap;
import com.pblabs.util.ds.sets.MapSet;
import com.pblabs.util.ds.sets.MultiMapSet;
import com.pblabs.util.Comparable;
import com.pblabs.util.Comparators;
import com.pblabs.util.Equalable;
import com.pblabs.util.Log;
import com.pblabs.util.LogTarget;
import com.pblabs.util.Predicates;
import com.pblabs.util.StringUtil;

#if js
import com.pblabs.components.scene.js.Canvas2DComponent;
import com.pblabs.components.scene.js.CanvasLayer;
import com.pblabs.components.scene.js.CanvasScene2D;
import com.pblabs.components.scene.js.CircleSprite;
import com.pblabs.components.scene.js.FilledSprite;
import com.pblabs.components.scene.js.ImageSprite;
import com.pblabs.engine.resource.js.ImageResources;
import com.pblabs.components.scene.js.Sprite;
// import haxe.remoting.NodeJSHTMLConnection;
#end

#if flash
import com.pblabs.util.DisplayUtils;
import com.pblabs.components.tasks.GoToFrameTask;
import com.pblabs.components.tasks.VisibleTask;
import com.pblabs.components.base.DisplayComponent;
import com.pblabs.components.debug.RectDisplayComponent;
import com.pblabs.engine.resource.flash.RessyResource;
import com.pblabs.geom.debug.GeometryTests;
import com.pblabs.util.EventDispatcherUtil;
import com.pblabs.util.GraphicsUtil;
#end

/**
  * If exporting a swf to import into a flash project, all
  * classes must be imported.
  */
class AllClasses #if flash extends flash.display.Sprite #end 
{
	public function new ()
	{
		#if flash
		super();
		#end
		
	}
	
	public static function main() 
	{
		#if flash
		flash.system.Security.allowDomain('*');
		flash.Lib.current.addChild(new AllClasses());
		#elseif js
		new AllClasses();
		#end
	}

}
