package com.pblabs.components.physics;

class CollisionPair<T>
{
	public var c1 :T;
	public var c2 :T;
	
	public function new (){}
	
	#if debug
	public function toString () :String
	{
	    return "CollisionPair " + c1 + " <->" + c2;
	}
	#end
}
