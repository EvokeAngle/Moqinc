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

		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="this is my page">
		<meta http-equiv="content-type" content="text/html; charset=gbk">

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/reguser.css">
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/main.css">
	</head>

	<body>
		<div id="formwrapper">
			<h3>
				XX�����̳�
			</h3>
				<fieldset>
					<legend>
						��������
					</legend>
						<br>
					<div>
						<label>
							 �û���
						</label>
							<label>${!empty sessionScope.adminUser?sessionScope.adminUser.userName:sessionScope.commonUser.userName}</label>
						<br />
					</div>

					<div>
						<label for="confirm_password">
							 �Ա�
						</label>
						<label>${!empty sessionScope.adminUser?sessionScope.adminUser.sex:sessionScope.commonUser.sex}</label>
						<br />
					</div>
					<div>
						<label for="Name">
							 ��ʵ����
						</label>
						<label>${!empty sessionScope.adminUser?sessionScope.adminUser.realName:sessionScope.commonUser.realName}</label>
						<br />
					</div>
					<div>
						<label for="Name">
							 ��������
						</label>
						<label>${!empty sessionScope.adminUser?sessionScope.adminUser.birthday:sessionScope.commonUser.birthday}</label>

						<br />
					</div>
					<div>
						<label for="Name">
							 ��������
						</label>
						<label>${!empty sessionScope.adminUser?sessionScope.adminUser.email:sessionScope.commonUser.email}</label>
						<br />
					</div>
					<div>
						<label for="Name">
							 �绰����
						</label>
						<label>${!empty sessionScope.adminUser?sessionScope.adminUser.tel:sessionScope.commonUser.tel}</label>
						<br />
					</div>
					<div>
						<label for="Name">
							 ��ַ
						</label>
						<label>${!empty sessionScope.adminUser?sessionScope.adminUser.address:sessionScope.commonUser.address}</label>
						<br />
					</div>
					<div>
						<label for="Name">
							  �ʱ�
						</label>
						<label>${!empty sessionScope.adminUser?sessionScope.adminUser.post:sessionScope.commonUser.post}</label>
						<br />
					</div>
				</fieldset>
			<br />
		</div>
	</body>
</html>
