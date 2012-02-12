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
package de.polygonal.gl.text.util;

import de.polygonal.core.event.IObserver;
import de.polygonal.core.event.IObservable;
import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.io.Resource;
import de.polygonal.core.io.ResourceEvent;
import de.polygonal.core.io.ResourceLoader;
import de.polygonal.core.io.ResourceLoaderEvent;
import de.polygonal.core.io.ResourceType;
import de.polygonal.core.util.Assert;
import flash.events.Event;
import flash.Lib;
import flash.net.FileFilter;
import flash.net.FileReference;
import flash.net.FileReferenceList;
import flash.net.URLRequest;

/**
 * Fontographer 4.1 .eps/.met to .hx converter.
 */
class EPSConvert implements IObserver
{
	public static var charCodeRange:Array<Array<Int>> = [[33, 126]];
	
	var _fileRefList:FileReferenceList;
	var _priority:Int;
	var _loader:ResourceLoader;
	var _reader:EPSFMetricsReader;
	var _massSaver:MassSaver;
	
	var _epsData:String;
	var _metData:String;
	
	/** @param onComplete Invoked when all enqueued files are converted. */
	public function new(?onComplete:Void->Void = null)
	{
		_priority = 1000;
		_loader = new ResourceLoader();
		_loader.attach(this);
		_massSaver = new MassSaver(onComplete);
	}
	
	/** Nullifies references so all used resources can be garbage collected. */
	public function free():Void
	{
		if (_reader != null) _reader.free();
	}
	
	/**
	 * Displays a file-browsing dialog box that lets the user select one .eps and one .met file which
	 * is then converted to a HaXe class. After conversion is complete, another file-browsing dialog
	 * box opens that lets the user save the result to the local file system.<br/>
	 * Example:
	 * <pre>
	 * class Main
	 * {
	 *   public static function main():Void
	 *   {
	 *     de.polygonal.ds.mem.MemoryManager.allocate(10240);
	 *     var converter = new de.polygonal.gl.text.util.EPSConvert();
	 *     converter.select();
	 *   }
	 * }
	 * </pre>
	 */
	public function select():Void
	{
		_fileRefList = new FileReferenceList();
		_fileRefList.addEventListener(Event.SELECT, _onSelect);
		_fileRefList.browse
		(
			[
				new FileFilter("Fontographer 4.1 metrics file (.met)", "*.*"),
				new FileFilter("FontoGrapher 4.1 PS-Adobe-2.0 EPSF-1.2 file (.eps)", "*.*")
			]
		);
	}
	
	/**
	 * Adds an .eps and .met file for batch conversion.<br/>
	 * Example:<br/>
	 * <pre>
	 * class Main
	 * {
	 *   public static function main():Void
	 *   {
	 *     var onComplete = function() { trace("batch conversion complete"); }
	 * 
	 *     de.polygonal.ds.mem.MemoryManager.allocate(10240);
	 *     var converter = new de.polygonal.gl.text.util.EPSConvert(onComplete);
	 *     converter.add("./fonts/font1.eps", "./fonts/font1.met");
	 *     converter.add("./fonts/font2.eps", "./fonts/font2.met");
	 *     converter.add("./fonts/font3.eps", "./fonts/font3.met");
	 *     converter.run();
	 *   }
	 * }
	 * </pre>
	 */
	public function add(eps:String, met:String)
	{
		_loader.enqueue(new Resource(new URLRequest(met), "met", ResourceType.TXT), _priority--);
		_loader.enqueue(new Resource(new URLRequest(eps), "eps", ResourceType.TXT), _priority--);
	}
	
	/** Loads and converts each enqueued file. */
	public function run():Void
	{
		_loader.start();
	}
	
	public function update(type:Int, source:IObservable, userData:Dynamic):Void
	{
		if (type == ResourceEvent.RES_COMPLETE)
		{
			var res:Resource = userData;
			if (res.userData == "met")
			{
				trace(Sprintf.format("met file %s loaded", [userData.request.url]));
				_metData = userData.content;
			}
			else
			if (res.userData == "eps")
			{
				trace(Sprintf.format("eps file %s loaded", [res.request.url]));
				_epsData = res.content;
				
				var time = Lib.getTimer();
				
				if (_reader != null) _reader.free();
				
				_reader = new EPSFMetricsReader(_epsData, _metData, charCodeRange);
				_reader.name = _getClassName(res.request.url);
				
				var handler = new ByteArrayHandler();
				handler.writeBytes(_reader);
				
				var binaryData = handler.bytes;
				var stringData = new ClassFormatter(_reader).output;
				
				var binaryName = _reader.name + ".hxf";
				var stringName = _reader.name + ".hx";
				
				_massSaver.add(stringData, stringName);
				//_massSaver.add(binaryData, binaryName);
				
				Sprintf.format("done in %.3f seconds", [(Lib.getTimer() - time) / 1000]);
			}
		}
		else
		if (type == ResourceLoaderEvent.QUE_EMPTY)
		{
			source.detach(this);
			_massSaver.saveAll();
		}
	}
	
	function _onSelect(e:Event):Void 
	{
		var epsIndex = -1;
		var metIndex = -1;
		
		for (i in 0..._fileRefList.fileList.length)
		{
			if (_fileRefList.fileList[i].name.indexOf(".eps") != -1)
				epsIndex = i;
			if (_fileRefList.fileList[i].name.indexOf(".met") != -1)
				metIndex = i;
		}
		
		#if debug
		Assert.assert(epsIndex != -1 && metIndex != -1, "epsIndex != -1 && metIndex != -1");
		#end
		
		add(_fileRefList.fileList[epsIndex].name, _fileRefList.fileList[metIndex].name);
		run();
	}
	
	function _getClassName(s:String):String
	{
		s = s.substr(0, s.length - 4);
		s = s.substr(s.indexOf('/') + 1);
		s = s.split(' ').join('');
		return s;
	}
}

private class MassSaver
{
	var _data:Array<Dynamic>;
	var _urls:Array<String>;
	var _fref:FileReference;
	var _completeClosure:Void->Void;
	
	public function new(onComplete:Void->Void)
	{
		_data = new Array<String>();
		_urls = new Array<String>();
		_completeClosure = onComplete;
	}
	
	public function add(data:Dynamic, url:String):Void
	{
		_data.push(data);
		_urls.push(url);
	}
	
	public function saveAll():Void
	{
		_fref = new FileReference();
		_fref.addEventListener(Event.COMPLETE, _onComplete);
		_fref.addEventListener(Event.CANCEL, _onComplete);
		_fref.save(_data.pop(), _urls.pop());
	}
	
	function _onComplete(e:Event):Void
	{
		if (_data.length > 0) _fref.save(_data.pop(), _urls.pop());
		else
		{
			if (_completeClosure != null)
				_completeClosure();
		}
	}
}