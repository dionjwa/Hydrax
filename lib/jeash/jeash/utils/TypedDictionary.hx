package jeash.utils;

class TypedDictionary<K,T> extends Dictionary {

	private var h : Dynamic;

	public function new(?weakKeys:Bool) : Void {
		super(weakKeys);
		untyped {
			h = __js__("{}");
			if( h.__proto__ != null ) {
				h.__proto__ = null;
				__js__("delete")(h.__proto__);
			}
		}
	}

	public function set( key : K, value : T ) : Void {
		untyped h[key] = value;
	}

	public function get( key : K ) : Null<T> {
		return untyped h[key];
	}

	public function exists( key : K ) : Bool {
		try {
			return untyped this.hasOwnProperty.call(h,key);
		}catch(e:Dynamic){
			untyped __js__("
				for(var i in this.h)
					if( i == key ) return true;
			");
			return false;
		}
	}

	public function delete( key : K ) : Bool {
		if( !exists(key) )
			return false;
		untyped __js__("delete")(h[key]);
		return true;
	}

	public function keys() : Iterator<String> {
		var a = new Array<String>();
		untyped __js__("
			for(var i in this.h)
				a.push(i.substr(1));
		");
		return a.iterator();
	}

	public function iterator() : Iterator<K> {
		return untyped {
			ref : h,
			it : keys(),
			hasNext : function() { return this.it.hasNext(); },
			next : function() { var i = this.it.next(); return i; }
		};
	}

}

