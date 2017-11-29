<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>用户列表</title>
</head>

<body>
<form name="icform" method="post">

<div id="menubar">
<div id="middleMenubar">
<div id="innerMenubar">
  <div id="navMenubar">
<ul>
	<li id="update"><a href="#" onclick="formSubmit('update','_self');this.blur();">修改</a></li>
	<li id="new"><a href="#" onclick="window.history.back();this.blur();">返回</a></li>
</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="../../staticfile/skin/default/images/icon/currency_yen.png"/>
    用户修改
  </div> 
  
<div>


<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%" >
	<td><input name="id" type="hidden" value="${user.id}"</td>
	<tr>
		<td>用户名：</td>
		<td><input type="text" name="username" value=" ${user.username}"/></td>
		<td>密码：</td>
		<td><input type="password" name="password" value="${user.password}"/></td>
	</tr>
	<tr>
		<td>昵称：</td>
		<td><input type="text" name="userInfo.name"  value="${user.userInfo.nickname}"/></td>
		<td>身份证号：</td>
		<td><input type="text" name="userInfo.cardNo" value="${user.userInfo.cardNo}"/></td>
	</tr>
	<tr>
		<td>性别：</td>
		<td><input type="text" name="userInfo.gender" value="${user.userInfo.gender}"/></td>
		<td>电话：</td>
		<td><input type="text" name="userInfo.telephone" value="${user.userInfo.telephone}"/></td>
	</tr>
	 	<tr>
		<td>地址：</td>
		<td><input type="text" name="userInfo.address" value="${user.userInfo.address }"/></td>
		<td>生日：</td>
		<td><input type="date" name="userInfo.birthday" value="${user.userInfo.birthday }"/></td>
	</tr>
	<tr>
        <td>用户级别：</td>
        <td> <select name="role">
             <option value="2" <c:if test="${user.role==2 }">selected="selected"</c:if>>-普通用户-</option>
             <option value="1" <c:if test="${user.role==1 }">selected="selected"</c:if>>-管理员-</option>
             <option value="0" <c:if test="${user.role==0 }">selected="selected"</c:if>>-超级管理员-</option>
        </select>
        </td>	
	</tr>
	
	<tr>
		<td>员工状态：</td>
		<td><input type="radio" name="state" value="1" <c:if test="${user.state==1 }">checked="checked"</c:if>/>启用
		<input type="radio" name="state"  value="0" <c:if test="${user.state==0 }">checked="checked"</c:if> />关闭
		</td>
		
	</tr>
	
</table>
</div>
 
</div>
 
 
</form>
</body>
</html>

