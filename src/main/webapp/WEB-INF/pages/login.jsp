<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="app" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Book Store</title>
<link rel="stylesheet" type="text/css" href="${app}/staticfile/css/style.css" />
</head>

<%@include file="_head.jsp" %>
<body>
<div id="wrap">

       <div class="center_content">
       	<div class="left_content">
            <div class="title"><span class="title_icon"><img src="${app}/staticfile/images/bullet1.gif" alt="" title="" /></span>LOGIN</div>
        
        	<div class="feat_prod_box_details">
            <p class="details">
            	欢迎来到jieshu
            </p>
            
              	<div class="contact_form">
                <div class="form_subtitle">登录</div>
                 	
                 	
                 	<div class="details">
				<c:if test="${!empty errorInfo}">
					${errorInfo}
				</c:if>
					</div>	
                 
                 
                  <form name="register" action="tologin.action">          
                    <div class="form_row">
                    <label class="contact"><strong>用户名:</strong></label>
                    <input name="username" type="text" class="contact_input" />
                    </div>  


                    <div class="form_row">
                    <label class="contact"><strong>密码:</strong></label>
                    <input name="password" type="password" class="contact_input" />
                    </div> 
                   
                   
             

                    
                    <div class="form_row">
                    <input type="submit" class="register" value="登录" />
                    </div>   
                  </form>     
                </div>  
            
          </div>	

              

            

            
        <div class="clear"></div>
        </div><!--end of left content-->
        
        <div class="right_content">
        
                	<div class="languages_box">

            <span class="red">Languages:</span>
            <a href="#"><img src="${app}/staticfile/images/gb.gif" alt="" title="" border="0" /></a>
            <a href="#"><img src="${app}/staticfile/images/fr.gif" alt="" title="" border="0" /></a>
            <a href="#"><img src="${app}/staticfile/images/de.gif" alt="" title="" border="0" /></a>
            </div>
                <div class="currency">
                <span class="red">Currency: </span>
                <a href="#">GBP</a>
                <a href="#">EUR</a>
                <a href="#"><strong>USD</strong></a>

                </div>
                
                
              <div class="cart">

                  <div class="title"><span class="title_icon"><img src="${app}/staticfile/images/cart.gif" alt="" title="" /></span>My cart</div>
                  <div class="home_cart_content">
                  3 x items | <span class="red">TOTAL: 100$</span>
                  </div>
                  <a href="/tocart" class="view_cart">view cart</a>
              
              </div>
        
             <div class="title"><span class="title_icon"><img src="${app}/staticfile/images/bullet3.gif" alt="" title="" /></span>About Our Store</div> 
             <div class="about">
             <p>
             <img src="images/about.gif" alt="" title="" class="right" />
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
       </div><!--end of center content-->
       


</div>

</body>

<%@include file="_foot.jsp" %>

</html>