package wdacommons;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.ServletContext;

/**
 * ...
 * 
 * @author amnz
 */
class JavaUtilities {
	
	/**
	 * 
	 */
	public static function duplicate<T>(list:java.util.List<Dynamic>, clazz:Class<T>):Array<T> {
		var result = new Array<T>();
		for (i in 0 ... list.size()) {
			result.push(j2h(list.get(i), clazz));
		}
		
		return result;
	}
	
	/**
	 * 
	 */
	public static function j2h<T>(jObject:Dynamic, clazz:Class<T>):T {
		var hObject = Type.createEmptyInstance(clazz);

		var fields = Type.getInstanceFields(clazz);
		for (j in 0 ... fields.length) {
			var value:Dynamic = Reflect.getProperty(jObject, fields[j]);
			if ( Std.is(value, java.sql.Timestamp) ) {
				var jValue:java.sql.Timestamp = cast(value, java.sql.Timestamp);
				value = Date.fromTime(cast(jValue.getTime(), Float));
			}
			
			Reflect.setField(hObject, fields[j], value);
		}

		return hObject;
	}

	/**
	 * 
	 * @param	ctx
	 * @param	request
	 * @return
	 */
	public static function hxContext(ctx:ServletContext, request:HttpServletRequest, section:String):HxContext {
		var context = new HxContext(request.getRemoteAddr(), section);
		
		return context;
	}


}