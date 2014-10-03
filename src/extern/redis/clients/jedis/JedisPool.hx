package redis.clients.jedis ;

/**
 * ...
 * 
 * @author amnz
 */
@:native("redis.clients.jedis.JedisPool")
extern class JedisPool {

	public function getResource():Jedis;
	public function returnResource(resource:Jedis):Void;

}
