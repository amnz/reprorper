package jp.wda.reprorper.doma;

import java.sql.SQLException;

import org.seasar.doma.jdbc.JdbcLogger;
import org.seasar.doma.jdbc.Sql;
import org.seasar.doma.jdbc.SqlExecutionSkipCause;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 *
 *
 *
 * @author		amnz
 */
public class LogbackJdbcLogger implements JdbcLogger {

	@Override
	public void logConnectionClosingFailure(String callerClassName, String callerMethodName, SQLException e) {
		Logger log = LoggerFactory.getLogger(callerClassName);
		log.error("logConnectionClosingFailure " + callerClassName + "#" + callerMethodName, e);
	}

	@Override
	public void logStatementClosingFailure(String callerClassName, String callerMethodName, SQLException e) {
		Logger log = LoggerFactory.getLogger(callerClassName);
		log.error("logStatementClosingFailure " + callerClassName + "#" + callerMethodName, e);
	}

	@Override
	public void logResultSetClosingFailure(String callerClassName, String callerMethodName, SQLException e) {
		Logger log = LoggerFactory.getLogger(callerClassName);
		log.error("logResultSetClosingFailure " + callerClassName + "#" + callerMethodName, e);
	}

	@Override
	public void logAutoCommitEnablingFailure(String callerClassName, String callerMethodName, SQLException e) {
		Logger log = LoggerFactory.getLogger(callerClassName);
		log.error("logAutoCommitEnablingFailure " + callerClassName + "#" + callerMethodName, e);
	}

	@Override
	public void logTransactionIsolationSettingFailuer(String callerClassName, String callerMethodName, int transactionIsolationLevel, SQLException e) {
		Logger log = LoggerFactory.getLogger(callerClassName);
		log.error("logTransactionIsolationSettingFailuer " + callerClassName + "#" + callerMethodName, e);
	}

	@Override
	public void logDaoMethodEntering(String callerClassName, String callerMethodName, Object... parameters) {
		Logger log = LoggerFactory.getLogger(callerClassName);
		log.info("START " + callerClassName + "#" + callerMethodName);
	}

	@Override
	public void logDaoMethodExiting(String callerClassName, String callerMethodName, Object result) {
		Logger log = LoggerFactory.getLogger(callerClassName);
		log.info("END   " + callerClassName + "#" + callerMethodName);
	}

	@Override
	public void logDaoMethodThrowing(String callerClassName, String callerMethodName, RuntimeException e) {
		Logger log = LoggerFactory.getLogger(callerClassName);
		log.error("END   " + callerClassName + "#" + callerMethodName + " RuntimeException: ", e);
	}

	@Override
	public void logSqlExecutionSkipping(String callerClassName, String callerMethodName, SqlExecutionSkipCause cause) {
		Logger log = LoggerFactory.getLogger(callerClassName);
		log.info("SKIPPED(" + cause.name() + ") " + callerClassName + "#" + callerMethodName);
	}

	@Override
	public void logSql(String callerClassName, String callerMethodName, Sql<?> sql) {
		Logger log = LoggerFactory.getLogger(callerClassName);
		String message = String.format("SQL log. sqlFilePath=[%s],%n%s", sql.getSqlFilePath(), sql.getFormattedSql());
		log.info(message);
	}

	@Override
	public void logLocalTransactionBegun(String callerClassName, String callerMethodName, String transactionId) {
	}

	@Override
	public void logLocalTransactionCommitted(String callerClassName, String callerMethodName, String transactionId) {
	}

	@Override
	public void logLocalTransactionRolledback(String callerClassName, String callerMethodName, String transactionId) {
	}

	@Override
	public void logLocalTransactionSavepointCreated(String callerClassName, String callerMethodName, String transactionId, String savepointName) {
	}

	@Override
	public void logLocalTransactionSavepointReleased(String callerClassName, String callerMethodName, String transactionId, String savepointName) {
	}

	@Override
	public void logLocalTransactionSavepointRolledback(String callerClassName, String callerMethodName, String transactionId, String savepointName) {
	}

	@Override
	public void logLocalTransactionRollbackFailure(String callerClassName, String callerMethodName, String transactionId, SQLException e) {
	}

	@Override
	public void logLocalTransactionEnded(String callerClassName, String callerMethodName, String transactionId) {
	}

}
