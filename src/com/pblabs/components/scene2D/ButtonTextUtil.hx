package com.pblabs.components.scene2D;

import com.pblabs.engine.core.IEntity;

class ButtonTextUtil
{
	/**
	  * Changes the text of relevant SceneComponents
	  */
	public static function setText (e :IEntity, text :String) :Void
	{
		for (svg in e.getComponentsByType(SVGComponent)) {
			svg.text = text;
		}
		//Other kinds of sceneComponents?
	}
	
}
