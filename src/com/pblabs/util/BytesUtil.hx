/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
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
