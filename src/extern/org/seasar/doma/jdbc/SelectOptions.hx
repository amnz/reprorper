package org.seasar.doma.jdbc;
import haxe.Int64;

/**
 * ...
 * 
 * @author amnz
 */
@:native("org.seasar.doma.jdbc.SelectOptions")
extern class SelectOptions {

	static function get():SelectOptions;
	
	
	@:overload(function(aliases:Array<String>):SelectOptions{})
	function forUpdate():SelectOptions;
	
	@:overload(function(aliases:Array<String>):SelectOptions{})
	function forUpdateNowait():SelectOptions;
	
	@:overload(function(waitSeconds:Int, aliases:Array<String>):SelectOptions{})
	function forUpdateWait(waitSeconds:Int):SelectOptions;
	
	function offset(offset:Int):SelectOptions;
	
	function limit(limit:Int):SelectOptions;
	
	function count():SelectOptions;
	
	function getCount():Int64;

}