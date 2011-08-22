package js.node.redis;

import bdog.redis.Redis;

class RedisObjectUtil
{
	/** Retrieves an object from a redis hash */
	public static function getObject <T>(conn :RedisClient, key :String, cls :Class<T>, cb :T->Void) :Void
	{
		conn.exists(key, function (e :Err, exists :Int) :Void {
			if (exists == 1) {
				var obj :SerializableRedis = cast Type.createInstance(cls, com.pblabs.util.Constants.EMPTY_ARRAY);
				obj.key = key;
				loadObject(conn, obj, cb);
			} else {
				//No key
				cb(null);
			}
		});
	}
	
	/** Reloads an object from a redis hash */
	public static function loadObject <T>(conn :RedisClient, obj :SerializableRedis, cb :T->Void) :Void
	{
		conn.hgetall(obj.key, function (e :Err, fieldsAndValues :Array<Dynamic>) :Void {
			//fieldsAndValues must be converted to an array, since the object returned is actually
			//an object type, not an array type.  ie There is no length property.
			var data :Dynamic<String> = {};
			var ii :Int = 0;
			var len = Reflect.fields(fieldsAndValues).length;
			while (ii < len) {
				Reflect.setField(data, Std.string(fieldsAndValues[ii]), Std.string(fieldsAndValues[ii + 1]));
				ii += 2;
			}
			obj.fromRedisHash(data);
			cb(cast obj);
		});
	}
	
	/** Reloads an object to a redis hash */
	public static function saveObject (conn :RedisClient, obj :SerializableRedis, cb :Void->Void) :Void
	{
		com.pblabs.util.Assert.isNotNull(obj.key, " obj.key is null");
		conn.hmset(obj.key, obj.toRedisHash(), function (e :Err, status :String) :Void {
			cb();
		});
	}
	
	/** Removes the object from the redis db */
	public static function deleteObject (conn :RedisClient, obj :SerializableRedis, cb :Void->Void) :Void
	{
		com.pblabs.util.Assert.isNotNull(obj.key, " obj.key is null");
		conn.del(obj.key, function (e :Err, found :Int) :Void {
			cb();
		});
	}
}
