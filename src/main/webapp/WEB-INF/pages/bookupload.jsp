<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>用户书籍上传</title>
		<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" href="<%=request.getContextPath() %>/staticfile/css/bookupload.css"/>
	    <script src="<%=request.getContextPath() %>/staticfile/js/jquery-1.4.2.js"></script>
	    <script src="<%=request.getContextPath() %>/staticfile/jsbookupload.js"></script>
	    <script >
	    </script>
	</head>
	<body>
	<%@include file="_head.jsp" %>
		<form  onsubmit="return checkForm()"
		action="<%= request.getContextPath() %>/servlet/RegistServlet" method="POST">
		
			<h1>书籍上传</h1>
			<table>
			    <tr>
			        <td >
			            <input type="hidden" name="userId" values="${userId}"/>
			        </td>
			    </tr>  
				<tr>
					<td class="tds">书籍名称：</td>
					<td>
						<input type="text" name="bookName" 
						       onblur="checkNull('bookName','书籍名称不能为空')"
						       value="<%=request.getParameter("bookName")==null
						       ?"" : request.getParameter("bookName") %>"
						       />
					<span id="username_msg"></span>
					</td>
				</tr>
				<tr>
					<td class="tds">书籍作者：</td>
					<td>
						<input type="text" name="bookAuthor"
						onblur="checkNull('password','书籍作者不能为空!')"
						value="<%=request.getParameter("bookAuthor")==null
						       ?"" : request.getParameter("bookAuthor") %>"
						/>
						<span></span>
					</td>
				</tr>
				<tr>
					<td class="tds">书籍出版社：</td>
					<td>
						<input type="text" name="press"
						 onblur="checkPassword('press','出版社不能为空!')"
						 value="<%=request.getParameter("press")==null
						       ?"" : request.getParameter("press") %>"
						/>
						<span></span>
					</td>
				</tr>
				<tr>
					<td class="tds">书籍出版日期：</td>
					<td>
						<input type="text" name="createTime"
						 onblur="checkPassword('createTime','出版社日期不能为空!')"
						 value="<%=request.getParameter("createTime")==null
						       ?"" : request.getParameter("createTime") %>"
						/>
						<span></span>
					</td>
				</tr>
				<tr>
				    <td class="tds">书籍类别：</td>
				    <td>
				       <select name="bookInfo.category">
                       <option value="4">-科技-</option>
                       <option value="3">-生活-</option>
                       <option value="2">-文学-</option>
                       <option value="1">-经济-</option>
                       <option value="0" selected="selected">-其它-</option>
                       </select>
                       <span></span>
				    </td>
				</tr>
				<tr>
					<td class="tds">书籍照片：</td>
					<td>
						<input type="file" name="bookInfo.imgurl"/>
						<span></span>
					</td>
				</tr>
				</tr>
				<tr>
					<td class="sub_td" colspan="2" class="tds">
						<input type="submit" value="上传"/>
				    </td>
				</tr>
			</table>
		</form>
		<%@include file="_foot.jsp" %>
	</body>
</html>




