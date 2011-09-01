package com.pblabs.components.scene2D.flash;

import flash.display.Shape;

/**
  * This will change in the future, a static using method will be used 
  * to get the graphics context of any SceneComponent.
  */
class SceneComponentShape extends SceneComponent
{
	public var shape (default, null) :Shape;
	
	public function new ()
	{
		super();
		shape = new Shape();
		_displayObject = shape;
	}
}
