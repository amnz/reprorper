package jp.wda.reprorper.core.dao;

/**
 * ...
 * 
 * @author amnz
 */
@:native("jp.wda.reprorper.core.dao.MessagesDao")
extern interface MessagesDao {

	function selectBySection(section:String):java.util.List<Dynamic>;
	
	function selectByID(section:String, id:Int):Dynamic;
	
	function insertByColumns(section:String, author:String, message:String):Int;

}