package com.pblabs.components.scene2D;


#if (flash || cpp || neko)
	typedef Image = flash.display.Bitmap;
#elseif js
	typedef Image = easel.display.Canvas;//js.Dom.Image;
#end
