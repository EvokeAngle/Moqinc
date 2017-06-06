package com.devon.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devon.dao.dto.Order;
import com.devon.dao.dto.OrderItem;
import com.devon.dao.impl.OrderDAOImpl;
import com.devon.dao.impl.OrderItemDAOImpl;

public class QueryOrderItemServlet extends HttpServlet {

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
		
		String page = request.getParameter("page");
		// 获得商品订单的编号
		String nid = request.getParameter("nid");
		// 查询到该笔订单的信息
		Order order = OrderDAOImpl.getInstance().selectSingleOrder(Long.parseLong(nid));
		// 根据该笔订单查询到其订单名细
		List<OrderItem> orderItemList = OrderItemDAOImpl.getInstance().selectOrderItem(Long.parseLong((nid)));
		request.setAttribute("order", order);
		request.setAttribute("orderItemList", orderItemList);
		if("orderitemtab".equals(page)){
			request.getRequestDispatcher("/admin/manage/tab/orderitemtab.jsp").forward(request, response);
			
		}else if("showorderitem".equals(page)){

			request.getRequestDispatcher("/admin/manage/showorderitem.jsp").forward(request, response);
		}
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
