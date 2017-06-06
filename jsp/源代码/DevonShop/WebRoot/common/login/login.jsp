<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String str = (String)request.getAttribute("obj");
	
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<style type="text/css">
.code {
	background-image: url(code.jpg);
	font-family: Arial;
	font-style: italic;
	color: Red;
	border: 0;
	padding: 2px 3px;
	letter-spacing: 3px;
	font-weight: bolder;
}

.unchanged {
	border: 0;
}
</style>
	<script language="javascript" type="text/javascript">
var code ; //在全局 定义验证码
function createCode(){ 
	code = "";
	var codeLength = 4;//验证码的长度
	var checkCode = document.getElementById("checkCode");
	checkCode.value = "";
	
	var selectChar = new Array(2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z');
	
	for(var i=0;i<codeLength;i++) {
	   var charIndex = Math.floor(Math.random()*32);
	   code +=selectChar[charIndex];
	}
	if(code.length != codeLength){
	   createCode();
	}
	checkCode.value = code;
}


</script>
<script type="text/javascript">

	var obj = "<%=str%>";
	function isFirst(obj){
		if(obj != "obj"){
			return;
		}
		alert("用户名或密码输入错误!");
	}
</script>
<script src="<%=path%>/js/chklogininfo.js" type="text/javascript"></script>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<title>前台用户登录</title>
		<style type="text/css">
<!--
a {
	color: #008EE3
}

a:link {
	text-decoration: none;
	color: #008EE3
}

A:visited {
	text-decoration: none;
	color: #666666
}

A:active {
	text-decoration: underline
}

A:hover {
	text-decoration: underline;
	color: #0066CC
}

A.b:link {
	text-decoration: none;
	font-size: 12px;
	font-family: "Helvetica,微软雅黑,宋体";
	color: #FFFFFF;
}

A.b:visited {
	text-decoration: none;
	font-size: 12px;
	font-family: "Helvetica,微软雅黑,宋体";
	color: #FFFFFF;
}

A.b:active {
	text-decoration: underline;
	color: #FF0000;
}

A.b:hover {
	text-decoration: underline;
	color: #ffffff
}

.table1 {
	border: 1px solid #CCCCCC;
}

.font {
	font-size: 12px;
	text-decoration: none;
	color: #999999;
	line-height: 20px;
}

.input {
	font-size: 12px;
	color: #999999;
	text-decoration: none;
	border: 0px none #999999;
}

td {
	font-size: 12px;
	color: #007AB5;
}

form {
	margin: 1px;
	padding: 1px;
}

input {
	border: 0px;
	height: 26px;
	color: #007AB5;
	.
	unnamed1
	{
	border
	:
	thin
	none
	#FFFFFF;
}

.unnamed1 {
	border: thin none #FFFFFF;
}

select {
	border: 1px solid #cccccc;
	height: 18px;
	color: #666666;
	.
	unnamed1
	{
	border
	:
	thin
	none
	#FFFFFF;
}

body {
	background-repeat: no-repeat;
	background-color: #9CDCF9;
	background-position: 0px 0px;
}

.tablelinenotop {
	border-top: 0px solid #CCCCCC;
	border-right: 1px solid #CCCCCC;
	border-bottom: 0px solid #CCCCCC;
	border-left: 1px solid #CCCCCC;
}

.tablelinenotopdown {
	border-top: 1px solid #eeeeee;
	border-right: 1px solid #eeeeee;
	border-bottom: 1px solid #eeeeee;
	border-left: 1px solid #eeeeee;
}

.style6 {
	FONT-SIZE: 9pt;
	color: #7b8ac3;
}
-->
</style>
	</head>
	
	<body onload="createCode()">
		<table width="681" border="0" align="center" cellpadding="0"
			cellspacing="0" style="margin-top: 120px">
			<tr>
				<td width="353" height="259" align="center" valign="bottom"
					background="Images/login_1.gif">
					<!--  					<table width="90%" border="0" cellspacing="3" cellpadding="0">
						<tr>
							<td align="right" valign="bottom" style="color: #05B8E4">
								Power by
								<a href="http://www.865171.cn" target="_blank">865171</a>
								Copyright 2009
							</td>
						</tr>
					</table>
-->
				</td>
				<td width="195" background="Images/login_2.gif">
					<table width="190" height="106" border="0" align="center"
						cellpadding="2" cellspacing="0">
						<form method="post" action="<%=path%>/servlet/CommonLoginServlet"
							onSubmit="return chkLoginInfo(divUserName, divPassword, divChkCode)"
							name="NETSJ_Login">
							<tr>
								<td height="55" colspan="2" align="left">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td width="40" style="height: 20px" align="left">
									用户名
								</td>
								<td>
									<input name="userName" type="TEXT" value="${cookie.userNameCommon.value }"
										style="background: url(Images/login_6.gif) repeat-x; border: solid 1px #27B3FE; height: 20px; width: 105px; background-color: #FFFFFF"
										id="UserName" size="14">
								</td>
							</tr>
							<tr>
								<td colspan="2" height="20">
									<div id="divUserName" style="color: red">
										
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="left">
									密&nbsp;&nbsp;码
								</td>
								<td>
									<input name="password" TYPE="PASSWORD"
										style="background: url(Images/login_6.gif) repeat-x; border: solid 1px #27B3FE; height: 20px; width: 105px; background-color: #FFFFFF"
										id="Password" size="16">
								</td>
							</tr>
							<tr>
								<td colspan="2" height="20">
									<div id="divPassword" style="color: red">
										
									</div>
								</td>
							</tr>
							<tr>
								<td height="20">
									验证码
								</td>
								<td>
									<input name="Code" type="text" id="chkCode" size="4"
										style="background: url(Images/login_6.gif) repeat-x; border: solid 1px #27B3FE; height: 20px; background-color: #FFFFFF"
										maxlength="4">
									<input type="text" id="checkCode" class="code"
										style="height: 20px; width: 55px" />
									<a href="#" onclick="createCode()">换一张</a>
								</td>
							</tr>
							<tr>
								<td colspan="2" height="20">
									<div id="divChkCode" style="color: red">
										
									</div>
								</td>
							</tr>
							<td colspan="2" align="center">
								<input type="submit" name="submit"
									style="background: url(Images/login_5.gif) no-repeat"
									value=" 登  陆 ">
								<input type="reset" name="Submit"
									style="background: url(Images/login_5.gif) no-repeat"
									value=" 取  消 ">
							</td>
							<tr>
								<td height="5" colspan="2"></td>
						</form>
					</table>
				</td>
				<td width="133" background="Images/login_3.gif">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td height="161" colspan="3" background="Images/login_4.gif"></td>
			</tr>
		</table>
	</body>
</html>
