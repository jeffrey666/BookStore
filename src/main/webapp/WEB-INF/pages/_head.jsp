<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${app}/staticfile/css/style.css" />
	</head>
<body>
<div id="wrap">
<div class="header">
       		<div class="logo"><a href="index.html"><img src="${app}/staticfile/images/logo.gif" alt="" title="" border="0" /></a></div>            
        <div id="menu">
            <ul>                                                                       
            <li class="selected"><a href="index.html">主页</a></li>
            
            
            <li><a href="category.html">搜索</a></li>
            <li><a href="specials.html">精品书</a></li>
            <li><a href="/regist">注册</a></li>
            <li><a href="details.html">价格</a></li>
            <li><a href="contact.html">联系</a></li>
            <li><a href="myaccount.html">用户详情</a></li>
            <li><a href="about.html">关于我们</a></li>
            <li>
			<c:choose>
				<c:when test="${sessionScope._CURRENT_USER == null}">
					<a href="${app}/login">登录</a>
				</c:when>
				<c:otherwise>
					<a href="${app}/logout">注销</a>				
				</c:otherwise>
			</c:choose>
            </li>
            </ul>
        </div>     
            
            
       </div> 
</div>
</body>