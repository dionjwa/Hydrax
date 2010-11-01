/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.debug;

import haxe.PosInfos;

import haxe.Stack;

/**
 * As many libraries use their own log system, this class allows
 * transparently using any logger without a giant refactor.
 * Just replace the dynamic functions with your chosen logger.
 */
class Log
{
    public function new () {}
    
    public static dynamic function debug (msg :Dynamic, ?infos : PosInfos) :Void
    {
        trace("debug: " + msg, infos);
    }
    
    public static dynamic function info (msg :Dynamic, ?infos : PosInfos) :Void
    {
        trace("info: " + msg, infos);
    }
    
    public static dynamic function warn (msg :Dynamic, ?infos : PosInfos) :Void
    {
        trace("warn: " + msg, infos);
    }
    
    public static dynamic function error (msg :Dynamic, ?infos : PosInfos) :Void
    {
        trace("error: " + msg, infos);
    }
    
    public static dynamic function print (msg :Dynamic, ?infos : PosInfos) :Void
    {
        haxe.Log.trace(msg, infos);
    }
    
    public static function getStackTrace () :String
    {
        return haxe.Stack.toString(haxe.Stack.callStack());
    }
    
}


