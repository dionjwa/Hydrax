package com.pblabs.util;

import haxe.io.Bytes;

class BytesUtil
{
	public static function xorBytes (bytes :Bytes, xorKey :Int) :Bytes
	{
		var xoredBytes = Bytes.alloc(bytes.length);
		for (ii in 0...bytes.length) {
			xoredBytes.set(ii, bytes.get(ii) ^ xorKey);
		}
		return xoredBytes;
	}
	
}
