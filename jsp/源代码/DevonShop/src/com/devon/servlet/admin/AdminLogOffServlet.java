package com.devon.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminLogOffServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getSession().invalidate();
		response.getWriter().write("<script>alert('您已安全退出后台管理系统！');window.top.location.href='" + getServletContext().getContextPath() + "/common/index.jsp';</script>");
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		
	}

}
