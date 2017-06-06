<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
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
  </head>
  
  <body>
  	<div align="center"><h3>订单详细信息</h3></div>
    <table border="1">
    	<tr>
    		<th colspan="4">订单信息</th>
    	</tr>
    	<tr>
    		<td class="wth">订单编号</td>
    		<td>${requestScope.order.nid }</td>
    		<td class="wth">用户名</td>
    		<td>${requestScope.order.scUser }</td>
    	</tr>
    	<tr>
    		<td class="wth">下单时间</td>
    		<td>${requestScope.order.dgDate }</td>
    		<td class="wth">付款方式</td>
    		<td>${requestScope.order.spayType }</td>
    	</tr>
    	<tr>
    		<td class="wth">收货方式</td>
    		<td>${requestScope.order.ssendType }</td>
    		<td class="wth">商品种类数</td>
    		<td>${requestScope.order.nmcTypeSize }</td>
    	</tr>
    	<tr>
    		<td class="wth">商品总个数</td>
    		<td>${requestScope.order.nmcSize }</td>
    		<td class="wth">订单总金额</td>
    		<td>${requestScope.order.ntotalPrice }</td>
    	</tr>
    	<tr>
    		<td class="wth">审核状态</td>
    		<td>
            	<c:if test="${requestScope.order.sstatus eq '0'}">未审核</c:if>
            	<c:if test="${requestScope.order.sstatus eq '1'}">审核已通过</c:if>
            	<c:if test="${requestScope.order.sstatus eq '2'}">审核未通过</c:if>
		    </td>
    		<td class="wth">审核反馈信息</td>
    		<td>${requestScope.order.smsg }</td>
    	</tr>
    	<tr>
    		<td class="wth">审核人</td>
    		<td>${requestScope.order.saUser }</td>
    		<td class="wth">审核时间</td>
    		<td>${requestScope.order.daDate }</td>
    	</tr>
    	<tr>
    		<td class="wth">收货人姓名</td>
    		<td>${requestScope.order.ssName }</td>
    		<td class="wth">收货人地址</td>
    		<td>${requestScope.order.ssAddress }</td>
    	</tr>
    	<tr>
    		<td class="wth">收货人邮编</td>
    		<td>${requestScope.order.ssCode }</td>
    		<td class="wth">收货人联系电话</td>
    		<td>${requestScope.order.ssPhone }</td>
    	</tr>
    	<tr>
    		<td class="wth">收货人Email</td>
    		<td>${requestScope.order.ssEmail }</td>
    	</tr>
    	
    	
    	<tr>
    		<th colspan="4">订单明细</th>
    	</tr>
    	<c:forEach items="${requestScope.orderItemList}" var="temp" varStatus="vs">
    		<tr>
    			<td colspan="4" style="font-weight: bold">${vs.count}：${temp.smcName}</td>
    		</tr>
	    	<tr>
	    		<td class="wth">条目编号</td>
	    		<td>${temp.nid}</td>
	    		<td class="wth">商品编号</td>
	    		<td>${temp.norderId}</td>
	    	</tr>
	    	<tr>
	    		<td class="wth">商品名</td>
	    		<td>${temp.smcName}</td>
	    		<td colspan="2" rowspan="5"><img src="<%=path %>/${empty temp.simg?'image/default.jpg':temp.simg}"/></td>
	    	</tr>
	    	<tr>
	    		<td class="wth">商品单价</td>
	    		<td>${temp.nprice}</td>
	    	</tr>
	    	<tr>
	    		<td class="wth">数量</td>
	    		<td>${temp.ncount }</td>
	    	</tr>
	    	<tr>
	    		<td class="wth">小计</td>
	    		<td>${temp.ntotalPrice }</td>
	    	</tr>
	    	<tr>
	    		<td class="wth">商品简介</td>
	    		<td>${temp.sdescription }</td>
	    	</tr>
    	</c:forEach>
    </table>
  </body>
</html>
