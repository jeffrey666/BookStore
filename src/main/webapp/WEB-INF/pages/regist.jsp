<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Book Store</title>
<link rel="stylesheet" type="text/css"
	href="${app}/staticfile/css/style.css" />
<script src="${app }/staticfile/js/jquery-1.6.2.js"></script>
<script src="${app }/staticfile/js/regist.js"></script>
<script>
	function checkUsername(thisObj) {
		var username = thisObj.value;
		if ($.trim(username) == "") {
			setMsg("username", "用户名不能为空");
			return;
		}
		$("#username_msg").load("/AjaxCheckUsername.action", {
			"username" : username
		});
	}
</script>
</head>
<%@include file="_head.jsp"%>
<body>
	<div id="wrap">




		<div class="center_content">
			<div class="left_content">
				<div class="title">
					<span class="title_icon"><img
						src="${app}/staticfile/images/bullet1.gif" alt="" title="" /></span>REGIST
				</div>

				<div class="feat_prod_box_details">
					<p class="details">欢迎注册Book
						Store，完成注册后请至个人中心完善信息。。。注册成功后将跳转至主页。。</p>

					<div class="contact_form">
						<div class="form_subtitle">注册新用户</div>


						<div class="details">
							<c:if test="${!empty errorInfo}">
								${errorInfo}
							</c:if>
						</div>


						<form name="register" onsubmit=" return checkForm()"
							action="toregist.action">
							<div class="form_row">
								<label class="contact"><strong>用户名:</strong></label> <input
									onblur="checkUsername(this)" name="username" type="text"
									class="contact_input" /> <span id="username_msg">${msg }</span>
							</div>


							<div class="form_row">
								<label class="contact"><strong>密码:</strong></label> <input
									onblur="checkNull('password','密码不能为空')" name="password"
									type="password" class="contact_input" /> <span>${msg }</span>
							</div>

							<div class="form_row">
								<label class="contact"><strong>确认密码:</strong></label> <input
									onblur="checkPassword('password','两次密码不一致')" name="password2"
									type="password" class="contact_input" /> <span>${msg }</span>
							</div>

							<!--   <div class="form_row">
                    <label class="contact"><strong>Email:</strong></label>
                    <input type="text" class="contact_input" />
                    </div>


                    <div class="form_row">
                    <label class="contact"><strong>Phone:</strong></label>
                    <input type="text" class="contact_input" />
                    </div>
                    
                    <div class="form_row">
                    <label class="contact"><strong>Company:</strong></label>
                    <input type="text" class="contact_input" />
                    </div>
                    
                    <div class="form_row">
                    <label class="contact"><strong>Adrres:</strong></label>
                    <input type="text" class="contact_input" />
                    </div>      -->

							<!--   <div class="form_row">
                        <div class="terms">
                        <input type="checkbox" name="terms" />
                        I agree to the <a href="#">terms &amp; conditions</a>                        </div>
                    </div>  -->


							<div class="form_row">
								<input type="submit" class="register" value="注册" />
							</div>
						</form>
					</div>

				</div>






				<div class="clear"></div>
			</div>
			<!--end of left content-->

			<div class="right_content">


				<div class="cart">
					<div class="title">
						<span class="title_icon"><img
							src="${app}/staticfile/images/cart.gif" alt="" title="" /></span>My
						cart
					</div>
					<div class="home_cart_content">
						3 x items | <span class="red">TOTAL: 100$</span>
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