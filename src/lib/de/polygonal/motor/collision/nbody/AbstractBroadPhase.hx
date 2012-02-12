/*
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
package de.polygonal.motor.collision.nbody;

import de.polygonal.ds.pooling.ObjectPool;
import de.polygonal.motor.collision.nbody.pair.PairHandler;
import de.polygonal.motor.collision.nbody.pair.PairManager;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.geom.primitive.AABB2;
import de.polygonal.motor.Settings;
import de.polygonal.motor.World;

class AbstractBroadPhase<T:Proxy> implements BroadPhase
{
	var _bound:AABB2;
	var _pairManager:PairManager;
	var _pairHandler:PairHandler;
	var _proxyPool:ObjectPool<T>;
	var _proxyCount:Int;
	var _settings:Settings;
	var _isInitialized:Bool;
	
	public function new(pairHandler:PairHandler)
	{
		_bound        = null;
		_pairManager   = null;
		_pairHandler   = pairHandler;
		_proxyPool     = null;
		_proxyCount    = 0;
		_settings      = World.settings;
		_isInitialized = false;
	}
	
	public function free():Void 
	{
		if (!_isInitialized) return;
		
		for (proxy in _proxyPool) proxy.shape = null;
		_proxyPool.free();
		_pairManager.free();
		
		_proxyPool     = null;
		_pairManager   = null;
		_pairHandler   = null;
		_bound        = null;
		_isInitialized = false;
	}
	
	inline public function getProxy(proxyId:Int):Proxy
	{
		if (proxyId == Proxy.NULL_PROXY)
			return null;
		else
			return _proxyPool.get(proxyId);
	}
	
	public function setWorldBound(aabb:AABB2):Void 
	{
		free();
		
		#if debug
		de.polygonal.core.util.Assert.assert(_proxyCount == 0, "_proxyCount == 0");
		#end
		
		_bound = aabb.clone();
		_initPairHandler();
		_initHook();
		_isInitialized = true;
	}
	
	public function createProxy(shape:AbstractShape):Int 
	{
		//get a new proxy from the proxy pool;
		//the pool id is used as the proxy id, since it's unique
		var proxyId = _proxyPool.next();
		var proxy = _proxyPool.get(proxyId);
		proxy.id = proxyId;
		proxy.shape = shape;
		_proxyCount++;
		
		return proxyId;
	}
	
	public function removeProxy(proxyId:Int):Void 
	{
		#if debug
		de.polygonal.core.util.Assert.assert(proxyId != Proxy.NULL_PROXY, "proxyId != Proxy.NULL_PROXY");
		#end
		
		var proxy = _proxyPool.get(proxyId);
		_proxyPool.put(proxyId);
		proxy.id = Proxy.NULL_PROXY;
		proxy.shape = null;
		_proxyCount--;
	}
	
	public function updateProxy(proxyId:Int):Void 
	{
	}
	
	public function update():Void 
	{
	}
	
	public function insideBound(bound:AABB2):Bool 
	{
		return _bound.contains(bound);
	}
	
	public function queryAABB(bound:AABB2, shapes:Array<AbstractShape>, maxShapeCount:Int):Int 
	{
		return 0;
	}
	
	function _initHook():Void
	{
	}
	
	function _initProxyPool(C:Class<T>):Void
	{
		_proxyPool = new ObjectPool<T>(_settings.maxProxies);
		_proxyPool.allocate(_settings.lazyPooling, C);
	}
	
	function _initPairHandler():Void
	{
		#if debug
		de.polygonal.core.util.Assert.assert(_proxyCount == 0, "_proxyCount == 0");
		#end
		
		_pairManager = new PairManager(_settings.maxPairs, _pairHandler, this, _settings.lazyPooling);
	}
}