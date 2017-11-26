<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
		<title>err page</title>
	</head>
	<body>
		
		<%@include file="_head.jsp" %>
		
		${requestScope.errMsg }
		
		<%@include file="_foot.jsp" %>
		
	</body>
</html>