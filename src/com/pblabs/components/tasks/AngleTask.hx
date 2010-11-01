/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.tasks;

import feffects.easing.Cubic;
import feffects.easing.Linear;

import com.pblabs.engine.core.PropertyReference;
import com.pblabs.components.base.AngleComponent;
import com.pblabs.components.tasks.AnimatePropertyTask;
import com.pblabs.components.tasks.IEntityTask;

class AngleTask extends AnimatePropertyTask 
{
    
    public static function CreateLinear (angle :Float, time :Float)
        :AngleTask
    {
        return new AngleTask(angle, time, Linear.easeNone);
    }

    public static function CreateSmooth (angle :Float, time :Float)
        :AngleTask
    {
        return new AngleTask(angle, time, Cubic.easeInOut);
    }

    public static function CreateEaseIn (angle :Float, time :Float)
        :AngleTask
    {
        return new AngleTask(angle, time, Cubic.easeIn);
    }

    public static function CreateEaseOut (angle :Float, time :Float)
        :AngleTask
    {
        return new AngleTask(angle, time, Cubic.easeOut);
    }

    public function new (angle :Float, ?time :Float = 0,
                               ?easingFn :Float->Float->Float->Float->Float = null, ?ref :PropertyReference<Float>)
    {
        super(ref == null ? AngleComponent.P_ANGLE : ref, angle, time, easingFn);
    }

    public override function clone () :IEntityTask
    {
        return new AngleTask(_to, _totalTime, _easingFn);
    }

}


