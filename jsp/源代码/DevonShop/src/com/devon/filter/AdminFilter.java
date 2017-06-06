package com.devon.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.devon.dao.dto.User;
import com.sun.org.apache.bcel.internal.generic.GETSTATIC;

public class AdminFilter implements Filter{

	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		String ft = ((HttpServletRequest)request).getParameter("ft");
		if(!"n".equals(ft)){
			HttpServletRequest httpServletRequest = (HttpServletRequest)request;
			HttpServletResponse httpServletResponse = (HttpServletResponse)response;
			HttpSession httpSession = httpServletRequest.getSession();
			User adminUser = (User)httpSession.getAttribute("adminUser");
			
			if(adminUser == null){
				((HttpServletResponse)response).getWriter().write("<script>alert('您尚未登录！请先登录，系统将自动跳转至登录页！');window.top.location.href='" + ((HttpServletRequest)request).getContextPath() + "/admin/login/login.jsp';</script>");
			}else{
				chain.doFilter(request, response);
			}
		}else{
			chain.doFilter(request, response);
		}

	}

	public void init(FilterConfig config) throws ServletException {

	}

}
