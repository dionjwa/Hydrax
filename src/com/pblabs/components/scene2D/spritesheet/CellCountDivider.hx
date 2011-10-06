/*******************************************************************************
 * PushButton Engine
 * Copyright (C) 2009 PushButton Labs, LLC
 * For more information see http://www.pushbuttonengine.com
 * 
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D.spritesheet;

    import flash.geom.Rectangle;
    import com.pblabs.engine.debug.Logger;
    
    /**
     * Divide a spritesheet into cells based on count - ie, 4 cells by 3 cells.
     */
    class CellCountDivider implements ISpriteSheetDivider {
        /**
         * The number of cells in the x direction.
         */
        public function new() { 
        xCount = 1;
        yCount = 1;
        }
        
        public var frameCount(getFrameCount, null) : Int
        ;
        public var owningSheet(null, setOwningSheet) : SpriteSheetComponent;
        /**
         * The number of cells in the x direction.
         */
        [EditorData(defaultValue="1")]
        public var xCount:Int ;
        
        /**
         * The number of cells in the y direction.
         */
        [EditorData(defaultValue="1")]
        public var yCount:Int ;
        
        /**
         * @inheritDoc
         */
        [EditorData(ignore="true")]
        public function setOwningSheet(value:SpriteSheetComponent):SpriteSheetComponent{
            if(_owningSheet)
                Logger.warn(this, "set OwningSheet", "Already assigned to a sheet, reassigning may result in unexpected behavior.");
            _owningSheet = value;
        	return value;
           }
        
        /**
         * @inheritDoc
         */
        public function getFrameCount():Int
        {
            return xCount * yCount;
        }
        
        /**
         * @inheritDoc
         */
        public function getFrameArea(index:Int):Rectangle
        {
            if (!_owningSheet)
                throw new Error("OwningSheet must be set before calling this!");
            
            var imageWidth:Int = _owningSheet.imageData.width;
            var imageHeight:Int = _owningSheet.imageData.height;
            
            var width:Int = imageWidth / xCount;
            var height:Int = imageHeight / yCount;
            
            var x:Int = index % xCount;
            var y:Int = Math.floor(index / xCount);
            
            var startX:Int = x * width;
            var startY:Int = y * height;
            
            return new Rectangle(startX, startY, width, height);
        }
        
        /**
         * @inheritDoc
         */
        public function clone():ISpriteSheetDivider
        {
            var c:CellCountDivider = new CellCountDivider();
            c.xCount = xCount;
            c.yCount = yCount;
            return c;
        }
        
        var _owningSheet:SpriteSheetComponent;
    }
