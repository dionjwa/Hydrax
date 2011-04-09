/*******************************************************************************
 * PushButton Engine
 * Copyright (C) 2009 PushButton Labs, LLC
 * For more information see http://www.pushbuttonengine.com
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D.flash;

    import flash.geom.Rectangle;
    
    /**
     * Interface for a scene layer which does caching and needs to know when a
     * renderer has changed its state.
     */
    interface ICachingLayer
    {
        /**
         * A renderer has changed its state/appearance/position and needs to be
         * redrawn.
         * @param dirtyRenderer The renderer which has changed.
         */
        function invalidate(dirtyRenderer:DisplayObjectRenderer):Void;
        
        /**
         * A region of the scene has become dirty and needs to be redrawn.
         * @param dirty The region in screen coordinates that is dirtied.
         */ 
        function invalidateRectangle(dirty:Rectangle):Void;
    }
