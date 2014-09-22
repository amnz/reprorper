package jp.wda.commons;
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
			Reflect.setField(hObject, fields[j], Reflect.getProperty(jObject, fields[j]));
		}

		return hObject;
	}

	/**
	 * 
	 * @param	ctx
	 * @param	request
	 * @return
	 */
	public static function hxContext(ctx:ServletContext, request:HttpServletRequest):HxContext {
		var context = new HxContext(request.getRemoteAddr());
		
		return context;
	}


}