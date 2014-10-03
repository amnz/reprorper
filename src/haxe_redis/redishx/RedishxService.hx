package redishx ;

import redishx.Redishx;
import redishx.RedishxPool;

import wdacommons.HxActionControlerBase;
import wdacommons.HxErrorResult;
import wdacommons.SerializerTools;

/**
 * ...
 * 
 * @author amnz
 */
class RedishxService extends HxActionControlerBase {

	// コンストラクタ ///////////////////////////////////////////////////////////////////
	//                                                                    Constructors //
	/////////////////////////////////////////////////////////////////////////////////////

	/**
	 * ...
	 *
	 */
	public function new() {
		super();
	}

	// プロパティ ///////////////////////////////////////////////////////////////////////
	//                                                                      Properties //
	/////////////////////////////////////////////////////////////////////////////////////
	
	private var pool:RedishxPool;
	/**
	 * 
	 * @param	s
	 */
	public function setRedishxPool(s:RedishxPool):Void {
		this.pool = s;
	}
	
	/**
	 * 
	 */
	public var redis(default, null):Redishx;

	// インスタンスメソッド /////////////////////////////////////////////////////////////
	//                                                                Instance Methods //
	/////////////////////////////////////////////////////////////////////////////////////
	
	/** {@inheritDoc} */
	public override function invokeAPI(serviceMethod:Dynamic):String {
		try {
			this.redis = this.pool.getResource();
		}catch (exception:Dynamic) {
			log.error(exception);
			return SerializerTools.serialize( HxErrorResult.exception(exception) );
		}
		
		var result:Dynamic = Reflect.callMethod(this, serviceMethod, Type.enumParameters(this.actionEnum));
		
		this.pool.returnResource(redis);
		return SerializerTools.serialize( result );
	}

}