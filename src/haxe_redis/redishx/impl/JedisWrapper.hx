package redishx.impl ;
import redis.clients.jedis.Jedis;

/**
 * ...
 * 
 * @author amnz
 */
class JedisWrapper implements Redishx {

	// コンストラクタ ///////////////////////////////////////////////////////////////////
	//                                                                    Constructors //
	/////////////////////////////////////////////////////////////////////////////////////

	/**
	 * ...
	 *
	 */
	public function new(jedis:Jedis) {
		this.jedis = jedis;
	}

	// 内部フィールド定義 ///////////////////////////////////////////////////////////////
	//                                                                          Fields //
	/////////////////////////////////////////////////////////////////////////////////////

	public var jedis(default, null):Jedis;

	// インスタンスメソッド /////////////////////////////////////////////////////////////
	//                                                                Instance Methods //
	/////////////////////////////////////////////////////////////////////////////////////

	/**
	 * 
	 * @param	key
	 * @return
	 */
	public function get(key:String):String {
		return jedis.get(key);
	}

	/**
	 * 
	 * @param	key
	 * @param	value
	 * @return
	 */
	public function set(key:String, value:String):String {
		return jedis.set(key, value);
	}
	
	/**
	 * 
	 * @param	pattern
	 * @return
	 */
	public function keys(pattern:String):Array<String> {
		var keys:java.util.Set<String> = jedis.keys(pattern);
		var result:Array<String> = new Array<String>();
		for (key in keys) {
			result.push(key);
		}
		
		return result;
	}
	
	/**
	 * 
	 * @param	key
	 * @return
	 */
	public function del(key:String):Float {
		return jedis.del(key);
	}

}