package com.devon.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devon.dao.dto.User;
import com.devon.dao.impl.UserDAOImpl;

public class AdminLoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String userName = req.getParameter("userName");
		String password = req.getParameter("password");
		
		User adminUser = new User();
		adminUser.setUserName(userName);
		adminUser.setPassword(password);
		List<User> result = UserDAOImpl.getInstance().selectUser(adminUser, UserDAOImpl.USER_OF_ADMIN, UserDAOImpl.QUERY_FOR_EXACT, 0);
		
		Cookie cookie =new Cookie("userNameAdmin",userName);
		cookie.setMaxAge(60*60*24*360);
		cookie.setPath("/");
		resp.addCookie(cookie);
		
		// =0说明用户名或密码错误
		if(result.size() == 0){
			PrintWriter writer = resp.getWriter();
			String contextPath = req.getContextPath();
			writer.print("<script>");
			writer.print("  alert('用户名或密码错误！');");
			writer.print("  window.location.href = '" + contextPath + "/admin/login/login.jsp';");
			writer.print("</script>");
		// 验证成功
		}else{
			// 取得返 回的User，用来区别是超级管理员还是普通管理员
			adminUser = result.get(0);
			req.getSession().setAttribute("adminUser", adminUser);
			req.getRequestDispatcher("/admin/manage/main.jsp").forward(req, resp);
		}
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
}
