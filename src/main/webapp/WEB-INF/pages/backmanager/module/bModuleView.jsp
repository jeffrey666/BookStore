<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>创建模块</title>
</head>

<body>
<form name="icform" method="post">

<div id="menubar">
<div id="middleMenubar">
<div id="innerMenubar">
  <div id="navMenubar">
<ul>
	<li id="back"><a href="#" onclick="window.history.back();">返回</a></li>

</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="../../staticfile/skin/default/images/icon/currency_yen.png"/>
    查看模块
  </div> 
  
<div>


<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%" >
	<tr>
		<td>模块名称：</td>
		<td>${module.name }</td>
	</tr>
 <tr>
		<td>序号：</td>
		<td>${module.orderNo }</td>
	</tr>
	<tr>
		<td>上级模块名称：</td>
		<td>
			${module.parentModule.name }
		</td>
	</tr>
	<tr>
		<td>类型：</td>
		<td>
		<c:if test="${module.ctype==1 }">主菜单</c:if>
		<c:if test="${module.ctype==2 }">侧边菜单</c:if>
		<c:if test="${module.ctype==3 }">按钮</c:if>
		</td>
	</tr>
	
	
	
	<tr>
		<td>模块状态：</td>
		<td>
			<c:if test="${module.state==0 }">停用</c:if>
			<c:if test="${module.state==1 }">启用</c:if>
		</td>
	</tr>
	<tr>
		<td>模块介绍：</td>
		<td>${module.remark}</td>
	</tr>


</table>
</div>
 
</div>
 
 
</form>
</body>
</html>

