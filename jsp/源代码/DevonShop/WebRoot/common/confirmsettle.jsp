<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<title>用户注册</title>
		<link href="main.css" rel="stylesheet" type="text/css" />
		<script>
			function backtoShoppinCarFun(){
				window.location.href = "<%=path%>/common/carmanage.jsp";
			}
		</script>


		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="this is my page">
		<meta http-equiv="content-type" content="text/html; charset=gbk">

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/reguser.css">
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/main.css">
	</head>

	<body>
		<div id="formwrapper" class="center">
			<form method="post" name="apForm" id="apForm" action="<%=path %>/servlet/PlacingOrderHelperServlet" onSubmit="return true;" >

					<fieldset>
						<legend>
							结算中心提示
						</legend>
					<br>
					<br>
					<div>
						<label for="confirm_password">
							 付款方式
						</label>
						<select name="spayType">
							<option value="在线支付">在线支付</option>
							<option value="货到付款">货到付款</option>
							<option value="邮局汇款">邮局汇款</option>
						</select>
						<br />
						<br />
					</div>
					<div>
						<label for="Name">
							收货方式
						</label>
						<select name="ssendType">
							<option value="快递">快递</option>
							<option value="平邮">平邮</option>
							<option value="EMS">EMS</option>
						</select>
						<br />
						<br />
						<br />
						<br />
					</div>
					<div class="enter">
						<input class="buttom" type="submit" name="submit" value="确认结算"/>
						<input class="buttom" type="button" name="backtoShoppinCar" value="返回购物车" onclick="backtoShoppinCarFun()"/>
					</div>
					</fieldset>
			</form>
			<br />
		</div>
	</body>
</html>
