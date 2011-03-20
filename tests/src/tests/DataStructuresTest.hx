package tests;

import com.pblabs.engine.core.IPBContext;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

import utest.Assert;

class DataStructuresTest 
{
	var ctx :IPBContext;
	
	public function new() {}
	
	public function setup():Void
	{
	}
	
	public function tearDown():Void
	{
	}
	
	public function testClassMap():Void
	{
		var m :Map<Class<Dynamic>, String> = Maps.newHashMap(Class);
		m.set(String, "val:String");
		m.set(haxe.Md5, "val:haxe.Md5");
		
		Assert.isTrue(m.size() == 2);
		
		m.remove(haxe.Md5);
		Assert.isTrue(m.size() == 1);
		
		m.set(haxe.Md5, "val:haxe.Md5");
		
		Assert.isTrue(m.get(haxe.Md5) == "val:haxe.Md5");
		
		m.clear();
		Assert.isTrue(m.size() == 0);
		
		//Test mapping interfaces
		m.set(IFoo, "val:IFoo");
		m.set(IBar, "val:IBar");
		
		Assert.isTrue(m.size() == 2);
		
		Assert.isTrue(m.get(IFoo) == "val:IFoo");
	}
}

interface IFoo
{
	function foo() :Void;
	var varfoo :String;
}

interface IBar
{
	function bar() :Void;
	var varbar :String;
}