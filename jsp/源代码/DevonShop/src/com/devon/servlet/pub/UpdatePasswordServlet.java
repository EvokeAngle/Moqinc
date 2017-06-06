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

public class UpdatePasswordServlet extends HttpServlet {

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
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 取得所提交的信息
		String type = request.getParameter("type");
		String userName = request.getParameter("userName");
		String oldPassword = request.getParameter("oldPassword");
		// 新密码
		String newPassword = request.getParameter("password");

		// 判断旧密码是否正确,不正确响应提示,return
		if("0".equals(type) || "1".equals(type)){
			User user = new User();
			user.setUserName(userName);
			user.setPassword(oldPassword);
			List<User> userList = UserDAOImpl.getInstance().selectUser(user, UserDAOImpl.USER_OF_ADMIN, UserDAOImpl.QUERY_FOR_EXACT, 0);
			if(userList.size() == 0){
				response.getWriter().write("<script>alert('旧密码输入错误！');window.location.href='" + getServletContext().getContextPath() + "/updpsw/updpsw.jsp';</script>");
				return;
			// 如正确则将密码更新,并响应提示
			}else{
				User userForPsw = new User();
				userForPsw.setUserName(userName);
				userForPsw.setPassword(newPassword);
				UserDAOImpl.getInstance().updateUser(userForPsw, UserDAOImpl.USER_OF_ADMIN);
				response.sendRedirect(getServletContext().getContextPath() + "/image/updsuccess.jpg");
			}
		}else if("2".equals(type)){
			User user = new User();
			user.setUserName(userName);
			user.setPassword(oldPassword);
			List<User> userList = UserDAOImpl.getInstance().selectUser(user, UserDAOImpl.USER_OF_COMMON, UserDAOImpl.QUERY_FOR_EXACT, 0);
			if(userList.size() == 0){
				response.getWriter().write("<script>alert('旧密码输入错误！');window.location.href='" + getServletContext().getContextPath() + "/updpsw/updpsw.jsp';</script>");
				return;
			// 如正确则将密码更新,并响应提示
			}else{
				User userForPsw = new User();
				userForPsw.setUserName(userName);
				userForPsw.setPassword(newPassword);
				UserDAOImpl.getInstance().updateUser(userForPsw, UserDAOImpl.USER_OF_COMMON);
				response.sendRedirect(getServletContext().getContextPath() + "/image/updsuccess.jpg");
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
}
