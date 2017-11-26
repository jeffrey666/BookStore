function checkForm(){
	var res1 = checkNull("username","用户名不能为空");
	var res2 = checkNull("password","密码不能为空");
	var res3 = checkNull("password2","确认密码不能为空");
	var res4 = checkPassword("password","两次密码输入不一致");
	
	return res1 && res2 && res3 && res4 ;
}

function checkPassword(name,msg){
	var psw1 = $("input[name='"+name+"']").val().trim();
	var psw2 = $("input[name='"+name+"2']").val().trim();
	checkNull("password2","确认密码不能为空");
	if(psw1!="" && psw2!="" && psw1!=psw2){
		setMsg(name+"2",msg);
		return false;
	}
	return true;
}
function checkNull(name,msg){
	var value =$("input[name='"+name+"']").val().trim();
	setMsg(name,"");
	if(value == ""){
		setMsg(name,msg);
		return false;
	}
	return true;
}
function setMsg(name,msg){
	var $oInp=$("input[name='"+name+"']");
	var $oSpan = $oInp.nextAll("span");
	$oSpan.html(msg);
	$oSpan.css("color","red");
}