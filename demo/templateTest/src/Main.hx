package;

import com.pblabs.engine.serialization.TemplateManager;
import com.pblabs.util.XMLUtil;

class Main #if flash extends flash.display.Sprite #end 
{
    public function new() 
    {
        #if flash
        super();
        #end
        // var rsrc = new ResourceManager();
        // rsrc.addResource(new XMLResource("from web url", Source.url("http://localhost/crossdomain.xml")));
        // rsrc.addResource(new XMLResource("from local file", Source.url("../rsrc/sample.xml")));
        
        // var onLoad = function () :Void {
        //     trace(rsrc);
        // }
        // var onError = function (e :Dynamic) :Void {
        //     trace("Errror " +e);
        // }
        
        // rsrc.load(onLoad, onError);
        var x = Xml.parse("<foo someatt=\"someattvalu\">
            <a>
                text
            </a>
            <a>
                <b/>
            </a>
        </foo>").firstChild();
        
        for (c in x) {
            trace("\n");
            
            trace("c.nodeType=" + c.nodeType);
            trace("isComplexContent=" + XMLUtil.hasComplexContent(c));
            if (c.nodeType == Xml.Element) {
                trace("nodeName=" + c.nodeName);
                // trace("value=" + c.nodeValue);
            } else {//if (c.nodeType != Xml.Document) {
                trace("value=" + c.nodeValue);
                
            }
            trace("c=" + c.toString());
            
        }
        
    }

    public static function main() 
    {
        #if flash
        flash.system.Security.allowDomain('*');
        flash.Lib.current.addChild(new Main());
        #elseif js
        new Main();
        #end
    }
}


