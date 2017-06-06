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
	<input type="hidden" id="currTime" value="${requestScope.currTime}"/>
	<input type="hidden" id="path" value="<%=path %>"/>
		<div id="formwrapper">
			<h3>
				网上商城
			</h3>
			<form method="post" name="apForm" id="apForm" action="<%=path %>/servlet/RegUserServlet" onSubmit="return checkAllInfo('<%=path %>')" >
				<input type="hidden" name="type" value="${requestScope.user.type}"/>
				<input type="hidden" name="task" value="${ requestScope.task}"/>
				<fieldset>
					<legend>
					<c:choose>
						<c:when test="${ requestScope.task eq 'update'}">
							<c:if test="${requestScope.user.type eq 0 or requestScope.user.type eq 1 }">管理员资料修改</c:if>
							<c:if test="${requestScope.user.type eq 2}">用户资料修改</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${requestScope.user.type eq 0 or requestScope.user.type eq 1 }">添加管理员</c:if>
							<c:if test="${requestScope.user.type eq 2}">用户注册</c:if>
						</c:otherwise>
					</c:choose>
					</legend>
					<br>
						<span style="color: red" >
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* 以下信息全部为必填项
						</span>
						<br>
						<br>
					<div>
						<label>
							 用户名
						</label>
					<input type="hidden" name="type" value="${requestScope.user.type}" />
													
					<c:choose>
						<c:when test="${ requestScope.task eq 'update'}">
							<input type="hidden" name="userName" value="${requestScope.user.userName}" />
							<label>${requestScope.user.userName}</label>
						</c:when>
						<c:otherwise>
							<input class="short" type="text" name="userName" id="userName"
								onBlur="checkInputValue(this.value,spanUserName, '用户名', '用户名必须是英文字母或数字，长度为3~15', /^([0-9]|[a-zA-Z]|_){3,15}$/, '<%=path%>')"
								onFocus="clearInputValue(spanUserName)" />
							<span id="spanUserName" style="text-align: center"></span>
						</c:otherwise>
					</c:choose>
						<br />
					</div>
					<c:if test="${requestScope.task eq 'insert'}">
					<div>
						<label for="Email">
							 密码
						</label>
						<input class="short" type="password" name="password" id="password"
							onBlur="checkInputValue(this.value, spanPassword, '密码', '密码必须是英文字母，数字或下划线，长度为3~15', /^([0-9]|[a-zA-Z]|_){3,15}$/, '<%=path%>')"
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
					</c:if>
					<div>
						<label for="confirm_password">
							 性别
						</label>
						<input class="short" style="width: 30px" type="radio" name="sex"
							value="男" checked="checked" />
						男
						<input class="short" style="width: 30px" type="radio" name="sex"
							value="女" ${requestScope.user.sex eq "女"?"checked='checked'":"" }/>
						女
						<br />
					</div>
					<div>
						<label for="Name">
							 真实姓名
						</label>
						<input class="short" type="text" name="realName" id="realName" value="${requestScope.user.realName}"
							maxlength="15"
							onBlur="checkInputValue(this.value, spanRealName, '真实姓名', '真实姓名必须是中文，长度为2~10', /^([一-龥]{2,10})$/, '<%=path%>')"
							onFocus="clearInputValue(spanRealName)" />
						<span id="spanRealName"></span>
						<br />
					</div>
					<div>
						<label for="Name">
							 出生日期
						</label>
						<input class="short" type="text" name="birthday" id="birthday" value="${requestScope.user.birthday}"
							onFocus="show_cele_date(this,'','',this, '<%=path%>');clearInputValue(spanBirthday)" />
						<span id="spanBirthday"></span>
						<br />
					</div>
					<div>
						<label for="Name">
							 电子邮箱
						</label>
						<input class="short" type="text" name="email" id="email" value="${requestScope.user.email}"
							onBlur="checkInputValue(this.value, spanEmail, '电子邮箱', '电子邮箱格式不正确！正确格式举例：abc@def.com', /^[-_A-Za-z0-9]+@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/, '<%=path%>')"
							onFocus="clearInputValue(spanEmail)" />
						<span id="spanEmail"></span>
						<br />
					</div>
					<div>
						<label for="Name">
							 电话号码
						</label>
						<input class="short" type="text" name="tel" id="tel" value="${requestScope.user.tel}"
							onBlur="checkInputValue(this.value, spanTel, '电话号码', '电话号码格式不正确！',  /(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$/, '<%=path%>')" 
							onFocus="spanTel.innerHTML ='' " />
						<span id="spanTel"></span>
						<br />
					</div>
					<div>
						<label for="Name">
							 地址
						</label>
						<input class="short" type="text" name="address" id="address" value="${requestScope.user.address}"
							maxlength="100"
							onBlur="checkInputValue(this.value, spanAddress, '地址', '', /(.+?)/, '<%=path%>')"
							onFocus="clearInputValue(spanAddress)" />
						<span id="spanAddress"></span>
						<br />
					</div>
					<div>
						<label for="Name">
							  邮编
						</label>
						<input class="short" type="text" name="post" id="post" value="${requestScope.user.post}"
							maxlength="6"
							onBlur="checkInputValue(this.value, spanPost, '邮编', '邮编格式不正确！', /[1-9]\d{5}(?!\d)/, '<%=path%>')"
							onFocus="spanPost.innerHTML ='' " />
						<span id="spanPost"></span>
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
