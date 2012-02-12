/*t
 *                            _/                                                    _/   
 *       _/_/_/      _/_/    _/  _/    _/    _/_/_/    _/_/    _/_/_/      _/_/_/  _/    
 *      _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/     
 *     _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/      
 *    _/_/_/      _/_/    _/    _/_/_/    _/_/_/    _/_/    _/    _/    _/_/_/  _/       
 *   _/                            _/        _/                                          
 *  _/                        _/_/      _/_/                                             
 *                                                                                       
 * POLYGONAL - A HAXE LIBRARY FOR GAME DEVELOPERS
 * Copyright (c) 2009-2010 Michael Baczynski, http://www.polygonal.de
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
package de.polygonal.core.util;

import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.log.Log;

/**
 * Idea borrowed from http://code.google.com/p/replicaisland/source/browse/trunk/src/com/replica/replicaisland/AllocationGuard.java
 */
class AllocationMonitor
{
	public static var Active  = false;
	public static var Profile = false;
	
	static var _hash:Hash<Int> = null;
	
	public static function dump():String
	{
		var s = "";
		for (key in _hash.keys())
		{
			s += Sprintf.format("%s -> %d\n", [key, _hash.get(key)]);
		}
		return s;
	}
	
	public function new()
	{
		if (Active)
			Log.getLog(AllocationMonitor).warn(Sprintf.format("Allocating %s while lock is active", [Type.getClassName(Type.getClass(this))]));
		
		if (Profile)
		{
			if (_hash == null) _hash = new Hash<Int>();
			var key = Type.getClassName(Type.getClass(this));
			if (!_hash.exists(key))
				_hash.set(key, 1);
			else
				_hash.set(key, _hash.get(key) + 1);
		}
	}
	
	public function count():Int
	{
		var key = Type.getClassName(Type.getClass(this));
		return _hash.get(key);
	}
}