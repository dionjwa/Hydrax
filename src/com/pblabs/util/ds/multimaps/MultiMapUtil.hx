package com.pblabs.util.ds.multimaps;

class MultiMapUtil
{
	public static function partition <K, V>(map :MultiMap<K, V>, data :Iterable<V>, getKey :V->K) :MultiMap<K, V>
	{
		for (v in data) {
			map.set(getKey(v), v);
		}
		return map;
	}
	
}
