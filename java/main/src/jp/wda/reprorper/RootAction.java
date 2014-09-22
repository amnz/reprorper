package jp.wda.reprorper;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;

import jp.wda.commons.HxActionControler;

import org.seasar.framework.container.S2Container;
import org.seasar.framework.container.factory.SingletonS2ContainerFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 *
 *
 *
 * $Id$
 * @author		$Author$
 * @revision	$Rev$
 * @date		$Date$
 */
@Path("/")
public class RootAction {

	// コンストラクタ ///////////////////////////////////////////////////////////////////
	//                                                                    Constructors //
	/////////////////////////////////////////////////////////////////////////////////////

	/**
	 */
	public RootAction() {
		super();

		S2Container container = SingletonS2ContainerFactory.getContainer();
		container.injectDependency(this);
	}
	private final Logger log = LoggerFactory.getLogger("jp.wda.access");

	// インスタンス変数 /////////////////////////////////////////////////////////////////
	//                                                                 Instance Fields //
	/////////////////////////////////////////////////////////////////////////////////////

	/**
	 *
	 */
	@Context
	public HttpServletRequest request;

	/**
	 *
	 */
	@Context
	public HttpServletResponse response;

	/**
	 *
	 */
	@Context
	public ServletContext context;

	/**
	 *
	 */
	@Context
	public UriInfo uriInfo;

	// プロパティ ///////////////////////////////////////////////////////////////////////
	//                                                                      Properties //
	/////////////////////////////////////////////////////////////////////////////////////

	/* ***********************************************************************>> */
	/** XXXX */
	private HxActionControler controller;
	/**
	 * XXXXを設定します。<BR>
	 * @param s 設定値<BR>
	 */
	public void setHxActionControler(HxActionControler s){ controller = s; }

	// インスタンスメソッド /////////////////////////////////////////////////////////////
	//                                                                Instance Methods //
	/////////////////////////////////////////////////////////////////////////////////////

	/**
	 *
	 *
	 * @return
	 */
	@GET
	@Path("/hx")
	@Produces(MediaType.TEXT_PLAIN)
	public Response get(
			  @QueryParam("q")		String parameter
			) {
		log.info(request.getRemoteAddr() + " [GET]  " + parameter);
		return Response.ok(controller.action(context, request, parameter)).build();
	}

	/**
	 *
	 *
	 * @return
	 */
	@POST
	@Path("/hx")
	@Produces(MediaType.TEXT_PLAIN)
	public Response post(
			  @FormParam("q")		String parameter
			) {
		log.info(request.getRemoteAddr() + " [POST] " + parameter);
		return Response.ok(controller.action(context, request, parameter)).build();
	}

}
