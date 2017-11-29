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
	<li id="new"><a href="#" onclick="window.history.back();this.blur();">返回</a></li>
</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="../../staticfile/skin/default/images/icon/currency_yen.png"/>
    角色查看
  </div> 
  
<div>


<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="50%" >
	
	<tr>
		<td>角色名称</td>
		<td>${roles.roleId }</td>
	</tr>
	<tr class="odd">
	    <td>角色描述</td>
	    <td>${roles.name }</td>
	</tr>
	<tr class="odd">
	    <td>角色序号：</td>
	    <td>
	       ${roles.orderNo} 
	    </td>
	</tr>
	
	
	
</table>
</div>
 
</div>
 
 
</form>
</body>
</html>

