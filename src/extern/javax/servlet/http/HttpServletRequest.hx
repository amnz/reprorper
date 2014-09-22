package javax.servlet.http;
import haxe.Int64;

/**
 * ...
 * 
 */
@:native("javax.servlet.http.HttpServletRequest")
extern interface HttpServletRequest {

	public function getAuthType():String;
	public function getCookies():Array<Cookie>;
	public function getDateHeader(name:String):Int64;
	public function getHeader(name:String):String;
	public function getHeaders(name:String):java.util.Enumeration<String>;
 	public function getHeaderNames():java.util.Enumeration<String>;
    public function getIntHeader(name:String):Int;
	public function getMethod():String;
	public function getPathInfo():String;
	public function getPathTranslated():String;
	public function getContextPath():String;
	public function getQueryString():String;
	public function getRemoteUser():String;
	public function isUserInRole(role:String):Bool;
	public function getUserPrincipal():java.security.Principal;
	public function getRequestedSessionId():String;
	public function getRequestURI():String;
	public function getRequestURL():StringBuf;
	public function getServletPath():String;
	public function getSession(?create:Bool):HttpSession;
	public function isRequestedSessionIdValid():Bool;
	public function isRequestedSessionIdFromCookie():Bool;
	public function isRequestedSessionIdFromURL():Bool;

	public function getAttribute(name:String):Dynamic;
	public function getAttributeNames():java.util.Enumeration<String>;
	public function getCharacterEncoding():String;
	public function setCharacterEncoding(env:String):Void;
	public function getContentLength():Int;
	public function getContentType():String;
	public function getParameter(name:String):String;
	public function getParameterNames():java.util.Enumeration<String>;
	public function getParameterValues(name:String):Array<String>;
	public function getParameterMap():java.util.Map<String, String>;
	public function getProtocol():String;
	public function getScheme():String;
	public function getServerName():String;
	public function getServerPort():Int;
	public function getRemoteAddr():String;
	public function getRemoteHost():String;
	public function setAttribute(name:String, value:Dynamic):Void;
	public function removeAttribute(name:String):Void;
	public function isSecure():Bool;
	public function getRequestDispatcher(path:String):RequestDispatcher;
	public function getRemotePort():Int;
	public function getLocalName():String;
	public function getLocalAddr():String;
	public function getLocalPort():Int;

}