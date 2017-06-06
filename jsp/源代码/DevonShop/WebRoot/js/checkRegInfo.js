
function isNull(inputValue, span, msgWhenNull, path){
	if(inputValue == null || inputValue == ""){
		span.innerHTML = "<img src='" + path + "/image/agree_no.gif' />&nbsp;请输入" + msgWhenNull + "！";
		return true;
	}else{
		return false;	
	}
}

function checkInputValue(inputValue, span, msgWhenNull, msgWhenWrongFormat, regex, path){

	var isnull = isNull(inputValue, span, msgWhenNull, path);
	if(isnull == false){
		if(msgWhenNull == "出生日期"){
			if(!checkAge()){
				span.innerHTML = "<img src='" + path + "/image/agree_no.gif' />&nbsp;" + msgWhenWrongFormat;
				return false;
			}else{
				span.innerHTML = "<img src='" + path + "/image/agree_ok.gif' />";
				return true;
			}
		}


		
		if(msgWhenNull == "确认密码"){
			if(!regex.test(inputValue)){
				span.innerHTML = "<img src='" + path + "/image/agree_no.gif' />&nbsp;" + msgWhenWrongFormat;
				return false;
			}
			if(document.getElementById("password").value != inputValue){
				span.innerHTML = "<img src='" + path + "/image/agree_no.gif' />&nbsp;确认密码不一致！";
				return false;			
			}else{
				span.innerHTML = "<img src='" + path + "/image/agree_ok.gif' />";
				return true;		
			}

		}
		
		if(!regex.test(inputValue)){
			span.innerHTML = "<img src='" + path + "/image/agree_no.gif' />&nbsp;" + msgWhenWrongFormat;
			return false;
		}else{
			if(msgWhenNull == "用户名"){
				span.innerHTML = 
					"<iframe frameborder='0' scrolling='no' marginwidth='0' marginheight='0' style='width:200px;height:18px' src='" + path + "/servlet/IsExistUserServlet?username=" + document.getElementById("username").value + "'></iframe>";
				return true;
			}
			span.innerHTML = "<img src='" + path + "/image/agree_ok.gif' />";
			return true;
		}
	}else{
		return false;
	}
}

function clearInputValue(anObject){
	anObject.innerHTML = "";
}

function getFocus(anObject){
	anObject.focus();
}

function checkAllInfo(path){
	
	var flag = true;
	if(!checkInputValue(document.getElementById("userName").value, spanUserName, "用户名", "用户名必须是英文字母，数字或下划线，且长度不小于3", /^([0-9]|[a-zA-Z]|_){3,15}$/, path)){
		flag = false;
	}
	if(!checkInputValue(document.getElementById("password").value, spanPassword, "密码", "密码必须是英文字母，数字或下划线，且长度不小于3", /^([0-9]|[a-zA-Z]|_){3,15}$/, path)){
		flag = false;
	}
	if(!checkInputValue(document.getElementById("passwordAgain").value, spanPasswordAgain, "确认密码", "确认密码必须是英文字母，数字或下划线，且长度不小于3", /^([0-9]|[a-zA-Z]|_){3,15}$/, path)){
		flag = false;
	}
	if(!checkInputValue(document.getElementById("realName").value, spanRealName, "真实姓名", "真实姓名长度不能大于 15", /^([一-龥]{2,10})$/, path)){
		flag = false;
	}
	if(!checkInputValue(document.getElementById("birthday").value, spanBirthday, '出生日期', '注册用户必须大于10周岁！', /^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$/, path)){
		flag = false;
	}
	if(!checkInputValue(document.getElementById("email").value, spanEmail, "电子邮箱", "电子邮箱格式不正确！正确格式举例：abc@def.com", /^[-_A-Za-z0-9]+@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/, path)){
		flag = false;
	}
	if(!checkInputValue(document.getElementById("tel").value, spanTel, "电话号码", "电话号码格式不正确！",  /(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$/, path)){
		flag = false;
	}
	if(!checkInputValue(document.getElementById("address").value, spanAddress, "地址", "", /(.+?)/, path)){
		flag = false;
	}
	if(!checkInputValue(document.getElementById("post").value, spanPost, "邮编", "邮编格式不正确！", /[1-9]\d{5}(?!\d)/, path)){
		flag = false;
	}
	return flag;
}

function checkAge(){
	var vbirthday = document.getElementById("birthday").value;
	var arr_birthday = vbirthday.split("-");
	var _birthday = new Date();
	_birthday.setFullYear( parseInt(arr_birthday[0], 10), parseInt(arr_birthday[1], 10), parseInt(arr_birthday[2], 10));
	
	var currTime = document.getElementById("currTime").value;
	var arr_currTime = currTime.split("-");
	var _currTime = new Date();
	_currTime.setFullYear(parseInt(arr_currTime[0], 10), parseInt(arr_currTime[1], 10), parseInt(arr_currTime[2], 10));

	if(_birthday <= _currTime ){
		return true;
		
	}else{
		return false;
	}
}


















function checkRegInfo(){
	var userName = document.forms[0].elements[0].value;
	var psw = document.forms[0].elements[1].value;
	var pswAgn = document.forms[0].elements[2].value;
	var sexMale = document.forms[0].elements[3].value;
	var sexFemale = document.forms[0].elements[4].value;
	var realName = document.forms[0].elements[5].value;
	var birthday = document.forms[0].elements[6].value;
	var email = document.forms[0].elements[7].value;
	var tel = document.forms[0].elements[8].value;
	var address = document.forms[0].elements[9].value;
	var post = document.forms[0].elements[10].value;


	
	var existWrong = false;
	// 用户名------------------------------------------------------------------------------------------------------------------------------
	if(userName == null || userName == ""){
		document.getElementById("spanUserName").innerHTML = "<img src='agree_no.gif' />请输入用户名！";
		existWrong = true;
	}else{
		var regex = /^([0-9]|[a-zA-Z]|_){3,}$/;
		if(!regex.test(userName)){
			document.getElementById("spanUserName").innerHTML = "<img src='agree_no.gif' />必须是英文字母或数字或者下划线, 且长度不小于3";
			existWrong = true;
		}else{
			document.getElementById("spanUserName").innerHTML = "<img src='agree_ok.gif' />";
		}
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------

	var pswFlag = true;
	var pswAgnFlag = true;
	// 密码
	if(psw == null || psw == ""){
		document.getElementById("spanPassword").innerHTML = "<img src='agree_no.gif' />请输入密码！";
		existWrong = true;
		pswFlag = false;
	}else{
		var regex = /^([0-9]|[a-zA-Z]|_){3，}$/;
		if(!regex.test(psw)){
			document.getElementById("spanPassword").innerHTML = "<img src='agree_no.gif' />长度必须不小于3！";
			existWrong = true;
			pswFlag = false;
		}else{
			document.getElementById("spanPassword").innerHTML = "<img src='agree_ok.gif' />";
		}
	}
	// 确认密码
	if(pswAgn == null || pswAgn == ""){
		document.getElementById("spanPasswordAgain").innerHTML = "<img src='agree_no.gif' />请输入确认密码！";
		existWrong = true;
		pswAgnFlag = false;
	}else{
		var regex = /^([0-9]|[a-zA-Z]|_){3, }$/;
		if(!regex.test(psw)){
			document.getElementById("spanPasswordAgain").innerHTML = "<img src='agree_no.gif' />长度必须不小于3！";
			existWrong = true;
			pswAgnFlag = false;
		}else{
			document.getElementById("spanPasswordAgain").innerHTML = "<img src='agree_ok.gif' />";
		}
	}
	// 密码与确认密码的一致性
	if(pswFlag == true && pswAgnFlag == true){
		if(!psw == pswAgn){
			document.getElementById("spanPassword").innerHTML = "";
			document.getElementById("spanPasswordAgain").innerHTML = "<img src='agree_no.gif' />密码与确认密码不一致！";
		}else{
			document.getElementById("spanPassword").innerHTML = "<img src='agree_ok.gif' />";	
			document.getElementById("spanPasswordAgain").innerHTML = "<img src='agree_ok.gif' />";	
		}
	}
	
	
	// 真实姓名------------------------------------------------------------------------------------------------------------------------------
	if(realName == null || realName == ""){
		document.getElementById("spanRealName").innerHTML = "<img src='agree_no.gif' />请输入真实姓名！";
		existWrong = true;
		
	}else{
		var regex = /^([a-zA-Z]{2,10})|([一-龥]{2,15})$/;
		if(!regex.test(realName)){
			document.getElementById("spanRealName").innerHTML = "<img src='agree_no.gif' />长度必须不大于15！";
			existWrong = true;
		}else{
			document.getElementById("spanRealName").innerHTML = "<img src='agree_ok.gif' />";	
		}
	}
	
	
	// 出生日期------------------------------------------------------------------------------------------------------------------------------
	if(birthday == null || birthday == ""){
		document.getElementById("spanBirthday").innerHTML = "<img src='agree_no.gif' />请选择出生日期！";
		existWrong = true;
	}else{
		document.getElementById("spanBirthday").innerHTML = "<img src='agree_ok.gif' />";	
	}
	
	
	// 电子邮箱------------------------------------------------------------------------------------------------------------------------------
	if(email == null || email == ""){
		document.getElementById("spanEmail").innerHTML = "<img src='agree_no.gif' />请输入电子邮箱！";
		existWrong = true;
	}else {
		var regex = /(\S)+[@]{1}(\S)+[.]{1}(\w)+/;
		if(!regex.test(email)){
			document.getElementById("spanEmail").innerHTML = "<img src='agree_no.gif' />电子邮箱格式不正确！如：abc@def.com";
			existWrong = true;
		}else{
			document.getElementById("spanEmail").innerHTML = "<img src='agree_ok.gif' />";	
		}
	}
	
	
	// 电话号码------------------------------------------------------------------------------------------------------------------------------
	if(tel == null || tel == ""){
		document.getElementById("spanTel").innerHTML = "<img src='agree_no.gif' />请输入电话号码！";
		existWrong = true;
	}else {
		var regex = /(\d{11})|(\d{3}|(\d{3}|\d{4})-)?(\d{8}|\d{7}) |([1][2]\d{1}|\d{3}-)?(\d{7}|\d{8})/;
		if(!regex.test(tel)){
			document.getElementById("spanTel").innerHTML = "<img src='agree_no.gif' />电话号码格式不正确！";
			existWrong = true;
		}else{
			document.getElementById("spanTel").innerHTML = "<img src='agree_ok.gif' />";
		}
	}
	
	
	// 地址------------------------------------------------------------------------------------------------------------------------------
	if(address == null || address == ""){
		document.getElementById("spanAddress").innerHTML = "<img src='agree_no.gif' />请输入地址！";
		existWrong = true;
	}else {
		if(address.length > 100){
			document.getElementById("spanAddress").innerHTML = "<img src='agree_no.gif' />长度必须不大于100！";
		}else{
			document.getElementById("spanAddress").innerHTML = "<img src='agree_ok.gif' />";		
		}
	}
	
	
	// 邮编------------------------------------------------------------------------------------------------------------------------------
	if(post == null || post == ""){
		document.getElementById("spanPost").innerHTML = "<img src='agree_no.gif' />请输入邮编！";
		existWrong = true;
	}else {
		var regex = /^\d{6}$/;
		if(!regex.test(post)){
			document.getElementById("spanPost").innerHTML = "<img src='agree_no.gif' />邮编格式不正确！";
			existWrong = true;			
		}else{
			document.getElementById("spanPost").innerHTML = "<img src='agree_ok.gif' />";
		}
	}
	
	
	if(existWrong == true){
		return false;	
	}else{
		return true;	
	}
	
	
	/*	var existWrong = false;
	// 用户名------------------------------------------------------------------------------------------------------------------------------
	if(userName == null || userName == ""){
		document.getElementById("spanUserName").innerHTML = "<img src='agree_no.gif' />请输入用户名！";
		existWrong = true;
	}else{
		var existSpace = false;
		for(var i = 0; i < userName.length; i++){
			if(userName[i] == " "){
				document.getElementById("spanUserName").innerHTML = "<img src='agree_no.gif' />用户名不能包含空格！";
				existSpace = true;
				break;
			}
		}
		
		if(existSpace == false){
			if(userName.length < 3){
				document.getElementById("spanUserName").innerHTML = "<img src='agree_no.gif' />用户名长度不能小于3个字符";
				existWrong = true;
			}else{
				document.getElementById("spanUserName").innerHTML = "<img src='agree_ok.gif' />";
			}
		}
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------

	var pswFlag = true;
	var pswAgnFlag = true;
	// 密码
	if(psw == null || psw == ""){
		document.getElementById("spanPassword").innerHTML = "<img src='agree_no.gif' />请输入密码！";
		existWrong = true;
		pswFlag = false;
	}else{
		var regex = /^([0-9]|[a-zA-Z]|_){3,99999}$/;
		if(!regex.test(psw)){
			document.getElementById("spanPassword").innerHTML = "<img src='agree_no.gif' />密码格式不正确！";
			existWrong = true;
			pswFlag = false;
		}
	}
	// 确认密码
	if(pswAgn == null || pswAgn == ""){
		document.getElementById("spanPasswordAgain").innerHTML = "<img src='agree_no.gif' />请输入确认密码！";
		existWrong = true;
		pswAgnFlag = false;
	}else{
		var regex = /^([0-9]|[a-zA-Z]|_){3,99999}$/;
		if(!regex.test(psw)){
			document.getElementById("spanPassword").innerHTML = "<img src='agree_no.gif' />确认密码格式不正确！";
			existWrong = true;
			pswAgnFlag = false;
		}
	}
	if(pswFlag == true && pswAgnFlag == true){
		if(!psw == pswAgn){
			document.getElementById("spanPassword").innerHTML = "";
			document.getElementById("spanPasswordAgain").innerHTML = "<img src='agree_no.gif' />密码与确认密码不一致！";
			var pswFlag = false;
			var pswAgnFlag = false;			
		}
	}
	if(pswFlag == true && pswAgnFlag == true){
		document.getElementById("spanPassword").innerHTML = "<img src='agree_ok.gif' />";	
		document.getElementById("spanPasswordAgain").innerHTML = "<img src='agree_ok.gif' />";	
	}
	
	
	
	
	// 真实姓名------------------------------------------------------------------------------------------------------------------------------
	if(realName == null || realName == ""){
		document.getElementById("spanRealName").innerHTML = "<img src='agree_no.gif' />请输入真实姓名！";
		existWrong = true;
		
	}else{
		var regex = /^([a-zA-Z]{2,10})|([一-龥]{2,15})$/;
		if(!regex.test(realName)){
			document.getElementById("spanRealName").innerHTML = "<img src='agree_no.gif' />真实姓名格式不正确！";
			existWrong = true;
		}else{
			document.getElementById("spanRealName").innerHTML = "<img src='agree_ok.gif' />";	
		}
	}
	
	
	// 出生日期------------------------------------------------------------------------------------------------------------------------------
	if(birthday == null || birthday == ""){
		document.getElementById("spanBirthday").innerHTML = "<img src='agree_no.gif' />请选择出生日期！";
		existWrong = true;
	}else{
		document.getElementById("spanBirthday").innerHTML = "<img src='agree_ok.gif' />";	
	}
	
	
	// 电子邮箱------------------------------------------------------------------------------------------------------------------------------
	if(email == null || email == ""){
		document.getElementById("spanEmail").innerHTML = "<img src='agree_no.gif' />请输入电子邮箱！";
		existWrong = true;
	}else {
		var regex = /(\S)+[@]{1}(\S)+[.]{1}(\w)+/;
		if(!regex.test(email)){
			document.getElementById("spanEmail").innerHTML = "<img src='agree_no.gif' />电子邮箱格式不正确！";
			existWrong = true;
		}else{
			document.getElementById("spanEmail").innerHTML = "<img src='agree_ok.gif' />";	
		}
	}
	
	
	// 电话号码------------------------------------------------------------------------------------------------------------------------------
	if(tel == null || tel == ""){
		document.getElementById("spanTel").innerHTML = "<img src='agree_no.gif' />请输入电话号码！";
		existWrong = true;
	}else {
		var regex = /(\d{11})|(\d{3}|(\d{3}|\d{4})-)?(\d{8}|\d{7}) |([1][2]\d{1}|\d{3}-)?(\d{7}|\d{8})/;
		if(!regex.test(tel)){
			document.getElementById("spanTel").innerHTML = "<img src='agree_no.gif' />电话号码格式不正确！";
			existWrong = true;
		}else{
			document.getElementById("spanTel").innerHTML = "<img src='agree_ok.gif' />";
		}
	}
	
	
	// 地址------------------------------------------------------------------------------------------------------------------------------
	if(address == null || address == ""){
		document.getElementById("spanAddress").innerHTML = "<img src='agree_no.gif' />请输入地址！";
		existWrong = true;
	}else {
		document.getElementById("spanAddress").innerHTML = "<img src='agree_ok.gif' />";
	}
	
	
	// 邮编------------------------------------------------------------------------------------------------------------------------------
	if(post == null || post == ""){
		document.getElementById("spanPost").innerHTML = "<img src='agree_no.gif' />请输入邮编！";
		existWrong = true;
	}else {
		var regex = /^\d{5,6}$/;
		if(!regex.test(post)){
			document.getElementById("spanPost").innerHTML = "<img src='agree_no.gif' />邮编格式不正确！";
			existWrong = true;			
		}else{
			document.getElementById("spanPost").innerHTML = "<img src='agree_ok.gif' />";
		}
	}
	
	

	if(existWrong == true){
		return false;	
	}else{
		return true;	
	}*/
}