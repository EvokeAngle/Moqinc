
function isNull(inputValue, span, msgWhenNull, path){
	if(inputValue == null || inputValue == ""){
		span.innerHTML = "<img src='" + path + "/image/agree_no.gif' />&nbsp;������" + msgWhenNull + "��";
		return true;
	}else{
		return false;	
	}
}

function checkInputValue(inputValue, span, msgWhenNull, msgWhenWrongFormat, regex, path){

	var isnull = isNull(inputValue, span, msgWhenNull, path);
	if(isnull == false){
		if(msgWhenNull == "��������"){
			if(!checkAge()){
				span.innerHTML = "<img src='" + path + "/image/agree_no.gif' />&nbsp;" + msgWhenWrongFormat;
				return false;
			}else{
				span.innerHTML = "<img src='" + path + "/image/agree_ok.gif' />";
				return true;
			}
		}


		
		if(msgWhenNull == "ȷ������"){
			if(!regex.test(inputValue)){
				span.innerHTML = "<img src='" + path + "/image/agree_no.gif' />&nbsp;" + msgWhenWrongFormat;
				return false;
			}
			if(document.getElementById("password").value != inputValue){
				span.innerHTML = "<img src='" + path + "/image/agree_no.gif' />&nbsp;ȷ�����벻һ�£�";
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
			if(msgWhenNull == "�û���"){
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
	if(!checkInputValue(document.getElementById("userName").value, spanUserName, "�û���", "�û���������Ӣ����ĸ�����ֻ��»��ߣ��ҳ��Ȳ�С��3", /^([0-9]|[a-zA-Z]|_){3,15}$/, path)){
		flag = false;
	}
	if(!checkInputValue(document.getElementById("password").value, spanPassword, "����", "���������Ӣ����ĸ�����ֻ��»��ߣ��ҳ��Ȳ�С��3", /^([0-9]|[a-zA-Z]|_){3,15}$/, path)){
		flag = false;
	}
	if(!checkInputValue(document.getElementById("passwordAgain").value, spanPasswordAgain, "ȷ������", "ȷ�����������Ӣ����ĸ�����ֻ��»��ߣ��ҳ��Ȳ�С��3", /^([0-9]|[a-zA-Z]|_){3,15}$/, path)){
		flag = false;
	}
	if(!checkInputValue(document.getElementById("realName").value, spanRealName, "��ʵ����", "��ʵ�������Ȳ��ܴ��� 15", /^([һ-��]{2,10})$/, path)){
		flag = false;
	}
	if(!checkInputValue(document.getElementById("birthday").value, spanBirthday, '��������', 'ע���û��������10���꣡', /^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$/, path)){
		flag = false;
	}
	if(!checkInputValue(document.getElementById("email").value, spanEmail, "��������", "���������ʽ����ȷ����ȷ��ʽ������abc@def.com", /^[-_A-Za-z0-9]+@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/, path)){
		flag = false;
	}
	if(!checkInputValue(document.getElementById("tel").value, spanTel, "�绰����", "�绰�����ʽ����ȷ��",  /(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$/, path)){
		flag = false;
	}
	if(!checkInputValue(document.getElementById("address").value, spanAddress, "��ַ", "", /(.+?)/, path)){
		flag = false;
	}
	if(!checkInputValue(document.getElementById("post").value, spanPost, "�ʱ�", "�ʱ��ʽ����ȷ��", /[1-9]\d{5}(?!\d)/, path)){
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
	// �û���------------------------------------------------------------------------------------------------------------------------------
	if(userName == null || userName == ""){
		document.getElementById("spanUserName").innerHTML = "<img src='agree_no.gif' />�������û�����";
		existWrong = true;
	}else{
		var regex = /^([0-9]|[a-zA-Z]|_){3,}$/;
		if(!regex.test(userName)){
			document.getElementById("spanUserName").innerHTML = "<img src='agree_no.gif' />������Ӣ����ĸ�����ֻ����»���, �ҳ��Ȳ�С��3";
			existWrong = true;
		}else{
			document.getElementById("spanUserName").innerHTML = "<img src='agree_ok.gif' />";
		}
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------

	var pswFlag = true;
	var pswAgnFlag = true;
	// ����
	if(psw == null || psw == ""){
		document.getElementById("spanPassword").innerHTML = "<img src='agree_no.gif' />���������룡";
		existWrong = true;
		pswFlag = false;
	}else{
		var regex = /^([0-9]|[a-zA-Z]|_){3��}$/;
		if(!regex.test(psw)){
			document.getElementById("spanPassword").innerHTML = "<img src='agree_no.gif' />���ȱ��벻С��3��";
			existWrong = true;
			pswFlag = false;
		}else{
			document.getElementById("spanPassword").innerHTML = "<img src='agree_ok.gif' />";
		}
	}
	// ȷ������
	if(pswAgn == null || pswAgn == ""){
		document.getElementById("spanPasswordAgain").innerHTML = "<img src='agree_no.gif' />������ȷ�����룡";
		existWrong = true;
		pswAgnFlag = false;
	}else{
		var regex = /^([0-9]|[a-zA-Z]|_){3, }$/;
		if(!regex.test(psw)){
			document.getElementById("spanPasswordAgain").innerHTML = "<img src='agree_no.gif' />���ȱ��벻С��3��";
			existWrong = true;
			pswAgnFlag = false;
		}else{
			document.getElementById("spanPasswordAgain").innerHTML = "<img src='agree_ok.gif' />";
		}
	}
	// ������ȷ�������һ����
	if(pswFlag == true && pswAgnFlag == true){
		if(!psw == pswAgn){
			document.getElementById("spanPassword").innerHTML = "";
			document.getElementById("spanPasswordAgain").innerHTML = "<img src='agree_no.gif' />������ȷ�����벻һ�£�";
		}else{
			document.getElementById("spanPassword").innerHTML = "<img src='agree_ok.gif' />";	
			document.getElementById("spanPasswordAgain").innerHTML = "<img src='agree_ok.gif' />";	
		}
	}
	
	
	// ��ʵ����------------------------------------------------------------------------------------------------------------------------------
	if(realName == null || realName == ""){
		document.getElementById("spanRealName").innerHTML = "<img src='agree_no.gif' />��������ʵ������";
		existWrong = true;
		
	}else{
		var regex = /^([a-zA-Z]{2,10})|([һ-��]{2,15})$/;
		if(!regex.test(realName)){
			document.getElementById("spanRealName").innerHTML = "<img src='agree_no.gif' />���ȱ��벻����15��";
			existWrong = true;
		}else{
			document.getElementById("spanRealName").innerHTML = "<img src='agree_ok.gif' />";	
		}
	}
	
	
	// ��������------------------------------------------------------------------------------------------------------------------------------
	if(birthday == null || birthday == ""){
		document.getElementById("spanBirthday").innerHTML = "<img src='agree_no.gif' />��ѡ��������ڣ�";
		existWrong = true;
	}else{
		document.getElementById("spanBirthday").innerHTML = "<img src='agree_ok.gif' />";	
	}
	
	
	// ��������------------------------------------------------------------------------------------------------------------------------------
	if(email == null || email == ""){
		document.getElementById("spanEmail").innerHTML = "<img src='agree_no.gif' />������������䣡";
		existWrong = true;
	}else {
		var regex = /(\S)+[@]{1}(\S)+[.]{1}(\w)+/;
		if(!regex.test(email)){
			document.getElementById("spanEmail").innerHTML = "<img src='agree_no.gif' />���������ʽ����ȷ���磺abc@def.com";
			existWrong = true;
		}else{
			document.getElementById("spanEmail").innerHTML = "<img src='agree_ok.gif' />";	
		}
	}
	
	
	// �绰����------------------------------------------------------------------------------------------------------------------------------
	if(tel == null || tel == ""){
		document.getElementById("spanTel").innerHTML = "<img src='agree_no.gif' />������绰���룡";
		existWrong = true;
	}else {
		var regex = /(\d{11})|(\d{3}|(\d{3}|\d{4})-)?(\d{8}|\d{7}) |([1][2]\d{1}|\d{3}-)?(\d{7}|\d{8})/;
		if(!regex.test(tel)){
			document.getElementById("spanTel").innerHTML = "<img src='agree_no.gif' />�绰�����ʽ����ȷ��";
			existWrong = true;
		}else{
			document.getElementById("spanTel").innerHTML = "<img src='agree_ok.gif' />";
		}
	}
	
	
	// ��ַ------------------------------------------------------------------------------------------------------------------------------
	if(address == null || address == ""){
		document.getElementById("spanAddress").innerHTML = "<img src='agree_no.gif' />�������ַ��";
		existWrong = true;
	}else {
		if(address.length > 100){
			document.getElementById("spanAddress").innerHTML = "<img src='agree_no.gif' />���ȱ��벻����100��";
		}else{
			document.getElementById("spanAddress").innerHTML = "<img src='agree_ok.gif' />";		
		}
	}
	
	
	// �ʱ�------------------------------------------------------------------------------------------------------------------------------
	if(post == null || post == ""){
		document.getElementById("spanPost").innerHTML = "<img src='agree_no.gif' />�������ʱ࣡";
		existWrong = true;
	}else {
		var regex = /^\d{6}$/;
		if(!regex.test(post)){
			document.getElementById("spanPost").innerHTML = "<img src='agree_no.gif' />�ʱ��ʽ����ȷ��";
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
	// �û���------------------------------------------------------------------------------------------------------------------------------
	if(userName == null || userName == ""){
		document.getElementById("spanUserName").innerHTML = "<img src='agree_no.gif' />�������û�����";
		existWrong = true;
	}else{
		var existSpace = false;
		for(var i = 0; i < userName.length; i++){
			if(userName[i] == " "){
				document.getElementById("spanUserName").innerHTML = "<img src='agree_no.gif' />�û������ܰ����ո�";
				existSpace = true;
				break;
			}
		}
		
		if(existSpace == false){
			if(userName.length < 3){
				document.getElementById("spanUserName").innerHTML = "<img src='agree_no.gif' />�û������Ȳ���С��3���ַ�";
				existWrong = true;
			}else{
				document.getElementById("spanUserName").innerHTML = "<img src='agree_ok.gif' />";
			}
		}
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------

	var pswFlag = true;
	var pswAgnFlag = true;
	// ����
	if(psw == null || psw == ""){
		document.getElementById("spanPassword").innerHTML = "<img src='agree_no.gif' />���������룡";
		existWrong = true;
		pswFlag = false;
	}else{
		var regex = /^([0-9]|[a-zA-Z]|_){3,99999}$/;
		if(!regex.test(psw)){
			document.getElementById("spanPassword").innerHTML = "<img src='agree_no.gif' />�����ʽ����ȷ��";
			existWrong = true;
			pswFlag = false;
		}
	}
	// ȷ������
	if(pswAgn == null || pswAgn == ""){
		document.getElementById("spanPasswordAgain").innerHTML = "<img src='agree_no.gif' />������ȷ�����룡";
		existWrong = true;
		pswAgnFlag = false;
	}else{
		var regex = /^([0-9]|[a-zA-Z]|_){3,99999}$/;
		if(!regex.test(psw)){
			document.getElementById("spanPassword").innerHTML = "<img src='agree_no.gif' />ȷ�������ʽ����ȷ��";
			existWrong = true;
			pswAgnFlag = false;
		}
	}
	if(pswFlag == true && pswAgnFlag == true){
		if(!psw == pswAgn){
			document.getElementById("spanPassword").innerHTML = "";
			document.getElementById("spanPasswordAgain").innerHTML = "<img src='agree_no.gif' />������ȷ�����벻һ�£�";
			var pswFlag = false;
			var pswAgnFlag = false;			
		}
	}
	if(pswFlag == true && pswAgnFlag == true){
		document.getElementById("spanPassword").innerHTML = "<img src='agree_ok.gif' />";	
		document.getElementById("spanPasswordAgain").innerHTML = "<img src='agree_ok.gif' />";	
	}
	
	
	
	
	// ��ʵ����------------------------------------------------------------------------------------------------------------------------------
	if(realName == null || realName == ""){
		document.getElementById("spanRealName").innerHTML = "<img src='agree_no.gif' />��������ʵ������";
		existWrong = true;
		
	}else{
		var regex = /^([a-zA-Z]{2,10})|([һ-��]{2,15})$/;
		if(!regex.test(realName)){
			document.getElementById("spanRealName").innerHTML = "<img src='agree_no.gif' />��ʵ������ʽ����ȷ��";
			existWrong = true;
		}else{
			document.getElementById("spanRealName").innerHTML = "<img src='agree_ok.gif' />";	
		}
	}
	
	
	// ��������------------------------------------------------------------------------------------------------------------------------------
	if(birthday == null || birthday == ""){
		document.getElementById("spanBirthday").innerHTML = "<img src='agree_no.gif' />��ѡ��������ڣ�";
		existWrong = true;
	}else{
		document.getElementById("spanBirthday").innerHTML = "<img src='agree_ok.gif' />";	
	}
	
	
	// ��������------------------------------------------------------------------------------------------------------------------------------
	if(email == null || email == ""){
		document.getElementById("spanEmail").innerHTML = "<img src='agree_no.gif' />������������䣡";
		existWrong = true;
	}else {
		var regex = /(\S)+[@]{1}(\S)+[.]{1}(\w)+/;
		if(!regex.test(email)){
			document.getElementById("spanEmail").innerHTML = "<img src='agree_no.gif' />���������ʽ����ȷ��";
			existWrong = true;
		}else{
			document.getElementById("spanEmail").innerHTML = "<img src='agree_ok.gif' />";	
		}
	}
	
	
	// �绰����------------------------------------------------------------------------------------------------------------------------------
	if(tel == null || tel == ""){
		document.getElementById("spanTel").innerHTML = "<img src='agree_no.gif' />������绰���룡";
		existWrong = true;
	}else {
		var regex = /(\d{11})|(\d{3}|(\d{3}|\d{4})-)?(\d{8}|\d{7}) |([1][2]\d{1}|\d{3}-)?(\d{7}|\d{8})/;
		if(!regex.test(tel)){
			document.getElementById("spanTel").innerHTML = "<img src='agree_no.gif' />�绰�����ʽ����ȷ��";
			existWrong = true;
		}else{
			document.getElementById("spanTel").innerHTML = "<img src='agree_ok.gif' />";
		}
	}
	
	
	// ��ַ------------------------------------------------------------------------------------------------------------------------------
	if(address == null || address == ""){
		document.getElementById("spanAddress").innerHTML = "<img src='agree_no.gif' />�������ַ��";
		existWrong = true;
	}else {
		document.getElementById("spanAddress").innerHTML = "<img src='agree_ok.gif' />";
	}
	
	
	// �ʱ�------------------------------------------------------------------------------------------------------------------------------
	if(post == null || post == ""){
		document.getElementById("spanPost").innerHTML = "<img src='agree_no.gif' />�������ʱ࣡";
		existWrong = true;
	}else {
		var regex = /^\d{5,6}$/;
		if(!regex.test(post)){
			document.getElementById("spanPost").innerHTML = "<img src='agree_no.gif' />�ʱ��ʽ����ȷ��";
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