package;

import com.pblabs.engine.core.Entity;
import com.pblabs.engine.core.EntityComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.resource.IResource;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.XMLResource;
import com.pblabs.engine.serialization.Serializer;
import com.pblabs.engine.serialization.TemplateManager;
import com.pblabs.engine.util.PBUtil;
import com.pblabs.util.Assert;
import com.pblabs.util.MetaUtil;
import com.pblabs.util.ReflectUtil;
import com.pblabs.util.XMLUtil;

using Lambda;

using com.pblabs.components.scene.SceneUtil;

class Main #if flash extends flash.display.Sprite #end 
{
	public function new() 
	{
		#if flash
		super();
		#end
		// testInsertion();
		// testSerialization();
		
		testReflection();
	}
	
	public function testReflection () :Void
	{
		var foo = new Foo();
		
		trace(Type.getInstanceFields(Type.getClass(foo)));
		
		// for (f in Type.getInstanceFields(Type.getClass(foo))) {
		//	 var s = f + ": ";
		//	 switch (Type.typeof(Reflect.field(foo, f))) {
		//		 case TUnknown:
		//		 s += "TUnknown";
		//		 case TObject:
		//		 s += "TObject";
		//		 case TNull:
		//		 s += "TNull";
		//		 case TInt:
		//		 s += "TInt";
		//		 case TFunction:
		//		 s += "TFunction";
		//		 case TFloat:
		//		 s += "TFloat";
		//		 case TEnum(e):
		//		 s += "TEnum " + e;
		//		 case TClass(c):
		//		 s += "TClass " + Type.getClassName(c);
		//		 case TBool:
		//		 s += "TBool";
		//	 }
		//	 trace(s);
		// }
		
		// trace(MetaUtil.isFieldMetaData(Foo, "bar", "transient"));
		// trace(MetaUtil.isFieldMetaData(Foo, "bar", "transient2"));
		// trace(haxe.rtti.Meta.getFields(Foo));
		
		var s = new Serializer();
		var xml = Xml.createElement("foo");
		var e = new EntityComponent();
		Reflect.setField(e, "_name", "blah");
		
		// trace("e.name=" + e.name);
		// trace("ReflectUtil.field(e, name))=" + ReflectUtil.field(e, "name"));
		
		// trace(Serializer.isIgnored(e, "isRegistered"));
		
		s.serializeComplex(e, xml);
		trace(xml.toString());
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
		//	 trace(f + "=" + Reflect.field(e, f));
		//	 trace(f + "=" + Type.typeof(Reflect.field(e, f)));
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

class FooParent //implements haxe.rtti.Infos
{
	public function new ()
	{
	}

	var parentBar :Bar;
	var parentBool :Bool;
}

class Foo extends FooParent
{
	public function new ()
	{
		super();
		parentBar = new Bar();
		otherBar = new Bar();
	}
	
	@transient
	public var bar :Bar;
	public var otherBar (get_otherBar, set_otherBar) :Bar;
	var _otherBar :Bar;
	
	function get_otherBar () :Bar
	{
		return _otherBar;
	}
	
	function set_otherBar (val :Bar) :Bar
	{
		_otherBar = val;
		return val;
	}
	
}

class Bar
{
	public function new ()
	{
	}
}


