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
package com.pblabs.engine.util;

	/**
	 * Minimal interface required by SimplePriorityQueue.
	 * 
	 * <p>Items are prioritized so that the highest priority is returned first.</p>
	 * 
	 * @see SimplePriorityQueue
	 */
	interface IPrioritizable
	{

		/**
		 * Change the priority. You only need to implement the setter if you want
		 * SimplePriorityHeap.reprioritize to work. Otherwise it can
		 * simply throw an Error.
		 */
		var priority (get_priority, set_priority) :Int;
	}
