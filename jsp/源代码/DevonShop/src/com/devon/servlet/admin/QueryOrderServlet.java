package com.devon.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devon.dao.dto.Order;
import com.devon.dao.impl.OrderDAOImpl;

public class QueryOrderServlet extends HttpServlet {

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

		String scUser = request.getParameter("scUser");
		if(scUser != null){
			scUser = scUser.trim();
		}
		String dgDateFrom = request.getParameter("dgDateFrom");
		String dgDateTo = request.getParameter("dgDateTo");
		String smcName = request.getParameter("smcName");
		if(smcName != null){
			smcName = smcName.trim();
		}
		String sstatus = request.getParameter("sstatus");
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null || "".equals(pageNum)){
			pageNum = "1";
		}
		String page = request.getParameter("page");
		
		request.setAttribute("scUser", scUser);
		request.setAttribute("dgDateFrom", dgDateFrom);
		request.setAttribute("dgDateTo", dgDateTo);
		request.setAttribute("smcName", smcName);
		request.setAttribute("sstatus", sstatus);

		if("common".equals(page)){
			List<Order> orderList = 
				OrderDAOImpl.getInstance().selectOrder(scUser, dgDateFrom, dgDateTo, smcName, sstatus, Integer.parseInt(pageNum), OrderDAOImpl.QUERY_FOR_EXACT);
			int[] result = OrderDAOImpl.getInstance().getResult(scUser, dgDateFrom, dgDateTo, smcName, sstatus, OrderDAOImpl.QUERY_FOR_EXACT);
			request.setAttribute("recordTotal", result[0]);
			request.setAttribute("pageTotal", result[1]);
			request.setAttribute("orderList", orderList);
			// 假如没有记录，把pageNum设为0
			if(result[0] == 0){
				pageNum = "0";
			}
			// 当有记录但所查页数大于最大页数时
			if(result[1] != 0 && result[1] < Integer.parseInt(pageNum)){
				response.getWriter().write("<script>alert('所查页数超出最大页数！系统将为您显示最后一页的记录！');window.location.href='" + getServletContext().getContextPath() + "/admin/manage/tab/QueryOrderServlet?page=" + page + "&scUser=" + scUser + "&dgDateFrom=" + dgDateFrom + "&dgDateTo=" + dgDateTo + "&sstatus=" + sstatus + "&pageNum=" + result[1] + "';</script>");
				return;
			}
			request.setAttribute("pageNum", Integer.parseInt(pageNum));
			request.getRequestDispatcher("/common/showorder/orderquerytab.jsp").forward(request, response);
		}else if("adminCheck".equals(page)){
			List<Order> orderList = 
				OrderDAOImpl.getInstance().selectOrder(scUser, dgDateFrom, dgDateTo, smcName, sstatus, Integer.parseInt(pageNum), OrderDAOImpl.QUERY_FOR_VAGUE);
			int[] result = OrderDAOImpl.getInstance().getResult(scUser, dgDateFrom, dgDateTo, smcName, sstatus, OrderDAOImpl.QUERY_FOR_VAGUE);
			// 假如没有记录，把pageNum设为0
			if(result[0] == 0){
				pageNum = "0";
			}
			// 当有记录但所查页数大于最大页数时
			if(result[1] != 0 && result[1] < Integer.parseInt(pageNum)){
				response.getWriter().write("<script>alert('所查页数超出最大页数！系统将为您显示最后一页的记录！');window.location.href='" + getServletContext().getContextPath() + "/admin/manage/tab/QueryOrderServlet?page=" + page + "&scUser=" + scUser + "&dgDateFrom=" + dgDateFrom + "&dgDateTo=" + dgDateTo + "&sstatus=" + sstatus + "&pageNum=" + result[1] + "';</script>");
				return;
			}
			request.setAttribute("pageNum", Integer.parseInt(pageNum));
			request.setAttribute("recordTotal", result[0]);
			request.setAttribute("pageTotal", result[1]);
			request.setAttribute("orderList", orderList);
			request.getRequestDispatcher("/admin/manage/tab/orderchecktab.jsp").forward(request, response);
		}else if("adminView".equals(page)){
			List<Order> orderList = 
				OrderDAOImpl.getInstance().selectOrder(scUser, dgDateFrom, dgDateTo, smcName, sstatus, Integer.parseInt(pageNum), OrderDAOImpl.QUERY_FOR_VAGUE);
			int[] result = OrderDAOImpl.getInstance().getResult(scUser, dgDateFrom, dgDateTo, smcName, sstatus, OrderDAOImpl.QUERY_FOR_VAGUE);
			// 假如没有记录，把pageNum设为0
			if(result[0] == 0){
				pageNum = "0";
			}
			// 当有记录但所查页数大于最大页数时
			if(result[1] != 0 && result[1] < Integer.parseInt(pageNum)){
				response.getWriter().write("<script>alert('所查页数超出最大页数！系统将为您显示最后一页的记录！');window.location.href='" + getServletContext().getContextPath() + "/admin/manage/tab/QueryOrderServlet?page=" + page + "&scUser=" + scUser + "&dgDateFrom=" + dgDateFrom + "&dgDateTo=" + dgDateTo + "&sstatus=" + sstatus + "&pageNum=" + result[1] + "';</script>");
				return;
			}
			request.setAttribute("pageNum", Integer.parseInt(pageNum));
			request.setAttribute("recordTotal", result[0]);
			request.setAttribute("pageTotal", result[1]);
			request.setAttribute("orderList", orderList);
			request.getRequestDispatcher("/admin/manage/tab/orderquerytab.jsp").forward(request, response);
		}else if("adminUpdate".equals(page)){
			List<Order> orderList = 
				OrderDAOImpl.getInstance().selectOrder(scUser, dgDateFrom, dgDateTo, smcName, sstatus, Integer.parseInt(pageNum), OrderDAOImpl.QUERY_FOR_VAGUE);
			int[] result = OrderDAOImpl.getInstance().getResult(scUser, dgDateFrom, dgDateTo, smcName, sstatus, OrderDAOImpl.QUERY_FOR_VAGUE);
			// 假如没有记录，把pageNum设为0
			if(result[0] == 0){
				pageNum = "0";
			}
			// 当有记录但所查页数大于最大页数时
			if(result[1] != 0 && result[1] < Integer.parseInt(pageNum)){
				response.getWriter().write("<script>alert('所查页数超出最大页数！系统将为您显示最后一页的记录！');window.location.href='" + getServletContext().getContextPath() + "/admin/manage/tab/QueryOrderServlet?page=" + page + "&scUser=" + scUser + "&dgDateFrom=" + dgDateFrom + "&dgDateTo=" + dgDateTo + "&sstatus=" + sstatus + "&pageNum=" + result[1] + "';</script>");
				return;
			}
			request.setAttribute("pageNum", Integer.parseInt(pageNum));
			request.setAttribute("recordTotal", result[0]);
			request.setAttribute("pageTotal", result[1]);
			request.setAttribute("orderList", orderList);
			request.getRequestDispatcher("/admin/manage/tab/orderupdatetab.jsp").forward(request, response);
		}
		
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
