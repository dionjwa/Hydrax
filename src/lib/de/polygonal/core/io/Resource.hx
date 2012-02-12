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

import de.polygonal.core.event.IObservable;
import de.polygonal.core.event.IObserver;
import de.polygonal.core.event.Observable;
import flash.display.Bitmap;
import flash.display.Loader;
import flash.events.Event;
import flash.events.HTTPStatusEvent;
import flash.events.IEventDispatcher;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.Lib;
import flash.media.Sound;
import flash.media.SoundLoaderContext;
import flash.net.URLLoader;
import flash.net.URLLoaderDataFormat;
import flash.net.URLRequest;
import flash.system.ApplicationDomain;
import flash.system.LoaderContext;

/**
 * <p>A resource provides a unified interface for loading different types of external data into an application.</p>
 * <p>Example:</p>
 * <pre class="prettyprint">
 * import de.polygonal.core.event.IObservable;
 * 
 * import de.polygonal.core.fmt.Sprintf;
 * import de.polygonal.core.io.Resource;
 * import de.polygonal.core.io.ResourceEvent;
 * import de.polygonal.core.io.ResourceType;
 * import flash.display.Bitmap;
 * import flash.Lib;
 * import flash.net.URLRequest;
 * 
 * class ResourceTest implements IObserver
 * {
 *     static function main() {
 *         new ResourceTest();
 *     }
 * 
 *     public function new() {
 *         super();
 *         
 *         //load an image
 *         var url = "http://code.google.com/p/polygonal/logo?logo_id=1256506873";
 *         var res = new Resource(new URLRequest(url), "logo", ResourceType.PIC);
 *         res.attach(this);
 *         res.load();
 *     }
 *     
 *     override public function update(type:Int, source:IObservable, userData:Dynamic):Void {
 *         if (ResourceEvent.has(type)) {
 *             trace(Sprintf.format("received event '%s'", [ResourceEvent.getName(type)]));
 *         }
 *         
 *         if (type == ResourceEvent.RES_COMPLETE) {
 *             //image successfully loaded; attach to display list
 *             var res:Resource = userData;
 *             var o:Bitmap = res.content;
 *             Lib.current.addChild(o);
 *         }
 *     }
 * }
 * </pre>
 */
class Resource extends Observable
{
	static var _resources = new Array<Resource>();
	
	/**
	 * When a resource object is successfully loaded its content is stored in a global registry and can be resolved by using <em>Resource.userData</em> as a <code>key</code>.
	 */
	public static function resolve(key:String):Dynamic
	{
		for (res in _resources)
		{
			if (res.userData == key)
				return res.content;
		}
		return null;
	}
	
	/**
	 * Clears the global resource registry.
	 */
	public static function flush():Void
	{
		_resources = new Array<Resource>();
	}
	
	public static function loadSimple(url:String, ?key:String, onComplete:Void->Void):Void
	{
		var res = new Resource(new URLRequest(url), key);
		res.attach(Observable.delegate(function(type, source, userData)
		{
			onComplete();
			res.unload();
			return false;
		}), ResourceEvent.RES_COMPLETE);
		res.load();
	}
	
	/**
	 * Custom user data.
	 */
	public var userData:Dynamic;
	
	/**
	 * The resource type.
	 */
	public var type(default, null):ResourceType;
	
	/**
	 * The resource data:
	 * <ul>
	 * <li>a <em>DisplayObject</em> (<em>ResourceType.SWF, ResourceType.PIC</em>)</li>
	 * <li>a <em>Sound</em> object (<em>ResourceType.MP3</em>)</li>
	 * <li>a <em>String</em> containing the text of the loaded file (<em>ResourceType.TXT</em>)</li>
	 * <li>a <em>ByteArray</em> containing raw binary data (<em>ResourceType.RAW</em>)</li>
	 * <li>an <em>URLVariables</em> object containing <em>URL-encoded</em>variables (<em>ResourceType.URL</em>)</li>
	 * </ul>
	 */
	public var content(default, null):Dynamic;
	
	/**
	 * The application domain of the loaded content.<br/>
	 * Only available for swf files.
	 */
	public var contentDomain(_contentDomainGetter, never):ApplicationDomain;
	function _contentDomainGetter():ApplicationDomain
	{
		de.polygonal.core.util.Assert.assert(Std.is(_loader, Loader), "Std.is(_loader, Loader)");
		return _loader.contentLoaderInfo.applicationDomain;
	}
	
	/**
	 * Returns the url request for this resource.
	 */
	public var request(default, null):URLRequest;
	
	/**
	 * Returns download progress defined as a value between 0.0 and 1.0.
	 */
	public var progress(default, null):Float;
	
	/**
	 * Returns the error object in case the loading operation aborted with an i/o error.
	 */
	public var error(default, null):IOErrorEvent;
	
	/**
	 * The loader context for this resource.<br/>
	 * Only available for swf and mp3 files.<br/>
	 * This allows to customize the application domain (default=<em>ApplicationDomain.currentDomain</em>),
	 * the security domain (default=null) and wether or not to use a cross-domain policy file (default=false).
	 */
	public var context:Dynamic;
	
	/**
	 * The dowload rate measured in kbps.
	 */
	public var downloadRateKbps(_downloadRateKbpsGetter, never):Float;
	function _downloadRateKbpsGetter():Float
	{
		if (Math.isNaN(_bytesLoaded)) return Math.NaN;
		return _bytesLoaded * 8 / _timeDeltaMs;
	}
	
	var _loader:Dynamic;
	var _timeStartMs:Int;
	var _timeDeltaMs:Int;
	var _bytesLoaded:Float;
	
	/**
	 * @param request the url request pointing to the resource.
	 * @param userData custom user data. if omitted, userData is set to <code>request</code>.<em>url</em>.
	 * @param type the resource type. if omitted, the type is guessed from the file extension.
	 */
	public function new(request:URLRequest, ?userData:Dynamic, ?type:ResourceType):Void
	{
		super();
		
		this.request = request;
		
		if (type == null)
		{
			//guess file type from file name
			var suffix = request.url.split(".")[1];
			switch (suffix)
			{
				case "swf":               type = ResourceType.SWF;
				case "gif", "png", "jpg": type = ResourceType.PIC;
				case "mp3":               type = ResourceType.MP3;
				case "xml", "txt":        type = ResourceType.TXT;
				
				default:
				throw "unknown file type";
			}
		}
		
		this.type = type;
		
		if (userData == null)
			this.userData = request.url;
		else
			this.userData = userData;
		
		switch (type)
		{
			case SWF, PIC:
			
			_loader = new Loader();
			registerListener(_loader.contentLoaderInfo);
			
			case TXT, RAW, URL:
			
			_loader = new URLLoader();
			registerListener(_loader);
			
			case MP3:
			
			_loader = new Sound();
			registerListener(_loader);
		}
	}
	
	/**
	 * Destroys this object by explicitly nullifying all references for GC'ing used resources.
	 */
	override public function free():Void
	{
		throw "use Resource#unload() instead";
	}
	
	/**
	 * Starts the download operation.
	 */
	public function load(?observer:IObserver):Void
	{
		if (observer != null) attach(observer);
		
		switch (type)
		{
			case SWF, PIC:
				if (context == null) context = new LoaderContext(false, ApplicationDomain.currentDomain);
				_loader.load(request, context);
			
			case TXT:
				_loader.load(request);
				_loader.dataFormat = URLLoaderDataFormat.TEXT;
			
			case RAW:
				_loader.load(request);
				_loader.dataFormat = URLLoaderDataFormat.BINARY;
			
			case URL:
				_loader.load(request);
				_loader.dataFormat = URLLoaderDataFormat.VARIABLES;
			
			case MP3:
				if (context == null) context = new SoundLoaderContext();
				_loader.load(request, context);
		}
	}
	
	/**
	 * Unloads this resource or cancels a running download operation.
	 */
	public function unload():Void
	{
		switch (type)
		{
			case SWF, PIC:
				if (content != null)
				{
					//detach loaded file from display list
					if (content.parent != null && content.parent != _loader)
							content.parent.removeChild(content);
					
					//fires Event.UNLOAD
					#if flash10
					_loader.unloadAndStop();
					#else
					_loader.unload();
					#end
				}
				else
				{
					//download in progress, close stream
					try { _loader.close(); } catch (unknown:Dynamic) {}
					notify(ResourceEvent.RES_UNLOAD, this);
				}
			
			case TXT, RAW, URL, MP3:
				try { _loader.close(); } catch (unknown:Dynamic) {}
				notify(ResourceEvent.RES_UNLOAD, this);
		}
	}
	
	function registerListener(e:IEventDispatcher):Void
	{
		e.addEventListener(Event.OPEN                 , onOpen      );
		e.addEventListener(Event.COMPLETE             , onComplete  );
		e.addEventListener(Event.UNLOAD               , onUnload    );
		e.addEventListener(ProgressEvent.PROGRESS     , onProgress  );
		e.addEventListener(IOErrorEvent.IO_ERROR      , onIOError   );
		e.addEventListener(HTTPStatusEvent.HTTP_STATUS, onHTTPStatus);
	}
	
	function unregisterListener(e:IEventDispatcher):Void
	{
		e.removeEventListener(Event.OPEN                 , onOpen      );
		e.removeEventListener(Event.COMPLETE             , onComplete  );
		e.removeEventListener(Event.UNLOAD               , onUnload    );
		e.removeEventListener(ProgressEvent.PROGRESS     , onProgress  );
		e.removeEventListener(IOErrorEvent.IO_ERROR      , onIOError   );
		e.removeEventListener(HTTPStatusEvent.HTTP_STATUS, onHTTPStatus);
	}
	
	function onOpen(e:Event):Void
	{
		_timeStartMs = Lib.getTimer();
		_timeDeltaMs = 0;
		progress     = 0;
		notify(ResourceEvent.RES_START, this);
	}
	
	function onComplete(e:Event):Void
	{
		switch (type)
		{
			case SWF, PIC:
				content = _loader.content;
			
			case TXT, RAW, URL:
				content = _loader.data;
				
			case MP3:
				content = _loader;
		}
		
		_timeDeltaMs = Lib.getTimer() - _timeStartMs;
		_resources.push(this);
		
		progress = 1;
		notify(ResourceEvent.RES_COMPLETE, this);
	}
	
	function onUnload(e:Event):Void
	{
		notify(ResourceEvent.RES_UNLOAD, this);
		
		unregisterListener(_loader);
		_loader = null;
		
		if (Std.is(content, Bitmap)) cast(content, Bitmap).bitmapData.dispose();
		
		context = null;
		request = null;
		content = null;
		error   = null;
		
		super.free();
	}
	
	function onProgress(e:ProgressEvent):Void
	{
		_bytesLoaded = e.bytesLoaded;
		_timeDeltaMs = Lib.getTimer() - _timeStartMs;
		
		progress = e.bytesLoaded / e.bytesTotal;
		notify(ResourceEvent.RES_PROGRESS, progress);
	}
	
	function onIOError(e:IOErrorEvent):Void
	{
		error = e;
		
		try { _loader.close(); } catch (unknown:Dynamic) {}
		
		notify(ResourceEvent.RES_ERROR, this);
		
		unregisterListener(_loader);
		
		if (Std.is(content, Bitmap))
			cast(content, Bitmap).bitmapData.dispose();
		
		_loader  = null;
		context = null;
		request = null;
		content = null;
		
		super.free();
	}
	
	function onHTTPStatus(e:HTTPStatusEvent):Void
	{
		notify(ResourceEvent.RES_HTTP_STATUS, e.status);
	}
}