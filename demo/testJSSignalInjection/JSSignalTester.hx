package;

class JSSignalTester
{
	public function new ()
	{
		var foo = new Foo();
		var bar = new Bar();
		
		foo.signaler.bind(bar.listener);
		foo.signaler.bind(Reflect.field(bar, "listener"), bar);
		
		fire();
	}
	
	public static function main() 
	{
		new JSSignalTester();
	}

}

class Foo
{
	public var signaler :Signaler<String>;
	
	public function new ()
	{
		signaler = new DirectSignaler(this);
	}
	
	public function fire () :Void
	{
		signaler.dispatch("firing");
	}
	
	public function toString () :String
	{
		return "Foo";
	}
}

class Bar
{
	public function new ()
	{
	}
	
	public function listener (signalText :String) :Void
	{
		trace(signalText + " recieved on " + this);
	}
	
	public function toString () :String
	{
		return "Bar";
	}

}
