package jp.wda.commons ;

import haxe.Serializer;
import haxe.Unserializer;

/**
 * ...
 * 
 * @author amnz
 */
class SerializerTools {

	/* ↓mixinでは使わせないよ、って意味 */
	@:noUsing
	public static function serialize(data:Dynamic):String {
		return Serializer.run(data);
	}
	
	@:noUsing
	public static function unserialize(raw_data:String):Dynamic {
		return Unserializer.run(raw_data);
	}

}
