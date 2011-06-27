package com.pblabs.components.scene2D;


#if (flash || cpp || neko)
	typedef ImageData = flash.display.BitmapData;
#elseif js
	typedef ImageData = easel.display.Canvas;
#end
