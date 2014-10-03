package wdacommons ;

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
	 * @param	section
	 * @param	parameter
	 * @return
	 */
	public function action(ctx:ServletContext, request:HttpServletRequest, section:String, parameter:String):String;

}