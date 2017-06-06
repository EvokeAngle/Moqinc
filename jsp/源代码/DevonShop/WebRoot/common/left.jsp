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
				vImage.src = "<%=path%>/admin/manage/images/sub.jpg?ft=n";
			}else if(vTbody.style.display == "block"){
				vTbody.style.display = "none";
				vImage.src = "<%=path%>/admin/manage/images/plus.jpg?ft=n";
			}
		}

	</script>
  </head>
  
  <body >
  		<div style="position: static ;font-size: 12px">
         <div align="center"><image src="<%=path %>/common/images/title.jpg"/>
            	<ul style="list-style: circle; text-align: justify; white-space: nowrap;">
            		<li>已选购商品：${!empty sessionScope.shoppingCar.totalType?sessionScope.shoppingCar.totalType:'0'} 种 ${!empty sessionScope.shoppingCar.totalCount?sessionScope.shoppingCar.totalCount:'0'} 件</li><br/>
            		<li>共计：<fmt:formatNumber type="currency" value="${!empty sessionScope.shoppingCar.totalPrice?sessionScope.shoppingCar.totalPrice:'0.00'}" groupingUsed="false" ></fmt:formatNumber>元</li><br/><br/>
            	</ul>
            		<table style="cursor: hand" border="0" width="100px" onclick="showShoppingCar()" cellpadding="0" cellspacing="0">
            			<tr>
            				<td style="text-align: center">
            					<img width="25px" height="25px" src="<%=path %>/common/images/car.jpg" alt="" />
            				</td>
            				<td style="text-align: center;color: #60aad3 ; font-size: 12px">
            					查看购物车
            				</td>
            			</tr>
            		</table>
            </div>
         </div>
         <br/>
          <br/>
	  	<div style="position:static">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品类目
	    	<table border="0" width="190px" style="font-size: 13px">
				<c:forEach items="${requestScope.typeList}" var="temp" varStatus="vs">
					<c:forEach items="${pageScope.temp}" var="temp2" varStatus="vs2">
							<c:choose>
								<c:when test="${pageScope.vs2.count == 1}">
										<tr>
											<td width="5px"><img id="picGoodsMg" src="<%=path%>/admin/manage/images/sub.jpg?ft=n" onclick="changeChildTr(tbody${pageScope.temp2.nid }, this)"/>&nbsp;${pageScope.temp2.nid }</td>
				        					<td align="left" width="120px"><span style="cursor: hand" onclick="queryGoodsForMaxType('${pageScope.temp2.nid}')">${pageScope.temp2.sname}</span></td>
					        			</tr>
			<tbody id="tbody${pageScope.temp2.nid }" style="display: block">
								</c:when>
	
								<c:otherwise>
	
										<tr>
											<td>&nbsp;</td>
				        					<td align="left" width="120px">&nbsp;&nbsp;<span style="cursor: hand" onclick="queryGoodsForMinType('${pageScope.temp2.nid}')">${pageScope.temp2.sname}</span></td>
				       					</tr>
	
								</c:otherwise>
	
							</c:choose>
					</c:forEach>
			</tbody>
				</c:forEach>
		</div>
  </body>
</html>
