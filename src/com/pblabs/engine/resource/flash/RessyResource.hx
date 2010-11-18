/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.resource.flash;

import com.pblabs.engine.debug.Log;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ResourceBase;
import com.pblabs.util.Preconditions;

import ressy.Eddy;

import ressy.Loddy;

import ressy.Ressy;

/**
  * This is a placeholder class.  The Ressy package looks like a 
  * quick way to get resource loading in Flash.  Converting all
  * the PBE classes will take some time, if that's a good idea at 
  * all.  In the meantime, implement a minimal resource loading
  * interface.
  */
class RessyResource extends ResourceBase<Dynamic>
{
    #if embed
    public function new (name :String, swfFileName :String, fileListName :String)
    #else
    public function new (name :String, baseFileName :String)
    #end
    {
        super(name);
        #if embed
        _resourceFileName = swfFileName;
        _fileListName = fileListName;
        #else
        _resourceFileName = baseFileName;
        #end    
    }

    override public function load (onLoad :Void->Void, onError :Dynamic->Void) :Void
    {
        super.load(onLoad, onError);
        #if embed
        Eddy.instance.load(_resourceFileName, _fileListName, loaded);
        #else
        Loddy.instance.load(_resourceFileName, loaded);
        #end
    }
    
    override public function create (?name :String) :Dynamic
    {
        Preconditions.checkNotNull(name, "Name must be given");
        return Ressy.instance.getStr(name);
    }
    
    override public function unload () :Void
    {
        super.unload();
        Log.warn("Not implemented");
    }
    
    var _resourceFileName :String;
    var _fileListName :String;
}


