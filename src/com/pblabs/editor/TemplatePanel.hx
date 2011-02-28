/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
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
