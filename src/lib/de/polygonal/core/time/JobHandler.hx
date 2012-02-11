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
package de.polygonal.core.time;

import de.polygonal.core.event.IObservable;
import de.polygonal.core.event.IObserver;

class JobHandler implements IObserver
{
	var _timeline:Timeline;
	var _id:Int;
	var _job:Job;
	
	public function new(job:Job, duration:Float, delay = .0)
	{
		_timeline = Timeline.instance();
		_timeline.attach(this);
		_id = _timeline.schedule(duration, delay);
	}
	
	public function free():Void
	{
		if (_job != null) _timeline.cancel(_id);
	}
	
	public function update(type:Int, source:IObservable, userData:Dynamic):Void
	{
		if (_job == null) return;
		if( _timeline.id != _id) return;
		
		switch (type)
		{
			case TimelineEvent.INTERVAL_START:
				_job.onStart();
			
			case TimelineEvent.INTERVAL_PROGRESS:
				_job.onProgress(_timeline.progress);
			
			case TimelineEvent.INTERVAL_END:
				source.detach(this);
				_job.onComplete();
				_job = null;
				_timeline = null;
			
			case TimelineEvent.CANCEL:
				source.detach(this);
				_job.onAbort();
				_job = null;
				_timeline = null;
		}
	}
}