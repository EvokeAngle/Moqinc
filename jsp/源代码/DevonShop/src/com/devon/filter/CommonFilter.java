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

public class CommonFilter implements Filter{

	public void destroy() {
		
		
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		Object commonUser = ((HttpServletRequest)request).getSession().getAttribute("commonUser");
		if(commonUser == null){
			((HttpServletResponse)response).getWriter().write("<script>alert('����δ��¼�����ȵ�¼��ϵͳ���Զ���ת����¼ҳ��');window.top.location.href='" + ((HttpServletRequest)request).getContextPath() + "/common/login/login.jsp';</script>");
		}else{
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig config) throws ServletException {
		
		
	}

}
