package jp.wda.reprorper;

import javax.ws.rs.ApplicationPath;

import jp.wda.commons.framework.MayaaFeature;

import org.glassfish.jersey.server.ResourceConfig;
import org.glassfish.jersey.server.mvc.jsp.JspMvcFeature;

/**
 *
 *
 *
 * @author		amnz
 */
@ApplicationPath("/")
public class MyResourceConfig extends ResourceConfig {

	// コンストラクタ ///////////////////////////////////////////////////////////////////
	//                                                                    Constructors //
	/////////////////////////////////////////////////////////////////////////////////////

	/**
	 *
	 */
	public MyResourceConfig() {
		 packages(this.getClass().getPackage().getName())
		.register(JspMvcFeature.class)
		.register(MayaaFeature.class);
	}

}
