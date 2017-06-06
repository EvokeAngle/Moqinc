package com.devon.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devon.dao.impl.UserDAOImpl;

public class DeleteUserServlet extends HttpServlet {

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

		String userType = request.getParameter("userType");
		String userName = request.getParameter("userName");
		// 管理员
		if("adminUser".equals(userType)){
			UserDAOImpl.getInstance().deleteUser(userName, UserDAOImpl.USER_OF_ADMIN);
		// 普通用户
		}else if("commonUser".equals(userType)){
			UserDAOImpl.getInstance().deleteUser(userName, UserDAOImpl.USER_OF_COMMON);
		}
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
