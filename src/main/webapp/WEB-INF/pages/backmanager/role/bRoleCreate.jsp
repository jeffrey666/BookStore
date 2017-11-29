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
	<li id="save"><a href="#" onclick="formSubmit('roletosave','_self');this.blur();">保存</a></li>
	<li id="new"><a href="#" onclick="window.history.back();this.blur();">返回</a></li>
</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="../../staticfile/skin/default/images/icon/currency_yen.png"/>
    角色新增
  </div> 
  
<div>


<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%" >
	
	<tr>
		<td>角色名称：</td>
		<td><input name="name" type="text"/> </td>
		<td>角色描述：</td>
		<td><input name="remarks" type="text"/></td>
	</tr>
	
	<tr>
		<td>角色序号：</td>
		<td><input name="orderNo" type="text"/></td>
 		
	</tr>
	
	
</table>
</div>
 
</div>
 
 
</form>
</body>
</html>

