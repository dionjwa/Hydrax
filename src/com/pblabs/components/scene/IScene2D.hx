/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene;
import com.pblabs.engine.core.IEntityComponent;

/**
  * This is a marker interface, used for getting the SceneManager
  * without knowing the implementation.
  *
  * This interface doesn't need any methods as the SceneComponent
  * implemetations are typed.
  *
  * It extends IEntityComponent so the PropertyReference can be 
  * retrieved.
  */
interface IScene2D implements IEntityComponent
{

}

