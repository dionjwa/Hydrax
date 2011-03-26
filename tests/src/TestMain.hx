package ;

import utest.Assert;

import utest.Runner;

import utest.ui.Report;

class TestMain
{
	public static function main() 
	{
		com.pblabs.engine.debug.Log.setup();
		
		var runner = new Runner();
		runner.addCase(new tests.DataStructuresTest());
		runner.addCase(new tests.ComponentsTest());
		Report.create(runner);
		runner.run();
	}
	
	public function new ()
	{
	}

}