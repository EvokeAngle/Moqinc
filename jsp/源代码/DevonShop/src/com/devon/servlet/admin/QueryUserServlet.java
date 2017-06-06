package com.devon.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devon.dao.dto.User;
import com.devon.dao.impl.UserDAOImpl;

public class QueryUserServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect(getServletContext().getContextPath() + "/admin/manage/tab/QueryUserServlet?queryType=adminUser");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("GBK");
		String userName = request.getParameter("userName");
		String sex = request.getParameter("sex");
		String isFreeze = request.getParameter("isFreeze");
		String queryType = request.getParameter("queryType");
		String pageNum = request.getParameter("pageNum");
		
		boolean isEmptyUserName = (userName == null || "".equals(userName))? true : false;
		boolean isEmptySex = ("".equals(sex) || "ȫ��".equals(sex) || sex == null)? true : false;
		boolean isEmptyState = ("".equals(isFreeze) || "ȫ��".equals(isFreeze) || isFreeze == null)? true : false;
		// û�иò���ʱĬ����ʾ��һҳ
		if(pageNum == null || "".equals(pageNum)){
			pageNum = "1";
		}
		
		User user = null;
		if(!isEmptyUserName || !isEmptySex || !isEmptyState){
			user = new User();
			user.setUserName(userName);
			user.setSex(sex);
			user.setIsFreeze(isFreeze);
		}
		
		List<User> users = null;
		int[] result = null;
		if("commonUser".equals(queryType)){
			result = UserDAOImpl.getInstance().getResult(user, UserDAOImpl.USER_OF_COMMON, UserDAOImpl.QUERY_FOR_VAGUE, 0);
			users = UserDAOImpl.getInstance().selectUser(user, UserDAOImpl.USER_OF_COMMON, UserDAOImpl.QUERY_FOR_VAGUE, Integer.parseInt(pageNum));
		}else if("adminUser".equals(queryType)){
			result = UserDAOImpl.getInstance().getResult(user, UserDAOImpl.USER_OF_ADMIN, UserDAOImpl.QUERY_FOR_VAGUE, 0);
			users = UserDAOImpl.getInstance().selectUser(user, UserDAOImpl.USER_OF_ADMIN, UserDAOImpl.QUERY_FOR_VAGUE, Integer.parseInt(pageNum));
		}

		// ����û�м�¼����pageNum��Ϊ0
		if(result[0] == 0){
			pageNum = "0";
		}
		// ���м�¼������ҳ���������ҳ��ʱ
		if(result[1] != 0 && result[1] < Integer.parseInt(pageNum)){
			response.getWriter().write("<script>alert('����ҳ���������ҳ����ϵͳ��Ϊ����ʾ���һҳ�ļ�¼��');window.location.href='" + getServletContext().getContextPath() + "/admin/manage/tab/QueryUserServlet?userName=" + userName + "&sex=" + sex + "&isFreeze=" + isFreeze + "&queryType=" + queryType + "&pageNum=" + result[1] + "';</script>");
			return;
		}
		request.setAttribute("userName", userName);
		request.setAttribute("sex", sex);
		request.setAttribute("isFreeze", isFreeze);
		
		request.setAttribute("recordTotal", result[0]);
		request.setAttribute("pageTotal", result[1]);
		request.setAttribute("pageNum", Integer.parseInt(pageNum));
		request.setAttribute("users", users);
		request.getRequestDispatcher("/admin/manage/tab/tab.jsp").forward(request, response);

	}

}
