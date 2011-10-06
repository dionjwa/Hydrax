package com.pblabs.components.physics; 

/**
  * Engine independent shape definitions.
  */
enum ShapeType  {
	CIRCLE(radius :Float, def :ShapeDefinition);
	BOX(w :Float, h :Float, def :ShapeDefinition);
	FIXED_BOX(x :Float, y :Float, w :Float, h :Float, def :ShapeDefinition);
}

class ShapeDefinition 
{
	public var density (default, null) :Float;
	public var restitution (default, null):Float;
	public var friction (default, null):Float;
	
	public function new (density :Float, restitution :Float, friction :Float)
	{
		this.density = density;
		this.restitution = restitution;
		this.friction = friction;
	}
}
