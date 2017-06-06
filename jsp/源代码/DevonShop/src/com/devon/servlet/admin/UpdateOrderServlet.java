package com.devon.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devon.dao.impl.OrderDAOImpl;

public class UpdateOrderServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nid = request.getParameter("nid");
		String spayType = request.getParameter("spayType");
		String ssendType = request.getParameter("ssendType");
		String ssName = request.getParameter("ssName");
		
		OrderDAOImpl.getInstance().updateOrder(Long.parseLong(nid), spayType, ssendType, ssName);
		response.getWriter().write("<script>alert('ÐÞ¸Ä³É¹¦£¡');window.location.href='" + getServletContext().getContextPath() + "/servlet/QueryOrderItemServlet?page=showorderitem&nid=" + nid + "'</script>");
		
	}

}
