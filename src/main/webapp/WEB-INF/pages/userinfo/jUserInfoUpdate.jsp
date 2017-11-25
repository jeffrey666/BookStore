<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>编辑个人信息</title>
</head>

<body>
<form name="icform" method="post">

<div id="menubar">
<div id="middleMenubar">
<div id="innerMenubar">
  <div id="navMenubar">
<ul>
	<li id="save"><a href="#" onclick="formSubmit('update','_self');this.blur();">修改</a></li>
	<li id="back"><a href="#" onclick="window.history.back();">返回</a></li>
</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="../../staticfile/skin/default/images/icon/currency_yen.png"/>
    编辑个人信息
  </div> 
  
<div>


<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%" >
	<tr><td><input name="userId" value="${user.id } " type="hidden" ></td></tr>
	<tr><td><input name="userInfoId" value="${user.userInfo.userInfoId } " type="hidden" ></td></tr>
	<tr>
	
		<td>用户名：</td>
		<td><input type="text" name="username" value="${user.username }" readonly="readonly" /></td>
		<td>状态：</td>
		<td><input type="text" name="state" value="<c:if test="${user.state==1 }">启用</c:if> <c:if test="${user.state!=1 }">其他状态</c:if>" readonly="readonly" /></td>
	</tr>
	<tr>
		<td>昵称：</td>
		<td><input type="text" name="userInfo.nickname" value="${user.userInfo.nickname }" /></td>
		<td>email：</td>
		<td><input type="text" name="userInfo.email" value="${user.userInfo.email }" /></td>
	</tr>
	<tr>
		<td>性别：</td>
		<td><input type="text" name="userInfo.gender" value="${user.userInfo.gender }" /></td>
		<td>地址：</td>
		<td><input type="text" name="userInfo.address" value="${user.userInfo.address }" /></td>
	</tr>
	 	<tr>
		<td>身份证号：</td>
		<td><input type="text" name="userInfo.cardNo" value="${user.userInfo.cardNo }" /></td>
		<td>积分：</td>
		<td><input type="text" name="userInfo.score" value="${user.userInfo.score }" readonly="readonly" /></td>
	</tr>
	</tr>
	 	<tr>
		<td>电话号码：</td>
		<td><input type="text" name="userInfo.telephone" value="${user.userInfo.telephone }" /></td>
	</tr>
	
	
	 
	

</table>
</div>
 
</div>
 
 
</form>
</body>
</html>

