package com.devon.servlet.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devon.dao.dto.Mc;
import com.devon.dao.dto.McType;
import com.devon.dao.impl.McDAOImpl;
import com.devon.dao.impl.McTypeDAOImpl;

public class DelGoodsImgServlet extends HttpServlet {

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

/*		String sname = request.getParameter("sname");
		String nmaxId = request.getParameter("nmaxId");
		String nminId = request.getParameter("nminId");
		String nprice = request.getParameter("nprice");
		String dcDate = request.getParameter("dcDate");*/
		
		String nid = request.getParameter("nid");
		String simg = request.getParameter("simg");
		String simgPath = getServletContext().getRealPath("/" + simg);
		File file = new File(simgPath);
		file.delete();
		McDAOImpl.getInstance().deleteMcSimg(Integer.parseInt(nid));
		
		response.getWriter().write("<script>window.parent.location.href='" + getServletContext().getContextPath() + "/admin/manage/tab/GetMcTypeServlet?page=insupdgoods&task=update&nid=" + nid + "';</script>");
		
/*		String smcTag = request.getParameter("smcTag");
		String sdescription = request.getParameter("sdescription");
		Mc mc = new Mc();
		mc.setSname(sname);
		mc.setNmaxId(nmaxId);
		mc.setNminId(nminId);
		mc.setNprice(nprice);
		mc.setDcDate(dcDate);
		mc.setSimg(simg);
		mc.setSmcTag(smcTag);
		mc.setSdescription(sdescription);
		request.setAttribute("mc", mc);
		
		List<List<McType>> typeList = McTypeDAOImpl.getInstance().getOption();
		request.getSession().setAttribute("typeList", typeList);
		
		request.getRequestDispatcher("/admin/manage/insupdgoods.jsp?task=update").forward(request, response);*/
		
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
