package javax.servlet.http;
import haxe.Int64;

/**
 * ...
 * 
 */
@:native("javax.servlet.http.HttpSession")
extern interface HttpSession {

	public function getCreationTime():Int64;
	public function getId():String;
	public function getLastAccessedTime():Int64;
	public function getServletContext():ServletContext;
	public function setMaxInactiveInterval(interval:Int):Void;
	public function getMaxInactiveInterval():Int;
	public function getAttribute(name:String):Dynamic;
	public function getAttributeNames():java.util.Enumeration<String>;
	public function setAttribute(name:String, value:Dynamic):Void;
	public function removeAttribute(name:String):Void;
	public function invalidate():Void;
	public function isNew():Bool;

}