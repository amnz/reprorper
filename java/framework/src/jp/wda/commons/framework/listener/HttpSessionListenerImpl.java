package jp.wda.commons.framework.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

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
public class HttpSessionListenerImpl implements HttpSessionListener {

	// コンストラクタ ///////////////////////////////////////////////////////////////////
	//                                                                    Constructors //
	/////////////////////////////////////////////////////////////////////////////////////

	/**
	 *
	 */
	public HttpSessionListenerImpl() {
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
	public void sessionCreated(HttpSessionEvent se){
		logger.debug("---------------------------------------------------------------------------------");
		logger.debug("SESSION started. : sessionid=" + se.getSession().getId() + ":" + se.getSession().getMaxInactiveInterval());
		logger.debug("---------------------------------------------------------------------------------");
	}

	/**
	 *
	 * @param se
	 */
	public void sessionDestroyed(HttpSessionEvent se){
		logger.debug("---------------------------------------------------------------------------------");
		logger.debug("SESSION destroyed. : sessionid=" + se.getSession().getId());
		logger.debug("---------------------------------------------------------------------------------");
	}

}
