#! /usr/bin/env python
# coding: utf-8

"""
Adds the correct license headers to hydrax source files.
"""
import os
import sys

root = "/Users/dion/storage/projects/hydrax"
fileList = []#"/Users/dion/storage/projects/hydrax/src/test.hx"]

filesAccountedFor = []

rootdir = root + "/src"
for root, subFolders, files in os.walk(rootdir):
	for file in files:
		if file.endswith(".hx"):
			fileList.append(os.path.join(root,file))

# print fileList

headers = {}
licensedFiles = {}

licensedFiles["pbe"] = ["com.pblabs.engine.core.PBContext",  "com.pblabs.engine.core.Entity",  "com.pblabs.engine.core.EntityComponent",  "com.pblabs.engine.core.IEntity",  "com.pblabs.engine.core.IEntityComponent", "com.pblabs.engine.core.IPBContext",  "com.pblabs.engine.core.IPBManager",  "com.pblabs.engine.core.IPBObject",  "com.pblabs.engine.core.IPropertyBag",  "com.pblabs.engine.core.NameManager",  "com.pblabs.engine.core.PBGame",  "com.pblabs.engine.core.PBGame",  "com.pblabs.engine.core.PBGroup",  "com.pblabs.engine.core.PBObject",  "com.pblabs.engine.core.PBSet",  "com.pblabs.engine.core.PropertyReference",  "com.pblabs.engine.debug.Profiler",  "com.pblabs.engine.input.InputKey",  "com.pblabs.engine.resource.flash.DataResource",  "com.pblabs.engine.resource.flash.ImageResource",  "com.pblabs.engine.resource.flash.MP3Resource",  "com.pblabs.engine.resource.flash.Resource",  "com.pblabs.engine.resource.flash.ResourceBundle",  "com.pblabs.engine.resource.flash.ResourceEvent",  "com.pblabs.engine.resource.flash.ResourceManager",  "com.pblabs.engine.resource.flash.SoundResource",  "com.pblabs.engine.resource.flash.SWFResource",  "com.pblabs.engine.resource.flash.XMLResource",  "com.pblabs.engine.resource.flash.provider.BulkLoaderResourceProvider",  "com.pblabs.engine.resource.flash.provider.EmbeddedResourceProvider",  "com.pblabs.engine.resource.flash.provider.FallbackResourceProvider",  "com.pblabs.engine.resource.flash.provider.IResourceProvider",  "com.pblabs.engine.resource.flash.provider.ResourceProviderBase",  "com.pblabs.engine.serialization.ISerializable",  "com.pblabs.engine.serialization.LevelContext",  "com.pblabs.engine.serialization.SchemaGenerator",  "com.pblabs.engine.serialization.Serializer",  "com.pblabs.engine.serialization.TemplateEvent",  "com.pblabs.engine.serialization.TemplateManager",  "com.pblabs.engine.serialization.TestForMetadata",  "com.pblabs.engine.serialization.TypeUtility",  "com.pblabs.engine.time.IAnimatedObject",  "com.pblabs.engine.time.IProcessManager",  "com.pblabs.engine.time.IQueuedObject",  "com.pblabs.engine.time.ITickedObject",  "com.pblabs.engine.time.ProcessManager",  "com.pblabs.engine.time.ScheduleObject",  "com.pblabs.engine.time.ThinkingComponent",   "com.pblabs.engine.time.Timer",  "com.pblabs.engine.util.IPrioritizable", "com.pblabs.components.spatial.ISpatialManager2D", "com.pblabs.components.spatial.ISpatialObject2D", "com.pblabs.components.spatial.RayHitInfo", "com.pblabs.engine.core.ObjectType", "com.pblabs.engine.core.ObjectTypeManager", ]
licensedFiles["flashbang"] = ["com.pblabs.components.tasks.FunctionTask",  "com.pblabs.components.tasks.GoToFrameTask",  "com.pblabs.components.tasks.LocationTask",  "com.pblabs.components.tasks.ParallelTask",  "com.pblabs.components.tasks.RepeatingTask",  "com.pblabs.components.tasks.SelfDestructTask",  "com.pblabs.components.tasks.SerialTask",  "com.pblabs.components.tasks.TaskContainer",  "com.pblabs.components.tasks.TimedTask",  "com.pblabs.components.tasks.VisibleTask",  "org.transition9.util.Rand"]
licensedFiles["aspirin"] = ["org.transition9.ds.maps.MapBuilder", "org.transition9.util.Random", "org.transition9.util.Comparable",  "org.transition9.util.Comparators",  "org.transition9.util.Equalable",   "org.transition9.util.LogTarget",  "org.transition9.util.Predicates", "org.transition9.util.StringUtil", "org.transition9.ds.maps.DefaultValueMap",  "org.transition9.ds.maps.ExpiringEntry",  "org.transition9.ds.maps.ExpiringMap",  "org.transition9.ds.maps.ForeachingMap",  "org.transition9.ds.maps.LinkedEntry",  "org.transition9.ds.maps.LinkedMap",  "org.transition9.ds.maps.LRMap",  "org.transition9.ds.maps.ValueComputingMap"]
licensedFiles["non_derived"] = ["org.transition9.util.Log", "org.transition9.util.MetaUtil", "com.pblabs.components.scene2D.SceneUtil", "AllClasses", "com.pblabs.components.base.AlphaComponent",  "com.pblabs.components.base.AngleComponent",  "com.pblabs.components.base.BoundedComponent",  "com.pblabs.components.base.DisplayComponent",  "com.pblabs.components.base.HealthComponent",  "com.pblabs.components.base.LocationComponent",  "com.pblabs.components.base.NotifyingValueComponent",  "com.pblabs.components.debug.BlobDisplayComponent",  "com.pblabs.components.debug.RectDisplayComponent",  "com.pblabs.components.debug.ValueComponent",  "com.pblabs.components.manager.NodeComponent", "com.pblabs.components.scene2D.SceneComponent", "com.pblabs.components.scene2D.SceneManager",  "com.pblabs.components.scene2D.SceneAlignment",  "com.pblabs.components.scene2D.SceneLayer",  "com.pblabs.components.scene2D.SceneLayerYOrdering",  "com.pblabs.components.scene2D.SceneView",  "com.pblabs.components.scene2D.js.SceneComponent",  "com.pblabs.components.scene2D.js.SceneLayer",  "com.pblabs.components.scene2D.js.SceneManager",  "com.pblabs.components.scene2D.js.CircleSprite",  "com.pblabs.components.scene2D.js.FilledSprite",  "com.pblabs.components.scene2D.js.ImageSprite", "com.pblabs.components.tasks.AngleTask",  "com.pblabs.components.tasks.AnimatePropertyTask",  "com.pblabs.components.tasks.AnimateValueTask",  "com.pblabs.components.tasks.DelayTicksTask",  "com.pblabs.components.tasks.IEntityTask",  "com.pblabs.components.tasks.InterpolatingTask",  "com.pblabs.components.tasks.TaskComponent",  "com.pblabs.components.tasks.TaskUtil",  "com.pblabs.components.ui.BarDisplayComponent",  "com.pblabs.components.input.MouseInputComponent",  "com.pblabs.components.util.DataComponent",  "com.pblabs.engine.core.IPBGroup",  "com.pblabs.engine.core.SetManager",  "com.pblabs.engine.core.SignalBondManager",  "com.pblabs.engine.debug.Log",  "com.pblabs.components.input.InputManager",  "com.pblabs.engine.resource.IResource",  "com.pblabs.engine.resource.IResourceManager",  "com.pblabs.engine.resource.ResourcesBase",  "com.pblabs.engine.resource.ResourceManager",  "com.pblabs.engine.resource.XMLResource",  "com.pblabs.engine.injection.Attributes",  "com.pblabs.engine.injection.ComponentInjector",  "com.pblabs.engine.injection.Injector",  "com.pblabs.engine.resource.flash.RessyResource",  "com.pblabs.engine.resource.js.ImageResources", "com.pblabs.engine.util.PBUtil",   "org.transition9.geom.Circle",  "org.transition9.geom.CircleUtil",  "org.transition9.geom.Geometry",  "org.transition9.geom.LineSegment",  "org.transition9.geom.LineSegmentTools",  "org.transition9.geom.Polygon",  "org.transition9.geom.PolygonTools",  "org.transition9.geom.Rectangle",  "org.transition9.geom.RectangleTools",  "Vec2",  "Vec2Tools",  "org.transition9.geom.bounds.AbstractBounds",  "org.transition9.geom.bounds.BoundsCircle",  "org.transition9.geom.bounds.BoundsDisplayObject",  "org.transition9.geom.bounds.BoundsForwarding",  "org.transition9.geom.bounds.BoundsHighLowRes",  "org.transition9.geom.bounds.BoundsLine",  "org.transition9.geom.bounds.BoundsNone",  "org.transition9.geom.bounds.BoundsPoint",  "org.transition9.geom.bounds.BoundsPolygon",  "org.transition9.geom.bounds.BoundsRectangle",  "org.transition9.geom.bounds.BoundsUtil",  "org.transition9.geom.bounds.IBounds",  "org.transition9.geom.debug.GeometryTests",  "org.transition9.util.ArrayUtil",  "org.transition9.util.Assert",  "org.transition9.util.Cloneable",  "org.transition9.util.DisplayUtils",  "org.transition9.util.Enumerable",  "org.transition9.util.EqualableUtil",  "org.transition9.util.EventDispatcherUtil",  "org.transition9.util.GraphicsUtil",  "org.transition9.util.IterUtil",  "org.transition9.util.NumberUtil",  "org.transition9.util.Macros",  "org.transition9.util.Preconditions",  "org.transition9.util.ReflectUtil",  "org.transition9.util.SignallingVar",  "org.transition9.util.XmlTools",  "org.transition9.ds.Hashable",  "org.transition9.ds.Map",  "org.transition9.ds.Maps",  "org.transition9.ds.MapUtil",  "org.transition9.ds.MultiMap",  "org.transition9.ds.MultiSet",  "org.transition9.ds.Set",  "org.transition9.ds.Sets",  "org.transition9.ds.Triple",  "org.transition9.ds.Tuple",  "org.transition9.ds.maps.AbstractMap",  "org.transition9.ds.maps.BiMap",  "org.transition9.ds.maps.DynamicMap",  "org.transition9.ds.maps.ForwardingMap",  "org.transition9.ds.maps.HashableMap",  "org.transition9.ds.maps.ImmutableMap",  "org.transition9.ds.maps.KeyListMap",  "org.transition9.ds.maps.SortedMap",  "org.transition9.ds.maps.StringMap",  "org.transition9.ds.multimaps.AbstractMultiMap",  "org.transition9.ds.multimaps.ArrayMultiMap",  "org.transition9.ds.multimaps.ListMultiMap",  "org.transition9.ds.multimaps.SetMultiMap",  "org.transition9.ds.sets.MapSet",  "org.transition9.ds.sets.MultiMapSet",  "haxe.remoting.NodeJSHTMLConnection", "com.pblabs.components.base.ScaleComponent",  "com.pblabs.components.debug.XBlobDisplayComponent",  "com.pblabs.components.input.BaseInputManager",  "com.pblabs.components.input.GestureData",  "com.pblabs.components.input.GestureInputManager",  "com.pblabs.components.input.IInteractiveComponent",  "com.pblabs.components.input.InputData",  "com.pblabs.components.input.InputUtil",  "com.pblabs.components.input.MouseInputManager",  "com.pblabs.components.input.TouchInputManager",  "com.pblabs.components.scene2D.BaseSceneComponent",  "com.pblabs.components.scene2D.BaseSceneLayer",  "com.pblabs.components.scene2D.BaseSceneManager",  "com.pblabs.components.scene2D.IScene2D",  "com.pblabs.components.scene2D.flash.SceneComponent",  "com.pblabs.components.scene2D.flash.SceneManager",  "com.pblabs.components.scene2D.flash.SceneLayer",  "com.pblabs.components.scene2D.js.JSLayer",  "com.pblabs.components.scene2D.js.JSSceneManager",  "com.pblabs.components.scene2D.js.canvas.SceneComponent",  "com.pblabs.components.scene2D.js.canvas.SceneLayer",  "com.pblabs.components.scene2D.js.canvas.SceneManager",  "com.pblabs.engine.debug.LogTarget",  "com.pblabs.engine.resource.EmbeddedResource",  "com.pblabs.engine.resource.ImageResource",  "com.pblabs.engine.resource.Source",  "org.transition9.util.DebugUtil",  "org.transition9.util.SignalVar",  "org.transition9.util.SignalVarAdvanced",  "org.transition9.ds.Collection",  "org.transition9.ds.maps.TransformKeyMap",  "org.transition9.ds.maps.VariableExpiringMap", "com.pblabs.components.scene2D.CircleShape",  "com.pblabs.components.scene2D.ImageComponent",  "com.pblabs.components.scene2D.RectangleShape",  "com.pblabs.components.scene2D.ShapeComponent",  "com.pblabs.components.scene2D.js.css.SceneComponent",  "com.pblabs.components.scene2D.js.css.Circle",  "com.pblabs.components.scene2D.js.css.ImageComponent",  "com.pblabs.components.scene2D.js.css.Rectangle",  "com.pblabs.components.scene2D.js.css.SceneLayer",  "com.pblabs.components.scene2D.js.css.SceneManager", "com.pblabs.components.Constants", "com.pblabs.components.input.IInputData", "com.pblabs.components.manager.INode", "com.pblabs.components.manager.INodeChild", "com.pblabs.components.scene2D.SceneManagerList", "com.pblabs.components.scene2D.flash.TextComponent", "com.pblabs.components.spatial.BasicSpatialManager2D", "com.pblabs.components.spatial.SpatialComponent", "com.pblabs.components.tasks.TaskComponentTicked", "com.pblabs.editor.CreationPanel", "com.pblabs.editor.CustomEditorPanelComponent", "com.pblabs.editor.Editor", "com.pblabs.editor.EntityPanel", "com.pblabs.editor.TemplatePanel", "com.pblabs.editor.TimePanel", "com.pblabs.engine.core.PBManagerBase", "com.pblabs.engine.pooling.IObjectPool", "com.pblabs.engine.pooling.ObjectPool", "com.pblabs.engine.pooling.ObjectPoolMgr", "com.pblabs.engine.pooling.SpritePool", "com.pblabs.engine.resource.BitmapCacheResource", "com.pblabs.engine.resource.ResourceToken", "com.pblabs.engine.resource.SVGResource", "com.pblabs.engine.resource.flash.SwfResource", "org.transition9.util.HashUtil", "org.transition9.ds.Pair", "hsl.js.data.Touch", "hsl.js.translation.touch.GestureTranslator", "hsl.js.translation.touch.TouchTranslator", "com.pblabs.components.input.DragManager",  "com.pblabs.components.scene2D.SVGComponent",  "com.pblabs.components.spatial.IBounded",  "com.pblabs.components.tasks.SetFieldTask",  "com.pblabs.components.tasks.Tasks",  "com.pblabs.components.ui.UIUtil",  "com.pblabs.engine.time.ProcessManagerSubordinate",  "com.pblabs.engine.util.Predicates",  "org.transition9.util.BytesUtil",  "org.transition9.util.F",  "org.transition9.util.StateChange",  "org.transition9.ds.maps.KeyedObjectMap",  "org.transition9.ds.sets.ArraySet"]
licensedFiles["easel"] = ["com.pblabs.components.scene2D.js.Sprite", "easel.display.Canvas", "easel.display.Context2d"]
licensedFiles["sprintf"] = ["org.transition9.util.Sprintf"]
licensedFiles["haxe"] = ["org.transition9.ds.maps.IntHashMap",  "org.transition9.ds.maps.HashMap"]
licensedFiles["polygonal"] = ["org.transition9.util.MathUtil"]
# licensedFiles["mathx"] = ["mathx.Limits", "mathx.MersenneTwister", "mathx.RandomGenerator"]

hydrax_preamble = """/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax"""

headers["non_derived"] = hydrax_preamble + """
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/"""

headers["pbe"] = hydrax_preamble + """
 *
 * This file was derived from the equivalent actionscript PushButton Engine 
 * source file:
 * http://code.google.com/p/pushbuttonengine/
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/"""

headers["flashbang"] = hydrax_preamble + """
 *
 * This source file was derived from the actionscript Flashbang library.
 * A copy of the LGPL license is located at the root of the SDK.
 *
 * The original file source header (required by the LGPL license):
 *
 * Flashbang - a framework for creating Flash games
 * Copyright (C) 2008-2010 Three Rings Design, Inc., All Rights Reserved
 * http://code.google.com/p/flashbang/
 * 
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
 */"""

aspirin_derived_header = headers["flashbang"].replace("Flashbang - a framework for creating Flash games", "aspirin library - Taking some of the pain out of Actionscript development.")
aspirin_derived_header = aspirin_derived_header.replace("Copyright (C) 2008-2010 Three Rings Design, Inc., All Rights Reserved", "Copyright (C) 2007-2010 Three Rings Design, Inc., All Rights Reserved")
aspirin_derived_header = aspirin_derived_header.replace("http://code.google.com/p/flashbang/", "http://code.google.com/p/ooo-aspirin/")
aspirin_derived_header = aspirin_derived_header.replace("This source file was derived from the actionscript Flashbang library.", "This source file was derived from the actionscript aspirin library.");
headers["aspirin"] = aspirin_derived_header

headers["easel"] = hydrax_preamble + """
 *
 * This file was derived from source code from the easel library:
 * http://github.com/aduros/easel
 * Copyright (C) 2010 Bruno Garcia
 *
 * Currently no license is listed for the easel library, so for now, this 
 * code takes on the project default license.
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/"""

headers["sprintf"] = hydrax_preamble + """
 *
 * This file was derived from a sprintf function by Manish Jethani.
 * Original copyright notice:
 *
 *  Author:  Manish Jethani (manish.jethani@gmail.com)
 *  Date:	April 3, 2006
 *  Version: 0.1
 *
 *  Copyright (c) 2006 Manish Jethani
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a
 *  copy of this software and associated documentation files (the "Software"),
 *  to deal in the Software without restriction, including without limitation
 *  the rights to use, copy, modify, merge, publish, distribute, sublicense,
 *  and/or sell copies of the Software, and to permit persons to whom the
 *  Software is furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 *  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 *  DEALINGS IN THE SOFTWARE.  
 ******************************************************************************/"""
 
headers["haxe"] = hydrax_preamble + """
 *
 * Portions derived from Haxe std code.  Haxe std library license and copyright:
 *
 * Copyright (c) 2005, The haXe Project Contributors
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *   - Redistributions of source code must retain the above copyright
 *	 notice, this list of conditions and the following disclaimer.
 *   - Redistributions in binary form must reproduce the above copyright
 *	 notice, this list of conditions and the following disclaimer in the
 *	 documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE HAXE PROJECT CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE HAXE PROJECT CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 ******************************************************************************/"""

headers["polygonal"] = hydrax_preamble + """
 *
 * Portions derived from polygonal code.  Polygonal license and copyright:
 *
 *							_/										  _/   
 *	   _/_/_/	  _/_/	_/  _/	_/	_/_/_/	_/_/	_/_/_/	_/	
 *	  _/	_/  _/	_/  _/  _/	_/  _/	_/  _/	_/  _/	_/  _/	 
 *	 _/	_/  _/	_/  _/  _/	_/  _/	_/  _/	_/  _/	_/  _/	  
 *	_/_/_/	  _/_/	_/	_/_/_/	_/_/_/	_/_/	_/	_/  _/	   
 *   _/							_/		_/								
 *  _/						_/_/	  _/_/
 *
 * POLYGONAL - A HAXE LIBRARY FOR GAME DEVELOPERS
 * Copyright (c) 2009-2010 Michael Baczynski, http://www.polygonal.de
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 ******************************************************************************/"""


headers["mathx"] = """/* <license>
 * This file is part of the dis-Emi-A HaXe Library. Copyright © edA-qa mort-ora-y
 * For full copyright and license information please refer to doc/license.txt.
 * </license> 
 */"""

#Add/replace the license
def replaceLicense (f, header):
	newLines = []
	file = open(f)
	found_license = False
	in_license = False
	for line in file:
		if in_license and line.find("*/") > -1:
			found_license = True
			in_license = False
		elif found_license:
			newLines.append(line + "\n")
		elif line.find("package") > -1:
			found_license = True
			newLines.append(line)
		elif not found_license and line.find("/**") > -1:
			in_license = True
			
	file.close()
	file = open(f, 'w')
	file.write(header + "\n")
	for line in newLines:
		file.write(line[0:-1])
	file.close()
	
def getFullPackageName(f):
	return f.split("src/")[-1].replace("/", ".").replace(".hx", "")

def addLicensesToClasses (classes, header):
	for f in fileList:
		fileEquivalent = getFullPackageName(f)
		if classes.count(fileEquivalent) > 0:
			if filesAccountedFor.count(f) > 0:
				print "Warning, " + str(f)  + " is already accounted for"
			else:
				# print "Replacing header for " + str(f)
				replaceLicense(f, header)
				filesAccountedFor.append(f)
		
#Add all the licenses
for item in licensedFiles.iteritems():
	libkey = item[0]
	files = item[1]
	if libkey not in headers:
		print "No licence for " + libkey + ", using default"
		addLicensesToClasses(files, headers["non_derived"])
	else:
		addLicensesToClasses(files, headers[libkey])
	# print item

#Notify classes with no licence asssignment
print "No license assignment for "
for f in fileList:
	if filesAccountedFor.count(f) == 0:
		print getFullPackageName(f)

# for f in filesAccountedFor:
#	 print getFullPackageName(f)
