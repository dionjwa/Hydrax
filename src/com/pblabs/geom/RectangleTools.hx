/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.geom;

import com.pblabs.geom.Rectangle;
import com.pblabs.geom.Vector2;

class RectangleTools
{
    public static function center (rect :Rectangle) :Vector2
    {
        return new Vector2(rect.left + rect.width / 2, rect.top + rect.height / 2);
    }
}


