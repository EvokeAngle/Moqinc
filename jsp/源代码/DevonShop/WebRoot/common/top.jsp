<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- TemplateBeginEditable name="doctitle" -->
<title>无标题文档</title>
<!-- TemplateEndEditable -->
<!-- TemplateBeginEditable name="head" -->
<!-- TemplateEndEditable -->
<style type="text/css">
<!--
.STYLE10 {font-size: 15px; font-family: "黑体"; }
ul {font-size: 12px; font-family: "宋体"; color: graytext;}
-->
</style>
<script>
	function toChangeMinType(maxTypeObj){
		var sel = maxTypeObj.value;
		var varItem;
		<c:forEach items="${requestScope.typeList}" var="temp" varStatus="s">
			<c:forEach items="${pageScope.temp}" var="temp2" varStatus="s2">
				<c:choose>
					<c:when test="${pageScope.s2.count == 1}">
						if(sel == ${pageScope.temp2.nid}){
							document.getElementById("minType").options.length = 0;
							varItem = new Option("请选择","0");
							document.getElementById("minType").options.add(varItem);
					</c:when>
					<c:otherwise>
						 varItem = new Option("${pageScope.temp2.sname}","${pageScope.temp2.nid}");
						 document.getElementById("minType").options.add(varItem);
					</c:otherwise>
				</c:choose>
			</c:forEach>
						}
		</c:forEach>
			if(sel == "0"){
				 document.getElementById("minType").options.length = 0;
				 varItem = new Option("请选择","0");
				 document.getElementById("minType").options.add(varItem);
			}
	}

	function searchGoods(vmaxType, vminType, vkeywords){
		window.frames[1].location.href = "<%=path %>/admin/manage/tab/QueryGoodsServlet?ft=n&page=showgoods&nmaxId=" + vmaxType + "&nminId=" + vminType + "&keywords=" + vkeywords + "&isClickSearch=yes";
	}

	function goIndex(index, userCenter, showOrder){
		index.background = "<%=path %>/common/images/over_b_bg.jpg"; 
		userCenter.background = "<%=path %>/common/images/norm_b_bg.jpg"; 
		showOrder.background = "<%=path %>/common/images/norm_b_bg.jpg"; 
		window.top.frames[0].location.href = "<%=path %>/admin/manage/tab/GetMcTypeServlet?ft=n&page=left";
		window.top.frames[1].location.href = "<%=path %>/admin/manage/tab/QueryGoodsServlet?ft=n&page=showgoods";
	}
	
	function goUserCenter(userCenter, index, showOrder){
		userCenter.background = "<%=path %>/common/images/over_b_bg.jpg"; 
		index.background = "<%=path %>/common/images/norm_b_bg.jpg"; 
		showOrder.background = "<%=path %>/common/images/norm_b_bg.jpg"; 
		window.top.frames[0].location.href = "<%=path %>/common/usercenter/left.jsp";
		window.top.frames[1].location.href = "<%=path %>/showselfinfo/showselfinfo.jsp";
	}
	
	function goShowOrder(showOrder, userCenter, index){
		showOrder.background = "<%=path %>/common/images/over_b_bg.jpg"; 
		index.background = "<%=path %>/common/images/norm_b_bg.jpg"; 
		userCenter.background = "<%=path %>/common/images/norm_b_bg.jpg"; 
		window.top.frames[0].location.href = "<%=path %>/common/showorder/left.jsp";
		window.top.frames[1].location.href = "<%=path%>/admin/manage/tab/QueryOrderServlet?ft=n&page=common&scUser=${sessionScope.commonUser.userName}";
	}

	function showShoppingCar(){
		window.top.frames[1].location.href = "<%=path %>/common/carmanage.jsp";
	}

	<c:if test="${!empty sessionScope.commonUser}">
		function toLogOff(){
			window.location.href = "<%=path %>/servlet/CommonLogOffServlet";
		}
	</c:if>
	
	<c:if test="${empty sessionScope.commonUser}">
		function toLoginF(){
			window.location.href = "<%=path %>/common/login/login.jsp"
		}
		function toReg(){
			window.location.href = "<%=path %>/servlet/InsertUserHelperServlet?userType=commonUser";
		}
		function toLoginB(){
			window.location.href = "<%=path %>/admin/login/login.jsp";
		}
	</c:if>
</script>

<style type="text/css">

	.fontStyle {font-size:12px; cursor: hand};
</style>
</head>

<body>
<br/>
<br/>
	<div align="center">
		<table width="990" border="0" cellspacing="0">
	        <tr>
				<td width="100px"></td>
				<td id="index" width="76px" height="30px" background="<%=path %>/common/images/over_b_bg.jpg" style="text-align: center;  cursor: hand " onclick="goIndex(this, userCenter, showOrder)"><span class="STYLE10" style="text-align: center; cursor: hand">首 页</span></td>
				<td id="userCenter" width="76px" background="<%=path %>/common/images/norm_b_bg.jpg" style="text-align: center; cursor: hand" onclick="goUserCenter(this, index, showOrder)"><span class="STYLE10" style="text-align: center; cursor: hand">会员中心</span></td>
				<td id="showOrder" width="76px" background="<%=path %>/common/images/norm_b_bg.jpg" style="text-align: center; cursor: hand " onclick="goShowOrder(this, index, userCenter)"><span class="STYLE10" style="text-align: center; cursor: hand">查看订单</span></td>
				<td width="600px">
					<c:if test="${!empty sessionScope.commonUser}">
						<span class="fontStyle">欢迎您：${sessionScope.commonUser.userName}</span>&nbsp;&nbsp;&nbsp;
						<span class="fontStyle" onclick="toLogOff()">退出登录</span>&nbsp;&nbsp;&nbsp;
						<span class="fontStyle" onclick="showShoppingCar()">购物车</span>&nbsp;&nbsp;&nbsp;
					</c:if>
					<c:if test="${empty sessionScope.commonUser}">
						<span class="fontStyle" onclick="toLoginF()">登录</span>&nbsp;&nbsp;&nbsp;
						<span class="fontStyle" onclick="toReg()">注册</span>&nbsp;&nbsp;&nbsp;
						<span class="fontStyle" onclick="toLoginB()">后台管理</span>&nbsp;&nbsp;&nbsp;
						<span class="fontStyle" onclick="showShoppingCar()">购物车</span>&nbsp;&nbsp;&nbsp;
					</c:if>
				</td>
	          <td width="*"></td>
	      </tr>
	      <tr>
	            <td width="990" height="63px" colspan="6" background="<%=path %>/common/images/top_bg.gif" >
	            	<span style="font-weight: bold;color: white">商品搜索</span>
						所属大类&nbsp;
		                <select name="maxType" id="maxType" style="width:120px;" onchange="toChangeMinType(this)">
			                <option value="0">请选择</option>
			                	<c:if test="${!empty requestScope.typeList}">
			                		<c:forEach items="${requestScope.typeList}" var="temp">
			                			<option value="${temp[0].nid }">${temp[0].sname }</option>
			                		</c:forEach>
			               		</c:if>
		                </select>
	
						所属小类&nbsp;
		                <select name="minType" id="minType" style="width:120px;">
		                	<option value="0">请选择</option>
		                		<c:if test="${!empty requestScope.typeList}">
			                		<c:forEach items="${requestScope.typeList}" var="temp">
			                			<c:forEach items="${pageScope.temp}" var="temp2" begin="1">
			                				<option value="${pageScope.temp2.nid }">${pageScope.temp2.sname }</option>
			                			</c:forEach>
			                		</c:forEach>
			               		</c:if>
		                </select>
	            	<input name="keywords" id="keywords"/> <img src="<%=path %>/common/images/search.gif" onclick="searchGoods(maxType.value, minType.value, keywords.value)" />
	            </td>
	      	</tr>
		</table>
	</div>
	<br/>
</body>

</html>
