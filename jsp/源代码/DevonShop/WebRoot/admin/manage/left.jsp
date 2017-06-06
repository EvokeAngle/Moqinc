<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'userManage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
	<!--
	body {
		margin-left: 0px;
		margin-top: 0px;
		margin-bottom: 0px;
		margin-right: 0px;
	}
	-->
	.tdStyle{height:1;font-size:9pt; color:#000000;filter:glow(color=#ffffff,strength=1)}
	.fontStyle{height:1;font-size:9pt; color:#bfdbeb;filter:glow(color=#1070a3,strength=1)}
	</style>
	<script  src="<%=path %>/js/ManageLeft.js">
	</script>
	<script>
  	var path = "<%=path%>";
  	function userManageClick(num,count)
	{
		var listComponent = new Array();
		for(var i = 0;i<count;i++){
			listComponent.push("manage"+(num+i));
		}
		shopManageClick(listComponent);
	}
	function overTdFun(comm){
		//comm.style.backgroundImage='url(<%=path %>/img/h_images/manage/main_52.gif)';
        //comm.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; 
	}
	function outTdFun(comm){
		//comm.style.backgroundImage='url()';
		//comm.style.borderStyle='none';
	}
	function changeTdHeight(selectIndex,Count){
		var comm;
		var Max = Count+1;
		var tab = document.getElementById("tab1");
		for(var i = 1;i<Max;i++){
			if(i==selectIndex){
				comm = document.getElementById("splitTr"+i);
				comm.style.height = tab.height;
				comm.style.display = "block";
				continue;
			}
			comm = document.getElementById("splitTr"+i);
			comm.style.display = "none";
			comm.style.height = 0;
		}
	}

	function showGoodsTypeMge(){
		window.parent.frames[1].location.href = "<%=path%>/admin/manage/tab/GetMcTypeServlet?page=goodstypemanage&queryType=goods";
	}

	function showGoodsInfoMge(){
		window.parent.frames[1].location.href = "<%=path%>/admin/manage/tab/GetMcTypeServlet?page=querycon&queryType=goods";
	}
	
	function showComUserMge(){
		window.parent.frames[1].location.href = "<%=path%>/admin/manage/tab/all.jsp?queryType=commonUser"
	}
	
	function showAdminUserMge(){
		window.parent.frames[1].location.href = "<%=path%>/admin/manage/tab/all.jsp?queryType=adminUser";
	}

	function showSelfInfo(){
		window.parent.frames[1].location.href = "<%=path%>/showselfinfo/showselfinfo.jsp";
	}
	
	function updateSelfInfo(){
		window.parent.frames[1].location.href = "<%=path%>/servlet/UpdateUserHelperServlet?userName=${sessionScope.adminUser.userName}&userType=${sessionScope.adminUser.type}";
	}
	
	function updateSelfPsw(){
		window.parent.frames[1].location.href = "<%=path%>/updpsw/updpsw.jsp";
	}

	function showOrder(){
		window.parent.frames[1].location.href = "<%=path%>/admin/manage/tab/all.jsp?queryType=order"
	}

	function showOrderCheck(){
		window.parent.frames[1].location.href = "<%=path%>/admin/manage/tab/all.jsp?queryType=orderCheck"
	}
	
	function showOrderupdate(){
		window.parent.frames[1].location.href = "<%=path%>/admin/manage/tab/all.jsp?queryType=orderUpdate"
	}
	
	function showMenu(){
		<c:if test="${sessionScope.queryType == 'goods' or empty sessionScope.queryType}">
			changeTdHeight(1,4);
		</c:if>
		
		<c:if test="${sessionScope.queryType == 'adminUser' or sessionScope.queryType == 'commonUser'}">
			changeTdHeight(2,4);
		</c:if>
	}
  </script>
  
  </head>
  
  <body bgcolor="#0a5c8e" onload="showMenu()">
<table id="tab1" height="100%" width="168" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="25">
			<table width="100%"
        		 cellpadding="0" cellspacing="0"
        		 border="0"
        		 background="<%=path %>/img/h_images/manage/main_29.gif"><tr>
				<td width="10%">&nbsp;</td>
				<td style="cursor:hand;" height="25" width="168" align="center"  valign="top" 
									onclick="changeTdHeight(1,4)">
				<font class="fontStyle">&nbsp;操作列表</font>
				</td>
			</tr></table>
		</td>
	</tr> 	
	<tr>
		<td style="cursor:hand;" height="25" width="168" colspan="2"
			background="<%=path %>/img/h_images/manage/main_43.gif" align="center"
			onclick="changeTdHeight(1,4)"  valign="top" >
			<font class="fontStyle">
		       			商品管理</font>
	  	</td>
	</tr>   
	<tr id= "splitTr1" style="display:none;">
        	<td valign="top"  bgcolor="#e5f4fd" colspan="2">
        	<table  width="100%"
        		    cellpadding="0" cellspacing="0"
        		 	border="0" >
				<tr id = "Row1" style="background-repeat: no-repeat;background-position: center" height="32">
			       	<td>&nbsp;</td>
			       	<td  valign="center">&nbsp;&nbsp;</td>
					<td style="cursor:hand;" align="left" onMouseOver="overTdFun(document.all.Row1)"  valign="center" 
						onmouseout="outTdFun(document.all.Row1)" onClick="showGoodsTypeMge()"><font class="tdStyle">商品类别管理</font></td>
				</tr>
				<tr id = "Row2" style="background-repeat: no-repeat;background-position: center" height="32">
					<td>&nbsp;</td>
					<td  valign="center"></td>
					<td style="cursor:hand;" align="left" onMouseOver="overTdFun(document.all.Row2)"   valign="center" 
						onmouseout="outTdFun(document.all.Row2)" 
						onClick="showGoodsInfoMge()"><font class="tdStyle">商品信息管理</font></td>
				</tr>
           </table>
           </td>
	</tr>
	<tr>
		<td style="cursor:hand;" height="25" width="168" colspan="2"
			background="<%=path %>/img/h_images/manage/main_43.gif" align="center"
			onclick="changeTdHeight(2,4)"  valign="top" >
			<font class="fontStyle">
		       			用户管理</font>
	  	</td>
	</tr> 
        <tr id= "splitTr2" >
        	<td valign="top"  bgcolor="#e5f4fd" colspan="2">
        	<table  width="100%"
        		    cellpadding="0" cellspacing="0"
        		 	border="0" >
				<tr id = "Row3" style="background-repeat: no-repeat;background-position: center" height="32">
			       	<td>&nbsp;</td>
			       	<td  valign="center">&nbsp;&nbsp;</td>
					<td style="cursor:hand;" align="left" onMouseOver="overTdFun(document.all.Row3)"  valign="center" 
						onmouseout="outTdFun(document.all.Row3)" onClick="showComUserMge()"><font class="tdStyle">注册用户管理</font></td>
				</tr>
				<c:if test="${sessionScope.adminUser.type == 0}">
				<tr id = "Row4" style="background-repeat: no-repeat;background-position: center" height="32">
					<td>&nbsp;</td>
					<td  valign="center"></td>
					<td style="cursor:hand;" align="left" onMouseOver="overTdFun(document.all.Row4)"   valign="center" 
						onmouseout="outTdFun(document.all.Row4)" 
						onClick="showAdminUserMge()"><font class="tdStyle">管理员管理</font></td>
				</tr>
				</c:if>
	            </td>
           </table>
        </tr>
	<tr>
		<td style="cursor:hand;" height="25" width="168" colspan="2"
			background="<%=path %>/img/h_images/manage/main_43.gif" align="center"
			onclick="changeTdHeight(3,4)"  valign="top" >
			<font class="fontStyle">
		       			个人资料管理</font>
	  		</td>
	     	</tr>          
	<tr id= "splitTr3" style="display:none;">
        	<td valign="top"  bgcolor="#e5f4fd" colspan="2">
        	<table  width="100%"
        		    cellpadding="0" cellspacing="0"
        		 	border="0" >
				<tr id = "Row1" style="background-repeat: no-repeat;background-position: center" height="32">
			       	<td>&nbsp;</td>
			       	<td  valign="center">&nbsp;&nbsp;</td>
					<td style="cursor:hand;" align="left" onMouseOver="overTdFun(document.all.Row5)"  valign="center" 
						onmouseout="outTdFun(document.all.Row5)" onClick="showSelfInfo()"><font class="tdStyle">查询个人资料</font></td>
				</tr>
				<tr id = "Row2" style="background-repeat: no-repeat;background-position: center" height="32">
					<td>&nbsp;</td>
					<td  valign="center"></td>
					<td style="cursor:hand;" align="left" onMouseOver="overTdFun(document.all.Row6)"   valign="center" 
						onmouseout="outTdFun(document.all.Row6)" 
						onClick="updateSelfInfo()"><font class="tdStyle">个人资料修改</font></td>
				</tr>
				<tr id = "Row2" style="background-repeat: no-repeat;background-position: center" height="32">
					<td>&nbsp;</td>
					<td  valign="center"></td>
					<td style="cursor:hand;" align="left" onMouseOver="overTdFun(document.all.Row7)"   valign="center" 
						onmouseout="outTdFun(document.all.Row7)" 
						onClick="updateSelfPsw()"><font class="tdStyle">密码修改</font></td>
				</tr>
           </table>
           </td>
	</tr>
	<tr>
		<td  style="cursor:hand;" height="25" width="168" colspan="2"
			background="<%=path %>/img/h_images/manage/main_43.gif" align="center"
			onclick="changeTdHeight(4,4)"  valign="top" >
			<font class="fontStyle">
		       			订单管理</font>
	  		</td>
	     	</tr>          
	<tr id= "splitTr4" style="display:none;">
        	<td valign="top"  bgcolor="#e5f4fd" colspan="2">
        	<table  width="100%"
        		    cellpadding="0" cellspacing="0"
        		 	border="0" >
				<tr id = "Row1" style="background-repeat: no-repeat;background-position: center" height="32">
			       	<td>&nbsp;</td>
			       	<td  valign="center">&nbsp;&nbsp;</td>
					<td style="cursor:hand;" align="left" onMouseOver="overTdFun(document.all.Row5)"  valign="center" 
						onmouseout="outTdFun(document.all.Row5)" onClick="showOrder()"><font class="tdStyle">订单及订单明细查询</font></td>
				</tr>
<!--			<tr id = "Row2" style="background-repeat: no-repeat;background-position: center" height="32">
					<td>&nbsp;</td>
					<td  valign="center"><img src="<%=path %>/img/h_images/manage/main_40.gif"/></td>
					<td style="cursor:hand;" align="left" onMouseOver="overTdFun(document.all.Row6)"   valign="center" 
						onmouseout="outTdFun(document.all.Row6)" 
						onClick="updateSelfInfo()"><font class="tdStyle">查看详细</font></td>
				</tr>  -->
				<tr id = "Row2" style="background-repeat: no-repeat;background-position: center" height="32">
					<td>&nbsp;</td>
					<td  valign="center"></td>
					<td style="cursor:hand;" align="left" onMouseOver="overTdFun(document.all.Row7)"   valign="center" 
						onmouseout="outTdFun(document.all.Row7)" 
						onClick="showOrderCheck()"><font class="tdStyle">订单审核</font></td>
				</tr>
				<tr id = "Row2" style="background-repeat: no-repeat;background-position: center" height="32">
					<td>&nbsp;</td>
					<td  valign="center"></td>
					<td style="cursor:hand;" align="left" onMouseOver="overTdFun(document.all.Row7)"   valign="center" 
						onmouseout="outTdFun(document.all.Row7)" 
						onClick="showOrderupdate()"><font class="tdStyle">订单修改</font></td>
				</tr>
           </table>
           </td>
	</tr>
          <td height="23" background="<%=path %>/img/h_images/manage/main_45.gif"  colspan="2">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="18%">&nbsp;</td>
              <td width="64%"><div align="center"><font class="fontStyle">JN100508倾情制作 </font></div></td>
              <td width="18%">&nbsp;</td>
            </tr>
          </table></td>
       </tr>
</table>
</html>
