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
		<script src="<%=path %>/js/calendar.js">
</script>
		<script src="<%=path %>/js/checkRegInfo.js">
</script>

		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="this is my page">
		<meta http-equiv="content-type" content="text/html; charset=gbk">

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/reguser.css">
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/main.css">
	</head>

	<body>
		<div id="formwrapper">
			<h3>
				XX网上商城
			</h3>
				<fieldset>
					<legend>
						个人资料
					</legend>
						<br>
					<div>
						<label>
							 用户名
						</label>
							<label>${!empty sessionScope.adminUser?sessionScope.adminUser.userName:sessionScope.commonUser.userName}</label>
						<br />
					</div>

					<div>
						<label for="confirm_password">
							 性别
						</label>
						<label>${!empty sessionScope.adminUser?sessionScope.adminUser.sex:sessionScope.commonUser.sex}</label>
						<br />
					</div>
					<div>
						<label for="Name">
							 真实姓名
						</label>
						<label>${!empty sessionScope.adminUser?sessionScope.adminUser.realName:sessionScope.commonUser.realName}</label>
						<br />
					</div>
					<div>
						<label for="Name">
							 出生日期
						</label>
						<label>${!empty sessionScope.adminUser?sessionScope.adminUser.birthday:sessionScope.commonUser.birthday}</label>

						<br />
					</div>
					<div>
						<label for="Name">
							 电子邮箱
						</label>
						<label>${!empty sessionScope.adminUser?sessionScope.adminUser.email:sessionScope.commonUser.email}</label>
						<br />
					</div>
					<div>
						<label for="Name">
							 电话号码
						</label>
						<label>${!empty sessionScope.adminUser?sessionScope.adminUser.tel:sessionScope.commonUser.tel}</label>
						<br />
					</div>
					<div>
						<label for="Name">
							 地址
						</label>
						<label>${!empty sessionScope.adminUser?sessionScope.adminUser.address:sessionScope.commonUser.address}</label>
						<br />
					</div>
					<div>
						<label for="Name">
							  邮编
						</label>
						<label>${!empty sessionScope.adminUser?sessionScope.adminUser.post:sessionScope.commonUser.post}</label>
						<br />
					</div>
				</fieldset>
			<br />
		</div>
	</body>
</html>
