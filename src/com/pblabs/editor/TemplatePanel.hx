package com.pblabs.editor;

import com.bit101.components.ComboBox;
import com.bit101.components.HBox;

import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IPBObject;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGameBase;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.util.Log;
import com.pblabs.util.Comparators;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

import flash.display.DisplayObjectContainer;

import flash.events.Event;

using Lambda;

using com.pblabs.util.IterUtil;

class TemplatePanel extends HBox
{
	var game :PBGameBase;
	
	public function new (parent :DisplayObjectContainer, game :PBGameBase)
	{
		super(parent);
		this.game = game;
	}

}
