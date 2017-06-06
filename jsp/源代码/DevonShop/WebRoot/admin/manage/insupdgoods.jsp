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
<!--		<link href="main.css" rel="stylesheet" type="text/css" />-->
		<script src="<%=path %>/js/calendar.js"></script>
		<script src="<%=path %>/js/checkRegInfo.js"></script>
		<script>
			//先嵌入select候选项,再定位选项
			/*function toSelectOption(){
				document.getElementById("maxType").innerHTML= "
									<option value='全部'>所有大类</option>
				                	<c:if test="${!empty sessionScope.typeList}">
				                		<c:forEach items="${sessionScope.typeList}" var="temp">
				                			<option value='${temp[0] }'>${temp[0] }</option>
				                		</c:forEach>
				               		</c:if>
				               		";
				
				document.getElementById("minType").innerHTML= "
									<option value='全部'>所有小类</option>
			                		<c:if test="${!empty sessionScope.typeList}">
				                		<c:forEach items="${sessionScope.typeList}" var="temp">
				                			<c:forEach items="${pageScope.temp}" var="temp2" begin="1">
				                				<option value='${pageScope.temp2 }'>${pageScope.temp2 }</option>
				                			</c:forEach>
				                		</c:forEach>
				               		</c:if>
				               		";
			}
			toSelectOption();*/
			//var maxType = "${param.nmaxId}";
			//var minType = "${param.nminId}";
			//document.getElementById(maxType).selected = "true";
			//document.getElementById(minType).selected = "true";

			function checkGoodsInfo(path){
				var flag = true;
				if(!checkInputValue(document.getElementById("sname").value,spanSname, '商品名称', '商品名称长度为3~15个字符', /(.+?){3,15}/, path)){
					flag = false;
				}

				if(!checkInputValue(document.getElementById("nprice").value,spanNprice, '商品价格', '商品价格必须是合法的价格', /^(([1-9]\d*)|0)(\.\d{2})?$/, path)){
					flag = false;
				}
				if(document.getElementById("simg").value != null && document.getElementById("simg").value != ""){
					var isOk = /(.jpg|.png|.gif|.bmp)$/.test(document.getElementById("simg").value);
					if(isOk == false){
						spanSimg.innerHTML = "<img src='" + "<%=path%>" + "/image/agree_no.gif' /> 商品图片只能为.jpg|.png|.gif|.bmp格式";
						flag = false;
					}
				}
				return flag;
			}

			function delGoodsImg(nid, simg){
				window.location.href = "<%=path%>/servlet/DelGoodsImgServlet?nid=" + nid + "&simg=" + simg;
			}

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
		</script>

		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="this is my page">
		<meta http-equiv="content-type" content="text/html; charset=gbk">

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/reguser.css">
<!--		<link rel="stylesheet" type="text/css" href="<%=path %>/css/main.css">-->

<style type="text/css">
	input{ height:22px;font-size:12px}
	textarea{height:50px;width:350px;font-size:12px}
	select{ height:22px;font-size:12px}
	label{font-size:12px}
	span{font-size:12px;color:red}
</style>

	</head>

	<body>
		<div id="formwrapper">
<!--			<h3>
				XX网上商城
			</h3>  -->
			<form method="post" name="apForm" id="apForm" enctype="multipart/form-data" action="<%=path %>/admin/manage/tab/InsUpdGoodsServlet" onSubmit="return checkGoodsInfo('<%=path %>')" >
				<input type="hidden" name="task" id="task" value="${ param.task}"/>
				<input type="hidden" name="nid" id="nid" value="${ requestScope.mc.nid}"/>
				<input type="hidden" name="hasNewImg" id="hasNewImg" value="${requestScope.mc.simg }"/>
				<fieldset>
					<legend>
					<c:choose>
						<c:when test="${ param.task eq 'update'}">
							商品信息修改
						</c:when>
						<c:when test="${ param.task eq 'insert'}">
							添加商品
						</c:when>
					</c:choose>
					</legend>
						<br>
						<span style="color: red; font-size:12px" >
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* 为必填项
						</span>
						<br>
						<br>
					<div>
						<label>
							 *商品名称
						</label>
						<c:choose>
							<c:when test="${ param.task eq 'update'}">
								<input class="short" type="text" name="sname" id="sname" value="${requestScope.mc.sname}" 								
								onBlur="checkInputValue(this.value,spanSname, '商品名称', '商品名称长度为3~15个字符', /(.+?){3,15}/, '<%=path%>')"
								onFocus="clearInputValue(spanSname)" />
							</c:when>
							<c:otherwise>
								<input class="short" type="text" name="sname" id="sname"
								onBlur="checkInputValue(this.value,spanSname, '商品名称', '商品名称长度为3~15个字符', /(.+?){3,15}/, '<%=path%>')"
								onFocus="clearInputValue(spanSname)" />
							</c:otherwise>
						</c:choose>
						<span id="spanSname" style="text-align: center"></span>
						<br />
					</div>
					<div>
						<label for="Email">
							*所属大类
						</label>
			                <select name="nmaxId" id="nmaxId" onchange="toChangenminId(this)"/>
								<option value='0'>请选择</option>
			                	<c:if test="${!empty sessionScope.typeList}">
			                		<c:forEach items="${sessionScope.typeList}" var="temp">
			                			<option value='${temp[0].nid }' ${temp[0].nid eq requestScope.mc.nmaxId?'selected':''}>${temp[0].sname }</option>
			                		</c:forEach>
			               		</c:if>
			                </select>
						<span id="spanMaxType"></span>
						<br />
					</div>
					<div>
						<label for="password">
							*所属小类
						</label>
			                <select name="nminId" id="nminId"/>
								<option value='0'>请选择</option>
		                		<c:if test="${!empty sessionScope.typeList}">
			                		<c:forEach items="${sessionScope.typeList}" var="temp">
			                			<c:forEach items="${pageScope.temp}" var="temp2" begin="1">
			                				<option id="${pageScope.temp2.nid }" value='${pageScope.temp2.nid }' ${pageScope.temp2.nid eq requestScope.mc.nminId?'selected':''}>${pageScope.temp2.sname}</option>
			                			</c:forEach>
			                		</c:forEach>
			               		</c:if>
			                </select>
						<span id="spanMinType"></span>
						<br />
					</div>
					<div>
						<label for="confirm_password">
							 *商品价格
						</label>
							<input class="short" type="text" name="nprice" id="npirce" value="${requestScope.mc.nprice}"
							onBlur="checkInputValue(this.value,spanNprice, '商品价格', '商品价格必须是合法的价格', /^(([1-9]\d*)|0)(\.\d{2})?$/, '<%=path%>')"
							onFocus="clearInputValue(spanNprice)" />
							<span id="spanNprice"></span>
						<br />
					</div>
					<div>
						<label for="Name">
							*添加时间
						</label>
						<input class="short" type="text" name="dcDate" id="dcDate" value="${requestScope.mc.dcDate}" readonly="readonly"/>
						<span id="spanRealName"></span>
						<br />
					</div>
					<div>
						<label for="Name">
							商品图片
						</label>
						<input class="short" type="file" name="simg" id="simg" onchange="imgDsp.src=this.value;" onFocus="clearInputValue(spanSimg)"/>
						${empty requestScope.mc.simg?"":"<input type='button' value='删除图片' onclick='delGoodsImg(nid.value, hasNewImg.value)'/>"}
						<span id="spanSimg"></span>
						<br />
					</div>
					<div>
						<label for="Name">
							图片预览
						</label>
						<img width="100px" height="100px" id="imgDsp" alt="" src="<%=path %>/${empty requestScope.mc.simg?'image/default.jpg':requestScope.mc.simg} " />
						<br />
					</div>
					<div>
					<div>
						<label for="Name">
							*是否缺货
						</label>
						<select name="smcTag" id="smcTag">
							<option value="是" selected="selected">是</option>
							<option value="否" selected="${requestScope.mc.smcTag == '否'?'selected':''}">否</option>
						</select>
						<br />
					</div>
					<div>
						<label for="Name">
							 商品描述
						</label>
						<textarea class="short" name="sdescription" id="sdescription"/>${requestScope.mc.sdescription}</textarea>
						<span id="spanTel"></span>
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
