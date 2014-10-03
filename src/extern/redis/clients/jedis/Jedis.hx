package redis.clients.jedis ;

/**
 * ...
 * 
 * @author amnz
 */
@:native("redis.clients.jedis.Jedis")
extern class Jedis {
	
	public function get(key:String):String;

	public function set(key:String, value:String):String;
	
	public function keys(pattern:String):java.util.Set<String>;
	
	public function del(key:String):Float;

}