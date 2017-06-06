package com.devon.servlet.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devon.dao.dto.Goods;
import com.devon.dao.dto.Order;
import com.devon.dao.dto.ShoppingCar;
import com.devon.dao.impl.OrderDAOImpl;

public class PlancingOrderServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String scUser = request.getParameter("scUser");
		String nid = request.getParameter("nid");
		String nmcTypeSize = request.getParameter("nmcTypeSize");
		String nmcSize = request.getParameter("nmcSize");
		String ntotalPrice = request.getParameter("ntotalPrice");
		String dgDate = request.getParameter("dgDate");
		String spayType = request.getParameter("spayType");
		String ssendType = request.getParameter("ssendType");
		String ssName = request.getParameter("ssName");
		String ssAddress = request.getParameter("ssAddress");
		String ssCode = request.getParameter("ssCode");
		String ssPhone = request.getParameter("ssPhone");
		String ssEmail = request.getParameter("ssEmail");
		
		Order order = new Order();
		order.setScUser(scUser);
		order.setNid(nid);
		order.setNmcTypeSize(nmcTypeSize);
		order.setNmcSize(nmcSize);
		order.setNtotalPrice(ntotalPrice);
		order.setDgDate(dgDate);
		order.setSpayType(spayType);
		order.setSsendType(ssendType);
		order.setSsName(ssName);
		order.setSsAddress(ssAddress);
		order.setSsCode(ssCode);
		order.setSsPhone(ssPhone);
		order.setSsEmail(ssEmail);
		List<Goods> goodsList = ((ShoppingCar)request.getSession().getAttribute("shoppingCar")).getGoodsList();
		OrderDAOImpl.getInstance().placingOrder(order, goodsList);
		
		response.getWriter().write("<script>alert('您的订单已经提交成功！\\n订单编号：" + nid + "\\n下单时间：" + dgDate + "');window.top.frames[0].location.href = '" + getServletContext().getContextPath() + "/common/usercenter/left.jsp';window.location.href='" + getServletContext().getContextPath() + "/admin/manage/tab/QueryOrderServlet?ft=n&page=common&scUser=" + scUser + "';</script>");
		request.getSession().removeAttribute("shoppingCar");
	}

}
