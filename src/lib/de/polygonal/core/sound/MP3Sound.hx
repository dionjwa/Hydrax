/* Copyright (c) 2011 Michael Baczynski, http://www.polygonal.de, All Rights Reserved. 23.08.2011 15:21 */
package de.polygonal.core.sound;

import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.math.Mathematics;
import flash.display.Loader;
import flash.events.Event;
import flash.media.Sound;
import flash.system.ApplicationDomain;
import flash.system.LoaderContext;
import flash.utils.ByteArray;
import format.swf.Data;

#if !flash
"The MP3Sound class is only available for flash"
#end

/**
 * <p>Converts mp3 bytes to a <code>flash.media.Sound</code> object.</p>
 */
class MP3Sound
{
	public var qname(default, null):String;
	public var sound(default, null):Sound;
	
	var _onComplete:MP3Sound->Void;
	
	/**
	 * @param qname the fully qualified name for the generated Sound object.
	 */
	public function new(qname:String)
	{
		this.qname = qname;
	}
	
	/**
	 * Converts raw mp3 <code>data</code> to a <code>flash.media.Sound</code> object and calls
	 * <code>onComplete</code> once finished.
	 */
	public function ofBytes(data:ByteArray, onComplete:MP3Sound->Void):Void 
	{
		_onComplete = onComplete;
		
		trace(Sprintf.format("creating sound object \'%s\'", [qname]));
		
		var ctx = new format.abc.Context();
		var cl = ctx.beginClass(qname);
		cl.superclass = ctx.type('flash.media.Sound');
		ctx.finalize();
		
		var abcOutput = new haxe.io.BytesOutput();
		new format.abc.Writer(abcOutput).write(ctx.getData());
		var abcBytes:haxe.io.Bytes = abcOutput.getBytes();
		
		var swfOutput:haxe.io.BytesOutput = new haxe.io.BytesOutput();
		var swfFile:format.swf.Data.SWF =
		{
			header:
			{
				version: 10,
				compressed: true,
				width: 400,
				height: 300,
				fps: cast(60, Float),
				nframes: 1
			},
			tags:
			[
				TSandBox(25),
				TSound(_processMp3(data)),
				TActionScript3(abcBytes),
				TSymbolClass([{cid: 1, className: qname}]),
				TShowFrame
			]
		}
        
		new format.swf.Writer(swfOutput).write(swfFile);
        var swfBytes:haxe.io.Bytes = swfOutput.getBytes();
		
		var loader = new Loader();
        loader.contentLoaderInfo.addEventListener(Event.COMPLETE, _onLoadComplete, false, 0);
        loader.loadBytes(swfBytes.getData(), new LoaderContext(false, ApplicationDomain.currentDomain));
	}
	
	function _onLoadComplete(e:Event)
	{
		e.target.removeEventListener(Event.COMPLETE, _onLoadComplete);
		sound = cast Type.createInstance(e.target.applicationDomain.getDefinition(qname), []);
		_onComplete(this);
	}
	
	function _processMp3(mp3:ByteArray)
	{
		var i            = 0;
		var k            = Std.int(mp3.length);
		var beginIdx     = 0;
		var endIdx       = k;
		var numSamples   = 0;
		var firstFrame   = true;
		var samplingrate = 0;
		var channelmode  = 0;
		var frame        = new MPEGFrame();
		var state        = 'id3v2';
		
		while (i < k)
		{
			switch(state)
			{
				case 'id3v2':
					if (mp3[i] == 0x49 && mp3[i + 1] == 0x44 && mp3[i + 2] == 0x33)
					{
						i += 10 + ((mp3[i + 6] << 21) | (mp3[i + 7] << 14) | (mp3[i + 8] << 7) | mp3[i + 9]);
					}
					beginIdx = i;
					state = 'sync';
				
				case 'sync':
					if (mp3[i] == 0xff && (mp3[i + 1] & 0xe0) == 0xe0)
						state = 'frame';
					else
					if (mp3[i] == 0x54 && mp3[i + 1] == 0x41 && mp3[i + 2] == 0x47)
					{
						endIdx = i;
						i = mp3.length;
					}
					else
						i++;
				
				case 'frame':
					frame.setHeaderByteAt(0, mp3[i++]);
					frame.setHeaderByteAt(1, mp3[i++]);
					frame.setHeaderByteAt(2, mp3[i++]);
					frame.setHeaderByteAt(3, mp3[i++]);
					if (frame.hasCRC)
					{
						frame.setCRCByteAt(0, mp3[i++]);
						frame.setCRCByteAt(1, mp3[i++]);
					}
					if (firstFrame)
					{
						firstFrame = false;
						samplingrate = frame.samplingRate;
						channelmode = frame.channelMode;
					}
					numSamples += frame.samples;
					i += frame.getSize();
					state = 'sync';
			}
		}
		
		var soundRate;
		switch (samplingrate)
		{
			case 44100: soundRate = SoundRate.SR44k;
			case 22050: soundRate = SoundRate.SR22k;
			case 11025: soundRate = SoundRate.SR11k;
			default: throw 'unsupported sampling rate ' + samplingrate;
		}
		
		var	_soundData = new ByteArray();
		_soundData.writeShort(0); //seek samples (always 0)
		_soundData.writeBytes(mp3, beginIdx, endIdx - beginIdx); //raw data without ID3 metadata
		
		return
		{
			sid: 1,
			format: format.swf.Data.SoundFormat.SFMP3,
			rate: soundRate,
			is16bit: true,
			isStereo: channelmode != MPEGFrame.CHANNEL_MODE_MONO,
			samples: haxe.Int32.ofInt(numSamples),
			data: format.swf.Data.SoundData.SDMp3(0, haxe.io.Bytes.ofData(_soundData))
			
		};
	}
}

/**
 * borrowed from https://github.com/claus/as3swf
 * 
 * The MIT License
 * 
 * Copyright (c) 2009 côdeazur brasil Ltda, Claus Wahlers
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
private class MPEGFrame 
{
	inline public static var MPEG_VERSION_1_0          = 0;
	inline public static var MPEG_VERSION_2_0          = 1;
	inline public static var MPEG_VERSION_2_5          = 2;
	inline public static var MPEG_LAYER_I              = 0;
	inline public static var MPEG_LAYER_II             = 1;
	inline public static var MPEG_LAYER_III            = 2;
	inline public static var CHANNEL_MODE_STEREO       = 0;
	inline public static var CHANNEL_MODE_JOINT_STEREO = 1;
	inline public static var CHANNEL_MODE_DUAL         = 2;
	inline public static var CHANNEL_MODE_MONO         = 3;
	
	static var mpegBitrates = 
	[
		[
			[0, 32, 96, 128, 160, 192, 224, 256, 288, 320, 352, 384, 416, 448, -1     ],
			[0, 32, 48,  56,  64,  80,  96, 112, 128, 160, 192, 224, 256, 320, 384, -1],
			[0, 32, 40,  48,  56,  64,  80,  96, 112, 128, 160, 192, 224, 256, 320, -1]
		],
		[
			[0, 32, 48, 56, 64, 80, 96, 112, 128, 144, 160, 176, 192, 224, 256, -1],
			[0,  8, 16, 24, 32, 40, 48,  56,  64,  80,  96, 112, 128, 144, 160, -1],
			[0,  8, 16, 24, 32, 40, 48,  56,  64,  80,  96, 112, 128, 144, 160, -1]
		]
	];
	
	static var mpegSamplingRates = 
	[
		[44100, 48000, 32000],
		[22050, 24000, 16000],
		[11025, 12000,  8000]
	];
	
	public var samplingRate:Int;
	public var channelMode:Int;
	public var hasCRC:Bool;
	public var samples:Int;
	
	var _version:Int;
	var _layer:Int;
	var _bitrate:Int;
	var _padding:Bool;
	var _header:ByteArray;
	var _data:ByteArray;
	var _crc:ByteArray;
	
	public function new()
	{
		samples = 1152;
		_header = new ByteArray();
		_header.writeByte(0);
		_header.writeByte(0);
		_header.writeByte(0);
		_header.writeByte(0);
		_crc = new ByteArray();
		_crc.writeByte(0);
		_crc.writeByte(0);
	}
	
	public function getSize():Int
	{
		var ret = 0;
		if (_layer == MPEG_LAYER_I)
		{
			ret = Math.floor((12000 * _bitrate) / samplingRate);
			if (_padding) ret++;
			ret <<= 2;
		}
		else
		{
			ret = Math.floor(((_version == MPEG_VERSION_1_0) ? 144000 : 72000) * _bitrate / samplingRate);
			if (_padding) ret++;
		}
		return ret - 4 - (hasCRC ? 2 : 0);
	}

	public function setHeaderByteAt(index:Int, value:Int):Void
	{
		switch (index)
		{
			case 0:
				if (value != 0xff)
					throw 'not a mpeg header';
			
			case 1:
				if ((value & 0xe0) != 0xe0)
					throw 'not a mpeg header';
				
				var mpegVersionBits = (value & 0x18) >> 3;
				switch (mpegVersionBits)
				{
					case 3: _version = MPEG_VERSION_1_0;
					case 2: _version = MPEG_VERSION_2_0;
					default: throw 'unsupported mpeg version';
				}
				
				var mpegLayerBits = (value & 0x06) >> 1;
				switch (mpegLayerBits)
				{
					case 1: _layer = MPEG_LAYER_III;
					default: throw 'unsupported mpeg layer';
				}
				hasCRC = !((value & 0x01) != 0);
			
			case 2:
				var bitrateIndex = ((value & 0xf0) >> 4);
				if (bitrateIndex == 0 || bitrateIndex == 0x0f) throw 'unsupported bitrate index';
				_bitrate = mpegBitrates[_version][_layer][bitrateIndex];
				var samplingrateIndex = ((value & 0x0c) >> 2);
				if (samplingrateIndex == 3) throw 'Unsupported samplingrate index';
				samplingRate = mpegSamplingRates[_version][samplingrateIndex];
				_padding = ((value & 0x02) == 0x02);
			
			case 3:
				channelMode = ((value & 0xc0) >> 6);
			
			default:
				throw 'Index out of bound';
		}
		
		_header[index] = value;
	}
	
	public function setCRCByteAt(index:UInt, value:UInt):Void
	{
		if (index > 1) throw 'index out of bound';
		_crc[index] = value;
	}
}