/*******************************************************************************
 * PushButton Engine
 * Copyright (C) 2009 PushButton Labs, LLC
 * For more information see http://www.pushbuttonengine.com
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D.spritesheet;

    import com.pblabs.engine.resource.SWFResource;

    import flash.display.*;
    import flash.geom.*;
    import flash.utils.Dictionary;

    /**
     * A class that is similar to the SpriteSheetComponent except the frames
     * are loaded by rasterizing frames from a MovieClip rather than splitting
     * a single image.
     */
    class SWFSpriteSheetComponent extends SpriteContainerComponent {
        /**
         * When cached is set to true (the default) the rasterized frames
         * are re-used by all instances of the SWFSpriteSheetComponent
         * with the same values for swf, smoothing, and clipName.
         */
        public function new() { 
        cached = true;
        _smoothing = true;
        _scale = new Point(1, 1);
        }
        
        public var bounds(getBounds, null) : Rectangle
        ;
        public var clipName(getClipName, setClipName) : String;
        public var isLoaded(getIsLoaded, null) : Bool
        ;
        public var scale(getScale, setScale) : Point;
        public var smoothing(getSmoothing, setSmoothing) : Bool;
        public var swf(getSwf, setSwf) : SWFResource;
        /**
         * When cached is set to true (the default) the rasterized frames
         * are re-used by all instances of the SWFSpriteSheetComponent
         * with the same values for swf, smoothing, and clipName.
         */
        public var cached:Bool ;

        /**
         * The SWF to be rasterized into frames.
         */
        public function getSwf():SWFResource{
            return _resource;
        }

        public function setSwf(value:SWFResource):SWFResource{
            _resource = value;
            _frames = null;
            _clip = null;
            deleteFrames();
        	return value;
           }

        /**
         * The name of the clip to instantiate from the SWF.
         * If this is null the root clip will be used.
         */
        public function getClipName():String{
            return _clipName;
        }

        public function setClipName(value:String):String{
            _clipName = value;
            _frames = null;
            _clip = null;
            deleteFrames();
        	return value;
           }

        /**
         * The bounds of the source MovieClip.
         * This can be used for clips that are expected to be rendered based on their bounds.
         */
        public function getBounds():Rectangle
        {
            return new Rectangle(_bounds.x, _bounds.y, _bounds.width * _scale.x, _bounds.height * _scale.y);
        }

        /**
         * Whether or not the bitmaps that are drawn should be smoothed. Default is True.
         */
        public function getSmoothing():Bool{
            return _smoothing;
        }
        public function setSmoothing(value:Bool):Bool{
            _smoothing = value;
        	return value;
           }

        /**
         * X/Y scaling for the SWF as it renders to bitmap.  
         * 
         * Value of (1, 1) mean no scaling (default).  
         * 
         * (0.5, 0.5) would be half the normal size, and (2, 2) would be double.
         */
        public function getScale():Point{
            return _scale.clone();
        }
        public function setScale(value:Point):Point{
            _scale = value.clone();
        	return value;
           }
        
        public override function getIsLoaded():Bool
        {
            if (!_resource || !_resource.isLoaded) 
                return false;

            if (!_frames) 
                rasterize();

            return _frames != null;
        }

        /**
         * Rasterizes the associated MovieClip and returns a list of frames.
         */
        override function getSourceFrames() : Array<Dynamic>
        {
            if (!_resource || !_resource.isLoaded)
                return null;

            if (!_frames)
                rasterize();

            return _frames;
        }

        /**
         * Reads the frames from the cache. Returns a null reference if they are not cached.
         */
        function getCachedFrames():CachedFramesData
        {
            if (!cached) 
                return null;

            return cast( _frameCache[getFramesCacheKey()], CachedFramesData);
        }

        /**
         * Caches the frames based on the current values.
         */
        function setCachedFrames(frames:CachedFramesData):Void 
        {
            if (!cached) 
                return;

            _frameCache[getFramesCacheKey()] = frames;
        }

        function getFramesCacheKey():String
        {
            return _resource.filename + ":" + (clipName ? clipName : "") + (_smoothing ? ":1" : ":0");
        }

        override function getRawFrame(index:Int) : BitmapData
        {
            var frame:BitmapData = super.getRawFrame(index);
            if (frame)
                return frame;

            if (!_frames || !_clip)
                return null;

            frame = rasterizeFrame(_clip, index + 1);
            _frames[index] = frame;
            
            return frame;
        }

        /**
         * Rasterizes the clip into an Array of BitmapData objects.
         * This array can then be used just like a sprite sheet.
         */
        function rasterize():Void
        {
            if (!_resource.isLoaded) return;

            var frames:CachedFramesData = getCachedFrames();
            if (frames)
            {
                _frames = frames.frames;
                _bounds = frames.bounds;
                _clip = frames.clip;
                return;
            }

            if (_clipName)
            {
                _clip = cast( _resource.getExportedAsset(_clipName), MovieClip);
                if (!_clip)
                    _clip = _resource.clip;
            }
            else
            {
                _clip = _resource.clip;
            }

            _frames = onRasterize(_clip);
            _bounds = _clip.getBounds(_clip);
            center = new Point(-_bounds.x, -_bounds.y);
            setCachedFrames(new CachedFramesData(_frames, _bounds, _clip));
        }

        /**
         * Performs the actual rasterizing. Override this to perform custom rasterizing of a clip.
         */
        function onRasterize(mc:MovieClip):Array<Dynamic>
        {
            var maxFrames:Int = swf.findMaxFrames(mc, mc.totalFrames);
            var rasterized:Array<Dynamic> = new Array(maxFrames);

            if (maxFrames > 0)
                rasterized[0] = rasterizeFrame(mc, 1);

            return rasterized;
        }

        function rasterizeFrame(mc:MovieClip, frameIndex:Int):BitmapData
        {
            if (mc.totalFrames >= frameIndex)
                mc.gotoAndStop(frameIndex);

            swf.advanceChildClips(mc, frameIndex);
            var bd:BitmapData = getBitmapDataByDisplay(mc);

            return bd;
        }

        /**
         * Draws the DisplayObject to a BitmapData using the bounds of the object.
         */
        function getBitmapDataByDisplay(display:DisplayObject):BitmapData 
        {
            var bounds:Rectangle = display.getBounds(display);

            var bd:BitmapData = new BitmapData(
                Math.max(1, Math.min(2880, bounds.width * scale.x)),
                Math.max(1, Math.min(2880, bounds.height * scale.y)),
                true,
                0x00000000);

            bd.draw(display, new Matrix(_scale.x, 0, 0, _scale.y, -bounds.x * _scale.x, -bounds.y * _scale.y), null, null, null, _smoothing);

            return bd;
        }

        static var _frameCache:Dictionary = new Dictionary(true);

        var _smoothing:Bool ;
        var _scale:Point ;
        var _frames:Array<Dynamic>;
        var _resource:SWFResource;
        var _clipName:String;
        var _clip:MovieClip;
        var _bounds:Rectangle;
    }
