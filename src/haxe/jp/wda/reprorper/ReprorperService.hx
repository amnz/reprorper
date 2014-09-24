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
import jp.wda.reprorper.model.MessageLabelDto;
import org.seasar.doma.jdbc.SelectOptions;

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
		log.debug(context.remoteAddress + "    log:" + SerializerTools.serialize( HxActions.write('test label', '<message>new</message>') ));
		log.debug(context.remoteAddress + " labels:" + SerializerTools.serialize( HxActions.labels(0, 50) ));
		log.debug(context.remoteAddress + " labels:" + SerializerTools.serialize( HxActions.labelsByTime(0, 50) ));
		log.debug(context.remoteAddress + " getLog:" + SerializerTools.serialize( HxActions.getLog(3) ));
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
	 * @return
	 * @see jp.wda.reprorper.HxActions#list
	 */
	public function list():HxResults {
		return HxResults.messages(JavaUtilities.duplicate(
			  dao.selectByOption(context.section, SelectOptions.get().limit(10).offset(0))
			, MessageDto));
	}
	
	/**
	 * 
	 * @param	page
	 * @param	amount
	 * @return
	 * @see jp.wda.reprorper.HxActions#labels(page:Int, amount:Int)
	 */
	public function labels(page:Int, amount:Int):HxResults {
		return HxResults.labels(JavaUtilities.duplicate(
			  dao.selectByOption(context.section, SelectOptions.get().limit(amount).offset(page * amount))
			, MessageLabelDto));
	}
	/**
	 * 
	 * @param	from
	 * @param	to
	 * @return
	 * @see jp.wda.reprorper.HxActions#labelsByTime(from:Float, to:Float)
	 */
	public function labelsByTime(from:Float, to:Float):HxResults {
		return HxResults.labels(JavaUtilities.duplicate(
			  dao.selectByFromTo(context.section, from, to)
			, MessageLabelDto));
	}

	
	/**
	 * 
	 * @param	id
	 * @return
	 * @see jp.wda.reprorper.HxActions#getLog(id:Int)
	 */
	public function getLog(id:Int):HxResults {
		var log = dao.selectByID(context.section, id);
		if (log == null) {
			return HxResults.none;
		}
		return HxResults.log(JavaUtilities.j2h(log, MessageDto));
	}
	
	/**
	 * 
	 * @param	label
	 * @param	message
	 * @return
	 * @see jp.wda.reprorper.HxActions#write(label:String, message:String)
	 */
	public function write(label:String, message:String):HxResults {
		var author = Md5.encode(context.remoteAddress);
		dao.insertByColumns(context.section, author, label, message);
		return HxResults.success;
	}

}
