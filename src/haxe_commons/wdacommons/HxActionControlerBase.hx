package wdacommons;

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
	public var log(default, null):Logger = LoggerFactory.getLogger("jp.wda.system");
	/**  */
	public var context(default, null):HxContext;
	/**  */
	public var actionEnum(default, null):EnumValue;

	// コントローラ /////////////////////////////////////////////////////////////////////
	//                                                              Controller Methods //
	/////////////////////////////////////////////////////////////////////////////////////
	
	/** {@inheritDoc} */
	public function action(ctx:ServletContext, request:HttpServletRequest, section:String, parameter:String):String {
		this.context = JavaUtilities.hxContext(ctx, request, section);
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
		
		return invokeAPI(serviceMethod);
	}
	
	/**
	 * 
	 * @param	parameter
	 * @param	unknown
	 * @return
	 */
	public function unserializeError(parameter:String, unknown:Dynamic):Dynamic {
		return HxErrorResult.exception(unknown);
	}
	
	/**
	 * 
	 * @param	serviceMethod
	 * @return
	 */
	public function invokeAPI(serviceMethod:Dynamic):String {
		return SerializerTools.serialize( Reflect.callMethod(this, serviceMethod, Type.enumParameters(this.actionEnum)) );
	}
	
	/**
	 * 
	 * @return
	 */
	public function invoke():Dynamic {
		return HxErrorResult.error;
	}

}