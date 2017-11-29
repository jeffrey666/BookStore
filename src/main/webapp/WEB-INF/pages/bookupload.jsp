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
	
</script>

</head>
<%@include file="_head.jsp"%>
<body>
	<div id="wrap">
		<div class="center_content">
			<div class="left_content">
				<form onsubmit="return checkForm()"
					action="<%=request.getContextPath()%>/saveBookUpload.action"
					method="POST" enctype="multipart/form-data">

					<h1 id="tt">书籍上传</h1>
					<table>
						
					
						<tr>
							<td class="tds">书籍名称：</td>
							<td><input type="text" name="bookName"
								onblur="checkNull('bookName','书籍名称不能为空')"
								 />
								<span></span></td>
						</tr>
						<tr>
							<td class="tds">书籍作者：</td>
							<td><input type="text" name="bookInfo.author"
								onblur="checkNull('bookInfo.author','书籍作者不能为空!')"
								/>
								<span></span></td>
						</tr>
						<tr>
							<td class="tds">书籍出版社：</td>
							<td><input type="text" name="bookInfo.bookPub"
								onblur="checkNull('bookInfo.bookPub','出版社不能为空!')"
								 />

								<span></span></td>
						</tr>
						<tr>
							<td class="tds">书籍出版日期：</td>
							<td><input type="date" name="bookInfo.pubDate"
								onblur="checkNull('bookInfo.pubDate','出版社日期不能为空!')"
								/>

								<span></span></td>
						</tr>
						<tr>
							<td class="tds">书籍类别：</td>
							<td><select name="bookInfo.category">
								<option value="其他"  selected="selected">其他</option>
								<option value="文学类">文学类</option>
								<option value="小说类">小说类</option>
								<option value="IT类">IT类</option>
								<option value="艺术与摄影类" >艺术与摄影类</option>
								<option value="军事类">军事类</option>
								<option value="辅导教材类" >辅导教材类</option>
								<option value="历史类" >历史类</option>
							</select> <span></span></td>
						</tr>
						<tr>
							<td class="tds">书籍照片：</td>
							<td><input type="file" name="picFile"/> <span></span>
							</td>
						</tr>
						
						<tr>
							<td class="tds">书籍简介：</td>
							<td>
								<textarea id="descripe" name="bookInfo.descripe" rows="5px" cols="20px" onblur="checkdescripe('bookInfo.descripe','书籍简介不能为空!')" ></textarea>
								<span></span>
							</td>
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
            <span class="red">Languages:</span>
            <a href="#" class="selected"><img src="${app}/staticfile/images/gb.gif" alt="" title="" border="0" /></a>
            <a href="#"><img src="images/fr.gif" alt="" title="" border="0" /></a>
            <a href="#"><img src="images/de.gif" alt="" title="" border="0" /></a>
            </div>
                <div class="currency">
                <span class="red">Currency: </span>
                <a href="#">GBP</a>
                <a href="#">EUR</a>
                <a href="#" class="selected">USD</a>
                </div>
                
                
              <div class="cart">
                  <div class="title"><span class="title_icon"><img src="${app}/staticfile/images/cart.gif" alt="" title="" /></span>My cart</div>
                  <div class="home_cart_content">
                  3 x items | <span class="red">TOTAL: 100$</span>
                  </div>
                  <a href="/search/toborrow" class="view_cart">view cart</a>
              
              </div>
                       
            	
        
        
             <div class="title"><span class="title_icon"><img src="${app}/staticfile/images/bullet3.gif" alt="" title="" /></span>About Our Store</div> 
             <div class="about">
             <p>
             <img src="${app}/staticfile/images/about.gif" alt="" title="" class="right" />
             Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.
             </p>
             
             </div>
             
             <div class="right_box">
             
             	<div class="title"><span class="title_icon"><img src="${app}/staticfile/images/bullet4.gif" alt="" title="" /></span>Promotions</div> 
                    <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="${app}/staticfile/images/promo_icon.gif" alt="" title="" /></span>
                        <a href="details.html"><img src="${app}/staticfile/images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
                    
                    <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="${app}/staticfile/images/promo_icon.gif" alt="" title="" /></span>
                        <a href="details.html"><img src="${app}/staticfile/images/thumb2.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>                    
                    
                    <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="${app}/staticfile/images/promo_icon.gif" alt="" title="" /></span>
                        <a href="details.html"><img src="${app}/staticfile/images/thumb3.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>              
             
             </div>
             
             <div class="right_box">
             
             	<div class="title"><span class="title_icon"><img src="${app}/staticfile/images/bullet5.gif" alt="" title="" /></span>Categories</div> 
                
                <ul class="list">
                <li><a href="#">accesories</a></li>
                <li><a href="#">books gifts</a></li>
                <li><a href="#">specials</a></li>
                <li><a href="#">hollidays gifts</a></li>
                <li><a href="#">accesories</a></li>
                <li><a href="#">books gifts</a></li>
                <li><a href="#">specials</a></li>
                <li><a href="#">hollidays gifts</a></li>
                <li><a href="#">accesories</a></li>
                <li><a href="#">books gifts</a></li>
                <li><a href="#">specials</a></li>                                              
                </ul>
                
             	<div class="title"><span class="title_icon"><img src="${app}/staticfile/images/bullet6.gif" alt="" title="" /></span>Partners</div> 
                
                <ul class="list">
                <li><a href="#">accesories</a></li>
                <li><a href="#">books gifts</a></li>
                <li><a href="#">specials</a></li>
                <li><a href="#">hollidays gifts</a></li>
                <li><a href="#">accesories</a></li>
                <li><a href="#">books gifts</a></li>
                <li><a href="#">specials</a></li>
                <li><a href="#">hollidays gifts</a></li>
                <li><a href="#">accesories</a></li>                              
                </ul>      
             
             </div>         
             
        
        </div><!--end of right content-->




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




