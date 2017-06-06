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
    
    <title>My JSP 'showgoods.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	

		
		function goToFirst(){
			window.location.href = "<%=path%>/admin/manage/tab/QueryGoodsServlet?ft=n&page=showgoods&pageNum=1&nmaxId=${requestScope.nmaxId }&nminId=${requestScope.nminId }&keywords=${requestScope.keywords }";			
	
		}
		
		function goToBack(){
			var backPageNum = ${requestScope.pageNum} - 1;
		
				window.location.href = "<%=path%>/admin/manage/tab/QueryGoodsServlet?ft=n&page=showgoods&pageNum=" + backPageNum + "&nmaxId=${requestScope.nmaxId }&nminId=${requestScope.nminId }&keywords=${requestScope.keywords }";
		}
		
		function goToNext(){
			var nextPageNum = ${requestScope.pageNum} + 1;
		
				window.location.href = "<%=path%>/admin/manage/tab/QueryGoodsServlet?ft=n&page=showgoods&pageNum=" + nextPageNum + "&nmaxId=${requestScope.nmaxId }&nminId=${requestScope.nminId }&keywords=${requestScope.keywords }";
		}
		
		function goToLast(){
				window.location.href = "<%=path%>/admin/manage/tab/QueryGoodsServlet?ft=n&page=showgoods&pageNum=${requestScope.pageTotal}&nmaxId=${requestScope.nmaxId }&nminId=${requestScope.nminId }&keywords=${requestScope.keywords }";
		}
		
		function goToAppoint(){
			var isOK = /^[1-9][0-9]*$/.test(appointPage.value);
			if(isOK == true){
				window.location.href = "<%=path%>/admin/manage/tab/QueryGoodsServlet?ft=n&page=showgoods&pageNum=" + appointPage.value + "&nmaxId=${requestScope.nmaxId }&nminId=${requestScope.nminId }&keywords=${requestScope.keywords }";
			}else{
				alert("非法数字，页数只能为首位不为0的正整数！");
			}
		}

		function toPay(primaryKey){
			
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
			//refreshIndexLeft();
		}
		
		function toDetail(primaryKey){
			window.location.href = "<%=path%>/servlet/QuerySingleGoodsServlet?nid=" + primaryKey;
		}
		
		
		function setSearchConOfTop(){
			
			var obj = window.top.document.getElementById("maxType");	
			var value = "${requestScope.nmaxId }";
		    for(var i=0;i<obj.options.length;i++){
		        if(obj.options[i].value == value){
		            obj.options[i].selected = true;
		        }
		    }
			var obj = window.top.document.getElementById("minType");	
			var value = "${requestScope.nminId }";
		    for(var i=0;i<obj.options.length;i++){
		        if(obj.options[i].value == value){
		            obj.options[i].selected = true;
		        }
		    }
		    window.top.document.getElementById("keywords").value = "${requestScope.keywords }";
		}

		function refreshIndexLeft(){
			window.top.frames[0].location.href = "<%=path%>/admin/manage/tab/GetMcTypeServlet?ft=n&page=left";
		}

	</script>
  </head>
  
<body onload="setSearchConOfTop()">
<!--  <input type="hidden" name="nmaxId" id="nmaxId" value="${requestScope.nmaxId }"/>
  <input type="hidden" name="nminId" id="nminId" value="${requestScope.nminId }"/>
  <input type="hidden" name="keywords" id="keywords" value="${requestScope.keywords }"/>  -->
  	<div align="center">
	    <table width="760px">
	    	<c:if test="${!empty requestScope.mcList}">
		    	<c:forEach items="${requestScope.mcList}" var="temp">
			    	<tr>
			    		<td width="100px" height="100px"><img width="80px" height="80px" src="<%=path %>/${empty temp.simg?'image/default.jpg':temp.simg }"/></td>
			    		<td width="490px" height="100px">
			    			<table>
			    				<tr>
			    					<td align="left" style="font-size: 12px">【商品名称】 ${temp.sname }</td>
			    				</tr>
			    				<tr>
			    					<td align="left" style="font-size: 12px">【商品价格】<fmt:formatNumber type="currency" value="${temp.nprice }" groupingUsed="false" ></fmt:formatNumber></td>
			    				</tr>
			    				<tr>
			    					<td align="left" style="color: #60aad3; font-size: 12px">${temp.sdescription}</td>
			    				</tr>
			    			</table>
			    		</td>
			    		<td width="15%" height="100px">
			    			<img alt="" src="<%=path %>/common/images/pay.jpg" onclick="toPay('${temp.nid }')">
			    			<img alt="" src="<%=path %>/common/images/detail.jpg"  onclick="toDetail('${temp.nid }')">
			    		</td>
			    	</tr>
		    	</c:forEach>
	    	</c:if>
	    	<c:if test="${empty requestScope.mcList}">
		    	<br/>
	    		<tr>
	    			<td align="center" style="font-size: 12px; color: red;">查无商品！</td>
	    	</c:if>
	    </table>
		<br/>
			<table width="85%" border="0" cellspacing="0" cellpadding="0" style="font-size: 12px">
		          <tr>
		            <td class="STYLE4">&nbsp;&nbsp;共有 ${requestScope.recordTotal} 条记录，当前第 ${requestScope.pageNum }/${requestScope.pageTotal } 页</td>
		            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
		                <tr>
		                  <td width="40"><img src="<%=path %>/common/images/first.gif" width="37" height="15" ${requestScope.pageNum > 1?"onclick='goToFirst()'":""}/></td>
		                  <td width="45"><img src="<%=path %>/common/images/back.gif" width="43" height="15" ${requestScope.pageNum > 1?"onclick='goToBack()'":""}/></td>
		                  <td width="45"><img src="<%=path %>/common/images/next.gif" width="43" height="15" ${requestScope.pageNum != requestScope.pageTotal?"onclick='goToNext()'":""}/></td>
		                  <td width="40"><img src="<%=path %>/common/images/last.gif" width="37" height="15" ${requestScope.pageNum >= 1 && requestScope.pageNum != requestScope.pageTotal?"onclick='goToLast()'":""}/></td>
		                  <td width="100"><div align="center"><span class="STYLE1" style="font-size: 12px">转到第
		                    <input name="appointPage" id="appointPage" type="text" size="4" style="height:12px; width:30px; border:1px solid #999999;" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/> 
		                    页 </span></div></td>
		                  <td width="40"><img src="<%=path %>/common/images/go.gif" width="37" height="15" onclick="goToAppoint()"/></td>
		                </tr>
		            </table></td>
		          </tr>
	        </table>
	    </div>
  </body>
</html>
