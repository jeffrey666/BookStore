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
	<li id="view"><a href="#" onclick="formSubmit('toview','_self');this.blur();">查看</a></li>
	<li id="new"><a href="#" onclick="formSubmit('tocreate','_self');this.blur();">新增</a></li>
	<li id="update"><a href="#" onclick="formSubmit('toupdate','_self');this.blur();">修改</a></li>
	<li id="delete"><a href="#" onclick="formSubmit('backdelete','_self');this.blur();">删除</a></li>
	<li id="new"><a href="#" onclick="formSubmit('start','_self');this.blur();">启用</a></li>
	<li id="new"><a href="#" onclick="formSubmit('stop','_self');this.blur();">停用</a></li>
	<li id="new"><a href="#" onclick="formSubmit('role','_self');this.blur();">角色</a></li>
</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="../../staticfile/images/currency_yen.png"/>
    用户列表
  </div> 
  
<div>


<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%" >
	<thead>
	<tr>
		<td class="tableHeader"><input type="checkbox" name="selid" onclick="checkAll('userId',this)"></td>
		<td class="tableHeader">序号</td>
		<td class="tableHeader">用户名</td>
		<td class="tableHeader">昵称</td>
		<td class="tableHeader">性别</td>
		<td class="tableHeader">邮箱</td>
		<td class="tableHeader">地址</td>
		<td class="tableHeader">电话号码</td>
		<td class="tableHeader">身份证号</td>
		<td class="tableHeader">用户积分</td>
		<td class="tableHeader">用户状态</td>
	</tr>
	</thead>
	<tbody class="tableBody" >
	
	<c:forEach items="${userList}" var="u" varStatus="status">
	<tr class="odd" onmouseover="this.className='highlight'" onmouseout="this.className='odd'">
		<td><input type="checkbox" name="id" value="${u.id}"/></td>
		<td>${status.index+1}</td>
		<td>${u.username}</td>
		<td><a href="toview?id=${u.id}">${u.userInfo.nickname}</a></td>
		<%-- <td>${u.userInfo.gender}</td> --%>
		<td>13213213</td>
		<td>${u.userInfo.email}</td>
		<td>${u.userInfo.address}</td>
		<td>${u.userInfo.telephone}</td>
		<td>${u.userInfo.cardNo}</td>
		<td>${u.userInfo.score}</td>
		<td>
			<c:if test="${u.state==1}"><a href="stop?id=${u.id}"><font color="green">启用</font></a></c:if>
			<c:if test="${u.state==0}"><a href="start?id=${u.id}"><font color="red">停用</font></a></c:if>
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

