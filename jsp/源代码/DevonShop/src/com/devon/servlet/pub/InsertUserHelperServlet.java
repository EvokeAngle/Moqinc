package com.devon.servlet.pub;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devon.dao.dto.User;
import com.devon.util.CurrentTimeFactory;

public class InsertUserHelperServlet extends HttpServlet {

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

		User user = new User();
		if("adminUser".equals(userType)){
			user.setType("1");
		}else if("commonUser".equals(userType)){
			user.setType("2");
		}
		request.setAttribute("user", user);
		request.setAttribute("task", "insert");
		request.setAttribute("currTime", CurrentTimeFactory.currTimeSub10());
		request.getRequestDispatcher("/reguser/reguser.jsp").forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
