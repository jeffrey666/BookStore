<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../../baselist.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>角色列表</title>
</head>

<body>
<form name="icform" method="post">

<div id="menubar">
<div id="middleMenubar">
<div id="innerMenubar">
  <div id="navMenubar">
<ul>
	<li id="view"><a href="#" onclick="formSubmit('roletoview','_self');this.blur();">查看</a></li>
	<li id="new"><a href="#" onclick="formSubmit('roletocreate','_self');this.blur();">新增</a></li>
	<li id="update"><a href="#" onclick="formSubmit('roletoupdate','_self');this.blur();">修改</a></li>
	<li id="delete"><a href="#" onclick="formSubmit('roledelete','_self');this.blur();">删除</a></li>
	<li id="new"><a href="#" onclick="formSubmit('roletomodule','_self');this.blur();">模块</a></li>
	
</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="../../staticfile/skin/default/images/icon/currency_yen.png"/>
    角色列表
  </div> 
  
<div>


<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%" >
	<thead>
	<tr>
		<td class="tableHeader"><input type="checkbox" name="selid" onclick="checkAll('roleId',this)"></td>
		<td class="tableHeader">序号</td>
		<td class="tableHeader">角色id</td>
		<td class="tableHeader">角色名称</td>
		<td class="tableHeader">角色描述</td>
		
	
	</tr>
	</thead>
	<tbody class="tableBody" >
	
	<c:forEach items="${roles}" var="r" varStatus="status">
	<tr class="odd" onmouseover="this.className='highlight'" onmouseout="this.className='odd'">
		<td><input type="checkbox" name="roleId" value="${r.roleId}"/></td>
		<td>${status.index+1}</td>
		<td>${r.name}</td>
		<td>${r.remarks}</td>
		<td>${r.orderNo}</td>
	</tr>
	</c:forEach>
	
	</tbody>
</table>
</div>
 
</div>
 
 
</form>
</body>
</html>

