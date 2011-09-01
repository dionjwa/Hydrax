/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.manager;

import com.pblabs.engine.core.IEntityComponent;

interface INodeChild<Parent:INodeParent<Dynamic>>
	implements IEntityComponent
{
	var parent :Parent;
	function removeFromParent () :Void;
	function removingFromParent() :Void;
	function addedToParent () :Void;
	function hasParent () :Bool;
}
