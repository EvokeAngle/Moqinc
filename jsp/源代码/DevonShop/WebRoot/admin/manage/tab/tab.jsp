<%@ page language="java" import="com.devon.dao.dto.User" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${!param.queryType eq ''}">
	<c:set var="queryType" value="${param.queryType}" scope="session"/>
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>�ޱ����ĵ�</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 12px}
.STYLE3 {font-size: 12px; font-weight: bold; }
.STYLE4 {
	color: #03515d;
	font-size: 12px;
	cursor: hand;
}
-->
</style>

<script>
var  highlightcolor='#c1ebff';
//�˴�clickcolorֻ����winϵͳ��ɫ������ܳɹ�,�����#xxxxxx�Ĵ���Ͳ���,��û�����Ϊʲô:(
var  clickcolor='#51b2f6';
function  changeto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}

function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return
if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}

function  clickto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}

<c:if test="${sessionScope.queryType == 'commonUser' or sessionScope.queryType == 'adminUser'}">

	function edtUser(primaryKey, userType){
		window.location.href = "<%=path%>/servlet/UpdateUserHelperServlet?userName=" + primaryKey + "&userType=" + userType;
	}
	
</c:if>

<c:if test="${sessionScope.queryType == 'goods'}">

	function edtGoods(primaryKey){
		window.location.href = "<%=path%>/admin/manage/tab/GetMcTypeServlet?nid=" + primaryKey + "&task=update&page=insupdgoods";
		//window.location.href = "<%=path%>/admin/manage/insupdgoods?userName=" + primaryKey + "&sname=" + sname + "&nmaxId=" + nmaxId + "&nminId=" + nminId + "&nprice=" + nprice + "&dcDate=" + dcDate + "&smcTag=" + smcTag + "&sdescription=" + sdescription + "&task=update";
	}
	
</c:if>

function del(primaryKey, userType, type){
	if(type == "0"){
		alert("���˺�Ϊ��������Ա,�޷�����ɾ��������");
		return;
	}
	<c:if test="${sessionScope.queryType == 'commonUser' or sessionScope.queryType == 'adminUser'}">
		var r=confirm("ȷ��Ҫɾ������Ա��" + primaryKey + "��");
		
		if (r==true){
		  	window.location.href = "<%=path%>/servlet/DeleteUserServlet?userName=" + primaryKey + "&userType=" + userType;
		}else {
		  	
		}
	</c:if>

	<c:if test="${sessionScope.queryType == 'goods'}">
		var r=confirm("ȷ��Ҫɾ����Ʒ��" + userType + "��");
		
		if (r==true){
		  	window.location.href = "<%=path%>/servlet/DeleteGoodsServlet?nid=" + primaryKey;
		}else {
		  	
		}
	</c:if>
}

function freezeUser(primaryKey, changeTo){
	window.location.href = "<%=path%>/servlet/RegUserServlet?userName=" + primaryKey + "&isFreeze=" + changeTo + "&pageNum=${requestScope.pageNum}";
}

function unfreezeUser(primaryKey, changeTo){
	window.location.href = "<%=path%>/servlet/RegUserServlet?userName=" + primaryKey + "&isFreeze=" + changeTo + "&pageNum=${requestScope.pageNum}";
}

function goToFirst(){
	<c:if test="${sessionScope.queryType == 'goods'}">
		window.location.href = "<%=path%>/admin/manage/tab/QueryGoodsServlet?page=tab&nmaxId=${requestScope.nmaxId}&nminId=${requestScope.nminId}&keywords=${requestScope.keywords}&pageNum=1";
	</c:if>
	
	<c:if test="${sessionScope.queryType == 'adminUser'}">
		window.location.href = "<%=path%>/admin/manage/tab/QueryUserServlet?userName=${requestScope.userName}&sex=${requestScope.sex}&queryType=adminUser&pageNum=1";
	</c:if>

	<c:if test="${sessionScope.queryType == 'commonUser'}">
		window.location.href = "<%=path%>/admin/manage/tab/QueryUserServlet?userName=${requestScope.userName}&sex=${requestScope.sex}&isFreeze=${requestScope.isFreeze}&queryType=commonUser&pageNum=1";
	</c:if>
}

function goToBack(){
	var backPageNum = ${requestScope.pageNum} - 1;
	
	<c:if test="${sessionScope.queryType == 'goods'}">
		window.location.href = "<%=path%>/admin/manage/tab/QueryGoodsServlet?page=tab&nmaxId=${requestScope.nmaxId}&nminId=${requestScope.nminId}&keywords=${requestScope.keywords}&pageNum=" + backPageNum;
	</c:if>
	
	<c:if test="${sessionScope.queryType == 'adminUser'}">
		window.location.href = "<%=path%>/admin/manage/tab/QueryUserServlet?userName=${requestScope.userName}&sex=${requestScope.sex}&queryType=adminUser&pageNum=" + backPageNum;
	</c:if>
	
	<c:if test="${sessionScope.queryType == 'commonUser'}">
		window.location.href = "<%=path%>/admin/manage/tab/QueryUserServlet?userName=${requestScope.userName}&sex=${requestScope.sex}&isFreeze=${requestScope.isFreeze}&queryType=commonUser&pageNum=" + backPageNum;
	</c:if>
}

function goToNext(){
	var nextPageNum = ${requestScope.pageNum} + 1;

	<c:if test="${sessionScope.queryType == 'goods'}">
		window.location.href = "<%=path%>/admin/manage/tab/QueryGoodsServlet?page=tab&nmaxId=${requestScope.nmaxId}&nminId=${requestScope.nminId}&keywords=${requestScope.keywords}&pageNum=" + nextPageNum;
	</c:if>
	
	<c:if test="${sessionScope.queryType == 'adminUser'}">
		window.location.href = "<%=path%>/admin/manage/tab/QueryUserServlet?userName=${requestScope.userName}&sex=${requestScope.sex}&queryType=adminUser&pageNum=" + nextPageNum;
	</c:if>
	
	<c:if test="${sessionScope.queryType == 'commonUser'}">
		window.location.href = "<%=path%>/admin/manage/tab/QueryUserServlet?userName=${requestScope.userName}&sex=${requestScope.sex}&isFreeze=${requestScope.isFreeze}&queryType=commonUser&pageNum=" + nextPageNum;
	</c:if>
}

function goToLast(){
	<c:if test="${sessionScope.queryType == 'goods'}">
		window.location.href = "<%=path%>/admin/manage/tab/QueryGoodsServlet?page=tab&nmaxId=${requestScope.nmaxId}&nminId=${requestScope.nminId}&keywords=${requestScope.keywords}&pageNum=${requestScope.pageTotal}";
	</c:if>
	
	<c:if test="${sessionScope.queryType == 'adminUser'}">
		window.location.href = "<%=path%>/admin/manage/tab/QueryUserServlet?userName=${requestScope.userName}&sex=${requestScope.sex}&queryType=adminUser&pageNum=${requestScope.pageTotal}";
	</c:if>
	
	<c:if test="${sessionScope.queryType == 'commonUser'}">
		window.location.href = "<%=path%>/admin/manage/tab/QueryUserServlet?userName=${requestScope.userName}&sex=${requestScope.sex}&isFreeze=${requestScope.isFreeze}&queryType=commonUser&pageNum=${requestScope.pageTotal}";
	</c:if>
}

function goToAppoint(){
	<c:if test="${sessionScope.queryType == 'goods'}">
		var isOK = /^[1-9][0-9]*$/.test(appointPage.value);
		if(isOK == true){
			window.location.href = "<%=path%>/admin/manage/tab/QueryGoodsServlet?page=tab&nmaxId=${requestScope.nmaxId}&nminId=${requestScope.nminId}&keywords=${requestScope.keywords}&pageNum=" + appointPage.value;
		}else{
			alert("��������λ��Ϊ0���������ٲ�ѯ��");
		}
	</c:if>
	
	<c:if test="${sessionScope.queryType == 'adminUser'}">
		var isOK = /^[1-9][0-9]*$/.test(appointPage.value);
		if(isOK == true){
			window.location.href = "<%=path%>/admin/manage/tab/QueryUserServlet?userName=${requestScope.userName}&sex=${requestScope.sex}&queryType=adminUser&pageNum=" + appointPage.value;
		}else{
			alert("��������λ��Ϊ0���������ٲ�ѯ��");
		}
	</c:if>
	
	<c:if test="${sessionScope.queryType == 'commonUser'}">
		var isOK = /^[1-9][0-9]*$/.test(appointPage.value);
		if(isOK == true){
			window.location.href = "<%=path%>/admin/manage/tab/QueryUserServlet?userName=${requestScope.userName}&sex=${requestScope.sex}&isFreeze=${requestScope.isFreeze}&queryType=commonUser&pageNum=" + appointPage.value;
		}else{
			alert("��������λ��Ϊ0���������ٲ�ѯ��");
		}
	</c:if>
	


}

</script>

</head>

<body>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <!--<td width="5%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">��ǰλ��</span>���û���Ϣ��ѯ</td>  -->
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60">&nbsp;</td>
                <td width="60">&nbsp;</td>
                <td width="60">&nbsp;</td>
                <td width="52">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
          	<c:choose>
          	  <c:when test="${sessionScope.queryType eq 'commonUser' or sessionScope.queryType eq 'adminUser'}">
	            <td width="18%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">�û���</span></div></td>
	            <td width="16%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">��ʵ����</span></div></td>
	            <td width="6%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">�Ա�</span></div></td>
	            <td width="30%" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">��ַ</span></div></td>
	            <td width="12%" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">ע��ʱ��</span></div></td>
            	<c:if test="${sessionScope.queryType eq 'commonUser'}">
            		<td width="10%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">�Ƿ񶳽�</span></div></td>
            	</c:if>
            	<td width="15%" height="22" background="images/bg.gif" bgcolor="#FFFFFF" class="STYLE1"><div align="center">����</div></td>
         	 </c:when>
         	 <c:when test="${sessionScope.queryType eq 'goods'}">
	            <td width="10%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">��ƷͼƬ</span></div></td>
	            <td width="24%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">����</span></div></td>
	            <td width="10%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">����</span></div></td>
	            <td width="12%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">��������</span></div></td>
	            <td width="12%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">����С��</span></div></td>
	            <td width="24%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">����</span></div></td>
         	 </c:when>
          	</c:choose>

          </tr>
<!--      <tr>
            <td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE1"><div align="center">abcfgtfgbgfrtyh</div></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">133453916585</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center">��</div></td>
            <td bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">tiezhu0902@163.com</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">350012</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE4"><img src="images/edt.gif" width="16" height="16" />�༭&nbsp; &nbsp;<img src="images/del.gif" width="16" height="16" />ɾ��</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">2010-11-11</span></div></td>
          </tr>-->
          
			<c:choose>
				<c:when test="${!empty requestScope.users}">
					<c:if test="${sessionScope.queryType eq 'commonUser'}">
							<c:forEach items="${requestScope.users}" var="temp">
								<tr>
								<td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE1"><div align="center">${ temp.userName}</div></div></td>
					            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${temp.realName }</span></div></td>
					            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${temp.sex }</span></div></td>
					            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${temp.address }</span></div></td>
					            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${temp.regTime }</span></div></td>
					            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${temp.isFreeze }</span></div></td>
								<c:if test="${temp.isFreeze eq '����'}">
					            	 <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE4" onclick="freezeUser('${ temp.userName}', '����')">&nbsp; &nbsp;<img src="images/del.gif" width="16" height="16" />����</span></div></td>
					            </c:if>
					            <c:if test="${temp.isFreeze eq '����'}">
					            	 <td height="20" bgcolor="#FFFFFF" ><div align="center"><span class="STYLE4" onclick="unfreezeUser('${ temp.userName}', '����')">&nbsp; &nbsp;<img src="images/del.gif" width="16" height="16" />�ⶳ</span></div></td>
					            </c:if>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty requestScope.users}">
							<tr>
								<td rowspan="7" height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE4">���޼�¼��</span></div></td>
							</tr>
						</c:if>
					<c:if test="${sessionScope.queryType eq 'adminUser'}">
							<c:forEach items="${requestScope.users}" var="temp">
								<tr>
								<td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE1"><div align="center">${ temp.userName}</div></div></td>
					            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${temp.realName }</span></div></td>
					            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${temp.sex }</span></div></td>
					            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${temp.address }</span></div></td>
					            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${temp.regTime }</span></div></td>
					            <td height="20" bgcolor="#FFFFFF" ><div align="center"><span class="STYLE4" align="center"><img src="images/edt.gif" width="16" height="16" /><span onclick="edtUser('${temp.userName}', 'adminUser')">�޸�</span>&nbsp; &nbsp;<img src="images/del.gif" width="16" height="16" /><span onclick="del('${temp.userName}', 'adminUser', ${temp.type })">ɾ��</span></span></div></td>
								</tr>
							</c:forEach>
						</c:if>
				</c:when>
				<c:when test="${!empty requestScope.mcList}">
						<c:forEach items="${requestScope.mcList}" var="temp">
							<tr>
				            	<td width="12%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><img width="100px" height="100px" src="<%=path %>/${empty temp.simg?'image/default.jpg':temp.simg }"/></span></div></td>
					            <td width="18%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${temp.sname }</span></div></td>
					            <td width="10%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${temp.nprice }</span></div></td>
					            <td width="18%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${temp.nmaxId }</span></div></td>
					            <td width="18%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${temp.nminId }</span></div></td>
					            <td height="24" background="images/bg.gif" bgcolor="#FFFFFF" ><div align="center"><span class="STYLE4" align="center"><img src="images/edt.gif" width="16" height="16" /><span onclick="edtGoods('${temp.nid}')">�޸�</span>&nbsp; &nbsp;<img src="images/del.gif" width="16" height="16" /><span onclick="del('${temp.nid}', '${temp.sname}')">ɾ��</span></span></div></td>
							</tr>
						</c:forEach>
	            </c:when>
	            <c:otherwise>
						<tr>
			            	<td width="12%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">���޼�¼��</span></div></td>
						</tr>
	            </c:otherwise>
			</c:choose>


        </table></td>
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="images/tab_18.gif" width="12" height="35" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="STYLE4">&nbsp;&nbsp;���� ${requestScope.recordTotal} ����¼����ǰ�� ${requestScope.pageNum }/${requestScope.pageTotal } ҳ</td>
            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="40"><img src="images/first.gif" width="37" height="15" ${requestScope.pageNum > 1?"onclick='goToFirst()'":""}/></td>
                  <td width="45"><img src="images/back.gif" width="43" height="15" ${requestScope.pageNum > 1?"onclick='goToBack()'":""}/></td>
                  <td width="45"><img src="images/next.gif" width="43" height="15" ${requestScope.pageNum != requestScope.pageTotal?"onclick='goToNext()'":""}/></td>
                  <td width="40"><img src="images/last.gif" width="37" height="15" ${requestScope.pageNum >= 1 && requestScope.pageNum != requestScope.pageTotal?"onclick='goToLast()'":""}/></td>
                  <td width="100"><div align="center"><span class="STYLE1">ת����
                    <input name="appointPage" id="appointPage" type="text" size="4" style="height:12px; width:30px; border:1px solid #999999;" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/> 
                    ҳ </span></div></td>
                  <td width="40"><img src="images/go.gif" width="37" height="15" onclick="goToAppoint()"/></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
