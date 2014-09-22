package org.slf4j;

/**
 * ...
 * @author ...
 */
@:native("org.slf4j.LoggerFactory")
extern class LoggerFactory {

	public static function getLogger(name:String):Logger;

}
