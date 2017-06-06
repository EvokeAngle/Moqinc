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
				if(!checkInputValue(document.getElementById("ssAddress").value,spanSSAddress, '��ַ', '��ַ����Ϊ3~15', /(.+?){3,100}$/, path)){
					flag = false;
				}
				if(!checkInputValue(document.getElementById("ssCode").value, spanSSCode, '�ʱ�', '�ʱ��ʽ����ȷ��', /[1-9]\d{5}(?!\d)/, path)){
					flag = false;
				}
				if(!checkInputValue(document.getElementById("ssPhone").value, spanSSPhone, '�绰����', '�绰�����ʽ����ȷ��',  /(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$/, path)){
					flag = false;
				}
				if(!checkInputValue(document.getElementById("ssEmail").value, spanSSEmail, '��������', '���������ʽ����ȷ����ȷ��ʽ������abc@def.com', /^[-_A-Za-z0-9]+@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/, path)){
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
			<form method="post" name="apForm" id="apForm" action="<%=path %>/servlet/PlancingOrderServlet" onSubmit="return checkAll('<%=path %>')" >
				<input type="hidden" name="scUser" value="${sessionScope.commonUser.userName }"/>
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
							 ${requestScope.nid}
						</label>
						<input type="hidden" name="nid" value="${requestScope.nid}"/>
					</div>		
					<br>	
					
					<div>
						<label>
							������Ʒ������
						</label>
						<label>
							 ${sessionScope.shoppingCar.totalType}
						</label>
						<input type="hidden" name="nmcTypeSize" value="${sessionScope.shoppingCar.totalType}"/>
					</div>		
					<br>	
					
					<div>
						<label>
							 ������Ʒ�ܼ���
						</label>
						<label>
							 ${sessionScope.shoppingCar.totalCount}
						</label>
						<input type="hidden" name="nmcSize" value="${sessionScope.shoppingCar.totalCount}"/>
					</div>		
					<br>	
					
					<div>
						<label>
							 �۸��ܼ�
						</label>
						<label>
							 <fmt:formatNumber type="currency" groupingUsed="false" value="${sessionScope.shoppingCar.totalPrice}"></fmt:formatNumber>
						</label>
						<input type="hidden" name="ntotalPrice" value="${sessionScope.shoppingCar.totalPrice}"/>
					</div>		
					<br>	
					
					<div>
						<label>
							 �µ�����
						</label>
						<label>
							 ${requestScope.dgDate}
						</label>
						<input type="hidden" name="dgDate" value="${requestScope.dgDate}"/>
					</div>		
					<br>	
					
					<div>
						<label>
							 ���ʽ
						</label>
						<label>
							 ${requestScope.spayType}
						</label>
						<input type="hidden" name="spayType" value="${requestScope.spayType}"/>
					</div>		
					<br>	
					
					<div>
						<label>
							 �ջ���ʽ
						</label>
						<label>
							 ${requestScope.ssendType}
						</label>
						<input type="hidden" name="ssendType" value="${requestScope.ssendType}"/>
					</div>		
					<br>	
					
					<div>
						<label>
							 �ջ���
						</label>
						<input class="short" type="text" name="ssName" id="ssName" value="${sessionScope.commonUser.realName }"
							onBlur="checkInputValue(this.value,spanSSName, '�ջ���', '�ջ����������������ģ�����Ϊ2~10', /^([һ-��]{2,10})$/, '<%=path%>')"
							onFocus="clearInputValue(spanSSName)" />
						<span id="spanSSName" style="text-align: center"></span>
					</div>		
					<br>	
					
					<div>
						<label>
							 �ջ���ַ
						</label>
						<input class="short" type="text" name="ssAddress" id="ssAddress" value="${sessionScope.commonUser.address }"
							onBlur="checkInputValue(this.value,spanSSAddress, '��ַ', '��ַ����Ϊ3~15', /(.+?){3,100}$/, '<%=path%>')"
							onFocus="clearInputValue(spanSSAddress)" />
						<span id="spanSSAddress" style="text-align: center"></span>
					</div>		
					<br>	
					
					<div>
						<label for="Name">
							  �ջ����ʱ�
						</label>
						<input class="short" type="text" name="ssCode" id="ssCode" value="${sessionScope.commonUser.post }"
							maxlength="6"
							onBlur="checkInputValue(this.value, spanSSCode, '�ʱ�', '�ʱ��ʽ����ȷ��', /[1-9]\d{5}(?!\d)/, '<%=path%>')"
							onFocus="spanSSCode.innerHTML =''; " />
						<span id="spanSSCode"></span>
						<br />
					</div>	

					<div>
						<label for="Name">
							 �ջ��˵绰
						</label>
						<input class="short" type="text" name="ssPhone" id="ssPhone" value="${sessionScope.commonUser.tel }"
							onBlur="checkInputValue(this.value, spanSSPhone, '�绰����', '�绰�����ʽ����ȷ��',  /(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$/, '<%=path%>')" 
							onFocus="spanSSPhone.innerHTML ='' " />
						<span id="spanSSPhone"></span>
						<br />
					</div>
					
					<div>
						<label for="Name">
							 �ջ��˵�������
						</label>
						<input class="short" type="text" name="ssEmail" id="ssEmail"  value="${sessionScope.commonUser.email }"
							onBlur="checkInputValue(this.value, spanSSEmail, '��������', '���������ʽ����ȷ����ȷ��ʽ������abc@def.com', /^[-_A-Za-z0-9]+@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/, '<%=path%>')"
							onFocus="clearInputValue(spanSSEmail)" />
						<span id="spanSSEmail"></span>
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
