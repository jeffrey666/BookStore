<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../../baselist.jsp"%>
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
	<li id="view"><a href="#" onclick="formSubmit('moduletoview','_self');this.blur();">查看</a></li>
	<li id="new"><a href="#" onclick="formSubmit('moduletocreate','_self');this.blur();">新增</a></li>
	<li id="update"><a href="#" onclick="formSubmit('moduletoupdate','_self');this.blur();">修改</a></li>
	<li id="delete"><a href="#" onclick="formSubmit('moduledelete','_self');this.blur();">删除</a></li>
	<li id="new"><a href="#" onclick="formSubmit('modulestart','_self');this.blur();">启用</a></li>
	<li id="new"><a href="#" onclick="formSubmit('modulestop','_self');this.blur();">停用</a></li>
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
		<td class="tableHeader"><input type="checkbox" name="selid" onclick="checkAll('moduleId',this)"></td>
		<td class="tableHeader">序号</td>
		<td class="tableHeader">模块名称</td>
		<td class="tableHeader">类型</td>
		<td class="tableHeader">上级模块名称</td>
		<td class="tableHeader">排序</td>
		<td class="tableHeader">说明</td>
		<td class="tableHeader">状态</td>
	
	</tr>
	</thead>
	<tbody class="tableBody" >
	
	<c:forEach items="${modules}" var="m" varStatus="status">
	<tr class="odd" onmouseover="this.className='highlight'" onmouseout="this.className='odd'">
		<td><input type="checkbox" name="moduleId" value="${m.moduleId}"/></td>
		<td>${status.index+1}</td>
		<td><a href="toview?moduleId=${m.moduleId}">${m.name}</a></td>
		<td><c:if test="${m.ctype==1 }">主菜单</c:if>
		    <c:if test="${m.ctype==2 }">侧边栏菜单</c:if>
		    <c:if test="${m.ctype==3 }">按钮</c:if></td>
		<td>${m.parentModule.name}</td>
		<td>${m.orderNo}</td>
		<td>${m.remark}</td>
		<td>${m.state}</td>
		<td>
			<c:if test="${m.state==1}"><a href="modulestop?moduleId=${m.moduleId}"><font color="green">启用</font></a></c:if>
			<c:if test="${m.state==0}"><a href="modulestart?moduleId=${m.moduleId}"><font color="red">停用</font></a></c:if>
		</td>
	</tr>
	</c:forEach>
	
	</tbody>
</table>
</div>
 
</div>
 
 
</form>
</body>
</html>

