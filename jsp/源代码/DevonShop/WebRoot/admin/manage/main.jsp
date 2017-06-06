<%@ page language="java" import="java.util.*,com.devon.dao.dto.User" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>后台管理系统</title>
</head>

<frameset rows="83,*" cols="*" framespacing="0" frameborder="no" border="0">
  <frame src="<%=path %>/admin/manage/top.jsp" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" />
  <frame src="<%=path %>/admin/manage/center.jsp" name="mainFrame" id="mainFrame" />
</frameset>
<noframes>
</noframes>
</html>
