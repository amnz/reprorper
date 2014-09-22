package jp.wda.reprorper;

/**
 * ...
 * 
 * @author amnz
 */
enum HxActions {

	list(section:String);
	
	getLog(section:String, id:Int);
	
	write(section:String, message:String);

}