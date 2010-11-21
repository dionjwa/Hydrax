package com.pblabs.components.input;

import com.pblabs.engine.core.IEntityComponent;
import com.pblabs.geom.Vector2;

/**
  * Minimal functionality needed to begin mouse/input device interactions.
  */
interface IInteractiveComponent implements IEntityComponent
{
	function containsScreenPoint (pos :Vector2) :Bool;
}


