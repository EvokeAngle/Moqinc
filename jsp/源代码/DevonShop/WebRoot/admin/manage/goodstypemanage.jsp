<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>无标题文档</title>
<style type="text/css"> 
	td {font-size:12px};
	input {width:120px};
	
	body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 12px}
.STYLE3 {font-size: 12px; font-weight: bold; }
.STYLE4 {
	color: #03515d;
	font-size: 12px;
	cursor: hand;
}
</style>
<script> 
	function changeChildTr(vTbody, vImage){
		if(vTbody.style.display == "none"){	
			vTbody.style.display = "block";
			vImage.src = "<%=path%>/admin/manage/images/sub.jpg";
		}else if(vTbody.style.display == "block"){
			vTbody.style.display = "none";
			vImage.src = "<%=path%>/admin/manage/images/plus.jpg";
		}
	}
	

	function edtGoodsType(primaryKey, npid, oldSname, newSname){
		if(oldSname == newSname){
			alert("商品类别无修改！");
			return;
		}
		var r=confirm("确定要将商品类别“" + primaryKey + "：" + oldSname + "”修改为“" + newSname + "”吗？");
		
		if (r==true){
		  	window.location.href = "<%=path%>/servlet/UpdateGoodsTypeServlet?nid=" + primaryKey + "&npid=" + npid + "&newSname=" + newSname;
		}else {
		  	
		}
	}

	function delGoodsType(primaryKey, sname){
		var r=confirm("确定要将商品类别“" + primaryKey + "：" + sname + "”及其所属商品删除吗？");
		
		if (r==true){
		  	window.location.href = "<%=path%>/servlet/DeleteGoodsTypeServlet?nid=" + primaryKey;
		}else {
		  	
		}
	}

	function addMcType(){
		window.location.href = "<%=path%>/admin/manage/tab/GetMcTypeServlet?page=insgoodstype";
	}
</script>
</head>
 
<body>
	<input type="button" value="添加商品类别" onclick="addMcType()"/>
	<table border="1">
		<tr>
			<td align="center">编号</td>
			<td align="center" width="200px">类别名称</td>
			<td align="center" width="80px">父类别编号</td>
			<td align="center">操作</td>
     	</tr>

			<c:forEach items="${requestScope.typeList}" var="temp" varStatus="vs">
				<c:forEach items="${pageScope.temp}" var="temp2" varStatus="vs2">
						<c:choose>
							<c:when test="${pageScope.vs2.count == 1}">
									<tr>
										<td><img id="picGoodsMg" src="<%=path%>/admin/manage/images/sub.jpg" onclick="changeChildTr(tbody${pageScope.temp2.nid }, this)"/>&nbsp;&nbsp;${pageScope.temp2.nid }</td>
			        					<td><input name="sname" id="nid${pageScope.temp2.nid }" value="${pageScope.temp2.sname }"></td>
			        					<td>${pageScope.temp2.npid }</td>
			        					<td height="24" background="<%=path%>/admin/manage/tab/images/bg.gif" bgcolor="#FFFFFF" ><div align="center"><span class="STYLE4" align="center"><img src="images/edt.gif" width="16" height="16" /><span onclick="edtGoodsType('${pageScope.temp2.nid }', '${pageScope.temp2.npid }', '${pageScope.temp2.sname }', nid${pageScope.temp2.nid }.value)">修改</span>&nbsp; &nbsp;<img src="images/del.gif" width="16" height="16" /><span onclick="delGoodsType('${pageScope.temp2.nid }', '${pageScope.temp2.sname }')">删除</span></span></div></td>
				        			</tr>
		<tbody id="tbody${pageScope.temp2.nid }" style="display: block">
							</c:when>

							<c:otherwise>

									<tr>
										<td>&nbsp;</td>
			        					<td align="right"><input name="sname" id="nid${pageScope.temp2.nid }" value="${pageScope.temp2.sname }"></td>
			        					<td align="right">${pageScope.temp2.npid }</td>
			        					<td height="24" background="<%=path%>/admin/manage/tab/images/bg.gif" bgcolor="#FFFFFF" ><div align="center"><span class="STYLE4" align="center"><img src="images/edt.gif" width="16" height="16" /><span onclick="edtGoodsType('${pageScope.temp2.nid }', '${pageScope.temp2.npid }', '${pageScope.temp2.sname }', nid${pageScope.temp2.nid }.value)">修改</span>&nbsp; &nbsp;<img src="images/del.gif" width="16" height="16" /><span onclick="delGoodsType('${pageScope.temp2.nid }', '${pageScope.temp2.sname }')">删除</span></span></div></td>
			       					</tr>

							</c:otherwise>

						</c:choose>
				</c:forEach>
		</tbody>
			</c:forEach>

<!--   	<tr>
        	<td>&nbsp;&nbsp;&nbsp;<img id="picGoodsMg" value="<%=path%>/admin/manage/images/sub.jpg" src="<%=path%>/admin/manage/images/sub.jpg" onclick="changeGoodsMg(this)"/>&nbsp;&nbsp;&nbsp;商品管理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        
       	<tr>
        	<td id="goodsKindMg">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="x.html">商品类别管理</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        
        <tr>
        	<td id="goodsInfoMg">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="x.html">商品信息管理</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        
       	<tr>
        	<td>&nbsp;&nbsp;&nbsp;<img id="picUserMg" value="<%=path%>/admin/manage/images/sub.jpg" src="<%=path%>/admin/manage/images/sub.jpg" onclick="changeUserMg(this)"/>&nbsp;&nbsp;&nbsp;用户管理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        
       	<tr>
        	<td id="regUserMg">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="x.html">注册用户管理</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        
        <tr>
        	<td id="adminUserMg">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="x.html">管理员用户管理</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        
        <tr>
        	<td>&nbsp;&nbsp;&nbsp;<img id="picOrderMg" value="<%=path%>/admin/manage/images/sub.jpg" src="<%=path%>/admin/manage/images/sub.jpg" onclick="changeOrderMg(this)"/>&nbsp;&nbsp;&nbsp;订单管理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        
       	<tr>
        	<td id="seeOrderForm">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="x.html">查看订单</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        
        <tr>
        	<td id="orderCheck">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="x.html">订单审核</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
 
        <tr>
        	<td id="changeCheck">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="x.html">修改审核</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
                
        <tr>
        	<td>&nbsp;&nbsp;&nbsp;<img id="picUserInfo" value="<%=path%>/admin/manage/images/sub.jpg" src="<%=path%>/admin/manage/images/sub.jpg" onclick="changeUserInfo(this)"/>&nbsp;&nbsp;&nbsp;个人资料&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        
       	<tr>
        	<td id="seeBasicInfo">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="x.html">查看基本资料</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        
        <tr>
        	<td id="changeBasicInfo">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="x.html">修改基本资料</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        <tr>
        	<td id="changePsw">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="x.html">修改密码</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        
        <tr>
        	<td>
        		<a href="x.html">安全退出</a>
            </td>
        </tr>  --> 
 
    </table>
</body>
</html>


