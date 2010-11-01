/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
//
// _S_Id: SceneAlignment.as 231 2010-02-17 03:21:08Z dionjw _S_

package com.pblabs.components.scene;

import flash.geom.Point;
/**
 * SceneAlignment enum.
 */
enum SceneAlignment{
    BOTTOM_LEFT;
    BOTTOM_RIGHT;
    CENTER;
    TOP_LEFT;
    TOP_RIGHT;
    
    // public static var DEFAULT_ALIGNMENT:SceneAlignment = CENTER;

    // /**
    //  * Given an alignment constant from this class, calculate
    //  * @param outPoint
    //  * @param alignment
    //  * @param sceneWidth
    //  * @param sceneHeight
    //  *
    //  */
    // public static function calculate (outPoint :Point, alignment :SceneAlignment, sceneWidth :Float,
    //     sceneHeight :Float) :Void
    // {
    //     switch (alignment) {
    //         case CENTER:
    //             outPoint.x = sceneWidth * 0.5;
    //             outPoint.y = sceneHeight * 0.5;
    //             break;
    //         case TOP_LEFT:
    //             outPoint.x = outPoint.y = 0;
    //             break;
    //         case TOP_RIGHT:
    //             outPoint.x = sceneWidth;
    //             outPoint.y = 0;
    //             break;
    //         case BOTTOM_LEFT:
    //             outPoint.x = 0;
    //             outPoint.y = sceneHeight;
    //             break;
    //         case BOTTOM_RIGHT:
    //             outPoint.x = sceneWidth;
    //             outPoint.y = sceneHeight;
    //             break;
    //     }
    // }

    // /**
    //  * Get the value of the SceneAlignment enum that corresponds to the specified string.
    //  * If the value requested does not exist, an ArgumentError will be thrown.
    //  */
    // public static function valueOf (name :String) :SceneAlignment
    // {
    //     return cast( Enum.valueOf(SceneAlignment, name), SceneAlignment);
    // }

    // /**
    //  * Get the values of the SceneAlignment enum
    //  */
    // public static function values () :Array<Dynamic>
    // {
    //     return Enum.values(SceneAlignment);
    // }

    // /** @private */
    // public function new (name :String)
    // {
    //     super(name);
    // }
}
