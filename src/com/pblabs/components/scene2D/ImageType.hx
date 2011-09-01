package com.pblabs.components.scene2D;


#if (flash || cpp || neko)
	typedef ImageType = flash.display.Bitmap;
#elseif js
	typedef ImageType = Image;
#end
