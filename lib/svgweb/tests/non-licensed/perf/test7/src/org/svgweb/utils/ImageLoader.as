 /*
 Copyright (c) 2009 by contributors:
 
 * Google Inc. (Brad Neuberg -- http://codinginparadise.org)
 * James Hight (http://labs.zavoo.com/)
 * Richard R. Masters
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
*/

package org.svgweb.utils {
    
    import org.svgweb.nodes.SVGImageNode;
    import flash.utils.ByteArray;
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.DisplayObject;
    import flash.display.Loader;
    import flash.display.LoaderInfo;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.net.URLLoader;
    import flash.net.URLLoaderDataFormat;
    import flash.net.URLRequest;


    public class ImageLoader {

        protected var imageHref:String;
        protected var listeners:Array = new Array();

        private var urlLoader:URLLoader;
        private var bitmapData:BitmapData;

        public function ImageLoader(imageHref:String):void {
            this.imageHref = imageHref;
        }

        public function addListener(listener:SVGImageNode):void {
            this.listeners.push(listener);

            // started loading?
            if (urlLoader) {
                // loaded finished already?
                if (bitmapData) {
                    listeners[listeners.length-1].onImageLoaded(bitmapData);
                }
            }
            else {
                // start loading
                urlLoader = new URLLoader();
                urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
    
                urlLoader.addEventListener(Event.COMPLETE, onURLLoaderComplete);
    
                urlLoader.addEventListener(IOErrorEvent.IO_ERROR, onError);
                urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);

                try {
                    urlLoader.load(new URLRequest(imageHref));
                } catch (e:Error) {
                    for (var i:uint=0; i < listeners.length; i++) {
                        listeners[i].onImageError();
                    }
                    listener.dbg("svgweb:flash:URLLoader.load:"+e);
                }

                return;
            }
        }

        private function onError(event:IOErrorEvent):void {
            urlLoader = null;
            for (var i:uint=0; i < listeners.length; i++) {
                listeners[i].onImageError();
            }
        }

        private function onURLLoaderComplete( event:Event ):void {
            try {
                var bytes:ByteArray = ByteArray(urlLoader.data);
                this.loadBytes(bytes);
            }
            catch(e:Error) {
                for (var i:uint=0; i < listeners.length; i++) {
                    listeners[i].onImageError();
                }
            }
            urlLoader = null;
        }

        /**
         * Load image byte array
         * Used to support data: href.
         **/
        private function loadBytes(byteArray:ByteArray):void {
            var loader:Loader = new Loader();
            loader.contentLoaderInfo.addEventListener( Event.COMPLETE, onBytesLoaded );
            try {
                loader.loadBytes( byteArray );
            }
            catch(e:Error) {
                for (var i:uint=0; i < listeners.length; i++) {
                    listeners[i].onImageError();
                }
            }
        }


        /**
         * Display image bitmap once bytes have loaded 
         * Used to support data: href.
         **/
        private function onBytesLoaded( event:Event ) :void
        {
            var content:DisplayObject = LoaderInfo( event.target ).content;
            bitmapData = new BitmapData( content.width, content.height, true, 0x00000000 );
            bitmapData.draw( content );

            for (var i:uint=0; i < listeners.length; i++) {
                listeners[i].onImageLoaded(bitmapData);
            }
            
        }
    }
}
