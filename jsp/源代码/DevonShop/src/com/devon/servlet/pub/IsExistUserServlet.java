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

public class IsExistUserServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String userName = request.getParameter("username");
		User user = new User();
		user.setUserName(userName);
		// 从XML中查找是否有此用户存在
		List<User> resultAdmin = UserDAOImpl.getInstance().selectUser(user, UserDAOImpl.USER_OF_ADMIN, UserDAOImpl.QUERY_FOR_EXACT, 0);
		if(resultAdmin.size() != 0){
			existUser(out);
		}
		// 从数据库中查找是否有此用户存在
		List<User> resultDb = UserDAOImpl.getInstance().selectUser(user, UserDAOImpl.USER_OF_COMMON, UserDAOImpl.QUERY_FOR_EXACT, 0);
		if(resultDb.size() != 0){
			existUser(out);
		}
		unexistUser(out);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

	private void existUser(PrintWriter out){
		String basePath = getServletContext().getContextPath();
		String imgPath = basePath + "/image/agree_no.gif";
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("<span style='font-size:12px;color:red'><img src='" + imgPath + "' />&nbsp;该用户名已存在，请更换用户名！</span>");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}
	
	private void unexistUser(PrintWriter out){
		String basePath = getServletContext().getContextPath();
		String imgPath = basePath + "/image/agree_ok.gif";
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("<span style='font-size:12px;color:red'><img src='" + imgPath + "' />&nbsp;该用户名可以使用！</span>");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}
}
