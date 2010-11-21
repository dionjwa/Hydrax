/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.util;

import com.pblabs.engine.core.EntityComponent;

/**
* Container for arbitrary data. As it is dynamic, you can set whatever
* fields you want. Useful for storing general purpose data.
*/

class DataComponent<T> extends EntityComponent, 
	implements Dynamic<T> 
{
	public function new() 
	{
		super();
	}
}
