package jp.wda.reprorper.core.dao;

import jp.wda.reprorper.core.entity.Section;
import jp.wda.reprorper.doma.DomaConfig;

import org.seasar.doma.Dao;
import org.seasar.doma.Select;

/**
 *
 *
 *
 * @author		amnz
 */
@Dao(config = DomaConfig.class)
public interface SectionsDao {

	/**
	 *
	 * @param key
	 * @return
	 */
	@Select
	public Section selectByKey(String key);

}
