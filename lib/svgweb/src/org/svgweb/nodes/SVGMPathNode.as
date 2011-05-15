package org.svgweb.nodes {

    import org.svgweb.core.SVGNode;
    import org.svgweb.utils.SVGUnits;
    import flash.events.Event;

    public class SVGMPathNode extends SVGNode {

        public function SVGMPathNode(svgRoot:SVGSVGNode, xml:XML, original:SVGNode = null):void {
            super(svgRoot, xml, original);
        }

        override protected function drawNode(event:Event = null):void {
            topSprite.visible = false;
            if ( (topSprite.parent != null) && (this._invalidDisplay) ) {
                this._invalidDisplay = false;

                if (this._xml != null) {
                    if (!this._parsedChildren) {
                        this.parseChildren();
                        this._parsedChildren = true;
                    }
                }
                topSprite.removeEventListener(Event.ENTER_FRAME, drawNode);
            }

            if (!this._initialRenderDone && topSprite.parent) {
                this._initialRenderDone = true;
                this.svgRoot.renderFinished();
            }
        }

        public function getSVGPathNode():SVGPathNode {
            var pathNode:SVGPathNode = null;
            var targetID:String = this._xml.@xlink::href;
            if (targetID) {
                if (targetID.match(/^#/)) {
                    targetID = targetID.substr(1);
                    pathNode = SVGPathNode(this.svgRoot.getNode(targetID));
                    return pathNode;
                }
            }
            return null;
        }
    }
}
