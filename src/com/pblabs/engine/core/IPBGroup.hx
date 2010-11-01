/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.core;

import com.pblabs.engine.core.IPBObject;

/**
  * This interface is needed so that root interfaces such as
  * IPBContext don't import any concrete classes.
  */
interface IPBGroup implements IPBObject
{
    var rootGroup (get_rootGroup, null) :IPBGroup;
    
    function addToGroup (item :IPBObject):Bool;
    function removeFromGroup (item :IPBObject):Bool;
    function iterator () :Iterator<IPBObject>;
    
    /**
     * Destroy all the objects in this group, but do not delete the group.
     */
    function clear() :Void;
    
}

