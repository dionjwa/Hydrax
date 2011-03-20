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

import com.pblabs.util.Comparators;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;
using com.pblabs.util.ds.MapUtil;

/**
 * Builds Maps.
 *
 * @example
 * <listing version="3.0">
 * // builds a sorted, weak-value Map.
 * var myMap :Map = Maps.newBuilder(String)
 *	 .makeSorted()
 *	 .makeWeakValues()
 *	 .build();
 * </listing>
 */
// TODO: this will become cooler, as I add support for a few more Map types
// that can be combined.
// TODO: Weak key maps?
// TODO: (probably not) "externally hashable" maps, like our old HashMap. Bleah.
class MapBuilder<K, V>
{
	public function new (?keyClazz :Class<K>)
	{
		_keyClazz = keyClazz;
		_keyVals = new Array<Dynamic>();
	}

	/**
	 * Make the Map sorted. If no Comparator is specified, then one is
	 * picked based on the keyClazz, falling back to Comparators.compareUnknowns.
	 *
	 * @return this MapBuilder, for chaining.
	 */
	public function makeSorted (?comp :K->K->Int = null) :MapBuilder<K, V>
	{
		_sorted = true;
		_comp = comp;
		return this;
	}

	/**
	 * Make the Map have weakly-held values.
	 *
	 * @return this MapBuilder, for chaining.
	 */
	// public function makeWeakValues () :MapBuilder<K, V>
	// {
	//	 _weakValues = true;
	//	 return this;
	// }

	/**
	 * Make the Map a cache, disposing of the least-recently-accessed (or least-recently-inserted)
	 * mappings whenever size exceeds maxSize. Iterating over this map (via keys(), values(),
	 * or forEach()) will visit the oldest mappings first.
	 *
	 * @return this MapBuilder, for chaining.
	 */
	public function makeLR (maxSize :Int, ?accessOrder :Bool = true) :MapBuilder<K, V>
	{
		_maxSizeLR = maxSize;
		_accessOrderLR = accessOrder;
		return this;
	}

	/**
	 * Make the Map auto-expire elements.
	 *
	 * @param createExpiringMapCallback factory function that creates the expiring Map.  Used due to multiple expiring
	 * map types.
	 *
	 * @return this MapBuilder, for chaining.
	 */
	public function makeExpiring (createExpiringMapCallback :Map<K, V>->Map<K, V>) :MapBuilder<K, V>
	{
		_createExpiringMap = createExpiringMapCallback;
		return this;
	}
	
	/**
	 * Make the Map immutable.
	 */
	public function makeImmutable () :MapBuilder<K, V>
	{
		_immutable = true;
		return this;
	}

	/**
	 * Make the map compute values for missing keys with the given function.  If setDefaultValue is
	 * also used, the compute function will first create a value for a missing key, and if it
	 * returns undefined, then the default value will be used.
	 */
	public function makeComputing (computer :K->V) :MapBuilder<K, V>
	{
		_computer = computer;
		return this;
	}

	/**
	 * Make the Map have a default value other than undefined.  If makeComputing is also used, this
	 * will only be returned if the computing function returns undefined for a key.
	 */
	public function setDefaultValue (value :V) :MapBuilder<K, V>
	{
		_defaultValue = value;
		return this;
	}

	/**
	 * Put a mapping into the Map, once built.
	 * If put is called more than once with the same key, the last value put will be
	 * contained in the Map.
	 */
	public function set (key :K, value :V) :MapBuilder<K, V>
	{
		_keyVals.push(key);
		_keyVals.push(value);
		return this;
	}

	/**
	 * Put all the mappings in the specified Map.
	 */
	public function setAll (other :Map<K, V>) :MapBuilder<K, V>
	{
		var selfref = this;
		other.forEach(function (key :K, value :V) :Bool {
			selfref._keyVals.push(key);
			selfref._keyVals.push(value);
			return false;
		});
		return this;
	}

	/**
	 * Build the Map!
	 */
	public function build () :Map<K, V>
	{
		var isLR:Bool = (_maxSizeLR > 0);
		var isExpiring:Bool = _createExpiringMap != null;
		Preconditions.checkArgument(!isLR || !isExpiring, "Cannot be both LR and Expiring");
		var map :Map<K, V> = Maps.newHashMap(_keyClazz);
		if (isLR) {
			map = new LRMap<K, V>(map, _maxSizeLR, _accessOrderLR);
		} 
		else if (isExpiring) {
			map = _createExpiringMap(map);
		}
		if (_sorted) {
			map = new SortedMap<K, V>(map,
				_comp != null ? _comp : Comparators.createNullSafe(Comparators.createFor(_keyClazz)));
		}
		// Do Computing before DefaultValue to let the computing function try to come up with a
		// value first
		if (_computer != null) {
			map = new ValueComputingMap<K, V>(map, _computer);
		}
		if (_defaultValue != null) {
			map = new DefaultValueMap<K, V>(map, _defaultValue);
		}
		var ii:Int = 0;
		   while (ii < _keyVals.length) {
			map.set(_keyVals[ii], _keyVals[ii + 1]);
			ii += 2;
		   }
		if (_immutable) {
			map = new ImmutableMap<K, V>(map);
		}
		return map;
	}

	/** @private */
	var _keyClazz:Class<K>;

	/** @private */
	var _keyVals:Array<Dynamic>;

	/** @private */
	var _weakValues:Bool;

	/** The default value for the map. @private */
	var _defaultValue:Dynamic;

	/** Tracks sorting. @private */
	var _sorted:Bool;
	/** @private */
	var _comp:Dynamic;

	/** Tracks LR map usage. @private */
	var _maxSizeLR:Int;
	/** @private */
	var _accessOrderLR:Bool;

	var _createExpiringMap :Map<K, V>->Map<K, V>;
	
	/** Track immutability. @private */
	var _immutable:Bool;

	/** The function to compute missing values in the map. @private */
	var _computer:K->V;
}
