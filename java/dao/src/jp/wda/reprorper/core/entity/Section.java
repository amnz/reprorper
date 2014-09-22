package jp.wda.reprorper.core.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import org.seasar.doma.Entity;
import org.seasar.doma.GeneratedValue;
import org.seasar.doma.GenerationType;
import org.seasar.doma.Id;
import org.seasar.doma.Table;
import org.seasar.doma.jdbc.entity.NamingType;

/**
 *
 *
 *
 * @author		amnz
 */
@Entity(naming = NamingType.SNAKE_LOWER_CASE)
@Table(name = "Sections")
public class Section implements Serializable {
	/**  */
	private static final long serialVersionUID = 1721244552752467227L;

	// コンストラクタ ///////////////////////////////////////////////////////////////////
	//                                                                    Constructors //
	/////////////////////////////////////////////////////////////////////////////////////

	/**
	 */
	public Section() {
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
	public Long sectionId;

	/**
	 *
	 */
	public String sectionKey;

	/**
	 *
	 */
	public String name;

	/**
	 *
	 */
	public Timestamp registeredAt;

}
