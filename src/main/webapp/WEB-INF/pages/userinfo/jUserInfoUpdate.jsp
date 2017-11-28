<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>编辑个人信息</title>
	
	<script src="https://cdn.bootcss.com/jquery/1.4.2/jquery.js"></script>
	<script type="text/javascript">
	
	function checkEmail(){
	
		promptMsg("text","userInfo.email","");
		
		isOK = true;
		
		if(isOK){
			reg = /^\w+@\w+(\.[a-zA-Z]+)+$/;
			$oEmail = $("input[type='text'][name='userInfo.email']");
			if( !reg.test( $oEmail.val() )){
				isOK = false;
				
				promptMsg("text","userInfo.email","邮箱格式不正确");
			}
		}
		
 		if(isOK){
			showVerifyEmailButton();
		} 
		
		return isOK;
	}
	
	function promptMsg(type, name, msg){
		$span = $("input[type='"+type+"'][name='"+name+"']+span");
		$span.css("color","red").text(msg);
	}
	
 	function showVerifyEmailButton(){
		$button = $("input[type='button'][value='验证邮箱']");
		$button.attr("hidden","");
	}

 	function onclickVerifyEamil(thisobj){
		$verifyEamilButton = $(thisobj);
		
		$.post("/user/BackAjaxDelProdServlet",
			{"prod_id":$oInputProdID.attr("id")},
			function(result){
				if("success"==result){
					alert("删除成功！");
					$oHasHiddenTd.parent().remove();
				}else{
					alert("删除失败："+result);
				}					
			});		
	}	
	
	</script>	
</head>

<body>
<form name="icform" method="post" target="_self"  action="/user/userinfo/update" >

   
  <div class="textbox-title">
	<img src="../../staticfile/skin/default/images/icon/currency_yen.png"/>
    编辑个人信息
  </div> 
  
<div>


<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%"   >
	<tr><td><input name="id" value="${_CURRENT_USER.id } " type="hidden" ></td></tr>
	<tr><td><input name="userInfo.userInfoId" value="${_CURRENT_USER.userInfo.userInfoId } " type="hidden" ></td></tr>
	<tr>
	
		<td>用户名：</td>
		<td><input type="text" name="username" value="${_CURRENT_USER.username }" readonly="readonly" /></td>

		<td>状态：</td>
		<td>
			<input disabled="disabled" type="radio" name="state" value="1"   <c:if test="${_CURRENT_USER.state==1 }">checked="checked"</c:if> />启用
			<input disabled="disabled" type="radio" name="state"  value="0" <c:if test="${_CURRENT_USER.state==0 }">checked="checked"</c:if> />关闭
		</td>
	</tr>
	<tr>
		<td>昵称：</td>
		<td><input type="text" name="userInfo.nickname" value="${_CURRENT_USER.userInfo.nickname }" /></td>
		<td>email：</td>
		<td>
			<input type="text" name="userInfo.email" value="${_CURRENT_USER.userInfo.email }" onblur="checkEmail()" />
			<span></span>
			<input hidden="hidden"  type="button" value="验证邮箱" onclick="onclickVerifyEamil(this)" />
		</td>
	</tr>
	<tr>
		<td>性别：</td>
		<td><input type="text" name="userInfo.gender" value="${_CURRENT_USER.userInfo.gender }" /></td>
		<td>地址：</td>
		<td><input type="text" name="userInfo.address" value="${_CURRENT_USER.userInfo.address }" /></td>
	</tr>
	 	<tr>
		<td>身份证号：</td>
		<td><input type="text" name="userInfo.cardNo" value="${_CURRENT_USER.userInfo.cardNo }" /></td>
		<td>积分：</td>
		<td><input type="text" name="userInfo.score" value="${_CURRENT_USER.userInfo.score }" readonly="readonly" /></td>
	</tr>
	</tr>
	 	<tr>
		<td>电话号码：</td>
		<td><input type="text" name="userInfo.telephone" value="${_CURRENT_USER.userInfo.telephone }" /></td>
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

