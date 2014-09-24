package jp.wda.reprorper.core.dao;

import java.sql.Timestamp;
import java.util.List;

import jp.wda.reprorper.core.entity.Message;

import org.seasar.doma.jdbc.Config;

/**
 *
 *
 *
 * @author		amnz
 */
public class MessagesDaoDelegate {

	// コンストラクタ ///////////////////////////////////////////////////////////////////
	//                                                                    Constructors //
	/////////////////////////////////////////////////////////////////////////////////////

	/**
	 */
	public MessagesDaoDelegate(Config config, MessagesDao dao) {
		super();

//		this.config = config;
		this.dao    = dao;
	}

//	private final Logger log = LoggerFactory.getLogger("jp.wda.system");
//	private Config config;
	private MessagesDao dao;



	/**
	 *
	 * @param from
	 * @param to
	 * @return
	 */
	public List<Message> selectByFromTo(String section, double from, double to) {
		Timestamp tFrom = new Timestamp((long)from);
		Timestamp tTo   = new Timestamp((long)to);

		return dao.selectByRegisteredAt(section, tFrom, tTo);
	}


}
