package;

import com.pblabs.components.base.LocationComponent;
import com.pblabs.engine.core.Entity;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.resource.IResource;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.XMLResource;
import com.pblabs.engine.serialization.TemplateManager;
import com.pblabs.engine.util.PBUtil;
import com.pblabs.util.Assert;
import com.pblabs.util.XMLUtil;
using com.pblabs.components.scene.SceneComponentUtil;

using Lambda;

class Main #if flash extends flash.display.Sprite #end 
{
    public function new() 
    {
        #if flash
        super();
        #end
        // testInsertion();
        testSerialization();
        
        
        // var e = new Entity();
        // trace(Reflect.hasField(e, "name"));
        
        // trace(Type.getInstanceFields(Type.getClass(e)).has("name"));
        
        // trace("Is dynamic=" + Std.is(e, Dynamic));
        
        // var anonymous :Dynamic = {};//Type.createInstance(Dynamic, []); 
        // anonymous.test = "foo";
        // trace(anonymous.test);
        // trace("Is dynamic=" + Std.is(anonymous, Dynamic));
        
        
        
        
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
        // var x = Xml.parse("<foo someatt=\"someattvalu\">
        //     <a>
        //         text
        //     </a>
        //     <a>
        //         <b/>
        //     </a>
        // </foo>").firstChild();
        
        // for (c in x) {
        //     trace("\n");
            
        //     trace("c.nodeType=" + c.nodeType);
        //     trace("isComplexContent=" + XMLUtil.hasComplexContent(c));
        //     if (c.nodeType == Xml.Element) {
        //         trace("nodeName=" + c.nodeName);
        //         // trace("value=" + c.nodeValue);
        //     } else {//if (c.nodeType != Xml.Document) {
        //         trace("value=" + c.nodeValue);
                
        //     }
        //     trace("c=" + c.toString());
            
        // }
        
    }
    
    public function testInsertion () :Void
    {
        var x = Xml.createDocument();//parse("<foo/>");
        var child = Xml.createElement("child");
        x.addChild(child);
        var test = Xml.createPCData("test");
        child.addChild(test);
        trace("child.nodeValue=" + child.nodeValue);
        test.addChild(Xml.parse("blah"));
        trace(x.toString());
    }
    
    public function testSerialization () :Void
    {
        var game = new PBGame();//#if flash this #end );
        var context :PBContext = game.allocate(PBContext);
        game.pushContext(context);
        game.run();
        
        // game.getManager(IResourceManager).addResource(new XMLResource("level", Source.url("../rsrc/level.xml")));
        var tm = context.getManager(TemplateManager); 
        var onLoad = function (xml :XMLResource) :Void {
            trace("loaded");
            var e = tm.instantiateEntity("dude", context);
            trace(PBUtil.entityToString(e));
            
        }
        
        var onError = function (e :Dynamic) :Void {
            trace("Froked " + e);
        }
        tm.signalLoaded.bind(onLoad);
        tm.loadFile("../rsrc/level.xml");
        // game.getManager(IResourceManager).load(onLoad, onError);
        
        // var e = context.allocate(IEntity);
        // // e.deferring = true;
        // e.initialize("dude");
        // e.addComponent(context.allocate(LocationComponent));
        // // e.deferring
        // var xml = Xml.createDocument();
        // e.serialize(xml);
        // trace(xml.toString());
        
        // e.destroy();
        
        // var e2 = context.allocate(IEntity);
        // e2.deserialize(xml.firstElement());
        // var xml2 = Xml.createDocument();
        // // var entityXML = Xml.createElement("entity");
        // e2.serialize(xml2);
        // trace(xml2.toString());
        // // trace(Reflect.fields(e));
        // trace(Type.getInstanceFields(Type.getClass(e)));
        // for (f in Type.getInstanceFields(Type.getClass(e))) {
        //     trace(f + "=" + Reflect.field(e, f));
        //     trace(f + "=" + Type.typeof(Reflect.field(e, f)));
        // }
        
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


