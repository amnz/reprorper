package redishx.impl ;

import redishx.Redishx;
import redishx.RedishxPool;
import redis.clients.jedis.JedisPool;

/**
 * ...
 * 
 * @author amnz
 */
class JedisPoolWrapper implements RedishxPool {

	// コンストラクタ ///////////////////////////////////////////////////////////////////
	//                                                                    Constructors //
	/////////////////////////////////////////////////////////////////////////////////////

	/**
	 * ...
	 *
	 */
	public function new(pool:JedisPool) {
		this.pool = pool;
	}

	// 内部フィールド定義 ///////////////////////////////////////////////////////////////
	//                                                                          Fields //
	/////////////////////////////////////////////////////////////////////////////////////

	private var pool:JedisPool;

	// プロパティ ///////////////////////////////////////////////////////////////////////
	//                                                                      Properties //
	/////////////////////////////////////////////////////////////////////////////////////


	// インスタンスメソッド /////////////////////////////////////////////////////////////
	//                                                                Instance Methods //
	/////////////////////////////////////////////////////////////////////////////////////

	/**
	 * 
	 * @return
	 */
	public function getResource():Redishx {
		return new JedisWrapper(pool.getResource());
	}
	
	/**
	 * 
	 * @param	resource
	 */
	public function returnResource(resource:Redishx):Void {
		var r:JedisWrapper = cast(resource, JedisWrapper);
		pool.returnResource(r.jedis);
	}

}