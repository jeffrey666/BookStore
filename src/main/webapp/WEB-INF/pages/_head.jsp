<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${app}/staticfile/css/style.css" />
	</head>
<body>
<div id="wrap">
<div class="header">
       		<div class="logo"><a href="index.html" target="_top" ><img src="${app}/staticfile/images/logo.gif" alt="" title="" border="0" /></a></div>            
        <div id="menu">
        
            <ul>                                                                       
            <li class="selected"><a href="/" target="_top" >主页</a></li>
            <li><a href="/tosearch" target="_top" >搜索</a></li>
            <li><a href="/tocategory" target="_top" >分类</a></li>
            <li><a href="/topsellers" target="_top" >热门书籍</a></li>
            <li><a href="/user/userinfo.action" target="_top" >用户详情</a></li>

            <li><a href="/bookupload" target="_top" >上传图书</a></li>

            <li>
			<c:choose>
				<c:when test="${sessionScope._CURRENT_USER == null}">
					<a href="/toregist" target="_top" >注册</a>
					<a href="${app}/tologin" target="_top" >登录</a>
				</c:when>
				<c:otherwise>
					
					<a   href="${app}/tologout"   target="_top" >您好：${_CURRENT_USER.username}&nbsp;&nbsp;注销</a>				
				</c:otherwise>
			</c:choose>
            </li>
            </ul>
        </div>     
            
            
       </div> 
</div>
</body>