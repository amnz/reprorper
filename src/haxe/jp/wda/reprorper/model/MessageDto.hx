package jp.wda.reprorper.model;

/**
 * ...
 * 
 * @author amnz
 */
class MessageDto {

	// コンストラクタ ///////////////////////////////////////////////////////////////////
	//                                                                    Constructors //
	/////////////////////////////////////////////////////////////////////////////////////

	/**
	 * ...
	 *
	 */
	public function new() {
		
	}

	// プロパティ ///////////////////////////////////////////////////////////////////////
	//                                                                      Properties //
	/////////////////////////////////////////////////////////////////////////////////////
	
	public var messageId:Int;
	public var author:String;
	public var label:String;
	public var message:String;
	public var registeredAt:Date;

}