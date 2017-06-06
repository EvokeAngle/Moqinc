<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<c:if test="${param.queryType != ''}">
	<c:set var="queryType" value="${param.queryType}" scope="session"/>
</c:if>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'querycon.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
			<script src="<%=path %>/js/calendar.js">
</script>
	<script type="text/javascript">
			
		function query(){
			
			<c:choose>
				<c:when test="${sessionScope.queryType == 'commonUser' or sessionScope.queryType == 'adminUser'}">
					var userName = document.forms[0].elements[0].value;
					var sex = document.forms[0].elements[1].value;
					var isFreeze = document.forms[0].elements[2].value;
					// 因为管理员管理时， 状态这个条件被隐藏，因此会取到下一个重置按钮的value，所以要进行判断
					if(isFreeze == "重置"){
						isFreeze = "全部";
					}
					var address = "<%=path%>" + "/admin/manage/tab/QueryUserServlet?userName=" + userName + "&sex=" + sex + "&isFreeze=" + isFreeze + "&queryType=" + "${sessionScope.queryType}";
					
				</c:when>
				
				<c:when test="${sessionScope.queryType == 'goods'}">
					var nmaxId = document.forms[0].elements[0].value;
					var nminId = document.forms[0].elements[1].value;
					var keywords = document.forms[0].elements[2].value;
					var address = "<%=path%>" + "/admin/manage/tab/QueryGoodsServlet?page=tab&nmaxId=" + nmaxId + "&nminId=" + nminId + "&keywords=" + keywords;
				</c:when>
			</c:choose>
			
			window.parent.frames[1].location.href = address;
			return false;
		}


		
	<c:choose>
		<c:when test="${sessionScope.queryType == 'commonUser' or sessionScope.queryType == 'adminUser'}">
		
			function insertAdmin(){
				window.parent.frames[1].location.href = "<%=path%>/servlet/InsertUserHelperServlet?userType=adminUser";
			}
			
		</c:when>
		
		<c:when test="${sessionScope.queryType == 'goods'}">
		
			function insertGoods(){
				window.parent.frames[1].location.href = "<%=path%>/admin/manage/tab/GetMcTypeServlet?task=insert&page=insupdgoods";
			}
			
		</c:when>
	</c:choose>

	function toChangenminId(nmaxIdObj){
		var sel = nmaxIdObj.value;
		var varItem;
		<c:forEach items="${sessionScope.typeList}" var="temp" varStatus="s">
			<c:forEach items="${pageScope.temp}" var="temp2" varStatus="s2">
				<c:choose>
					<c:when test="${pageScope.s2.count == 1}">
						if(sel == ${pageScope.temp2.nid}){
							document.getElementById("nminId").options.length = 0;
							varItem = new Option("请选择","0");
							document.getElementById("nminId").options.add(varItem);
					</c:when>
					<c:otherwise>
						 varItem = new Option("${pageScope.temp2.sname}","${pageScope.temp2.nid}");
						 document.getElementById("nminId").options.add(varItem);
					</c:otherwise>
				</c:choose>
			</c:forEach>
						}
		</c:forEach>
			if(sel == "0"){
				 document.getElementById("nminId").options.length = 0;
				 varItem = new Option("请选择","0");
				 document.getElementById("nminId").options.add(varItem);
			}
	}
		
/*		function toChangenminId(nid){
			var type = new Array();
	  		<c:if test="${!empty sessionScope.typeList}">
			<c:forEach items="${sessionScope.typeList}" var="temp" varStatus="s">
				var temp${s.count} = new Array();
				<c:forEach items="${pageScope.temp}" var="temp2" varStatus="s2">
					temp${s.count}[${s2.count}] = ${pageScope.temp2};
				</c:forEach>
				type[${s.count}] = temp${s.count};
			</c:forEach>
			</c:if>
	}*/
	</script>
	<style>
		table {height:20px};
	</style>
  </head>
  
  <body>

	<table>
	<form onSubmit="return query()">
		<c:choose>
			<c:when test="${sessionScope.queryType eq 'commonUser' or sessionScope.queryType eq 'adminUser'}">
		        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
		          <tr>
		            <td width="220" height="23" valign="bottom"><table width="220" border="0" cellspacing="0" cellpadding="0">
		              <tr>
		                <td height="18" style="background:url(images/topbg.gif);  font-size:12px; color:#2b7dbb;"><div align="center">用户名&nbsp;<input name="userName"/></div></td>
		              </tr>
		            </table></td>
		            <td width="100" valign="bottom"><table width="100" border="0" cellspacing="0" cellpadding="0">
		              <tr>
		                <td height="18" style="background:url(images/topbg.gif); font-size:12px; color:#2b7dbb;"><div align="center">性别&nbsp;<select name="sex" /><option value="全部">全部</option><option value="男">男</option><option value="女">女</option></select></div></td>
		              </tr>
		            </table></td>
		            <c:if test="${sessionScope.queryType eq 'commonUser'}">
		            <td width="100" valign="bottom"><table width="100" border="0" cellspacing="0" cellpadding="0">
		              <tr>
		                <td height="18" style="background:url(images/topbg.gif); font-size:12px; color:#2b7dbb;"><div align="center">状态&nbsp;<select name="isFreeze" /><option value="全部">全部</option><option value="正常">正常</option><option value="冻结">冻结</option></select></div></td>
		              </tr>
		            </table></td>
		            </c:if>
		            <td width="150" valign="bottom"><table width="150" border="0" cellspacing="0" cellpadding="0">
		              <tr>
		                <td height="18" style="background:url(images/topbg.gif); font-size:12px; color:#2b7dbb;"><div align="center"><input height="18"type="reset" value="重置"/>&nbsp;&nbsp;&nbsp;<input height="18"type="submit" value="查询"/></div></td>
		              </tr>
		            </table></td>
		            <td width="560px" valign="bottom">&nbsp;</td>
 		            <c:if test="${sessionScope.adminUser.type eq 0}">
		            <td height="18" style="background:url(images/topbg.gif); ;font-size:12px; color:#2b7dbb;"><div align="center"><input type="button" value="添加管理员" id="addAdmin" onClick="insertAdmin()"/></div></td>
		          	</c:if>
		          </tr>
		        </table></td>
		        </c:when>
		        <c:when test="${sessionScope.queryType eq 'goods'}">
			        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
			          <tr>
			            <td width="200" height="23" valign="bottom"><table width="200" border="0" cellspacing="0" cellpadding="0">
			              <tr>
			                <td height="18" style="background:url(images/topbg.gif);  font-size:12px; color:#2b7dbb;">
				                <div align="center">所属大类&nbsp;
					                <select name="nmaxId" id="nmaxId" style="width:120px;" onchange="toChangenminId(this)"/>
						                <option value="0">请选择</option>
						                	<c:if test="${!empty sessionScope.typeList}">
						                		<c:forEach items="${sessionScope.typeList}" var="temp">
						                			<option value="${temp[0].nid }">${temp[0].sname }</option>
						                		</c:forEach>
						               		</c:if>
					                </select>
				                </div>
			                </td>
			              </tr>
			            </table></td>
			            <td width="200" valign="bottom"><table width="200" border="0" cellspacing="0" cellpadding="0">
			              <tr>
			                <td height="18" style="background:url(images/topbg.gif); font-size:12px; color:#2b7dbb;">
				                <div align="center">所属小类&nbsp;
					                <select name="nminId" style="width:120px;"/>
					                	<option value="0">请选择</option>
		<%--			                		<c:if test="${!empty sessionScope.typeList}">
						                		<c:forEach items="${sessionScope.typeList}" var="temp">
						                			<c:forEach items="${pageScope.temp}" var="temp2" begin="1">
						                				<option value="${pageScope.temp2.nid }">${pageScope.temp2.sname }</option>
						                			</c:forEach>
						                		</c:forEach>
						               		</c:if> --%>
					                </select>
				                </div>
			                </td>
			              </tr>
			            </table></td>

			            <td width="220" valign="bottom"><table width="220" border="0" cellspacing="0" cellpadding="0">
			              <tr>
			                <td height="18" style="background:url(images/topbg.gif); font-size:12px; color:#2b7dbb;"><div align="center">关键字&nbsp;<input type="text" name="keywords" /></div></td>
			              </tr>
			            </table></td>

			            <td width="150" valign="bottom"><table width="150" border="0" cellspacing="0" cellpadding="0">
			              <tr>
			                <td height="18" style="background:url(images/topbg.gif); font-size:12px; color:#2b7dbb;"><div align="center"><input height="18"type="reset" value="重置"/>&nbsp;&nbsp;&nbsp;<input height="18"type="submit" value="查询"/></div></td>
			              </tr>
			            </table></td>
			            <td height="18" style="background:url(images/topbg.gif); ;font-size:12px; color:#2b7dbb;"><div align="center"><input type="button" value="添加商品" id="addGoods" onClick="insertGoods()"/></div></td>
			          </tr>
			        </table></td>

		        </c:when>
	        </c:choose>
    </form>
</table>
  </body>
</html>