package jp.wda.reprorper ;

import haxe.crypto.Md5;
import jp.wda.commons.HxActionControler;
import jp.wda.commons.HxActionControlerBase;
import jp.wda.commons.HxErrorResult;
import jp.wda.commons.HxService;
import jp.wda.commons.JavaUtilities;
import jp.wda.commons.SerializerTools;
import jp.wda.reprorper.core.dao.MessagesDao;
import jp.wda.reprorper.core.dao.SectionsDao;
import jp.wda.reprorper.HxActions;
import jp.wda.reprorper.model.MessageDto;

/**
 * ...
 * 
 * @author amnz
 */
class ReprorperService extends HxActionControlerBase {

	// コンストラクタ ///////////////////////////////////////////////////////////////////
	//                                                                    Constructors //
	/////////////////////////////////////////////////////////////////////////////////////

	/**
	 * ...
	 *
	 */
	public function new() {
		super();
		log.debug("ReprorperService initialized.");
	}

	// プロパティ ///////////////////////////////////////////////////////////////////////
	//                                                                      Properties //
	/////////////////////////////////////////////////////////////////////////////////////
	
	private var sectionsDao:SectionsDao;
	/**
	 * 
	 * @param	s
	 */
	public function setSectionsDao(s:SectionsDao):Void {
		this.sectionsDao = s;
	}
	
	private var dao:MessagesDao;
	/**
	 * 
	 * @param	s
	 */
	public function setMessagesDao(s:MessagesDao):Void {
		this.dao = s;
	}

	// インスタンスメソッド /////////////////////////////////////////////////////////////
	//                                                                Instance Methods //
	/////////////////////////////////////////////////////////////////////////////////////
	
	/** {@inheritDoc} */
	public override function unserializeError(parameter:String, unknown:Dynamic):Dynamic {
		log.debug("parameter sample.");
		log.debug(context.remoteAddress + "    log:" + SerializerTools.serialize( HxActions.write('test001', '<message>new</message>') ));
		log.debug(context.remoteAddress + "   list:" + SerializerTools.serialize( HxActions.list('test001') ));
		log.debug(context.remoteAddress + " getLog:" + SerializerTools.serialize( HxActions.getLog('test001', 3) ));
		log.debug(context.remoteAddress + " string:" + SerializerTools.serialize( "test action" ));
		log.debug("-----------------");
		
		log.error(context.remoteAddress + " parameter:" + parameter);
		log.error(context.remoteAddress + " unserialize failure. :" + unknown);
		
		return HxResults.error;
	}
	
	/** {@inheritDoc} */
	public override function invoke():Dynamic {
		//var api:HxActions = cast(actionEnum, HxActions);
		//switch(api) {
			//
		//}
		return HxResults.error;
	}

	// インスタンスメソッド /////////////////////////////////////////////////////////////
	//                                                                Instance Methods //
	/////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * 
	 * @param	ctx
	 * @param	section
	 * @return
	 */
	public function list(section:String):HxResults {
		log.debug("list:" + this);
		var list = dao.selectBySection(section);
		return HxResults.messages(JavaUtilities.duplicate(list, MessageDto));
	}
	
	/**
	 * 
	 * @param	section
	 * @param	id
	 * @return
	 */
	public function getLog(section:String, id:Int):HxResults {
		return HxResults.log(JavaUtilities.j2h(dao.selectByID(section, id), MessageDto));
	}
	
	/**
	 * 
	 * @param	ctx
	 * @param	section
	 * @return
	 */
	public function write(section:String, message:String):HxResults {
		var author = Md5.encode(this.context.remoteAddress);
		dao.insertByColumns(section, author, message);
		return HxResults.success;
	}


}
