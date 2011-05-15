package {
    import flash.display.Sprite;
    import flash.external.ExternalInterface;

    [SWF(frameRate="40", width="100", height="100")]
    public class Main extends Sprite {
        public function Main():void {
            this.setupJavaScriptInterface();
        }
    
        /**
         * JavaScript interface setup
         **/
        protected function setupJavaScriptInterface():void {
            function js_receiveFromBrowser(jsMsg:String):String {
                return null;
            }
            try {
                ExternalInterface.addCallback("sendToFlash", js_receiveFromBrowser);
            }
            catch(error:SecurityError) {
            }
        }
    }
}
