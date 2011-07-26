package com.pblabs.util.ds;

class SetTools
{
	public static function toString(set :Iterable<Dynamic>, ?sep :String = ",") :String 
	{
		if (set == null) {
			return "null";
		}
		var s = new StringBuf();
		s.add("(");
		var it = set.iterator();
		for(i in it) {
			s.add(StringUtil.getStringKey(i));
			if( it.hasNext()) {
				s.add(sep + " ");
			}
		}
		s.add(")");
		return s.toString();
	}
}
