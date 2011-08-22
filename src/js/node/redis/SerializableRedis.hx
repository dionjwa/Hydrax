package js.node.redis;

interface SerializableRedis
{
	/** The key redis uses to retrieve this object */
	var key :String;
	/** Parse this object from a redis hash */
	function fromRedisHash (data :Dynamic<String>) :Void;
	/** Converts this object to a String array for storing in a redis hash */
	function toRedisHash () :Array<String>;
}
