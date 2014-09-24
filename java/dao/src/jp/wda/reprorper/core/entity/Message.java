package jp.wda.reprorper.core.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import org.seasar.doma.Entity;
import org.seasar.doma.GeneratedValue;
import org.seasar.doma.GenerationType;
import org.seasar.doma.Id;
import org.seasar.doma.Table;
import org.seasar.doma.Version;
import org.seasar.doma.jdbc.entity.NamingType;

/**
 *
 *
 *
 * @author		amnz
 */
@Entity(naming = NamingType.SNAKE_LOWER_CASE)
@Table(name = "Messages")
public class Message implements Serializable {
	/**  */
	private static final long serialVersionUID = 4346711597282296217L;

	// コンストラクタ ///////////////////////////////////////////////////////////////////
	//                                                                    Constructors //
	/////////////////////////////////////////////////////////////////////////////////////

	/**
	 */
	public Message() {
		super();
	}

	// プロパティ ///////////////////////////////////////////////////////////////////////
	//                                                                      Properties //
	/////////////////////////////////////////////////////////////////////////////////////

	/**
	 *
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int messageId;

	/**
	 *
	 */
	public int sectionId;

	/**
	 *
	 */
	public String author;

	/**
	 *
	 */
	public String label;

	/**
	 *
	 */
	public String message;

	/**
	 *
	 */
	@Version
	public Integer versionNo;

	/**
	 *
	 */
	public Timestamp registeredAt;

}
