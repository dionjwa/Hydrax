package com.pblabs.util;

using Lambda;

class AsyncLambda
{
	/**
	  * Asynchronously calls f on the elements of it.  f takes a finish callback for that element.
	  */
	public static function iter<T> (it :Iterable<T>, f :T->(Void->Void)->Void, onFinish :Void->Void) :Void
	{
		var iterator = it.iterator();
		var asyncCall = null;
		asyncCall = function () :Void {
			if (iterator.hasNext()) {
				f(iterator.next(), asyncCall);
			} else {
				onFinish();
			}
		}
		asyncCall();
	}
}
