package jp.wda.commons.framework.listener;

import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 *
 *
 *
 * $Id$
 * @author		$Author$
 * @revision	$Revision$
 * @date		$Date$
 */
public class HttpSessionAttributeListenerImpl implements HttpSessionAttributeListener {

	// コンストラクタ ///////////////////////////////////////////////////////////////////
	//                                                                    Constructors //
	/////////////////////////////////////////////////////////////////////////////////////

	/**
	 *
	 */
	public HttpSessionAttributeListenerImpl() {
		super();
	}

	// 内部フィールド定義 ///////////////////////////////////////////////////////////////
	//                                                                          Fields //
	/////////////////////////////////////////////////////////////////////////////////////

	/** ロガー */
	protected static Logger logger = LoggerFactory.getLogger("jp.wda.g2cluster.system");

	// インスタンスメソッド /////////////////////////////////////////////////////////////
	//                                                                Instance Methods //
	/////////////////////////////////////////////////////////////////////////////////////

	/**
	 *
	 * @param se
	 */
	public void attributeAdded(HttpSessionBindingEvent se){
		logger.debug("Bind to SESSION \"" + se.getName() + "\"=" + se.getValue() + " : sessionid=" + se.getSession().getId());
	}

	/**
	 *
	 * @param se
	 */
	public void attributeRemoved(HttpSessionBindingEvent se){
		logger.debug("Remove from SESSION \"" + se.getName() + "\"=" + se.getValue() + " : sessionid=" + se.getSession().getId());
	}

	/**
	 *
	 * @param se
	 */
	public void attributeReplaced(HttpSessionBindingEvent se){
		logger.debug("Replace SESSION from \"" + se.getName() + "\"=" + se.getValue());
		logger.debug("Replace SESSION to   \"" + se.getName() + "\"=" + se.getSession().getAttribute(se.getName()));
	}

}
