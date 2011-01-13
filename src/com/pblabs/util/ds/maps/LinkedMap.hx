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
import com.pblabs.util.ds.Map;

/**
 * A map that maintains a linked list of entries. Can use a Dictionary as backing.
 * keys(), values(), and forEach() will all visit the oldest mappings first.
 *
 * @private
 */
class LinkedMap<K, V> extends ForeachingMap<K, V> 
{
	public function new (source :Map<K, V>)
	{
		super(source);
		_anchor = new LinkedEntry<K, V>(null, null); // fake entry
		_anchor.before = _anchor.after = _anchor;
	}

	public override function set (key :K, value :V) :V
	{
		var entry = newEntry(key, value);
		addNewEntry(entry);
		var previous :LinkedEntry<K, V> = cast super.set(key, untyped entry);
		return unlink(previous);
	}

	public override function get (key :K) :V
	{
		return unwrap(getEntry(key));
	}

	public override function remove (key :K) :V
	{
		return unlink(cast super.remove(key));
	}

	public override function clear () :Void
	{
		super.clear();
		_anchor.before = _anchor.after = _anchor;
	}

	public override function forEach (fn :K->V->Dynamic) :Void
	{
		// iterate over entries, oldest to newest.
		var entry = _anchor.after;
		while (entry != _anchor) {
			if (fn(entry.key, entry.value)) {
				break;
			}
			entry = entry.after;
	   }
	}

	/**
	 * Unlink the specified entry and return the value.
	 * @private
	 */
	function unlink (val :LinkedEntry<K, V>) :V
	{
		if (val == null) {
			return null;
		}
		val.remove();
		return val.value;
	}

	/**
	 * Unwrap the entry. Varargs so that it can be passed to Array.map.
	 * @private
	 */
	function unwrap (val :LinkedEntry<K, V>) :V
	{
		if (val == null) {
			return null;
		}
		// if (Std.is(val, LinkedEntry)) {
			// var le :LinkedEntry<K, V> = cast val;
			return val.value;
		// } else {
			// return cast val;
		// }
	}

	/**
	 * So that this can be overridden separately from the unwrap.
	 * @private
	 */
	function getEntry (key :K) :LinkedEntry<K, V>
	{
		untyped return super.get(key);
	}

	/**
	 * For overriding.
	 * @private
	 */
	function newEntry (key :K, value :V) :LinkedEntry<K,V>
	{
		return new LinkedEntry(key, value);
	}
	
	function addNewEntry (entry :LinkedEntry<K, V>) :Void
	{
		entry.addBefore(_anchor);
	}

	/** The anchor of our linked list. @private */
	var _anchor :LinkedEntry<K,V>;
}
