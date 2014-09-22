package jp.wda.commons.framework.listener;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.aopalliance.intercept.MethodInvocation;
import org.seasar.framework.aop.interceptors.AbstractInterceptor;
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
public class TransactionLoggerInterceptor extends AbstractInterceptor {
	/**  */
	private static final long serialVersionUID = -7972503114332676504L;

	// コンストラクタ ///////////////////////////////////////////////////////////////////
	//                                                                    Constructors //
	/////////////////////////////////////////////////////////////////////////////////////

	/**
	 *
	 */
	public TransactionLoggerInterceptor() {
		super();
	}

	// 内部フィールド定義 ///////////////////////////////////////////////////////////////
	//                                                                          Fields //
	/////////////////////////////////////////////////////////////////////////////////////

	/** ロガー */
	protected static Logger logger = LoggerFactory.getLogger("jp.wda.performance");
	/**
	 * XXXを設定します。<BR>
	 * @param s 設定値<BR>
	 */
	public void setServletContext(ServletContext s){
		if(s != null) { debugModeFile = new File(s.getRealPath("/WEB-INF/debug")); }
	}

	/** デバッグモード検査ファイル */
	private File debugModeFile = null;
	/**
	 *
	 * @return
	 */
	protected boolean debugMode() { return debugModeFile != null ? debugModeFile.exists() : true; }

	// インスタンスメソッド /////////////////////////////////////////////////////////////
	//                                                                Instance Methods //
	/////////////////////////////////////////////////////////////////////////////////////

	/** {@inheritDoc} */
	@Override
	public final Object invoke(MethodInvocation invocation) throws Throwable {
		long initUsing = Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();
		long starttime = System.currentTimeMillis();

		Object action = null;
		HttpServletRequest request = null;
		if(debugMode()) {
			action = invocation.getThis();
			Object[] args = invocation.getArguments();
			for(Object a : args) {
				if(a instanceof HttpServletRequest) {
					request = (HttpServletRequest)a;
					break;
				}
			}

			logger.info("Transaction Start ----------------------------------------------------------");
			logger.info("Action        :" + action.getClass().getName());
			if(request != null) {
				logger.info("HxAction      :" + request.getParameter("q"));
				logger.info("RemoteAddr    :" + request.getRemoteAddr());
			}
		}

		Object ret = null;
		Throwable cause = null;
		try {
			ret = invocation.proceed();
		} catch (Throwable t) {
			cause = t;
		}

		if(action != null) {
			logger.info("  Performance Report ****************");
			if(request != null) {
				logger.info("  RemoteAddr  :" + request.getRemoteAddr());
			}
			logger.info("  processing  :" + (System.currentTimeMillis() - starttime) + "msec.");
			logger.info("  maxMemory   :" + Runtime.getRuntime().maxMemory());
			logger.info("  totalMemory :" + Runtime.getRuntime().totalMemory());
			logger.info("  freeMemory  :" + Runtime.getRuntime().freeMemory());
			long currentUsing = Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();
			logger.info("  using       :" + currentUsing);
			logger.info("  increase    :" + (currentUsing - initUsing));
			logger.info("  ***********************************");
		}

		if (cause == null) { return ret; }
		throw cause;
	}

}
