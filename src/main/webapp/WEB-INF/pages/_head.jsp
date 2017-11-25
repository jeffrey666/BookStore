<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>

<link rel="stylesheet" href="<%= request.getContextPath() %>/staticfile/css/head.css"/>

<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />

<div id="common_head">
	<div id="line1">
		<div id="content">
			<c:choose>
				<c:when test="${sessionScope._CURRENT_USER == null}">
					<a href="${pageContext.request.contextPath}/login.jsp">登录</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="${pageContext.request.contextPath}/regist.jsp">注册</a>
				</c:when>
				<c:otherwise>
					${sessionScope._CURRENT_USER.username} &nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="${pageContext.request.contextPath}/servlet/LogoutServlet">注销</a>				
				</c:otherwise>
			</c:choose>
			
		</div>
	</div>
	
	<div id="line2">
		<%-- <img id="logo" src="<%= request.getContextPath() %>/img/head/logo.jpg"/> --%>
		<input type="text" name=""/>
		<input type="button" value="搜 索"/>
		<span id="goto">
			<%-- <a id="goto_order" href="${requestScope.contextPath }/servlet/OrderListServlet">我的订单</a> --%>
			<%-- <a id="goto_cart" href="${requestScope.contextPath }/cart.jsp">我的购物车</a> --%>
		</span>
	</div>
	<div id="line3">
		<div id="content">
			<ul>
				<li><a href="<%= request.getContextPath() %>/">首页</a></li>
				<%-- <li><a href="<%= request.getContextPath() %>/servlet/ProdListServlet">全部图书</a></li> --%>
			</ul>
		</div>
	</div>
</div>