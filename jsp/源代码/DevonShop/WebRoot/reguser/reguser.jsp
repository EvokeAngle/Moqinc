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
	<input type="hidden" id="currTime" value="${requestScope.currTime}"/>
	<input type="hidden" id="path" value="<%=path %>"/>
		<div id="formwrapper">
			<h3>
				�����̳�
			</h3>
			<form method="post" name="apForm" id="apForm" action="<%=path %>/servlet/RegUserServlet" onSubmit="return checkAllInfo('<%=path %>')" >
				<input type="hidden" name="type" value="${requestScope.user.type}"/>
				<input type="hidden" name="task" value="${ requestScope.task}"/>
				<fieldset>
					<legend>
					<c:choose>
						<c:when test="${ requestScope.task eq 'update'}">
							<c:if test="${requestScope.user.type eq 0 or requestScope.user.type eq 1 }">����Ա�����޸�</c:if>
							<c:if test="${requestScope.user.type eq 2}">�û������޸�</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${requestScope.user.type eq 0 or requestScope.user.type eq 1 }">��ӹ���Ա</c:if>
							<c:if test="${requestScope.user.type eq 2}">�û�ע��</c:if>
						</c:otherwise>
					</c:choose>
					</legend>
					<br>
						<span style="color: red" >
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* ������Ϣȫ��Ϊ������
						</span>
						<br>
						<br>
					<div>
						<label>
							 �û���
						</label>
					<input type="hidden" name="type" value="${requestScope.user.type}" />
													
					<c:choose>
						<c:when test="${ requestScope.task eq 'update'}">
							<input type="hidden" name="userName" value="${requestScope.user.userName}" />
							<label>${requestScope.user.userName}</label>
						</c:when>
						<c:otherwise>
							<input class="short" type="text" name="userName" id="userName"
								onBlur="checkInputValue(this.value,spanUserName, '�û���', '�û���������Ӣ����ĸ�����֣�����Ϊ3~15', /^([0-9]|[a-zA-Z]|_){3,15}$/, '<%=path%>')"
								onFocus="clearInputValue(spanUserName)" />
							<span id="spanUserName" style="text-align: center"></span>
						</c:otherwise>
					</c:choose>
						<br />
					</div>
					<c:if test="${requestScope.task eq 'insert'}">
					<div>
						<label for="Email">
							 ����
						</label>
						<input class="short" type="password" name="password" id="password"
							onBlur="checkInputValue(this.value, spanPassword, '����', '���������Ӣ����ĸ�����ֻ��»��ߣ�����Ϊ3~15', /^([0-9]|[a-zA-Z]|_){3,15}$/, '<%=path%>')"
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
					</c:if>
					<div>
						<label for="confirm_password">
							 �Ա�
						</label>
						<input class="short" style="width: 30px" type="radio" name="sex"
							value="��" checked="checked" />
						��
						<input class="short" style="width: 30px" type="radio" name="sex"
							value="Ů" ${requestScope.user.sex eq "Ů"?"checked='checked'":"" }/>
						Ů
						<br />
					</div>
					<div>
						<label for="Name">
							 ��ʵ����
						</label>
						<input class="short" type="text" name="realName" id="realName" value="${requestScope.user.realName}"
							maxlength="15"
							onBlur="checkInputValue(this.value, spanRealName, '��ʵ����', '��ʵ�������������ģ�����Ϊ2~10', /^([һ-��]{2,10})$/, '<%=path%>')"
							onFocus="clearInputValue(spanRealName)" />
						<span id="spanRealName"></span>
						<br />
					</div>
					<div>
						<label for="Name">
							 ��������
						</label>
						<input class="short" type="text" name="birthday" id="birthday" value="${requestScope.user.birthday}"
							onFocus="show_cele_date(this,'','',this, '<%=path%>');clearInputValue(spanBirthday)" />
						<span id="spanBirthday"></span>
						<br />
					</div>
					<div>
						<label for="Name">
							 ��������
						</label>
						<input class="short" type="text" name="email" id="email" value="${requestScope.user.email}"
							onBlur="checkInputValue(this.value, spanEmail, '��������', '���������ʽ����ȷ����ȷ��ʽ������abc@def.com', /^[-_A-Za-z0-9]+@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/, '<%=path%>')"
							onFocus="clearInputValue(spanEmail)" />
						<span id="spanEmail"></span>
						<br />
					</div>
					<div>
						<label for="Name">
							 �绰����
						</label>
						<input class="short" type="text" name="tel" id="tel" value="${requestScope.user.tel}"
							onBlur="checkInputValue(this.value, spanTel, '�绰����', '�绰�����ʽ����ȷ��',  /(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$/, '<%=path%>')" 
							onFocus="spanTel.innerHTML ='' " />
						<span id="spanTel"></span>
						<br />
					</div>
					<div>
						<label for="Name">
							 ��ַ
						</label>
						<input class="short" type="text" name="address" id="address" value="${requestScope.user.address}"
							maxlength="100"
							onBlur="checkInputValue(this.value, spanAddress, '��ַ', '', /(.+?)/, '<%=path%>')"
							onFocus="clearInputValue(spanAddress)" />
						<span id="spanAddress"></span>
						<br />
					</div>
					<div>
						<label for="Name">
							  �ʱ�
						</label>
						<input class="short" type="text" name="post" id="post" value="${requestScope.user.post}"
							maxlength="6"
							onBlur="checkInputValue(this.value, spanPost, '�ʱ�', '�ʱ��ʽ����ȷ��', /[1-9]\d{5}(?!\d)/, '<%=path%>')"
							onFocus="spanPost.innerHTML ='' " />
						<span id="spanPost"></span>
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
