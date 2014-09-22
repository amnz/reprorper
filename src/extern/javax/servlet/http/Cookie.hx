package javax.servlet.http;

/**
 * ...
 * 
 * @author amnz
 */
@:native("javax.servlet.http.Cookie")
extern class Cookie {

	public function new(name:String, value:String);
	
	public function setComment(purpose:String):Void;
	public function getComment():String;
	public function setDomain(pattern:String):Void;
	public function getDomain():String;
	public function setMaxAge(expiry:Int):Void;
	public function getMaxAge():Int;
	public function setPath(uri:String):Void;
	public function getPath():String;
	public function setSecure(flag:Bool):Void;
	public function getSecure():Bool;
	public function getName():String;
	public function setValue(value:String):Void;
	public function getValue():String;
	public function setVersion(v:Int):Void;
	public function getVersion():Int;

}