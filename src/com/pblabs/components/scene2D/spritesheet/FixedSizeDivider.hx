/*******************************************************************************
 * PushButton Engine
 * Copyright (C) 2009 PushButton Labs, LLC
 * For more information see http://www.pushbuttonengine.com
 * 
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D.spritesheet;

    import com.pblabs.engine.debug.Logger;
    
    import flash.geom.Rectangle;
    
    /**
     * Divide a sprite sheet into fixed-size cells.
     */
    class FixedSizeDivider implements ISpriteSheetDivider {
        /**
         * The width of each frame.
         */
        public function new() { 
        width = 32;
        height = 32;
        horizontalSpacing = 0;
        verticalSpacing = 0;
        }
        
        public var frameCount(getFrameCount, null) : Int
        ;
        public var owningSheet(null, setOwningSheet) : SpriteSheetComponent;
        /**
         * The width of each frame.
         */
        [EditorData(defaultValue="32")]
        public var width:Int ;
        
        /**
         * The height of each frame.
         */
        [EditorData(defaultValue="32")]
        public var height:Int ;
        
        /**
         * The horizonal spacing between frames
         */	  
        [EditorData(defaultValue="0")]
        public var horizontalSpacing:Int ;
        
        /**
         * The vertical spacing between frames
         */	  
        [EditorData(defaultValue="0")]
        public var verticalSpacing:Int ;
        
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
            if (!_owningSheet)
                throw new Error("OwningSheet must be set before calling this!");
            
            return Math.floor(_owningSheet.imageData.width / width) * Math.floor(_owningSheet.imageData.height / height);
        }
        
        /**
         * @inheritDoc
         */
        public function getFrameArea(index:Int):Rectangle
        {
            if (!_owningSheet)
                throw new Error("OwningSheet must be set before calling this!");
            
            var x:Int = index % Math.floor(_owningSheet.imageData.width / width);
            var y:Int = Math.floor(index / Math.floor(_owningSheet.imageData.width / width));
            
            return new Rectangle(x * (width + horizontalSpacing), y * (height + verticalSpacing), width, height);
        }
        
        /**
         * @inheritDoc
         */
        public function clone():ISpriteSheetDivider
        {
            var c:FixedSizeDivider = new FixedSizeDivider();
            c.width = width;
            c.height = height;
            return c;
        }
        
        var _owningSheet:SpriteSheetComponent;
    }
