<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'all.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <c:if test="${param.queryType eq 'adminUser' || param.queryType eq 'commonUser' || param.queryType eq 'goods'}">
    <frameset rows="30,*" framespacing="0">
    	<c:set value="${param.queryType}" scope="session" var="queryType"></c:set>
  	<frame src="querycon.jsp?queryType=${param.queryType }" marginwidth='0' marginheight='0' frameborder="0" scrolling="no">
  </c:if>

  	
  <c:if test="${param.queryType eq 'adminUser'}">
  	<c:set value="${param.queryType}" scope="session" var="queryType"></c:set>
	<frame src="<%=path%>/admin/manage/tab/QueryUserServlet?queryType=adminUser" marginwidth='0' marginheight='0' frameborder="0" scrolling="yes">
    </frameset>
  </c:if>
  
  <c:if test="${param.queryType eq 'commonUser'}">
    <c:set value="${param.queryType}" scope="session" var="queryType"></c:set>
	<frame src="<%=path%>/admin/manage/tab/QueryUserServlet?queryType=commonUser" marginwidth='0' marginheight='0' frameborder="0" scrolling="yes">
    </frameset>
  </c:if>
  
  <c:if test="${param.queryType eq 'goods'}">
    <c:set value="${param.queryType}" scope="session" var="queryType"></c:set>
	<frame src="<%=path%>/admin/manage/tab/QueryGoodsServlet?queryType=goods&page=tab&pageNum=1" marginwidth='0' marginheight='0' frameborder="0" scrolling="yes">
    </frameset>
  </c:if>

  <c:if test="${param.queryType eq 'order'}">
    <c:set value="${param.queryType}" scope="session" var="queryType"></c:set>
	<iframe src="<%=path%>/admin/manage/tab/QueryOrderServlet?page=adminView&pageNum=1" marginwidth='0' marginheight='0' frameborder="0" scrolling="yes" height="100%" width="100%"></iframe>
  </c:if>

  <c:if test="${param.queryType eq 'orderCheck'}">
    <c:set value="${param.queryType}" scope="session" var="queryType"></c:set>
	<iframe src="<%=path%>/admin/manage/tab/QueryOrderServlet?page=adminCheck&pageNum=1" marginwidth='0' marginheight='0' frameborder="0" scrolling="yes" height="100%" width="100%"></iframe>
  </c:if>
  
  <c:if test="${param.queryType eq 'orderUpdate'}">
    <c:set value="${param.queryType}" scope="session" var="queryType"></c:set>
	<iframe src="<%=path%>/admin/manage/tab/QueryOrderServlet?page=adminUpdate&pageNum=1" marginwidth='0' marginheight='0' frameborder="0" scrolling="yes" height="100%" width="100%"></iframe>
  </c:if>
</html>
