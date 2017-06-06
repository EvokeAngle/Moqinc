package com.devon.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devon.dao.dto.Order;
import com.devon.dao.impl.OrderDAOImpl;

public class UpdateOrderHelperServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String nid = request.getParameter("nid");
		Order order = OrderDAOImpl.getInstance().selectSingleOrder(Long.parseLong(nid));
		request.setAttribute("order", order);
		request.getRequestDispatcher("/admin/manage/orderupdate.jsp").forward(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		
	}

}
