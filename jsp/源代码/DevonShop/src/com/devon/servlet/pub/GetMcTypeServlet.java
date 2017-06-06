package com.devon.servlet.pub;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devon.dao.dto.Mc;
import com.devon.dao.dto.McType;
import com.devon.dao.impl.McDAOImpl;
import com.devon.dao.impl.McTypeDAOImpl;
import com.devon.util.CurrentTimeFactory;
import com.devon.util.FileNameFactory;

public class GetMcTypeServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String page = request.getParameter("page");
		// 把商品类信息给查询页面------------------------------------------------------------------
		if ("querycon".equals(page)) {
			List<List<McType>> typeList = McTypeDAOImpl.getInstance().getOption();
			request.getSession().setAttribute("typeList", typeList);
			request.getRequestDispatcher(
					"/admin/manage/tab/all.jsp?queryType=goods").forward(
					request, response);
		// 把商品类信息给增加/ 修改商品页面------------------------------------------------------------------
		} else if ("insupdgoods".equals(page)) {
			String task = request.getParameter("task");
			List<List<McType>> typeList = McTypeDAOImpl.getInstance().getOption();
			request.getSession().setAttribute("typeList", typeList);
			// 修改商品信息
			if ("update".equals(task)) {
				String nid = request.getParameter("nid");
				Mc mc = McDAOImpl.getInstance().selectSingleMc(Integer.parseInt(nid));
				request.setAttribute("mc", mc);
				request.getRequestDispatcher(
						"/admin/manage/insupdgoods.jsp?task=" + task).forward(request, response);
			// 新增商品
			} else if ("insert".equals(task)) {
				String dcDate = CurrentTimeFactory.getCurrentTime(CurrentTimeFactory.FORMAT_TIME);
				Mc mc = new Mc();
				mc.setDcDate(dcDate);
				request.setAttribute("mc", mc);
				request.getRequestDispatcher(
						"/admin/manage/insupdgoods.jsp?&task=" + task).forward(request, response);

			}
		// 把商品类信息给商品类别管理------------------------------------------------------------------
		}else if("goodstypemanage".equals(page)){
			List<List<McType>> typeList = McTypeDAOImpl.getInstance().getMcTypeList();
			request.setAttribute("typeList", typeList);
			request.getRequestDispatcher(
			"/admin/manage/goodstypemanage.jsp").forward(request,
			response);
		// 所商品类信息给添加类别----------------------------------------------------------------------
		}else if("insgoodstype".equals(page)){
			List<List<McType>> typeList = McTypeDAOImpl.getInstance().getMcTypeList();
			request.setAttribute("typeList", typeList);
			request.getRequestDispatcher(
			"/admin/manage/insgoodstype.jsp").forward(request,
			response);
		// 商城首页顶部
		}else if("top".equals(page)){
			List<List<McType>> typeList = McTypeDAOImpl.getInstance().getMcTypeList();
			request.setAttribute("typeList", typeList);
			request.getRequestDispatcher(
			"/common/top.jsp").forward(request,
			response);
		// 
		}else if("left".equals(page)){
			List<List<McType>> typeList = McTypeDAOImpl.getInstance().getMcTypeList();
			request.setAttribute("typeList", typeList);
			request.getRequestDispatcher(
			"/common/left.jsp").forward(request,
			response);
		}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doGet(request,response);
	}
}
