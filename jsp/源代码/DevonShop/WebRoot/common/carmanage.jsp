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
    
    <title>My JSP 'carmanage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	
		function remove(primaryKey){
			window.location.href = "<%=path%>/servlet/ShoppingCarServlet?task=remove&nid=" + primaryKey;
			//refreshIndexLeft();
		}

		function editNcount(primaryKey, ncount){
			var isOK = /^[1-9][0-9]*$/.test(ncount);
			if(isOK){
				if(ncount > 1000){
					alert("每种商品所购最大数量为1000");
					return;
				}
				window.location.href = "<%=path%>/servlet/ShoppingCarServlet?task=editNcount&nid=" + primaryKey + "&ncount=" + ncount;
				//refreshIndexLeft();
			}else{
				alert("非法数字，数量只能为首位不为0的正整数！");
			}	
		}

		function refreshIndexLeft(){
			//alert();
			window.top.frames[0].location.href = "<%=path%>/admin/manage/tab/GetMcTypeServlet?ft=n&page=left";
		}

		function continueShopping(){
			window.location.href = "<%=path %>/admin/manage/tab/QueryGoodsServlet?ft=n&page=showgoods";
		}

		function clearShoppingCar(){
			window.location.href = "<%=path %>/servlet/ShoppingCarServlet?task=clear";
		}

		function settleAccount(){
			window.location.href = "<%=path %>/common/confirmsettle.jsp";
		}
	</script>
	<style type="text/css">
		table{text-align: center;};
	</style>
  </head>

  <body onload="refreshIndexLeft()">
  	<br/>
  	<div align="center" style="font-family: 黑体;font-size: 25px;">购物车管理</div>
	<br/>
    <table align="center" cellspacing="5px" style="font-size: 12px">
    	<tr bgcolor="#FFFACD">
    		<td width="100px">图片</td>
    		<td width="60px">商品编号</td>
    		<td width="180px">商品名称</td>
    		<td width="100px">商品价格</td>
    		<td width="100px">数量</td>
    		<td width="100px">小计</td>
    		<td width="70px">操作</td>
    	</tr>
    	<c:if test="${!empty sessionScope.shoppingCar.goodsList}">
	    	<c:forEach items="${sessionScope.shoppingCar.goodsList}" var="temp" varStatus="vs">
	    	    <tr>
		    		<td height="100px"><img width="60px" height="60px" src="<%=path %>/${!empty temp.simg?temp.simg:'image/default.jpg' }"/></td>
		    		<td>${temp.nid }</td>
		    		<td>${temp.sname }</td>
		    		<td><fmt:formatNumber type="currency" value="${temp.nprice }" groupingUsed="false"></fmt:formatNumber></td>
		    		<td>
		    			<input style="width:40px" id="ncount${vs.count}" value="${temp.ncount }"/>
		    			<span style="cursor: hand" onclick="editNcount('${temp.nid }', ncount${vs.count}.value)">修改数量</span>
		    		</td>
		    		<td><fmt:formatNumber type="currency" value="${temp.nprice * temp.ncount }" groupingUsed="false"></fmt:formatNumber></td>
		    		<td>
		    			<span style="cursor: hand" onclick="remove('${temp.nid }')">删除</span>
		    		</td>
	    		</tr>
	    	</c:forEach>
    	</c:if>
    	<c:if test="${empty sessionScope.shoppingCar.goodsList}">
    		<tr>
    			<td colspan="7">您还未选购商品！</td>
    		</tr>
    	</c:if>
    </table>
    <br/><br/>
    <div align="right">
	    <img src="<%=path %>/common/images/continue_pay.jpg" onclick="continueShopping()" style="cursor:hand"/>
	    <img src="<%=path %>/common/images/clear.jpg" ${!empty sessionScope.shoppingCar.goodsList?"onclick='clearShoppingCar()'":"onclick=\"alert('您还未选购任何商品,无法进行清空购物车操作！')\"" } style="cursor:hand"/>
	    <img src="<%=path %>/common/images/settle_account_center.jpg" ${!empty sessionScope.shoppingCar.goodsList?"onclick='settleAccount()'":"onclick=\"alert('您还未选购任何商品,无法进行结算操作！')\"" } style="cursor:hand"/>
    </div>
  </body>
</html>
