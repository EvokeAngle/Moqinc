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
<script type="text/javascript">
	function checkAllPsw(path){
		var flag = true;
		if(!checkInputValue(document.getElementById("oldPassword").value, spanOldPassword, "旧密码", "密码必须是英文字母，数字或下划线，且长度不小于3", /^([0-9]|[a-zA-Z]|_){3,15}$/, path)){
			flag = false;
		}
		if(!checkInputValue(document.getElementById("password").value, spanPassword, "新密码", "密码必须是英文字母，数字或下划线，且长度不小于3", /^([0-9]|[a-zA-Z]|_){3,15}$/, path)){
			flag = false;
		}
		if(!checkInputValue(document.getElementById("passwordAgain").value, spanPasswordAgain, "确认密码", "确认密码必须是英文字母，数字或下划线，且长度不小于3", /^([0-9]|[a-zA-Z]|_){3,15}$/, path)){
			flag = false;
		}
		return flag;
	}
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
				网上商城
			</h3>
			<form method="post" name="apForm" id="apForm" action="<%=path %>/servlet/UpdatePasswordServlet" onSubmit="return checkAllPsw('<%=path %>')" >
				<input type="hidden" name="userName" value="${param.userName}"/>
				<input type="hidden" name="type" value="${param.type}"/>
				<fieldset>
					<legend>
						密码修改
					</legend>
						<br>
					<div>
						<label>
							 旧 密 码
						</label>
						<input class="short" type="password" name="oldPassword" id="oldPassword"
							onBlur="checkInputValue(this.value, spanOldPassword, '旧密码', '密码必须是英文字母，数字或下划线，长度为3~15', /^([0-9]|[a-zA-Z]|_){3,15}$/, '<%=path%>')"
							onFocus="clearInputValue(spanOldPassword)" />
						<span id="spanOldPassword"></span>
						<br />
					</div>

					<div>
						<label for="Email">
							新 密 码
						</label>
						<input class="short" type="password" name="password" id="password"
							onBlur="checkInputValue(this.value, spanPassword, '新密码', '密码必须是英文字母，数字或下划线，长度为3~15', /^([0-9]|[a-zA-Z]|_){3,15}$/, '<%=path%>')"
							onFocus="clearInputValue(spanPassword)" />
						<span id="spanPassword"></span>
						<br />
					</div>
					<div>
						<label for="password">
							 确认密码
						</label>
						<input class="short" type="password" name="passwordAgain"
							id="passwordAgain"
							onBlur="checkInputValue(this.value, spanPasswordAgain, '确认密码', '确认密码密码必须是英文字母，数字或下划线，长度为3~15', /^([0-9]|[a-zA-Z]|_){3,15}$/, '<%=path%>')"
							onFocus="clearInputValue(spanPasswordAgain)" />
						<span id="spanPasswordAgain"></span>
						<br />
					</div>
					<div class="enter">
						<input class="buttom" type="submit" name="submit" value="提交"/>
						<input class="buttom" type="reset" name="reset" value="重置" />
					</div>
				</fieldset>
			</form>
			<br />
		</div>
	</body>
</html>
