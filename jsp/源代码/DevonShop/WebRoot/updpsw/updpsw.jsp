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
		<title>�û�ע��</title>
		<link href="main.css" rel="stylesheet" type="text/css" />
		<script src="<%=path %>/js/calendar.js">
</script>
		<script src="<%=path %>/js/checkRegInfo.js">
</script>
<script type="text/javascript">
	function checkAllPsw(path){
		var flag = true;
		if(!checkInputValue(document.getElementById("oldPassword").value, spanOldPassword, "������", "���������Ӣ����ĸ�����ֻ��»��ߣ��ҳ��Ȳ�С��3", /^([0-9]|[a-zA-Z]|_){3,15}$/, path)){
			flag = false;
		}
		if(!checkInputValue(document.getElementById("password").value, spanPassword, "������", "���������Ӣ����ĸ�����ֻ��»��ߣ��ҳ��Ȳ�С��3", /^([0-9]|[a-zA-Z]|_){3,15}$/, path)){
			flag = false;
		}
		if(!checkInputValue(document.getElementById("passwordAgain").value, spanPasswordAgain, "ȷ������", "ȷ�����������Ӣ����ĸ�����ֻ��»��ߣ��ҳ��Ȳ�С��3", /^([0-9]|[a-zA-Z]|_){3,15}$/, path)){
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
				�����̳�
			</h3>
			<form method="post" name="apForm" id="apForm" action="<%=path %>/servlet/UpdatePasswordServlet" onSubmit="return checkAllPsw('<%=path %>')" >
				<input type="hidden" name="userName" value="${param.userName}"/>
				<input type="hidden" name="type" value="${param.type}"/>
				<fieldset>
					<legend>
						�����޸�
					</legend>
						<br>
					<div>
						<label>
							 �� �� ��
						</label>
						<input class="short" type="password" name="oldPassword" id="oldPassword"
							onBlur="checkInputValue(this.value, spanOldPassword, '������', '���������Ӣ����ĸ�����ֻ��»��ߣ�����Ϊ3~15', /^([0-9]|[a-zA-Z]|_){3,15}$/, '<%=path%>')"
							onFocus="clearInputValue(spanOldPassword)" />
						<span id="spanOldPassword"></span>
						<br />
					</div>

					<div>
						<label for="Email">
							�� �� ��
						</label>
						<input class="short" type="password" name="password" id="password"
							onBlur="checkInputValue(this.value, spanPassword, '������', '���������Ӣ����ĸ�����ֻ��»��ߣ�����Ϊ3~15', /^([0-9]|[a-zA-Z]|_){3,15}$/, '<%=path%>')"
							onFocus="clearInputValue(spanPassword)" />
						<span id="spanPassword"></span>
						<br />
					</div>
					<div>
						<label for="password">
							 ȷ������
						</label>
						<input class="short" type="password" name="passwordAgain"
							id="passwordAgain"
							onBlur="checkInputValue(this.value, spanPasswordAgain, 'ȷ������', 'ȷ���������������Ӣ����ĸ�����ֻ��»��ߣ�����Ϊ3~15', /^([0-9]|[a-zA-Z]|_){3,15}$/, '<%=path%>')"
							onFocus="clearInputValue(spanPasswordAgain)" />
						<span id="spanPasswordAgain"></span>
						<br />
					</div>
					<div class="enter">
						<input class="buttom" type="submit" name="submit" value="�ύ"/>
						<input class="buttom" type="reset" name="reset" value="����" />
					</div>
				</fieldset>
			</form>
			<br />
		</div>
	</body>
</html>
