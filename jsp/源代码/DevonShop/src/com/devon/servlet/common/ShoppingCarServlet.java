package com.devon.servlet.common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devon.dao.dto.Goods;
import com.devon.dao.dto.ShoppingCar;
import com.devon.dao.impl.GoodsDAOImpl;

public class ShoppingCarServlet extends HttpServlet {

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

		String task = request.getParameter("task");
		String nid = request.getParameter("nid");
		ShoppingCar car = (ShoppingCar)request.getSession().getAttribute("shoppingCar");
		// 购买 ---------------------------------------------------------------------------
		if("pay".equals(task)){
			// session中不存在购物车
			if(car == null){
				ShoppingCar newCar = new ShoppingCar();
				newCar.addGoods(Integer.parseInt(nid));
				request.getSession().setAttribute("shoppingCar", newCar);
			// session中已存在购物车
			}else{
				car.addGoods(Integer.parseInt(nid));
				request.getSession().setAttribute("shoppingCar", car);
			}
		// 移除商品 ---------------------------------------------------------------------------
		}else if("remove".equals(task)){
			car.removeGoods(Integer.parseInt(nid));
		// 修改商品数量 ---------------------------------------------------------------------------
		}else if("editNcount".equals(task)){
			String ncount = request.getParameter("ncount");
			car.editNcount(Integer.parseInt(nid), Integer.parseInt(ncount));
		// 清空购物车
		}else if("clear".equals(task)){
			car.clearCar();
		}
try {
	Thread.sleep(600);
} catch (InterruptedException e) {
	e.printStackTrace();
}
		request.getRequestDispatcher("/common/carmanage.jsp").forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
