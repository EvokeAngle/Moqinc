<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>�ޱ����ĵ�</title>
<style type="text/css"> 
	td {font-size:12px};
	input {width:120px};
</style>

<script src="<%=path %>/js/checkRegInfo.js"></script>
<script> 

	function insertMcType(path){
		var flag = true;
		if(!checkInputValue(document.getElementById("cTypeName").value, spanCTypeName, "�����", "��������ȱ���Ϊ3~15", /(.+?){3,15}/, path)){
			flag = false;
		}
		
		if(flag){
			var pType = document.getElementById("pType").value;
			var cTypeName = document.getElementById("cTypeName").value;
			window.location.href = path + "/servlet/InsertMcTypeServlet?pType=" + pType + "&cTypeName=" + cTypeName;
		}
	}
</script>
<style type="text/css">
	label {font-size:14px};
</style>
</head>
 
<body topmargin="20px">

	<div style="margin-left: 20px">
		<div>
			<label for="password">
				 �� �� ��
			</label>
			<input class="short" type="text" name="cTypeName" style="width:100px"
				id="typeName"
				onBlur="checkInputValue(this.value, spanCTypeName, '�����', '��������ȱ���Ϊ3~15', /(.+?){3,15}/, '<%=path%>')"
				onFocus="clearInputValue(spanCTypeName)" />
			<span id="spanCTypeName"></span>
			<br />
			<br />
		</div>

		<div>
			<label for="confirm_password">
				�������
			</label>
			<select name="pType" style="width:100px">
				<option value="0" >�޸����</option>
				<c:forEach items="${requestScope.typeList}" var="temp" varStatus="vs">
					<option value="${pageScope.temp[0].nid }">${pageScope.temp[0].sname }</option>
				</c:forEach>
			</select>
		</div>
		
		<div>
			<br />
			<button style="width: 60px" onclick="insertMcType('<%=path%>')">�ύ</button>
			<input style="width: 60px" type ="reset" value="����" />
		</div>
	</div>

<!--   	<tr>
        	<td>&nbsp;&nbsp;&nbsp;<img id="picGoodsMg" value="<%=path%>/admin/manage/images/sub.jpg" src="<%=path%>/admin/manage/images/sub.jpg" onclick="changeGoodsMg(this)"/>&nbsp;&nbsp;&nbsp;��Ʒ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        
       	<tr>
        	<td id="goodsKindMg">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="x.html">��Ʒ������</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        
        <tr>
        	<td id="goodsInfoMg">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="x.html">��Ʒ��Ϣ����</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        
       	<tr>
        	<td>&nbsp;&nbsp;&nbsp;<img id="picUserMg" value="<%=path%>/admin/manage/images/sub.jpg" src="<%=path%>/admin/manage/images/sub.jpg" onclick="changeUserMg(this)"/>&nbsp;&nbsp;&nbsp;�û�����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        
       	<tr>
        	<td id="regUserMg">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="x.html">ע���û�����</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        
        <tr>
        	<td id="adminUserMg">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="x.html">����Ա�û�����</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        
        <tr>
        	<td>&nbsp;&nbsp;&nbsp;<img id="picOrderMg" value="<%=path%>/admin/manage/images/sub.jpg" src="<%=path%>/admin/manage/images/sub.jpg" onclick="changeOrderMg(this)"/>&nbsp;&nbsp;&nbsp;��������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        
       	<tr>
        	<td id="seeOrderForm">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="x.html">�鿴����</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        
        <tr>
        	<td id="orderCheck">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="x.html">�������</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
 
        <tr>
        	<td id="changeCheck">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="x.html">�޸����</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
                
        <tr>
        	<td>&nbsp;&nbsp;&nbsp;<img id="picUserInfo" value="<%=path%>/admin/manage/images/sub.jpg" src="<%=path%>/admin/manage/images/sub.jpg" onclick="changeUserInfo(this)"/>&nbsp;&nbsp;&nbsp;��������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        
       	<tr>
        	<td id="seeBasicInfo">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="x.html">�鿴��������</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        
        <tr>
        	<td id="changeBasicInfo">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="x.html">�޸Ļ�������</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        <tr>
        	<td id="changePsw">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="x.html">�޸�����</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        
        <tr>
        	<td>
        		<a href="x.html">��ȫ�˳�</a>
            </td>
        </tr>  --> 
 
</body>
</html>


