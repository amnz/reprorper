package org.slf4j;

import java.lang.Throwable;
import java.StdTypes;

/**
 *
 */
@:native("org.slf4j.Logger")
extern interface Logger {

	public function debug(msg:String):Void;

	public function info(msg:String):Void;

	public function warn(msg:String):Void;

	public function error(msg:String):Void;

}
