package com.pblabs.components.scene;

import com.pblabs.engine.core.IEntityComponent;

/**
  * This is a marker interface, used for getting the Scene2DManager
  * without knowing the implementation.
  *
  * This interface doesn't need any methods as the Scene2DComponent
  * implemetations are typed.
  *
  * It extends IEntityComponent so the PropertyRefernce can be 
  * retrieved.
  */
interface IScene2D implements IEntityComponent
{

}

