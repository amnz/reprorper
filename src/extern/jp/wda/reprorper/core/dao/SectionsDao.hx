package jp.wda.reprorper.core.dao;

/**
 * ...
 * 
 * @author amnz
 */
@:native("jp.wda.reprorper.core.dao.SectionsDao")
extern interface SectionsDao {

	function selectByKey(key:String):Dynamic;

}