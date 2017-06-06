package com.devon.servlet.pub;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devon.dao.dto.GoodsSearchCondition;
import com.devon.dao.dto.Mc;
import com.devon.dao.impl.McDAOImpl;
import com.devon.dao.inf.McDAO;

public class QueryGoodsServlet extends HttpServlet {

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

		String nmaxId = request.getParameter("nmaxId");
		String nminId = request.getParameter("nminId");
		String keywords = request.getParameter("keywords");
		String pageNum = request.getParameter("pageNum");
		String page = request.getParameter("page");
		//String isClickSearch = request.getParameter("isClickSearch");
		// 点查询时，默认到第一页
		if(pageNum == null || "".equals(pageNum)){
			pageNum = "1";
		}

		List<Mc> mcList = McDAOImpl.getInstance().selectMc(nmaxId, nminId, keywords, Integer.parseInt(pageNum));
		int[] result = McDAOImpl.getInstance().getResult(nmaxId, nminId, keywords);
		// 假如没有记录，把pageNum设为0
		if(result[0] == 0){
			pageNum = "0";
		}
		// 当有记录但所查页数大于最大页数时
		if(result[1] != 0 && result[1] < Integer.parseInt(pageNum)){
			response.getWriter().write("<script>alert('所查页数超出最大页数！系统将为您显示最后一页的记录！');window.location.href='" + getServletContext().getContextPath() + "/admin/manage/tab/QueryGoodsServlet?nmaxId=" + nmaxId + "&nminId=" + nminId + "&keywords=" + keywords + "&page=" + page + "&pageNum=" + result[1] + "';</script>");
			return;
		}
		request.setAttribute("nmaxId", nmaxId);
		request.setAttribute("nminId", nminId);
		request.setAttribute("keywords", keywords);
		
		request.setAttribute("recordTotal", result[0]);
		request.setAttribute("pageTotal", result[1]);
		request.setAttribute("mcList", mcList);
		request.setAttribute("pageNum", Integer.parseInt(pageNum));
		request.setAttribute("nminId", nminId);
		request.setAttribute("nmaxId", nmaxId);
		request.setAttribute("keywords", keywords);
		
		if("tab".equals(page)){
			request.getRequestDispatcher("/admin/manage/tab/tab.jsp").forward(request, response);
		}else if("showgoods".equals(page)){
			request.getRequestDispatcher("/common/showgoods.jsp").forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}


}
