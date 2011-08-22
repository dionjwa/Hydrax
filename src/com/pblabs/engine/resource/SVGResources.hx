package com.pblabs.engine.resource;

/**
  * Loads and stores String(Svg) resources
  */
class SvgResources extends StringResources
{
	public function new ()
	{
		super(Type.enumConstructor(ResourceType.SVG));
	}
}
