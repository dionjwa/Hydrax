/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This source file was derived from the actionscript aspirin library.
 * A copy of the LGPL license is located at the root of the SDK.
 *
 * The original file source header (required by the LGPL license):
 *
 * aspirin library - Taking some of the pain out of Actionscript development.
 * Copyright (C) 2007-2010 Three Rings Design, Inc., All Rights Reserved
 * http://code.google.com/p/ooo-aspirin/
 * 
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
 */
package com.pblabs.util.ds.maps;
import com.pblabs.util.Preconditions;

class ExpiringEntry<K, V> extends LinkedEntry<K, V> {
	
	/** Process time the entry will expire (in milliseconds) */
	public var expireTime :Int;

	public function new (key :K, value :V, expireTime :Int)
	{
		super(key, value);
		Preconditions.checkArgument(expireTime >= 0, "expireTime must be >= 0");
		this.expireTime = expireTime;
	}
	
	#if debug
	public function toString () :String
	{
		return com.pblabs.util.StringUtil.objectToString(this, ["key", "value", "expireTime"]); 
	}
	#end
}
