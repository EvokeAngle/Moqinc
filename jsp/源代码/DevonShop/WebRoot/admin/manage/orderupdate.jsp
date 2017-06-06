<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<title>�û�ע��</title>
		<link href="main.css" rel="stylesheet" type="text/css" />
				<script src="<%=path %>/js/checkRegInfo.js">
		</script>
		<script>
			function checkAll(path){
				var flag = true;
				if(!checkInputValue(document.getElementById("ssName").value,spanSSName, '�ջ���', '�ջ����������������ģ�����Ϊ2~10', /^([һ-��]{2,10})$/, path)){
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
			<form method="post" name="apForm" id="apForm" action="<%=path %>/servlet/UpdateOrderServlet" onSubmit="return checkAll('<%=path %>')" >
				<fieldset>
					<legend>
						�µ���Ϣ
					</legend>
					<br>
						<span style="color: red" >
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* ������Ϣȫ��Ϊ������
						</span>
						<br>
						<br>
					<div>
						<label>
							 ������
						</label>
						<label>
							 ${requestScope.order.nid}
						</label>
						<input type="hidden" name="nid" value="${requestScope.order.nid}"/>
					</div>		
					<br>	
					
					<div>
						<label>
							������Ʒ������
						</label>
						<label>
							 ${requestScope.order.nmcTypeSize}
						</label>
					</div>		
					<br>	
					
					<div>
						<label>
							 ������Ʒ�ܼ���
						</label>
						<label>
							 ${requestScope.order.nmcSize}
						</label>
					</div>		
					<br>	
					
					<div>
						<label>
							 �۸��ܼ�
						</label>
						<label>
							 <fmt:formatNumber type="currency" groupingUsed="false" value="${requestScope.order.ntotalPrice}"></fmt:formatNumber>
						</label>
					</div>		
					<br>	
					
					<div>
						<label>
							 �µ�����
						</label>
						<label>
							 ${requestScope.order.dgDate}
						</label>
					</div>		
					<br>	
					
					<div>
						<label>
							 ���ʽ
						</label>
						<select name="spayType">
							<option value="����֧��" ${requestScope.order.spayType eq "����֧��"?"selected='true'":""}>����֧��</option>
							<option value="��������" ${requestScope.order.spayType eq "��������"?"selected='true'":""}>��������</option>
							<option value="�ʾֻ��" ${requestScope.order.spayType eq "�ʾֻ��"?"selected='true'":""}>�ʾֻ��</option>
						</select>
					</div>		
					<br>	
					
					<div>
						<label>
							 �ջ���ʽ
						</label>
						<select name="ssendType">
							<option value="���" ${requestScope.order.ssendType eq "���"?"selected='true'":""}>���</option>
							<option value="ƽ��" ${requestScope.order.ssendType eq "ƽ��"?"selected='true'":""}>ƽ��</option>
							<option value="EMS" ${requestScope.order.ssendType eq "EMS"?"selected='true'":""}>EMS</option>
						</select>
					</div>		
					<br>	
					
					<div>
						<label>
							 �ջ���
						</label>
						<input class="short" type="text" name="ssName" id="ssName" value="${requestScope.order.ssName}"
							onBlur="checkInputValue(this.value,spanSSName, '�ջ���', '�ջ����������������ģ�����Ϊ2~10', /^([һ-��]{2,10})$/, '<%=path%>')"
							onFocus="clearInputValue(spanSSName)" />
						<span id="spanSSName" style="text-align: center"></span>
					</div>		
					<br>	
					
					<div>
						<label>
							 �ջ���ַ
						</label>
						<label>${requestScope.order.ssAddress}</label>
					</div>		
					<br>	
					
					<div>
						<label for="Name">
							  �ջ����ʱ�
						</label>
						<label>${requestScope.order.ssCode}</label>
						<br />
					</div>	

					<div>
						<label for="Name">
							 �ջ��˵绰
						</label>
						<label>${requestScope.order.ssPhone}</label>
						<br />
					</div>
					
					<div>
						<label for="Name">
							 �ջ��˵�������
						</label>
						<label>${requestScope.order.ssEmail}</label>
						<br />
					</div>		
							
						
					<div class="enter">
						<input class="buttom" type="submit" name="submit" value="ȷ��"/>
						<input class="buttom" type="reset" name="reset" value="����" />
					</div>
				</fieldset>
			</form>
			<br />
		</div>
	</body>
</html>
