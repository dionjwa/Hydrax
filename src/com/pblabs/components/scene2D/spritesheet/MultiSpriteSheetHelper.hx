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
    import com.pblabs.engine.entity.EntityComponent;
    
    import flash.geom.Point;
    import flash.utils.Dictionary;
    
    /**
     * Helper to manage many similar sprite sheets (for instance, multiple sheets
     * for the same character). You can specify a divider and directions-per-frame
     * count, then a dictionary where the keys are the names of the sheets (for 
     * instance "Run") and the file to load from (for instance 
     * "../assets/Images/MyCharacterRun.gif"). New SpriteSheetComponents are
     * created by this component and added to the owning Entity. Then you can get
     * at the sheets by referencing this component's owning entity and the name
     * of the sheet you specified in the Sheets dictionary.
     */ 
    class MultiSpriteSheetHelper extends EntityComponent {
        public function new() { 
        center = new Point();
        sheets = new Dictionary();
        dividers = new Dictionary();
        directionCount = new Dictionary();
        }
        
        public var divider:ISpriteSheetDivider;
        public var directionsPerFrame:Int;
        public var center:Point ;
        
        [TypeHint(type="String")]
        public var sheets:Dictionary ;
        
        [TypeHint(type="com.pblabs.rendering2D.ISpriteSheetDivider")]
        public var dividers:Dictionary ;
        
        [TypeHint(type="int")]
        public var directionCount:Dictionary ;
        
        override function onAdd():Void
        {
            // Debugging aid - make sure that none of the sheets we will be
            // creating already exist.
            for(var key:String in sheets)
            {
                if(owner.lookupComponentByName(key))
                    Logger.error(this, "onAdd", "Already have a component named '" + key + "', but we're going to be registering a sprite sheet with that name on entity '" + owner.name + "'!");
            }
            
            // Create the sheets.
            for(key in sheets)
            {
                var file:String = sheets[key];
                
                var newSheet:SpriteSheetComponent = new SpriteSheetComponent();
                
                if(directionCount[key] > 0)
                    newSheet.directionsPerFrame = directionCount[key];
                else
                    newSheet.directionsPerFrame = directionsPerFrame;
                
                if(Std.is( dividers[key], ISpriteSheetDivider))
                    newSheet.divider = dividers[key];
                else
                    newSheet.divider = divider.clone();
                
                newSheet.imageFilename = file;
                newSheet.center = center;
                
                owner.addComponent(newSheet, key);
            }
        }
    }
