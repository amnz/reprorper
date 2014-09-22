package javax.servlet;

/**
 * ...
 * 
 * @author amnz
 */
@:native("javax.servlet.ServletContext")
extern interface ServletContext {

	public function getContext(uripath:String):ServletContext;
	public function getMajorVersion():Int;
	public function getMinorVersion():Int;
	public function getMimeType(file:String):String;
	public function getResourcePaths(path:String):java.util.Set<String>;
	public function getResource(path:String):java.net.URL;
	public function getResourceAsStream(path:String):java.io.InputStream;
	public function getRequestDispatcher(path:String):RequestDispatcher;
	public function getNamedDispatcher(name:String):RequestDispatcher;
	public function log(msg:String, ?t:java.lang.Throwable):Void;
	public function getRealPath(path:String):String;
	public function getServerInfo():String;
	public function getInitParameter(name:String):String;
	public function getInitParameterNames():java.util.Enumeration<String>;
	public function getAttribute(name:String):Dynamic;
	public function getAttributeNames():java.util.Enumeration<String>;
	public function setAttribute(name:String, value:Dynamic):Void;
	public function removeAttribute(name:String):Void;
	public function getServletContextName():String;

}