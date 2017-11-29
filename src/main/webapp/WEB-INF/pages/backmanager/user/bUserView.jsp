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
	<li id="new"><a href="#" onclick="window.history.back();this.blur();">返回</a></li>
</ul>
  </div>
</div>
</div>
</div>
   
  <div class="textbox-title">
	<img src="../../staticfile/skin/default/images/icon/currency_yen.png"/>
    用户查看
  </div> 
  
<div>


<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%" >
	
	<tr>
		<td>用户名</td>
		<td>${user.username}</td>
	</tr>
	<tr class="odd">
	    <td>用户昵称</td>
	    <td>${user.userInfo.nickname}</td>
	</tr>
	<tr class="odd">
	    <td>性别:</td>
	    <td>
	       ${user.userInfo.gender} 
	    </td>
	</tr>
	<tr class="odd">
	  <td>用户身份证号：</td>
	  <td>
	     ${user.userInfo.cardNo }
	  </td>
	</tr>
	<tr class="odd">
	  <td>用户电话号码：</td>
	  <td>
	    ${user.userInfo.telephone}
	  </td>
	</tr>
	<tr class="odd">
	  <td>用户邮箱：</td>
	  <td>
	     ${user.userInfo.email}
	  </td>
	</tr>
	<tr class="odd">
	  <td>用户地址：</td>
	  <td>
	     ${user.userInfo.address}
	  </td>
	</tr>
	<tr class="odd">
	  <td>用户积分：</td>
	  <td>
	     ${user.userInfo.score}
	  </td>
	</tr>
	<tr class="odd">
	  <td>用户状态：</td>
	  <td>
	     <c:if test="${user.state==0 }">停用</c:if>
	     <c:if test="${user.state==1 }">启用</c:if>
	  </td>
	</tr>
	
	
</table>
</div>
 
</div>
 
 
</form>
</body>
</html>

