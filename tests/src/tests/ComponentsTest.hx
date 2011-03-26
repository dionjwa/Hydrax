package tests;

import com.pblabs.components.util.DataComponent;

import utest.Assert;

class ComponentsTest 
{
	public function new() {}
	
	public function setup():Void
	{
	}
	
	public function tearDown():Void
	{
	}
	
	public function testDataComponentSerialization():Void
	{
		var d = new DataComponent<Dynamic>();
		d.test = "testtext";
		d.someInt = 3;
		
		var xml = Xml.createElement("comp");
		d.serialize(xml);
		
		var d2 = new DataComponent<Dynamic>();
		d2.deserialize(xml);
		
		for (f in Reflect.fields(d)) {
			Assert.isTrue(Reflect.field(d, f) == Reflect.field(d2, f));
		}
	}
}
