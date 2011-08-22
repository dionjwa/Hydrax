package com.pblabs.components.scene2D;

#if (flash || cpp || neko)
	typedef ImageData = flash.display.BitmapData;
#elseif js
	//Defined in html5
	// typedef ImageData = CanvasRenderingContext2D.ImageData;
#end
