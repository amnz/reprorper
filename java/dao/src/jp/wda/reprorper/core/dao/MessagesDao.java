package jp.wda.reprorper.core.dao;

import java.util.List;

import jp.wda.reprorper.core.entity.Message;
import jp.wda.reprorper.doma.DomaConfig;

import org.seasar.doma.Dao;
import org.seasar.doma.Insert;
import org.seasar.doma.Select;

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
	 * @param message
	 * @return
	 */
	@Insert(sqlFile=true)
	int insertByColumns(String section, String author, String message);

}
