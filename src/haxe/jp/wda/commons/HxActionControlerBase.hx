package jp.wda.commons;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * ...
 * 
 * @author amnz
 */
class HxActionControlerBase implements HxActionControler {

	// コンストラクタ ///////////////////////////////////////////////////////////////////
	//                                                                    Constructors //
	/////////////////////////////////////////////////////////////////////////////////////

	/**
	 * ...
	 *
	 */
	public function new() {
		
	}
	/** システムロガー */
	var log:Logger = LoggerFactory.getLogger("jp.wda.system");
	/**  */
	public var context:HxContext;
	/**  */
	public var actionEnum:EnumValue;

	// コントローラ /////////////////////////////////////////////////////////////////////
	//                                                              Controller Methods //
	/////////////////////////////////////////////////////////////////////////////////////
	
	/** {@inheritDoc} */
	public function action(ctx:ServletContext, request:HttpServletRequest, parameter:String):String {
		this.context = JavaUtilities.hxContext(ctx, request);
		var api:EnumValue;
		try {
			api = SerializerTools.unserialize(parameter);
		} catch (unknown : Dynamic) {
			return SerializerTools.serialize( unserializeError(parameter, unknown) );
		}
		
		var serviceMethod = null;
		try {
			serviceMethod = Reflect.field(this, Type.enumConstructor(api));
		} catch (unknown : Dynamic) {
			return SerializerTools.serialize( unserializeError(parameter, unknown) );
		}
		
		this.actionEnum = api;
		if (serviceMethod == null) {
			return SerializerTools.serialize( this.invoke() );
		}
		
		return SerializerTools.serialize( Reflect.callMethod(this, serviceMethod, Type.enumParameters(api)) );
	}
	
	/**
	 * 
	 * @param	parameter
	 * @param	unknown
	 * @return
	 */
	public function unserializeError(parameter:String, unknown:Dynamic):Dynamic {
		return HxErrorResult.error;
	}
	
	/**
	 * 
	 * @return
	 */
	public function invoke():Dynamic {
		return HxErrorResult.error;
	}

}