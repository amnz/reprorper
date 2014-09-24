package jp.wda.reprorper.core.dao;

import java.sql.Timestamp;
import java.util.List;

import jp.wda.reprorper.core.entity.Message;
import jp.wda.reprorper.doma.DomaConfig;

import org.seasar.doma.Dao;
import org.seasar.doma.Delegate;
import org.seasar.doma.Insert;
import org.seasar.doma.Select;
import org.seasar.doma.jdbc.SelectOptions;

/**
 *
 *
 *
 * @author		amnz
 */
@Dao(config = DomaConfig.class)
public interface MessagesDao {

	/**
	 *
	 * @param section
	 * @return
	 */
	@Select
	public List<Message> selectBySection(String section);

	/**
	 *
	 * @param section
	 * @return
	 */
	@Select
	public List<Message> selectByOption(String section, SelectOptions options);

	/**
	 *
	 * @param from
	 * @param to
	 * @return
	 */
	@Delegate(to = MessagesDaoDelegate.class)
	public List<Message> selectByFromTo(String section, double from, double to);

	/**
	 *
	 * @param from
	 * @param to
	 * @return
	 */
	@Select
	public List<Message> selectByRegisteredAt(String section, Timestamp from, Timestamp to);

	/**
	 *
	 * @param section
	 * @param id
	 * @return
	 */
	@Select
	public Message selectByID(String section, long id);

	/**
	 *
	 * @param message
	 * @return
	 */
	@Insert
	int insert(Message message);

	/**
	 *
	 * @param section
	 * @param author
	 * @param label
	 * @param message
	 * @return
	 */
	@Insert(sqlFile=true)
	int insertByColumns(String section, String author, String label, String message);

}
