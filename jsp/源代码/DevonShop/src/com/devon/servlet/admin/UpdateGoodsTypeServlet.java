package com.devon.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devon.dao.dto.McType;
import com.devon.dao.impl.McDAOImpl;
import com.devon.dao.impl.McTypeDAOImpl;
import com.devon.dao.inf.McTypeDAO;

public class UpdateGoodsTypeServlet extends HttpServlet {

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

		String nid = request.getParameter("nid");
		String newSname = request.getParameter("newSname");
		String npid = request.getParameter("npid");

		McType mcType = new McType();
		mcType.setNid(nid);
		mcType.setSname(newSname);
		mcType.setNpid(npid);
		// ��������Ƿ���ͬ�����ظ�
		boolean isRepeatedSname = McTypeDAOImpl.getInstance().isRepeatedSname(mcType);
		// �������
		if(isRepeatedSname){
			String respContent = "<script>alert('����ͼ�޸ĵ�������ͬ���������ĸ��������������ظ�������������ԣ�');window.location.href='" + getServletContext().getContextPath() + "/admin/manage/tab/GetMcTypeServlet?page=goodstypemanage';</script>";
			response.getWriter().write(respContent);
		// ���ظ�
		}else{
			McTypeDAOImpl.getInstance().updateMcType(mcType);
			String respContent = "<script>alert('��Ʒ����޸ĳɹ���');window.location.href='" + getServletContext().getContextPath() + "/admin/manage/tab/GetMcTypeServlet?page=goodstypemanage';</script>";
			response.getWriter().write(respContent);
		}

	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
