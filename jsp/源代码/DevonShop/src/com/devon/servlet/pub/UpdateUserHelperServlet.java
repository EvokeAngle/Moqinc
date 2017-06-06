package com.devon.servlet.pub;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devon.dao.dto.User;
import com.devon.dao.impl.UserDAOImpl;
import com.devon.util.CurrentTimeFactory;

public class UpdateUserHelperServlet extends HttpServlet {

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

		String userName = request.getParameter("userName");
		String userType = request.getParameter("userType");
		
		User user = new User();
		user.setUserName(userName);
		
		List<User> users = null;
		if("adminUser".equals(userType) || "0".equals(userType) || "1".equals(userType)){
			users = UserDAOImpl.getInstance().selectUser(user, UserDAOImpl.USER_OF_ADMIN, UserDAOImpl.QUERY_FOR_EXACT, 0);
		}else if("commonUser".equals(userType) || "2".equals(userType) ){
			users = UserDAOImpl.getInstance().selectUser(user, UserDAOImpl.USER_OF_COMMON, UserDAOImpl.QUERY_FOR_EXACT, 0);
		}
		request.setAttribute("user", users.get(0));
		request.setAttribute("task", "update");
		request.setAttribute("currTime", CurrentTimeFactory.currTimeSub10());
		request.getRequestDispatcher("/reguser/reguser.jsp").forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
