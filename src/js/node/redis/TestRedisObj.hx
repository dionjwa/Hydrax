package js.node.redis;

import bdog.redis.Redis;

class TestRedisObj
	implements SerializableRedis
{
	public var redisKey :String;
	
	public var id :String;
	public var age :Int;
	
	
	public function new ()
	{
	}
	
	public function fromRedisHash (data :Dynamic<String>) :Void
	{
		id = data.id;
		age = Std.parseInt(data.age);
	}
	
	public function toRedisHash () :Array<String> 
	{
		return ["id", id, "age", Std.string(age)];
	}
	
	public function toString () :String
	{
	    return com.pblabs.util.StringUtil.objectToString(this, ["id", "age"]);
	}
	
	public static function main () :Void
	{
	    var redis :RedisClient = Redis.newClient();
		trace("new appmanager");
		var obj = new node.redis.TestRedisObj();
		obj.redisKey = "testObj";
		obj.id = "testId";
		obj.age = 44;
		trace('obj=' + obj);
		node.redis.RedisObjectUtil.save(redis, obj, function () :Void {
			trace("saved");
			node.redis.RedisObjectUtil.getObject(redis, obj.redisKey, node.redis.TestRedisObj, 
			function (obj2 :node.redis.TestRedisObj) :Void {
				trace('obj2=' + obj2);
			});
		});
		
	}
	

}
