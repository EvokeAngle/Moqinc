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
		// ȡ�����ύ����Ϣ
		String type = request.getParameter("type");
		String userName = request.getParameter("userName");
		String oldPassword = request.getParameter("oldPassword");
		// ������
		String newPassword = request.getParameter("password");

		// �жϾ������Ƿ���ȷ,����ȷ��Ӧ��ʾ,return
		if("0".equals(type) || "1".equals(type)){
			User user = new User();
			user.setUserName(userName);
			user.setPassword(oldPassword);
			List<User> userList = UserDAOImpl.getInstance().selectUser(user, UserDAOImpl.USER_OF_ADMIN, UserDAOImpl.QUERY_FOR_EXACT, 0);
			if(userList.size() == 0){
				response.getWriter().write("<script>alert('�������������');window.location.href='" + getServletContext().getContextPath() + "/updpsw/updpsw.jsp';</script>");
				return;
			// ����ȷ���������,����Ӧ��ʾ
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
				response.getWriter().write("<script>alert('�������������');window.location.href='" + getServletContext().getContextPath() + "/updpsw/updpsw.jsp';</script>");
				return;
			// ����ȷ���������,����Ӧ��ʾ
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
