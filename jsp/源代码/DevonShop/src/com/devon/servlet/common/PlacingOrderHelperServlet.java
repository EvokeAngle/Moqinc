package com.devon.servlet.common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devon.util.CurrentTimeFactory;
import com.devon.util.OrderIdFactory;

public class PlacingOrderHelperServlet extends HttpServlet {

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

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String spayType = request.getParameter("spayType");
		String ssendType = request.getParameter("ssendType");
		String nid = OrderIdFactory.createId();
		String dgDate = CurrentTimeFactory.getCurrentTime(CurrentTimeFactory.FORMAT_TIME);
		request.setAttribute("spayType", spayType);
		request.setAttribute("ssendType", ssendType);
		request.setAttribute("nid", nid);
		request.setAttribute("dgDate", dgDate);
		request.getRequestDispatcher("/common/placingorder.jsp").forward(request, response);
	}

}
