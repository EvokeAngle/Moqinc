package com.devon.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.security.krb5.internal.crypto.crc32;

import com.devon.dao.impl.OrderDAOImpl;
import com.devon.util.CurrentTimeFactory;

public class OrderCheckServlet extends HttpServlet {

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
		doPost(request, response);
		
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String nid = request.getParameter("nid");
		String saUser = request.getParameter("saUser");
		String sstatus = request.getParameter("sstatus");
		String smsg = request.getParameter("smsg");
		String daDate = CurrentTimeFactory.getCurrentTime(CurrentTimeFactory.FORMAT_TIME);
		
		OrderDAOImpl.getInstance().checkOrder(Long.parseLong(nid), sstatus, smsg, daDate, saUser);
		response.getWriter().write("<script>alert('…Û∫À≥…π¶£°');window.location.href='" + getServletContext().getContextPath() + "/servlet/QueryOrderItemServlet?page=showorderitem&nid=" + nid + "'</script>");
	}

}
