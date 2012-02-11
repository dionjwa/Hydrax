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

import de.polygonal.core.event.IObservable;
import de.polygonal.core.event.IObserver;
import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.io.Resource;
import de.polygonal.core.io.ResourceEvent;
import de.polygonal.core.io.ResourceLoaderEvent;
import de.polygonal.core.io.ResourceType;
import de.polygonal.core.util.Assert;
import de.polygonal.ds.Hashable;
import de.polygonal.ds.LinkedQueue;
import flash.net.URLRequest;
import flash.utils.ByteArray;

/**
 * Provides back and forth conversion between a byte array and the font data of an EPSFMetricsReader object.
 */
class ByteArrayHandler implements IObserver
{
	public var bytes:ByteArray;
	
	public var glyphCommands:Array<flash.Vector<Int>>;
	public var glyphData:Array<flash.Vector<Float>>;
	public var glyphBounds:Array<Float>;
	public var minChar:Int;
	public var maxChar:Int;
	public var charCodeRange:Array<Bool>;
	
	public var isMonoSpace:Bool;
	public var emsquare:Float;
	public var ascent:Float;
	public var descent:Float;
	public var width:Float;
	public var spacingTable:Array<Int>;
	public var kerningTable:Array<Int>;
	
	var _data:EPSFMetricsReader;
	
	public function new()
	{
	}
	
	public function writeBytes(data:EPSFMetricsReader):Void
	{
		_data = data;
		
		bytes = new ByteArray();
		bytes.writeBoolean(_data.isMonoSpace);
		
		bytes.writeShort(_data.emsquare);
		bytes.writeShort(_data.ascent);
		bytes.writeShort(_data.descent);
		bytes.writeShort(_data.spacingValues[33]);
		
		_writeGlyphs();
		_writeBound();
		
		if (!_data.isMonoSpace)
		{
			_writeSpacing();
			_writeKerning();
		}
		
		bytes.position = 0;
		bytes.compress();
	}
	
	public function loadBytes(url:String):Void
	{
		var res = new Resource(new URLRequest(url), ResourceType.RAW);
		res.attach(this);
		res.load();
	}
	
	public function readBytes(bytes:ByteArray):Void
	{
		this.bytes = bytes;
		
		bytes.uncompress();
		isMonoSpace = bytes.readBoolean();
		
		emsquare = bytes.readShort();
		ascent = bytes.readShort();
		descent = bytes.readShort();
		width = bytes.readShort();
		
		_readGlyphs();
		_readBound();
		
		if (!isMonoSpace)
		{
			_readSpacing();
			_readKerning();
		}
	}
	
	public function update(type:Int, source:IObservable, userData:Dynamic):Void
	{
		if (type == ResourceEvent.RES_COMPLETE)
		{
			var res:Resource = userData;
			readBytes(res.content);
		}
	}
	
	function _writeSpacing():Void
	{
		bytes.writeShort(_data.spacingValues.length);
		for (i in _data.spacingValues)
			bytes.writeShort(i);
	}
	
	function _writeKerning():Void
	{
		var table = KerningTable.compute(_data);
		bytes.writeShort(table.length);
		for (i in table)
			bytes.writeShort(i);
	}
	
	function _writeGlyphs():Void
	{
		//write total number of glyphs to the byte stream
		//range is inclusive, e.g. [40,120] => length=121
		var numGlyphs = 0;
		for (i in 0..._data.charCodeRange.length)
		{
			if (_data.charCodeRange[i])
				numGlyphs++;
		}
		bytes.writeShort(numGlyphs);
		
		//write all glyphs to the byte stream
		for (i in 0..._data.charCodeRange.length + 1)
		{
			//skip excluded char codes
			if (!_data.charCodeRange[i]) continue;
			
			//don't destroy source queue
			var que:LinkedQueue<Dynamic> = cast _data.glyphData[i].clone(true);
			if (que == null) continue;
			
			var buffer = new LinkedQueue<Dynamic>();
			while (que.size() > 0)
			{
				switch (que.dequeue())
				{
					case 'm':
						
						var x = que.dequeue();
						var y = que.dequeue();
						buffer.enqueue('m');
						buffer.enqueue(x);
						buffer.enqueue(y);
						
					case 'l':
						
						var x = que.dequeue();
						var y = que.dequeue();
						buffer.enqueue('l');
						buffer.enqueue(x);
						buffer.enqueue(y);
						
					case 'c':
						
						var x0 = que.dequeue();
						var y0 = que.dequeue();
						var x1 = que.dequeue();
						var y1 = que.dequeue();
						var x2 = que.dequeue();
						var y2 = que.dequeue();
						var x3 = que.dequeue();
						var y3 = que.dequeue();
						buffer.enqueue('c');
						buffer.enqueue(x0);
						buffer.enqueue(y0);
						buffer.enqueue(x1);
						buffer.enqueue(y1);
						buffer.enqueue(x2);
						buffer.enqueue(y2);
						buffer.enqueue(x3);
						buffer.enqueue(y3);
				}
			}
			
			//write glyph character code
			bytes.writeShort(i);
			
			//write total number of commands, followed by the actual data
			bytes.writeShort(buffer.size());
			
			var l = buffer.size();
			var k = 0;
			while (buffer.size() > 0)
			{
				var x = buffer.dequeue();
				switch (x)
				{
					case 'm':
					
					bytes.writeByte(1);
					bytes.writeFloat(buffer.dequeue());
					bytes.writeFloat(buffer.dequeue());
					k += 3;
					
					case 'l':
					
					bytes.writeByte(2);
					bytes.writeFloat(buffer.dequeue());
					bytes.writeFloat(buffer.dequeue());
					k += 3;
					
					case 'c':
					
					bytes.writeByte(3);
					bytes.writeFloat(buffer.dequeue());
					bytes.writeFloat(buffer.dequeue());
					bytes.writeFloat(buffer.dequeue());
					bytes.writeFloat(buffer.dequeue());
					bytes.writeFloat(buffer.dequeue());
					bytes.writeFloat(buffer.dequeue());
					bytes.writeFloat(buffer.dequeue());
					bytes.writeFloat(buffer.dequeue());
					k += 9;
				}
			}
		}
	}
	
	function _writeBound():Void
	{
		var numBound = 0;
		for (i in 0..._data.glyphBounds.length)
		{
			if (_data.glyphBounds[i] != null)
				numBound++;
		}
		
		var k = 0;
		
		bytes.writeShort(numBound);
		for (i in 0..._data.glyphBounds.length + 1)
		{
			var aabb = _data.glyphBounds[i];
			if (aabb == null) continue;
			var charCode = i;
			
			k++;
			
			bytes.writeShort(charCode);
			bytes.writeFloat(aabb.minX);
			bytes.writeFloat(aabb.minY);
			bytes.writeFloat(aabb.maxX);
			bytes.writeFloat(aabb.maxY);
		}
	}
	
	function _readSpacing():Void
	{
		var k = bytes.readShort();
		spacingTable = new Array<Int>();
		for (i in 0...k)
			spacingTable[i] = bytes.readShort();
	}
	
	function _readKerning():Void
	{
		var k = bytes.readShort();
		kerningTable = new Array<Int>();
		for (i in 0...k)
			kerningTable[i] = bytes.readShort();
	}
	
	function _readGlyphs():Void
	{
		var numGlyphs = bytes.readShort();
		
		glyphCommands = new Array<flash.Vector<Int>>();
		glyphData = new Array<flash.Vector<Float>>();
		
		var ak = 0;
		
		for (i in 0...numGlyphs)
		{
			var charCode = bytes.readShort();
			
			ak++;
			
			var a = new flash.Vector<Int>();
			var b = new flash.Vector<Float>();
			
			glyphCommands[charCode] = a;
			glyphData[charCode] = b;
			
			var k = bytes.readShort();
			while (k > 0)
			{
				var byte = bytes.readByte();
				switch (byte)
				{
					case 1:
					
					var x = bytes.readFloat();
					var y = bytes.readFloat();
					k -= 3;
					
					a.push(1);
					b.push(x);
					b.push(y);
					
					case 2:
					
					var x = bytes.readFloat();
					var y = bytes.readFloat();
					k -= 3;
					
					a.push(2);
					b.push(x);
					b.push(y);
					
					case 3:
					
					var x0 = bytes.readFloat();
					var y0 = bytes.readFloat();
					var x1 = bytes.readFloat();
					var y1 = bytes.readFloat();
					var x2 = bytes.readFloat();
					var y2 = bytes.readFloat();
					var x3 = bytes.readFloat();
					var y3 = bytes.readFloat();
					k -= 9;
					
					a.push(3);
					b.push(x0);
					b.push(y0);
					b.push(x1);
					b.push(y1);
					b.push(x2);
					b.push(y2);
					b.push(x3);
					b.push(y3);
				}
			}
		}
	}
	
	function _readBound():Void
	{
		var numBound = bytes.readShort();
		glyphBounds = new Array<Float>();
		for (i in 0...numBound)
		{
			var charCode = bytes.readShort();
			var minX = bytes.readFloat();
			var minY = bytes.readFloat();
			var maxX = bytes.readFloat();
			var maxY = bytes.readFloat();
			
			glyphBounds.push(charCode);
			glyphBounds.push(minX);
			glyphBounds.push(minY);
			glyphBounds.push(maxX);
			glyphBounds.push(maxY);
		}
	}
}