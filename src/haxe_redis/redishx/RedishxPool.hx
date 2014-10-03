package redishx ;

/**
 * ...
 * 
 * @author amnz
 */
interface RedishxPool {

	public function getResource():Redishx;
	
	public function returnResource(resource:Redishx):Void;

}