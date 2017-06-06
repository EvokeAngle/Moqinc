package com.devon.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devon.dao.dto.McType;
import com.devon.dao.impl.McTypeDAOImpl;

public class InsertMcTypeServlet extends HttpServlet {

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

		String pType = request.getParameter("pType");
		String cTypeName = request.getParameter("cTypeName");
		
		McType mcType = new McType();
		mcType.setNpid(pType);
		mcType.setSname(cTypeName);
		
		// 检测名称是否在同级中重复
		boolean isRepeatedSname = McTypeDAOImpl.getInstance().isRepeatedSname(mcType);
		// 如果复重
		if(isRepeatedSname){
			String respContent = "<script>alert('您试图添加的商品类别与同级类别或该类的父类别的现有名称重复，请更换后再试！');window.location.href='" + getServletContext().getContextPath() + "/admin/manage/tab/GetMcTypeServlet?page=insgoodstype';</script>";
			response.getWriter().write(respContent);
		// 不重复
		}else{
			McTypeDAOImpl.getInstance().insertMcType(mcType);
			String respContent = "<script>alert('商品类别添加成功！');window.location.href='" + getServletContext().getContextPath() + "/admin/manage/tab/GetMcTypeServlet?page=goodstypemanage';</script>";
			response.getWriter().write(respContent);
		}
		
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
