/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.geom;

import com.pblabs.geom.LineSegment;
import com.pblabs.geom.Vector2;

using com.pblabs.geom.VectorTools;

class LineSegmentTools
{

    public static function getMidpoint (line :LineSegment) :Vector2
    {
        return line.a.getMidpoint(line.b);
    }
}

