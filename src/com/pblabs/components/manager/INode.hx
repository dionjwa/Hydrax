/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.manager;
interface INode<Child>
{
	var children (get_children, null) :Array<Child>;
	function removeChild (c :Child) :Void;
	function addChild (c :Child) :Void;
}
