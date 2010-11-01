/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene;
import com.pblabs.components.base.AlphaComponent;
import com.pblabs.components.base.AngleComponent;
import com.pblabs.components.base.LocationComponent;
import com.pblabs.components.tasks.TaskComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IPBContext;

class SceneComponentUtil
{
    public static function createBaseSceneEntity (context :IPBContext, name :String) :IEntity
    {
        var e :IEntity = context.allocate(IEntity);
        e.initialize(name);
        
        e.deferring = true;
        
        e.addComponent(context.allocate(LocationComponent));
        e.addComponent(context.allocate(AlphaComponent));
        e.addComponent(context.allocate(AngleComponent));
        e.addComponent(context.allocate(TaskComponent));
        
        return e;
    }
    
    public static function setLocation (e :IEntity, x :Float, y :Float) :Void
    {
        e.lookupComponent(LocationComponent).setLocation(x, y);
    }
    
}


