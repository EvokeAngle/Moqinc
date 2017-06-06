<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    
    <title>My JSP 'orderitemtab.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
	body {
	font: normal 11px auto "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
	color: #4f6b72;
	background: #E6EAE9;
}

a {
	color: #c75f3e;
}

#mytable {
	width: 750px;
	padding: 0;
	margin: 0;
}

caption {
	padding: 0 0 5px 0;
	width: 700px;	 
	font: italic 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
	text-align: right;
}

th {
	font: bold 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
	color: #4f6b72;
	border-right: 1px solid #C1DAD7;
	border-bottom: 1px solid #C1DAD7;
	border-top: 1px solid #C1DAD7;
	letter-spacing: 2px;
	text-transform: uppercase;
	text-align: left;
	padding: 6px 6px 6px 12px;
	background: #CAE8EA url(images/bg_header.jpg) no-repeat;
}

th.nobg {
	border-top: 0;
	border-left: 0;
	border-right: 1px solid #C1DAD7;
	background: none;
}

td {
	border-right: 1px solid #C1DAD7;
	border-bottom: 1px solid #C1DAD7;
	background: #fff;
	font-size:12px;
	padding: 6px 6px 6px 12px;
	color: #4f6b72;
	height:35px;
}

td.wth{
	
	width:85px;
	text-align:center;
}

td.alt {
	background: #F5FAFA;
	color: #797268;
}

th.spec {
	border-left: 1px solid #C1DAD7;
	border-top: 0;
	background: #fff url(images/bullet1.gif) no-repeat;
	font: bold 10px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
}

th.specalt {
	border-left: 1px solid #C1DAD7;
	border-top: 0;
	background: #f5fafa url(images/bullet2.gif) no-repeat;
	font: bold 10px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
	color: #797268;
}
</style>
<script type="text/javascript">
	function toPay(primaryKey, goodsnid){
		
		var isOver = false;
		// 遍历商品数量
		<c:forEach items="${sessionScope.shoppingCar.goodsList}" var="temp">
			if(${temp.nid} == primaryKey){
				if(${temp.ncount} + 1 > 1000){
					alert("每种商品所购最大数量为1000");
					return;
				}
			}
		</c:forEach>
		
		window.location.href = "<%=path%>/servlet/ShoppingCarServlet?task=pay&nid=" + primaryKey;
		refreshIndexLeft();
	}
	
	function refreshIndexLeft(){
		window.top.frames[0].location.href = "<%=path%>/admin/manage/tab/GetMcTypeServlet?ft=n&page=left";
	}
</script>

	<link rel="stylesheet" type="text/css" href="<%=path %>/css/fancy.css" media="screen" />
	<script type="text/javascript" src="<%=path %>/js/jquery-1.2.3.pack.js"></script> 
	<script type="text/javascript" src="<%=path %>/js/jquery.pngFix.pack.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery.fancybox-1.0.0.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {		 
			$("a").fancybox({
				'hideOnContentClick': true
			});
		});	
	</script>
	
</head>
  
<body onload="refreshIndexLeft()">
<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
  	<div ><h2 align="center">商品详细信息</h2><br /><br /><br /><br /><br /><br />
	    <table border="1">
	    	<tr>
	    		<td width="100px" class="wth" >商品编号</td>
	    		<td id="nid">${requestScope.mc.nid }</td>
	    		<td width="100px" class="wth">商品名称</td>
	    		<td width="200px">${requestScope.mc.sname }</td>
	    	</tr>
	    	<tr>
	    		<td class="wth">商品价格</td>
	    		<td><fmt:formatNumber type="currency" value="${requestScope.mc.nprice }" groupingUsed="false"></fmt:formatNumber></td>
	    		<td class="wth" rowspan="4" colspan="2"><a href="<%=path%>/${!empty requestScope.mc.simg?requestScope.mc.simg:'image/default.jpg' }"><img width="80px" height="80px" src="<%=path%>/${!empty requestScope.mc.simg?requestScope.mc.simg:'image/default.jpg' }"/></a></td>
	    	</tr>
	    	<tr>
	    		<td class="wth">上架时间</td>
	    		<td>${requestScope.mc.dcDate }</td>
	    	</tr>
	    	<tr>
	    		<td class="wth">是否缺货</td>
	    		<td>${requestScope.mc.smcTag == 0?"缺货":"有库存" }</td>
	    	</tr>
	    	<tr>
	    		<td class="wth">商品简介</td>
	    		<td>${requestScope.mc.sdescription }</td>
	    	</tr>
	    </table>
	    <br/><br /><br /><br />
		<div align="right">
			<input type="button" value="购  买" onclick="toPay(nid.innerText)"/>&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="返  回" onclick="window.history.back();"/>&nbsp;&nbsp;&nbsp;
		</div>
		<br>
	</div>
  </body>
</html>
