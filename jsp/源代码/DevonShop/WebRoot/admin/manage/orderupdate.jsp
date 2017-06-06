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
		<title>用户注册</title>
		<link href="main.css" rel="stylesheet" type="text/css" />
				<script src="<%=path %>/js/checkRegInfo.js">
		</script>
		<script>
			function checkAll(path){
				var flag = true;
				if(!checkInputValue(document.getElementById("ssName").value,spanSSName, '收货人', '收货人姓名必须是中文，长度为2~10', /^([一-龥]{2,10})$/, path)){
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
						下单信息
					</legend>
					<br>
						<span style="color: red" >
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* 以下信息全部为必填项
						</span>
						<br>
						<br>
					<div>
						<label>
							 订单号
						</label>
						<label>
							 ${requestScope.order.nid}
						</label>
						<input type="hidden" name="nid" value="${requestScope.order.nid}"/>
					</div>		
					<br>	
					
					<div>
						<label>
							所购商品种类数
						</label>
						<label>
							 ${requestScope.order.nmcTypeSize}
						</label>
					</div>		
					<br>	
					
					<div>
						<label>
							 所购商品总件数
						</label>
						<label>
							 ${requestScope.order.nmcSize}
						</label>
					</div>		
					<br>	
					
					<div>
						<label>
							 价格总计
						</label>
						<label>
							 <fmt:formatNumber type="currency" groupingUsed="false" value="${requestScope.order.ntotalPrice}"></fmt:formatNumber>
						</label>
					</div>		
					<br>	
					
					<div>
						<label>
							 下单日期
						</label>
						<label>
							 ${requestScope.order.dgDate}
						</label>
					</div>		
					<br>	
					
					<div>
						<label>
							 付款方式
						</label>
						<select name="spayType">
							<option value="在线支付" ${requestScope.order.spayType eq "在线支付"?"selected='true'":""}>在线支付</option>
							<option value="货到付款" ${requestScope.order.spayType eq "货到付款"?"selected='true'":""}>货到付款</option>
							<option value="邮局汇款" ${requestScope.order.spayType eq "邮局汇款"?"selected='true'":""}>邮局汇款</option>
						</select>
					</div>		
					<br>	
					
					<div>
						<label>
							 收货方式
						</label>
						<select name="ssendType">
							<option value="快递" ${requestScope.order.ssendType eq "快递"?"selected='true'":""}>快递</option>
							<option value="平邮" ${requestScope.order.ssendType eq "平邮"?"selected='true'":""}>平邮</option>
							<option value="EMS" ${requestScope.order.ssendType eq "EMS"?"selected='true'":""}>EMS</option>
						</select>
					</div>		
					<br>	
					
					<div>
						<label>
							 收货人
						</label>
						<input class="short" type="text" name="ssName" id="ssName" value="${requestScope.order.ssName}"
							onBlur="checkInputValue(this.value,spanSSName, '收货人', '收货人姓名必须是中文，长度为2~10', /^([一-龥]{2,10})$/, '<%=path%>')"
							onFocus="clearInputValue(spanSSName)" />
						<span id="spanSSName" style="text-align: center"></span>
					</div>		
					<br>	
					
					<div>
						<label>
							 收货地址
						</label>
						<label>${requestScope.order.ssAddress}</label>
					</div>		
					<br>	
					
					<div>
						<label for="Name">
							  收货人邮编
						</label>
						<label>${requestScope.order.ssCode}</label>
						<br />
					</div>	

					<div>
						<label for="Name">
							 收货人电话
						</label>
						<label>${requestScope.order.ssPhone}</label>
						<br />
					</div>
					
					<div>
						<label for="Name">
							 收货人电子邮箱
						</label>
						<label>${requestScope.order.ssEmail}</label>
						<br />
					</div>		
							
						
					<div class="enter">
						<input class="buttom" type="submit" name="submit" value="确认"/>
						<input class="buttom" type="reset" name="reset" value="重置" />
					</div>
				</fieldset>
			</form>
			<br />
		</div>
	</body>
</html>
