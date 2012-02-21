package com.pblabs.components.scene2D;


#if (flash || cpp || neko || spaceport)
	typedef BitmapType = flash.display.Bitmap;
#elseif js
	typedef BitmapType = Canvas;
#end
