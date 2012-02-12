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
package de.polygonal.core.io;

import de.polygonal.core.event.IObserver;
import de.polygonal.core.event.IObservable;
import de.polygonal.core.event.Observable;
import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.log.Log;
import de.polygonal.ds.Cloneable;
import de.polygonal.ds.HashableItem;
import de.polygonal.ds.ListSet;
import de.polygonal.ds.Prioritizable;
import de.polygonal.ds.PriorityQueue;
import de.polygonal.ds.Set;
import de.polygonal.ds.HashKey;

private class PrioritizedResource extends HashableItem, implements Prioritizable, implements Cloneable<PrioritizedResource>
{
	public var res:Resource;
	
	public var priority:Float;
	public var position:Int;
	
	public function new(res:Resource, priority:Float)
	{
		super();
		
		this.res = res;
		this.priority = priority;
	}
	
	public function clone():PrioritizedResource
	{
		return new PrioritizedResource(res, priority);
	}
	
	public function toString():String
	{
		return Sprintf.format("{PrioritizedResource, url: %s}", [res.request.url]);
	}
}

/**
 * <p>A prioritized loading queue.</p>
 */
class ResourceLoader extends Observable, implements IObserver
{
	var _pq:PriorityQueue<PrioritizedResource>;
	
	var _isActive:Bool;
	var _activeResource:PrioritizedResource;
	var _loadedResources:Set<Resource>;
	
	var _reprioritized:Bool;
	
	var _min:Int;
	var _max:Int;
	
	/**
	 * The download progress of all resources as a value between 0.0 and 1.0.
	 */
	public var progress(default, null):Float;
	
	/**
	 * The total number of loaded resources.
	 */
	public var numLoadedResources(default, null):Int;
	
	/**
	 * The total number of pending resources.
	 */
	public var numRemainingResources(_numRemainingResourcesGetter, never):Int;
	function _numRemainingResourcesGetter():Int { return _pq.size(); }
	
	public function new()
	{
		super();
		
		_pq = new PriorityQueue<PrioritizedResource>(false);
		_loadedResources = new ListSet<Resource>();
	}
	
	/**
	 * Destroys this object by explicitly nullifying all references for GC'ing used resources.
	 */
	override public function free():Void
	{
		abort();
	}
	
	public function update(type:Int, source:IObservable, userData:Dynamic):Void
	{
		switch (type)
		{
			case ResourceEvent.RES_START:
				_computeProgress();
				notify(ResourceEvent.RES_START, _activeResource.res);
			
			case ResourceEvent.RES_COMPLETE:
				_pq.remove(_activeResource);
				numLoadedResources++;
				_computeProgress();
				var res:Resource = _activeResource.res;
				_activeResource = null;
				_loadedResources.set(res);
				notify(ResourceEvent.RES_COMPLETE, res);
				if (_isActive) _nextFile();
			
			case ResourceEvent.RES_PROGRESS:
				var total = (numLoadedResources - _min) + numRemainingResources - _max;
				progress = ((numLoadedResources - _min) / total) + (_activeResource.res.progress / total);
				notify(ResourceEvent.RES_PROGRESS, _activeResource.res);
			
			case ResourceEvent.RES_UNLOAD:
				if (_activeResource != null)
				{
					_activeResource.res.detach(this);
					if (_reprioritized)
					{
						_reprioritized = false;
						_nextFile();
					}
					else
						_activeResource = null;
				}
				else
				{
					var res:Resource = userData;
					_loadedResources.remove(res);
					res.detach(this);
					Log.getLog(ResourceLoader).info(Sprintf.format("unloadedresource '%s'", [res.request.url]));
				}
				
			case ResourceEvent.RES_ERROR:
				Log.getLog(ResourceLoader).warn(Sprintf.format("file '%s' not found", [userData.request.url]));
				_pq.remove(_activeResource);
				_activeResource.res.detach(this);
				notify(ResourceEvent.RES_ERROR, _activeResource.res);
				_activeResource = null;
				if (_isActive) _nextFile();
		}
	}
	
	/**
	 * Enqueues the resource <code>x</code>.
	 * @param priority defines the load order (higher value equals higher priority).
	 */
	public function enqueue(x:Resource, priority:Int):Void
	{
		_pq.enqueue(new PrioritizedResource(x, priority));
	}
	
	/**
	 * Downloads all enqueued resources in the order of their priority.
	 */
	public function start():Void
	{
		if (_activeResource != null) return;
		if (_pq.isEmpty()) return;
		
		if (numLoadedResources == 0)
			notify(ResourceLoaderEvent.QUE_START, null);
		
		_nextFile();
	}
	
	/**
	 * Aborts downloading all resources.
	 */
	public function abort():Void
	{
		_isActive = false;
		if (_activeResource != null)
		{
			_activeResource.res.unload();
			return;
		}
	}
	
	/**
	 * Reprioritizes an existing resource.
	 * @param x the url of the resource or a <em>Resource</em> object.
	 * @throws de.polygonal.core.util.AssertionError resource not found (debug only).
	 */
	public function reprioritize(x:Dynamic, newPriority:Int):Void
	{
		var pres:PrioritizedResource = null;
		if (Std.is(x, String))
		{
			var url:String = x;
			for (i in _pq)
			{
				if (i.res.request.url == url)
				{
					pres = i;
					break;
				}
			}
		}
		else
		{
			var res:Resource = x;
			for (i in _pq)
			{
				if (i.res == res)
				{
					pres = i;
					break;
				}
			}
		}
		
		#if debug
		de.polygonal.core.util.Assert.assert(pres != null, "pres != null");
		#end
		
		_pq.reprioritize(pres, newPriority);
		
		//TODO check
		if (_activeResource != null)
		{
			_reprioritized = true;
			_activeResource.res.unload();
		}
	}
	
	/**
	 * Returns the string form of the value that this object represents.
	 */
	public function toString():String
	{
		var s = "\n{ResourceLoader}";
		s += _pq;
		return s;
	}
	
	function _computeProgress():Void
	{
		progress = ((numLoadedResources - _min) / ((numLoadedResources - _min) + numRemainingResources - _max));
	}
	
	function _nextFile():Void
	{
		if (numRemainingResources > 0)
		{
			_isActive = true;
			_activeResource = _pq.peek();
			_activeResource.res.attach(this);
			_activeResource.res.load();
		}
		else
		{
			progress = 0;
			_activeResource = null;
			_isActive = false;
			notify(ResourceLoaderEvent.QUE_EMPTY, null);
		}
	}
}