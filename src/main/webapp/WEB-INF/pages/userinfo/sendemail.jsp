<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Book email</title>

</head>
<%@include file="../_head.jsp"%>
<body>
	<h1 style="text-align:center">邮件发送</h1>
	    <form action="sendemail" method="post">
        <table  width="100%" height="100%" align="center" style="_margin-top:2%;">
        <td align="center" valign="middle">
        <input type="text" name="email" />
        <input type="submit" value="提交"/>
        </td>
        
        </table>
        </form>
    </form>
</body>
<%@include file="../_foot.jsp"%>
</html>