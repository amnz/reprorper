package jp.wda.commons ;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.ServletContext;

/**
 * ...
 * 
 * @author amnz
 */
interface HxActionControler {

	/**
	 * 
	 * @param	ctx
	 * @param	request
	 * @param	parameter
	 * @return
	 */
	public function action(ctx:ServletContext, request:HttpServletRequest, parameter:String):String;

}