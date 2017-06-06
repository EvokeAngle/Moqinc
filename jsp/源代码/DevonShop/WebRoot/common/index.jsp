<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- TemplateBeginEditable name="doctitle" -->
<title>网上商城</title>
<!-- TemplateEndEditable -->
<!-- TemplateBeginEditable name="head" -->
<!-- TemplateEndEditable -->
<style type="text/css">
<!--
.STYLE10 {font-size: 15px; font-family: "黑体"; }
ul {font-size: 12px; font-family: "宋体"; color: graytext;}
-->
</style>
</head>
<!--
<frameset rows="130,15,*" framespacing="0"  frameborder="0" marginheight="0px" marginwidth="0px" >
	<frame src="<%=path %>/admin/manage/tab/GetMcTypeServlet?ft=n&page=top" marginheight="" marginwidth="0" scrolling="no"></frame>
	<frame src="" scrolling="no"></frame>
	<frameset cols="200,*" scrolling="auto">
		<frameset rows="300,*">
			<frame src="<%=path %>/common/cartotal.jsp" marginheight="0" marginwidth="0" scrolling="no"></frame>
			<frame src="<%=path %>/admin/manage/tab/GetMcTypeServlet?ft=n&page=goodstype" marginheight="0" marginwidth="0" scrolling="no"></frame>
		</frameset>
		<frame src="<%=path %>/admin/manage/tab/QueryGoodsServlet?ft=n&page=showgoods" marginheight="0" marginwidth="0" scrolling="auto"></frame>
	</frameset>
</frameset>
-->
<body>
	<div align="center">
		<c:import url="/admin/manage/tab/GetMcTypeServlet?ft=n&page=top" ></c:import>
		<%--<jsp:include page="${pageContext.request.contextPath}/admin/manage/tab/GetMcTypeServlet?ft=n&page=top"></jsp:include> --%>
		<table width="990px" border="0">
			<tr valign="top" >
				<td valign="top">
					<table border="0" width="80px" >
						<tr valign="top">
						   	<td width="85px" valign="top">
						   		<iframe src="<%=path %>/admin/manage/tab/GetMcTypeServlet?ft=n&page=left" frameborder="0" marginheight="0" marginwidth="0" scrolling="auto" width="200px" height="1070px"></iframe>
						   		<%--<c:import url="/common/cartotal.jsp"></c:import>
						   		<br />
						   		<br />
								<c:import url="/admin/manage/tab/GetMcTypeServlet?ft=n&page=goodstype"></c:import>--%>
							</td>
		         		</tr>
		         	</table>
				</td>
	        	<td height="1070px">
	        		<iframe src="<%=path %>/admin/manage/tab/QueryGoodsServlet?ft=n&page=showgoods" frameborder="0" marginheight="0" marginwidth="0" scrolling="auto" width="770px" height="1070px"></iframe>
	            </td>
			</tr>
		</table>
	</div>
</body>
</html>
