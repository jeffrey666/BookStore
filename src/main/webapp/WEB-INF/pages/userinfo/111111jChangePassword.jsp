<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>修改密码</title>
	<script type="text/javascript"	src="<%=request.getContextPath()%>/staticfile/js/jquery-1.6.2.js"></script>
	
<script type="text/javascript">

	function checkForm(){
		
		isOK = true;
		
		isOK = checkOldPsw() 
				&& checkNewPsw() 
				&& checkNewPswConfirm();
		
		return isOK;
	}
	
	function checkOldPsw(){
		
		isOK = true;
		
		isOK = checkNull("old_psw","密码不能为空");
		
		return isOK;
	}	
	
	function checkNewPsw(){
		
		isOK = true;
		
		isOK = checkNull("new_password","密码不能为空");
		
		return isOK;
	}	
	
	function checkNewPswConfirm(){
		
		isOK = true;
		
		isOK = checkNull("new_password_confirm","密码不能为空");
		
		if(isOK){
			if( $("input[name='new_password']").val() != $("input[name='new_password_confirm']").val() ){
				promptMsg("两次输入的密码不一致！");
				isOK = false;
			}
					
		}		
		
		return isOK;
	}
	
	function promptMsg(msg){
		$errMsg = $("#errMsg");
		$span.css("color","red").text(msg);
	}	
	
	function checkNull(name, msg){
		
		promptMsg("");
		
		isOK = true;
		$o = $("input[name='"+name+"']");
		
		if( $o.val() == ""){
			promptMsg(msg);
			isOK = false;
		}
		
		return isOK;
	}	
</script>	
	
</head>

<body>
<form  onsubmit="return checkForm()" name="icform" method="post" target="_self"  action="/user/password/update" >

   
  <div class="textbox-title">
	<img src="../../staticfile/skin/default/images/icon/currency_yen.png"/>
    修改密码
  </div> 
  
<div>


<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%"   >
	<tr><td><input name="user_id" value="${_CURRENT_USER.id } " type="hidden" ></td></tr>
	<tr>
		<td>
			<span id="errMsg" style="color: red;" >${errMsg }</span>
		</td>
	</tr>
	<tr>
		<td>旧密码：</td>
		<td><input type="password" name="old_psw"  /></td>
	</tr>
	<tr>
		<td>新密码：</td>
		<td><input type="password" name="new_password"  /></td>
	</tr>
		<tr>
		<td>确认密码：</td>
		<td><input type="password" name="new_password_confirm" /></td>
	</tr>	
	
	<tr>
		<td><input type="submit" value="提交"/></td>
		<td><input type="button" value="返回" onclick="window.history.back();" /></td>		
	</tr>
	
	
	 
	

</table>
</div>
 
</div>
 
 
</form>
</body>
</html>

