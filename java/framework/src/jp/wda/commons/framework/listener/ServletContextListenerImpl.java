package jp.wda.commons.framework.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

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
public class ServletContextListenerImpl implements ServletContextListener {

	// コンストラクタ ///////////////////////////////////////////////////////////////////
	//                                                                    Constructors //
	/////////////////////////////////////////////////////////////////////////////////////

	/**
	 *
	 */
	public ServletContextListenerImpl() {
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

	/** {@inheritDoc} */
	@Override
	public void contextInitialized(ServletContextEvent evt) {
		logger.debug("contextInitialized");
	}

	/** {@inheritDoc} */
	@Override
	public void contextDestroyed(ServletContextEvent evt) {
		logger.debug("contextDestroyed");
	}

}
