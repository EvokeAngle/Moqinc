package com.devon.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devon.dao.impl.McTypeDAOImpl;

public class DeleteGoodsTypeServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String nid = request.getParameter("nid");
		
		McTypeDAOImpl.getInstance().deleteMcTypeWithMc(Integer.parseInt(nid));
		String respContent = "<script>alert('商品类别删除成功！');window.location.href='" + getServletContext().getContextPath() + "/admin/manage/tab/GetMcTypeServlet?page=goodstypemanage';</script>";
		response.getWriter().write(respContent);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
