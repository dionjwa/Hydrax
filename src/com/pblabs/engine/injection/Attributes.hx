/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
/*
 * Copyright (c) 2009, Franco Ponticelli <franco.ponticelli@gmail.com>
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *   - Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   - Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY FRANCO PONTICELLI "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL FRANCO PONTICELLI BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 */
package com.pblabs.engine.injection;
import com.pblabs.util.ReflectUtil;

import haxe.rtti.CType;

using Lambda;

class Attributes 
{
	static var cacheAttributes = new Hash<Attributes>();
	static var parser = ~/\s*[*]?\s*[@]([a-z0-9_]+)\s+([^\r\n]+)(?:\n|\r\n|\r)?/im;
	
	public static function of(cls : Class<Dynamic>, ?field : String) : Attributes {
		var name = Type.getClassName(cls) + (field == null ? '' : ':' + field);
		if (cacheAttributes.exists(name)) return cacheAttributes.get(name);
		var pcls = Type.getSuperClass(cls);
		var att = new Attributes(pcls != null ? of(pcls, field) : null);
		if(field == null)
			fillClassAttributes(cls, att);
		else
			fillFieldAttributes(cls, field, att);
		cacheAttributes.set(name, att);
		return att;
	}
	
	static function fillClassAttributes(cls : Class<Dynamic>, att : Attributes) {
		var x = ReflectUtil.getRttiXml(cls);
		if (x == null) return;
		fillAttributes(x, att);
	}
	
	static function fillFieldAttributes(cls : Class<Dynamic>, field : String, att : Attributes) {
		if (untyped cls.__rtti == null) return;
		var x = ReflectUtil.getRttiXml(cls);
		if (x == null) return;
		var fields = x.elementsNamed(field);
		if (!fields.hasNext()) return;
		fillAttributes(fields.next(), att, field);
	}
	
	static function fillAttributes(x : Xml, att : Attributes, ?field :String) 
	{
		var doc = x.elementsNamed("haxe_doc").next();
		if (doc == null) return;
		var s = doc.firstChild().nodeValue;
		while(s.length > 0) {
			if(!parser.match(s)) break;
			att.set(parser.matched(1), parser.matched(2));
			s = parser.matchedRight();
		}
	}
	
	public var parent(default, null) : Attributes;
	
	public function exists(key : String) {
		if (h.exists(key))
			return true;
		else if (parent == null)
			return false;
		else
			return parent.exists(key);
	}
	
	public function get(key : String, ?alternative : String) {
		if (h.exists(key))
			return h.get(key);
		else if (parent == null)
			return alternative;
		else
			return parent.get(key, alternative);
	}
	
	public function set(key : String, value : String) {
		h.set(key, value);
	}
	
	public function isInherited(key : String) {
		if (h.exists(key) || parent == null)
			return false;
		else
			return parent.exists(key);
	}
	
	public function keys() : Iterator<String> {
		var p = parent;
		var list = new List();
		while (p != null) {
			for (k in p.keys())
				if(!list.has(k))
					list.add(k);
			p = p.parent;
		}
		for (k in h.keys())
			if(!list.has(k))
				list.add(k);
		return list.iterator();
	}
	
	public function iterator() : Iterator<String> {
		var list = new List();
		for (k in keys())
			list.add(get(k));
		return list.iterator();
	}
	
	public function toString() {
		var a = [];
		for (k in keys()) {
			a.push(k + (isInherited(k) ? '*' : '') + ' : ' + get(k));
		}
		return '{ ' + a.join(', ') + ' }';
	}
	
	var h : Hash<String>;
	
	function new(parent : Attributes) {
		this.parent = parent;
		h = new Hash();
	}
}

