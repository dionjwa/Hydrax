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

#if !doc
@:build(de.polygonal.core.event.ObserverMacro.create
([
	RES_START,
	RES_PROGRESS,
	RES_COMPLETE,
	RES_ERROR,
	RES_HTTP_STATUS,
	RES_UNLOAD
]))
#end
/**
 * <p>Updates triggered by a <em>Resource</em> class.</p>
 */
class ResourceEvent
{
	#if doc
	/**
	 * A resource has started a download operation.<br/>
	 * <em>userData</em>: the resource object.
	 */
	public static var RES_START:Int;
	
	/**
	 * The resource data is received as the download operation progresses.<br/>
	 * <em>userData</em>: the download progress in the range &#091;0,1&#093;.
	 */
	public static var RES_PROGRESS:Int;
	
	/**
	 * The resource has been loaded successfully.<br/>
	 * <em>userData</em>: the resource object.
	 */
	public static var RES_COMPLETE:Int;
	
	/**
	 * An i/o error occurred after trying to load a resource.<br/>
	 * <em>userData</em>: the resource object. 
	 */
	public static var RES_ERROR:Int;
	
	/**
	 * A network request for a resource was made over HTTP and an HTTP status code could be detected.<br/>
	 * <em>userData</em>: the HTTP status code.
	 */
	public static var RES_HTTP_STATUS:Int;
	
	/**
	 * The resource data was unloaded.<br/>
	 * <em>userData</em>: the resource object.
	 */
	public static var RES_UNLOAD:Int;
	#end
}