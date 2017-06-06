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
</style>

<script src="<%=path %>/js/checkRegInfo.js"></script>
<script> 

	function insertMcType(path){
		var flag = true;
		if(!checkInputValue(document.getElementById("cTypeName").value, spanCTypeName, "类别名", "类别名长度必须为3~15", /(.+?){3,15}/, path)){
			flag = false;
		}
		
		if(flag){
			var pType = document.getElementById("pType").value;
			var cTypeName = document.getElementById("cTypeName").value;
			window.location.href = path + "/servlet/InsertMcTypeServlet?pType=" + pType + "&cTypeName=" + cTypeName;
		}
	}
</script>
<style type="text/css">
	label {font-size:14px};
</style>
</head>
 
<body topmargin="20px">

	<div style="margin-left: 20px">
		<div>
			<label for="password">
				 类 别 名
			</label>
			<input class="short" type="text" name="cTypeName" style="width:100px"
				id="typeName"
				onBlur="checkInputValue(this.value, spanCTypeName, '类别名', '类别名长度必须为3~15', /(.+?){3,15}/, '<%=path%>')"
				onFocus="clearInputValue(spanCTypeName)" />
			<span id="spanCTypeName"></span>
			<br />
			<br />
		</div>

		<div>
			<label for="confirm_password">
				父类别名
			</label>
			<select name="pType" style="width:100px">
				<option value="0" >无父类别</option>
				<c:forEach items="${requestScope.typeList}" var="temp" varStatus="vs">
					<option value="${pageScope.temp[0].nid }">${pageScope.temp[0].sname }</option>
				</c:forEach>
			</select>
		</div>
		
		<div>
			<br />
			<button style="width: 60px" onclick="insertMcType('<%=path%>')">提交</button>
			<input style="width: 60px" type ="reset" value="重置" />
		</div>
	</div>

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
 
</body>
</html>


