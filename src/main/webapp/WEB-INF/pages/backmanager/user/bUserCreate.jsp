<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>部门列表</title>
</head>

<body>
<form name="icform" method="post">

<div id="menubar">
<div id="middleMenubar">
<div id="innerMenubar">
  <div id="navMenubar">
<ul>
	<li id="save"><a href="#" onclick="formSubmit('tosave','_self');this.blur();">保存</a></li>
	<li id="new"><a href="#" onclick="window.history.back();this.blur();">返回</a></li>
</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="../../staticfile/skin/default/images/icon/currency_yen.png"/>
    用户新增
  </div> 
  
<div>


<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%" >
	
	
	
	
	<tr>
		<td>用户名：</td>
		<td><input type="text" name="username" /></td>
		<td>密码：</td>
		<td><input type="password" name="password" /></td>
	</tr>
	<tr>
		<td>昵称：</td>
		<td><input type="text" name="userInfo.nickname" /></td>
		<td>身份证号：</td>
		<td><input type="text" name="userInfo.cardNo" /></td>
	</tr>
	
	
	<tr>
		<td>性别：</td>
		<td><input type="text" name="userInfo.gender" /></td>
		<td>电话</td>
 		<td><input type="text" name="userInfo.telephone" /></td>
	</tr>
	 	<tr>
		<td>email：</td>
		<td><input type="text" name="userInfo.email" /></td>
		<td>生日：</td>
		<td><input type="date" name="userInfo.birthday" /></td>
		<td>地址:</td>
 		<td><input type="text" name="userInfo.address" /></td>
		
	</tr>
	<tr>
        <td>用户级别：</td>
        <td> <select name="userInfo.userLevel">
             <option value="2">-普通用户-</option>
             <option value="1">-管理员-</option>
             <option value="0">-超级管理员-</option>
        </select>
        </td>	
	</tr>
	
	
	
	
	<tr>
		<td>员工状态：</td>
		<td><input type="radio" name="state" value="1" />启用
		<input type="radio" name="state"  value="0" />关闭
		</td>
		
	</tr>
	
	<tr>
		<td>备注信息：</td>
		<td colspan="3">
		<textarea name="userInfo.remark" style="width:100%;height:100px"></textarea>
 		</td>
 		
	</tr>
	
	
</table>
</div>
 
</div>
 
 
</form>
</body>
</html>

