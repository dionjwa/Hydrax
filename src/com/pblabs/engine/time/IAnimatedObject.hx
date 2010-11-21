/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file was derived from the equivalent actionscript PushButton Engine 
 * source file:
 * http://code.google.com/p/pushbuttonengine/
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
/*******************************************************************************
 * PushButton Engine
 * Copyright (C) 2009 PushButton Labs, LLC
 * For more information see http://www.pushbuttonengine.com
 * 
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.time;

   /**
	* This interface should be implemented by objects that need to perform
	* actions every frame. This is most often things directly related to
	* rendering, such as advancing frames of a sprite animation. For performing
	* physics, processing AI, or other things of that nature, responding to
	* ticks would be more appropriate.
	* 
	* <p>Along with implementing this interface, the object needs to be added
	* to the ProcessManager via the AddAnimatedObject method.</p>
	* 
	* @see ProcessManager
	* @see ITickedObject
	*/
   interface IAnimatedObject
   {
	  /**
	   * This method is called every frame by the ProcessManager on any objects
	   * that have been added to it with the AddAnimatedObject method.
	   * 
	   * @param deltaTime The amount of time (in seconds) that has elapsed since
	   * the last frame.
	   * 
	   * @see ProcessManager#AddAnimatedObject()
	   */
	  function onFrame(deltaTime:Float):Void;
   }
