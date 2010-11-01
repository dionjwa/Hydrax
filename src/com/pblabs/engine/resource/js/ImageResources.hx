/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.resource.js;

import com.pblabs.engine.resource.ResourceBase;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ReflectUtil;
import com.pblabs.util.StringUtil;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

import js.Dom;

/**
  * Javascript image loader.
  */
class ImageResources extends ResourceBase<Image>
{
    public function new (name :String, baseLoc :String, imageRefs :Array<String>)
    {
        super(name);
        _imageRefs = imageRefs;
        _images = Maps.newHashMap(String);
        _baseLocation = baseLoc;
    }
    
    override public function load (onLoad :Void->Void, onError :Dynamic->Void) :Void
    {
        var self = this;
        var total = _imageRefs.length;
        var complete = 0;

        for (href in _imageRefs) {
            var image :Image = untyped __js__ ("new Image()");
            image.onload = function (_) {
                self._images.set(href, image);
                complete += 1;
                if (complete == total) {
                    onLoad();
                }
            }

            image.onerror = function (_) {
                onError("Error loading " + self._baseLocation + href);
            }
            image.src = _baseLocation+href;
        }
    }
    
    override public function get (?imageName :String) :Image
    {
        Preconditions.checkNotNull(imageName, "image name cannot be null");
        return _images.get(imageName);
    }
    
    override public function toString () :String
    {
        return "[ImageResources: " + _images + "]";
    }

    var _imageRefs :Array<String>;
    var _images :Map<String, Image>;
    var _baseLocation :String;
}


