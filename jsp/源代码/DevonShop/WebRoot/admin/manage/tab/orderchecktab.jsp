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
<script src="<%=path %>/js/calendar.js"></script>
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

function goToFirst(){
		window.location.href = "<%=path%>/admin/manage/tab/QueryOrderServlet?page=adminCheck&dgDateFrom=${requestScope.dgDateFrom}&dgDateTo=${requestScope.dgDateTo}&sstatus=${requestScope.sstatus}&scUser=${requestScope.scUser}&smcName=${requestScope.smcName}&pageNum=1";

}

function goToBack(){
	var backPageNum = ${requestScope.pageNum} - 1;

		window.location.href = "<%=path%>/admin/manage/tab/QueryOrderServlet?page=adminCheck&dgDateFrom=${requestScope.dgDateFrom}&dgDateTo=${requestScope.dgDateTo}&sstatus=${requestScope.sstatus}&scUser=${requestScope.scUser}&smcName=${requestScope.smcName}&pageNum=" + backPageNum;
}

function goToNext(){
	var nextPageNum = ${requestScope.pageNum} + 1;

		window.location.href = "<%=path%>/admin/manage/tab/QueryOrderServlet?page=adminCheck&dgDateFrom=${requestScope.dgDateFrom}&dgDateTo=${requestScope.dgDateTo}&sstatus=${requestScope.sstatus}&scUser=${requestScope.scUser}&smcName=${requestScope.smcName}&pageNum=" + nextPageNum;
}

function goToLast(){
		window.location.href = "<%=path%>/admin/manage/tab/QueryOrderServlet?page=adminCheck&dgDateFrom=${requestScope.dgDateFrom}&dgDateTo=${requestScope.dgDateTo}&sstatus=${requestScope.sstatus}&scUser=${requestScope.scUser}&smcName=${requestScope.smcName}&pageNum=${requestScope.pageTotal}";
}

function goToAppoint(){
	var isOK = /^[1-9][0-9]*$/.test(appointPage.value);
	if(isOK == true){
		window.location.href = "<%=path%>/admin/manage/tab/QueryOrderServlet?page=adminCheck&dgDateFrom=${requestScope.dgDateFrom}&dgDateTo=${requestScope.dgDateTo}&sstatus=${requestScope.sstatus}&scUser=${requestScope.scUser}&smcName=${requestScope.smcName}&pageNum=" + appointPage.value;
	}else{
		alert("��������λ��Ϊ0���������ٲ�ѯ��");
	}

}

function queryFun(vdgDateF, vdgDateT){
	// ������Ϊ��ʱ�����ж�
	if((vdgDateF != null || vdgDateF != "") && (vdgDateT != null || vdgDateT != "")){
		dgDateFArr = vdgDateF.split("-");
		dgDateTArr = vdgDateT.split("-");
		var dateF = new Date(dgDateFArr[0],dgDateFArr[1],dgDateFArr[2]);
		var dateT = new Date(dgDateTArr[0],dgDateTArr[1],dgDateTArr[2]);
		if(dateF > dateT){
			alert('��ʼ���ڲ��ɴ��ڽ������ڣ�');
			return false;
		}
	}
	return true;
}

function checkIt(primaryKey){
	window.location.href = "<%=path%>/admin/manage/ordercheck.jsp?nid=" + primaryKey;
}

function cannotCheckIt(){
	alert("��Ч��������Ϊ�ñʶ�������ˣ�");
}


</script>
<style type="text/css">
	input {width:80px};
</style>
</head>

<body>

<form action="<%=path%>/admin/manage/tab/QueryOrderServlet" onsubmit="return queryFun(dgDateFrom.value, dgDateTo.value)">
	<input type="hidden" name="page" value="adminCheck"/>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="18" width="140px" style="background:url(images/topbg.gif);  font-size:12px; color:#2b7dbb;">
				�µ���&nbsp;<input class="short" name="scUser" value="${!empty requestScope.scUser?requestScope.scUser:'' }"/>
			</td>
	        <td height="18" width="270px" style="background:url(images/topbg.gif);  font-size:12px; color:#2b7dbb;">
	         		�µ�����&nbsp;<input class="short" type="text" name="dgDateFrom" id="dgDateFrom" onFocus="show_cele_date(this,'','',this, '<%=path%>')" readonly="readonly" value="${!empty requestScope.dgDateFrom?requestScope.dgDateFrom:'' }"/>
					&nbsp;��&nbsp;<input class="short" type="text" name="dgDateTo" id="dgDateTo" onFocus="show_cele_date(this,'','',this, '<%=path%>')" readonly="readonly" value="${!empty requestScope.dgDateTo?requestScope.dgDateTo:'' }"/>
			</td>
		    <td height="18" width="150px" style="background:url(images/topbg.gif);  font-size:12px; color:#2b7dbb;">
					��Ʒ����&nbsp;<input id="smcName" name="smcName" value="${!empty requestScope.smcName?requestScope.smcName:'' }"/>
		    </td>
		    <td height="18" style="background:url(images/topbg.gif);  font-size:12px; color:#2b7dbb;">
		         	���״̬&nbsp;
		         	<select id="sstatus" name="sstatus">
		         		<option value="" selected="selected">��ѡ��</option>
		         		<option value="0" ${requestScope.sstatus eq "0" ? "selected='selected'":"" }>δ���</option>
		         		<option value="1" ${requestScope.sstatus eq "1" ? "selected='selected'":"" }>�����ͨ��</option>
		         		<option value="2" ${requestScope.sstatus eq "2" ? "selected='selected'":"" }>���δͨ��</option>
		         	</select>
		         	
		    </td>
		    <td width="30px">
		    	<input type="submit" id="query" value="��ѯ" />
		    </td>
	  	</tr>	
	</table>
</form>	 

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
            <td width="18%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">������</span></div></td>
            <td width="14%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">�û���</span></div></td>
            <td width="10%" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">������ʽ</span></div></td>
            <td width="20%" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">�µ�ʱ��</span></div></td>
            <td width="12%" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">��ʽ</span></div></td>
            <td width="12%" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">������</span></div></td>
            <td width="12%" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">����</span></div></td>
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
          <c:if test="${!empty requestScope.orderList}">
				<c:forEach items="${requestScope.orderList}" var="temp">
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE1"><div align="center">${ temp.nid}</div></div></td>
			            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${temp.scUser }</span></div></td>
			            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${temp.ssendType }</span></div></td>
			            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${temp.dgDate }</span></div></td>
			            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${temp.spayType }</span></div></td>
			            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE4">
			            	<c:if test="${temp.sstatus eq '0'}">δ���</c:if>
			            	<c:if test="${temp.sstatus eq '1'}">�����ͨ��</c:if>
			            	<c:if test="${temp.sstatus eq '2'}">���δͨ��</c:if>
			            </span></div></td>
						<td height="20" bgcolor="#FFFFFF">
				            <c:if test="${temp.sstatus eq '0'}">
								<div align="center"><span class="STYLE1" onclick="checkIt('${temp.nid}')" style="cursor: hand">���</span></div>
							</c:if>
				            <c:if test="${temp.sstatus eq '1'}">
								<div align="center"><span class="STYLE1" style="color: gray;">�����</span></div>
							</c:if>
				            <c:if test="${temp.sstatus eq '2'}">
								<div align="center"><span class="STYLE1" style="color: gray;">�����</span></div>
							</c:if>
						</td>
			            </tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty requestScope.orderList}">
				<tr>
					<td width="12%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">���޼�¼��</span></div></td>
				</tr>
			</c:if>
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
