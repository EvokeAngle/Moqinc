<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'cartotal.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function queryGoodsForMaxType(primaryKey){
			window.top.frames[1].location.href = "<%=path %>/admin/manage/tab/QueryGoodsServlet?ft=n&page=showgoods&nmaxId=" + primaryKey;
		}
		
		function queryGoodsForMinType(primaryKey){
			window.top.frames[1].location.href = "<%=path %>/admin/manage/tab/QueryGoodsServlet?ft=n&page=showgoods&nminId=" + primaryKey;
		}

		function showShoppingCar(){
			window.top.frames[1].location.href = "<%=path %>/common/carmanage.jsp";
		}

		function changeChildTr(vTbody, vImage){
			if(vTbody.style.display == "none"){	
				vTbody.style.display = "block";
				vImage.src = "<%=path%>/admin/manage/images/sub.jpg";
			}else if(vTbody.style.display == "block"){
				vTbody.style.display = "none";
				vImage.src = "<%=path%>/admin/manage/images/plus.jpg";
			}
		}

		function myOrder(){
			window.top.frames[1].location.href = "<%=path%>/admin/manage/tab/QueryOrderServlet?ft=n&page=common&scUser=${sessionScope.commonUser.userName}";
		}
	</script>
  </head>
  
  <body>
  <br>
  <br>
  <br>
  <br>
  <br>
  		<table border="0" align="center">
  			<tr>
  				<td width="160px" height="31px" style="cursor: hand;" background="<%=path %>/common/usercenter/images/my_order.jpg" onclick="myOrder()"></td>
  			</tr>
  		</table>
  </body>
</html>
