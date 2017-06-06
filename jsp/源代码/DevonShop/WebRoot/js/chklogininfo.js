function chkLoginInfo(divUserName, divPassword, divChkCode) {
	var userName = document.forms[0].elements[0].value;
	var password = document.forms[0].elements[1].value;
	var chkCode = document.forms[0].elements[2].value;

	var isOK = true;
	
	if (userName == null || userName == "") {
		divUserName.innerText = "�������û�����";
		isOK = false;
	} else {
		var regex = /^([0-9]|[a-zA-Z]|_){3,15}$/;
		if (!regex.test(userName)) {
			divUserName.innerText = "�û�����ʽ����ȷ��";
			isOK = false;
		}else{
			divUserName.innerText = "";
			isOK = true;
		}
	}

	if (password == null || password == "") {
		divPassword.innerText = "���������룡";
		isOK = false;
	} else {
		var regex = /^([0-9]|[a-zA-Z]|_){3,15}$/;
		if (!regex.test(password)) {
			divPassword.innerText = "�����ʽ����ȷ��";
			isOK = false;
		}else{
			divPassword.innerText = "";
			isOK = true;
		}
	}


	if(!validate(divChkCode)){
		isOK = false;
	}

	return isOK;
}


function validate(divChkCode) {
	var inputCode = document.getElementById("chkCode").value.toUpperCase();
	if(inputCode.length <=0) {
		divChkCode.innerText = "��������֤�룡";
		return false;
	}else if(inputCode != code ){
		divChkCode.innerText = "��֤���������";
		createCode();
		return false;
	}else {
		return true;
	}

}