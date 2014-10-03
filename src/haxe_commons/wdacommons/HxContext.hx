package wdacommons;

/**
 * ...
 * 
 * @author amnz
 */
class HxContext {

	// コンストラクタ ///////////////////////////////////////////////////////////////////
	//                                                                    Constructors //
	/////////////////////////////////////////////////////////////////////////////////////

	/**
	 * ...
	 *
	 */
	public function new(ipAddress:String, section:String) {
		this.remoteAddress = ipAddress;
		this.section       = section;
	}

	// プロパティ ///////////////////////////////////////////////////////////////////////
	//                                                                      Properties //
	/////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * 
	 */
	public var section(default, null):String;
	
	/**
	 * 
	 */
	public var remoteAddress(default, null):String;

}