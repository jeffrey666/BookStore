<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>

<head>
<title>用户书籍上传</title>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/staticfile/css/bookupload.css" />
<script
	src="<%=request.getContextPath()%>/staticfile/js/jquery-1.6.2.js"></script>
<script src="<%=request.getContextPath()%>/staticfile/js/bookupload.js"></script>
<script type="text/javascript">
	function validate_img(a) {
		var file = a.value;
		if (!/.(gif|jpg|jpeg|png|GIF|JPG|png)$/.test(file)) {
			alert("图片类型必须是.gif,jpeg,jpg,png中的一种");
			var obj = document.getElementById('pic');
			obj.outerHTML = obj.outerHTML;
			return false;
		} else {
			var fileSize = document.getElementById("pic").files[0].size / 1024;
			if (fileSize > 1024) {
				alert('请上传大小小于1M的图片');
				var obj = document.getElementById('pic');
				obj.outerHTML = obj.outerHTML;
				return false;
			}
		}
		alert("图片通过");
	}
</script>

</head>
<%@include file="_head.jsp"%>
<body>
	<div id="wrap">
		<div class="center_content">
			<div class="left_content">
				<c:if test="${_CURRENT_USER.userInfo.score<10 }">
					<span style="color: red; text-align: center">${shortOfScore}</span>
				</c:if>
				<form onsubmit="return checkForm()"
					action="<%=request.getContextPath()%>/saveBookUpload.action"
					method="POST" enctype="multipart/form-data">
					<h1 id="tt">书籍上传</h1>
					<table>


						<tr>
							<td class="tds">书籍名称：</td>
							<td><input type="text" name="bookName"
								onblur="checkNull('bookName','书籍名称不能为空')" /> <span></span></td>
						</tr>
						<tr>
							<td class="tds">书籍作者：</td>
							<td><input type="text" name="bookInfo.author"
								onblur="checkNull('bookInfo.author','书籍作者不能为空!')" /> <span></span></td>
						</tr>
						<tr>
							<td class="tds">出版 社：</td>
							<td><input type="text" name="bookInfo.bookPub"
								onblur="checkNull('bookInfo.bookPub','出版社不能为空!')" />

								<span></span></td>
						</tr>
						<tr>
							<td class="tds">出版日期：</td>
							<td><input type="date" name="bookInfo.pubDate"
								onblur="checkNull('bookInfo.pubDate','出版社日期不能为空!')" />

								<span></span></td>
						</tr>
						<tr>
							<td class="tds">书籍类别：</td>
							<td><select name="bookInfo.category">
									<option value="其他" selected="selected">其他</option>
									<option value="文学类">文学类</option>
									<option value="小说类">小说类</option>
									<option value="IT类">IT类</option>
									<option value="艺术与摄影类">艺术与摄影类</option>
									<option value="军事类">军事类</option>
									<option value="辅导教材类">辅导教材类</option>
									<option value="历史类">历史类</option>
							</select> <span></span></td>
						</tr>
						<tr>
							<td class="tds">书籍照片：</td>
							<td><input id="pic" type="file" name="picFile"
								onchange="Javascript:validate_img(this);"
								onblur="checkNull('picFile','书籍图片不能为空!')" /> <span></span></td>
						</tr>

						<tr>
							<td class="tds">书籍简介：</td>
							<td><textarea id="descripe" name="bookInfo.descripe"
									rows="5px" cols="20px"
									onblur="checkdescripe('bookInfo.descripe','书籍简介不能为空!')"></textarea>
								<span></span></td>
						</tr>
						<tr>
							<td class="sub_td" colspan="2" class="tds"><input
								type="submit" value="上传" /></td>
						</tr>
					</table>
				</form>
			</div>
			<!--end of left content-->

			<div class="right_content">


				<div class="cart">
					<div class="title">
						<span class="title_icon"><img
							src="${app}/staticfile/images/cart.gif" alt="" title="" /></span>My
						cart
					</div>
					<a href="/search/toborrow" class="view_cart">我的借阅</a>
				</div>

				<div class="title">
					<span class="title_icon"><img
						src="${app}/staticfile/images/bullet3.gif" alt="" title="" /></span>Welcome
					to our Book Store!
				</div>
				<div class="about">
					<p>
						<%@include file="graphCopy.jsp"%>
					</p>
				</div>
			</div>
		</div>
		<!--end of right content-->

		<div class="clear"></div>
	</div>
	<!--end of center content-->


	<%--        
       <div class="footer">

       	<div class="left_footer"><img src="${app}/staticfile/images/footer_logo.gif" alt="" title="" /><br /> <a href="http://www.cssmoban.com/" title="free templates">cssmoban</a></div>

        <div class="right_footer">
        <a href="#"></a>
        <a href="#"></a>
        <a href="#"></a>
        <a href="#"></a>
        <a href="#"></a>
       
        </div>
        
       
       </div> --%>



	</div>
</body>
<%@include file="_foot.jsp"%>
</html>




