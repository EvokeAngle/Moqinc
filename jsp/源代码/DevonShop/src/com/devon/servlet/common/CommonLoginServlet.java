package com.devon.servlet.common;

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
import com.devon.util.CurrentTimeFactory;

public class CommonLoginServlet extends HttpServlet {

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
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
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		

		Cookie cookie =new Cookie("userNameCommon",userName);
		cookie.setMaxAge(60*60*24*360);
		cookie.setPath("/");
		response.addCookie(cookie);

		
		User commonUser = new User();
		commonUser.setUserName(userName);
		commonUser.setPassword(password);
		List<User> result = UserDAOImpl.getInstance().selectUser(commonUser,
				UserDAOImpl.USER_OF_COMMON, UserDAOImpl.QUERY_FOR_EXACT, 0);
		// =0说明用户名或密码错误
		if (result.size() == 0) {
			PrintWriter writer = response.getWriter();
			String contextPath = request.getContextPath();
			writer.print("<script>");
			writer.print("  alert('用户名或密码错误！');");
			writer.print("  window.location.href = '" + contextPath
					+ "/common/login/login.jsp';");
			writer.print("</script>");
		// 验证成功，继续判断状态
		} else {

			commonUser = result.get(0);
			if("冻结".equals(commonUser.getIsFreeze())){
				PrintWriter writer = response.getWriter();
				String contextPath = request.getContextPath();
				writer.print("<script>");
				writer.print("  alert('您的账号被冻结，请联系管理员！');");
				writer.print("  window.location.href = '" + contextPath
						+ "/common/login/login.jsp';");
				writer.print("</script>");
			}else {
				request.getSession().setAttribute("commonUser", commonUser);
				String lastLogin = CurrentTimeFactory.getCurrentTime(CurrentTimeFactory.FORMAT_TIME);
				UserDAOImpl.getInstance().updateLoginInfo(commonUser.getUserName(), lastLogin);
				request.getRequestDispatcher("/common/index.jsp").forward(request,
						response);
			}

		}
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doPost(request,response);
	}
}
