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
							����������ʾ
						</legend>
					<br>
					<br>
					<div>
						<label for="confirm_password">
							 ���ʽ
						</label>
						<select name="spayType">
							<option value="����֧��">����֧��</option>
							<option value="��������">��������</option>
							<option value="�ʾֻ��">�ʾֻ��</option>
						</select>
						<br />
						<br />
					</div>
					<div>
						<label for="Name">
							�ջ���ʽ
						</label>
						<select name="ssendType">
							<option value="���">���</option>
							<option value="ƽ��">ƽ��</option>
							<option value="EMS">EMS</option>
						</select>
						<br />
						<br />
						<br />
						<br />
					</div>
					<div class="enter">
						<input class="buttom" type="submit" name="submit" value="ȷ�Ͻ���"/>
						<input class="buttom" type="button" name="backtoShoppinCar" value="���ع��ﳵ" onclick="backtoShoppinCarFun()"/>
					</div>
					</fieldset>
			</form>
			<br />
		</div>
	</body>
</html>
