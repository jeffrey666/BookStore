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
<script>
	
</script>
</head>
<%@include file="_head.jsp"%>
<body>
	<div id="wrap">

		<%--  <div class="header">
       		<div class="logo"><a href="index.html"><img src="${app}/staticfile/images/logo.gif" alt="" title="" border="0" /></a></div>            
        <div id="menu">
         <ul>                                                                       
      			<li id="back"><a href="#" onclick="window.history.back();">返回</a></li>
       <!--      <li><a href="index.html"></a></li>
            <li><a href="about.html"></a></li>
            <li><a href="category.html"></a></li>
            <li><a href="specials.html"></a></li>
            <li><a href="myaccount.html"</a></li>
            <li class="selected"><a href="register.html"></a></li>
            <li><a href="details.html"></a></li>
            <li><a href="contact.html"></a></li> -->
            </ul> 
        </div>     
            
            
       </div>  --%>



		<div class="center_content">
			<div class="left_content">
				<form onsubmit="return checkForm()"
					action="<%=request.getContextPath()%>/saveBookUpload.action"
					method="POST" enctype="multipart/form-data">

					<h1 id="tt">书籍上传</h1>
					<table>
						<tr>
							<td><input type="hidden" name="userId" values="${userId}" />
							</td>
						</tr>
						<tr>
							<td class="tds">书籍名称：</td>
							<td><input type="text" name="bookName"
								onblur="checkNull('bookName','书籍名称不能为空')"
								value="<%=request.getParameter("bookName") == null ? "" : request.getParameter("bookName")%>" />
								<span></span></td>
						</tr>
						<tr>
							<td class="tds">书籍作者：</td>
							<td><input type="text" name="bookAuthor"
								onblur="checkNull('bookAuthor','书籍作者不能为空!')"
								value="<%=request.getParameter("bookAuthor") == null ? "" : request.getParameter("bookAuthor")%>" />
								<span></span></td>
						</tr>
						<tr>
							<td class="tds">书籍出版社：</td>
							<td><input type="text" name="press"
								onblur="checkNull('press','出版社不能为空!')"
								value="<%=request.getParameter("press") == null ? "" : request.getParameter("press")%>" />
								<span></span></td>
						</tr>
						<tr>
							<td class="tds">书籍出版日期：</td>
							<td><input type="text" name="createTime"
								onblur="checkNull('createTime','出版社日期不能为空!')"
								value="<%=request.getParameter("createTime") == null ? "" : request.getParameter("createTime")%>" />
								<span></span></td>
						</tr>
						<tr>
							<td class="tds">书籍类别：</td>
							<td><select name="bookInfo.category">
									<option value="4">-科技-</option>
									<option value="3">-生活-</option>
									<option value="2">-文学-</option>
									<option value="1">-经济-</option>
									<option value="0" selected="selected">-其它-</option>
							</select> <span></span></td>
						</tr>
						<tr>
							<td class="tds">书籍照片：</td>
							<td><input type="file" name="bookInfo.imgurl" /> <span></span>
							</td>
						</tr>
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

				<div class="languages_box">

					<span class="red">Languages:</span> <a href="#"><img
						src="${app}/staticfile/images/gb.gif" alt="" title="" border="0" /></a>
					<a href="#"><img src="${app}/staticfile/images/fr.gif" alt=""
						title="" border="0" /></a> <a href="#"><img
						src="${app}/staticfile/images/de.gif" alt="" title="" border="0" /></a>

				</div>
				<div class="currency">
					<span class="red"> </span> <a href="#"></a> <a href="#"></a> <a
						href="#"><strong></strong></a>
				</div>


				<div class="cart">

					<div class="title">
						<span class="title_icon"><img
							src="${app}/staticfile/images/cart.gif" alt="" title="" /></span>My
						cart
					</div>

					<div class="home_cart_content">
						<span class="red"></span>
					</div>

					<a href="/tocart" class="view_cart">view cart</a>

				</div>

				<div class="title">
					<span class="title_icon"><img
						src="${app}/staticfile/images/bullet3.gif" alt="" title="" /></span>About
					Our Store
				</div>
				<div class="about">
					<p>
						<img src="images/about.gif" alt="" title="" class="right" />

					</p>

				</div>

				<div class="right_box">


					<div class="title">
						<span class="title_icon"><img
							src="${app}/staticfile/images/bullet4.gif" alt="" title="" /></span>Promotions
					</div>

					<div class="new_prod_box">
						<a href="details.html"></a>
						<div class="new_prod_bg">
							<span class="new_icon"><img
								src="${app}/staticfile/images/promo_icon.gif" alt="" title="" /></span>
							<a href="details.html"><img
								src="${app}/staticfile/images/thumb1.gif" alt="" title=""
								class="thumb" border="0" /></a>
						</div>
					</div>

					<div class="new_prod_box">
						<a href="details.html"></a>
						<div class="new_prod_bg">
							<span class="new_icon"><img
								src="${app}/staticfile/images/promo_icon.gif" alt="" title="" /></span>
							<a href="details.html"><img
								src="${app}/staticfile/images/thumb2.gif" alt="" title=""
								class="thumb" border="0" /></a>
						</div>
					</div>

					<div class="new_prod_box">
						<a href="details.html"></a>
						<div class="new_prod_bg">
							<span class="new_icon"><img
								src="${app}/staticfile/images/promo_icon.gif" alt="" title="" /></span>
							<a href="details.html"><img
								src="${app}/staticfile/images/thumb3.gif" alt="" title=""
								class="thumb" border="0" /></a>
						</div>
					</div>

				</div>

				<div class="right_box">


					<div class="title">
						<span class="title_icon"><img
							src="${app}/staticfile/images/bullet5.gif" alt="" title="" /></span>Categories
					</div>

					<ul class="list">
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
					</ul>


					<div class="title">
						<span class="title_icon"><img
							src="${app}/staticfile/images/bullet6.gif" alt="" title="" /></span>Partners
					</div>


					<ul class="list">
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
					</ul>

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
>>>>>>> master
</html>




