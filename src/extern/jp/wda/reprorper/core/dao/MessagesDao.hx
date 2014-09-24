package jp.wda.reprorper.core.dao;

import org.seasar.doma.jdbc.SelectOptions;

/**
 * ...
 * 
 * @author amnz
 */
@:native("jp.wda.reprorper.core.dao.MessagesDao")
extern interface MessagesDao {

	function selectBySection(section:String):java.util.List<Dynamic>;
	
	function selectByOption(section:String, options:SelectOptions):java.util.List<Dynamic>;
	
	function selectByFromTo(section:String, from:Float, to:Float):java.util.List<Dynamic>;
	
	function selectByID(section:String, id:Int):Dynamic;
	
	function insertByColumns(section:String, author:String, label:String, message:String):Int;

}