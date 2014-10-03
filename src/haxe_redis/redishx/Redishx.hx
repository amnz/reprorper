package redishx ;

/**
 * ...
 * 
 * @author amnz
 */
interface Redishx {
	
	public function get(key:String):String;

	public function set(key:String, value:String):String;
	
	public function keys(pattern:String):Array<String>;
	
	public function del(key:String):Float;

}
