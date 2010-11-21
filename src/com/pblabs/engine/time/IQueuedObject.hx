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

import com.pblabs.engine.util.IPrioritizable;

/**
 * An object which will be called back at a specific time. This interface
 * contains all the storage needed for the queueing which the ProcessManager
 * performs, so that the queue has zero memory allocation overhead. 
 * 
 * @see ThinkingComponent
 */
interface IQueuedObject implements IPrioritizable{
	/**
	 * Time (in milliseconds) at which to process this object.
	 */
	function nextThinkTime():Float;
	
	/**
	 * Callback to call at the nextThinkTime.
	 */
	function nextThinkCallback():Dynamic;
}
