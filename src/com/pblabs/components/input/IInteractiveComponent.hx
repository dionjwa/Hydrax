package com.pblabs.components.input;

import com.pblabs.engine.core.IEntityComponent;
import com.pblabs.geom.Vector2;

/**
  * Implementing classes must add
  * @sets("IInteractiveComponent")
  * to their class declaration
  */
interface IInteractiveComponent implements IEntityComponent
{
    function containsScreenPoint (pos :Vector2) :Bool;
}


