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
			function isNull(inputValue, span, msgWhenNull, path){
				if(inputValue == null || inputValue == ""){
					span.innerHTML = "<img src='" + path + "/image/agree_no.gif' />&nbsp;请填写" + msgWhenNull + "！";
					return false;
				}else{
					return true;	
				}
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
			<form method="post" name="apForm" id="apForm" action="<%=path %>/servlet/OrderCheckServlet" onSubmit="return isNull(smsg.value, spanSmsg, '审核反馈信息', '<%=path %>')" >
					<input type="hidden" name="saUser" value="${sessionScope.adminUser.userName }"/>
					<input type="hidden" name="nid" value="${param.nid }"/>
					<br>
					<fieldset>
						<legend>
							订单审核
						</legend>
					<div>
						<label for="confirm_password">
							 请选择审核结果
						</label>
						<input class="short" style="width: 30px" type="radio" name="sstatus"
							value="1" checked="checked" />
						审核通过
						<input class="short" style="width: 30px" type="radio" name="sstatus"
							value="2"/>
						审核未通过
						<br />
						<br />
						<br />
						<br />
					</div>
					<div>
						<label for="Name">
							审核反馈信息
						</label>
						<textarea name="smsg" id="smsg" rows="5" cols="50"
							onBlur="isNull(this.value, spanSmsg, '审核反馈信息', '<%=path%>')"
							onFocus="spanSmsg.innerHTML ='' " /></textarea>
						<br />
						<span id="spanSmsg"></span>
						<br />
						<br />
						<br />
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
