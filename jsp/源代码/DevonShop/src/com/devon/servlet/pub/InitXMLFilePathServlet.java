package com.devon.servlet.pub;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devon.dao.impl.UserDAOImpl;

public class InitXMLFilePathServlet extends HttpServlet {

	@Override
	public void init() throws ServletException {
	
		String xmlFilePath = getServletContext().getRealPath("/user.xml");
		UserDAOImpl.initXMLFilePath(xmlFilePath);
	}
}
