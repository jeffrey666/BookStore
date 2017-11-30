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
<script src="https://cdn.bootcss.com/jquery/1.4.2/jquery.js"></script>
<script type="text/javascript">
	function checkEmail() {
		promptMsg("text", "userInfo.email", "");
		hideVerifyEmailButton();

		$oEmail = $("input[type='text'][name='userInfo.email']");
		$oOldEmail = $("input[type='hidden'][name='old_userInfo.email']");
		if ($oOldEmail.val() == $oEmail.val()) {

			return;
		}

		isOK = true;

		if (isOK) {
			reg = /^\w+@\w+(\.[a-zA-Z]+)+$/;

			if (!reg.test($oEmail.val())) {
				isOK = false;

				promptMsg("text", "userInfo.email", "邮箱格式不正确");
			}
		}

		if (isOK) {
			showVerifyEmailButton();
		}

		return isOK;
	}

	function promptMsg(type, name, msg) {
		$span = $("input[type='" + type + "'][name='" + name + "']+span");
		$span.css("color", "red").text(msg);
	}

	function showVerifyEmailButton() {
		$button = $("input[type='button'][value='验证邮箱']");
		$button.attr("hidden", "");
	}

	function hideVerifyEmailButton() {
		$button = $("input[type='button'][value='验证邮箱']");
		$button.attr("hidden", "hidden");
	}

	function onclickVerifyEamil(thisobj) {
		$verifyEamilButton = $(thisobj);
		$oTextEmail = $("input[type='text'][name='userInfo.email']");
		$oUserIdHidden = $("input[type='hidden'][name='id']");

		$.post("/user/wantChangeEmail.action", {
			"user_id" : $oUserIdHidden.val(),
			"new_email" : $oTextEmail.val()
		}, function(result) {
		});

		alert("已发送邮箱，请验证");
		$verifyEamilButton.attr("disabled", "disabled");
		$oTextEmail.attr("readonly", "readonly");

	}
</script>
</head>
<%@include file="../_head.jsp"%>
<body>
	<form name="icform" method="post" target="_self"
		action="/user/userinfo/update">

		<div id="wrap">



			<div class="center_content">
				<div class="left_content">
					<div class="title">
						<span class="title_icon"><img
							src="${app}/staticfile/images/bullet1.gif" alt="" title="" /></span>个人中心
					</div>

					<div class="feat_prod_box_details">
						<p class="details"></p>

						<div class="contact_form">
							<div class="form_subtitle">修改个人信息</div>


							<div class="details">
								<c:if test="${!empty errorInfo}">
								${errorInfo}
							</c:if>
							</div>

							<div>
								<input name="id" value="${_CURRENT_USER.id } " type="hidden">
							</div>
							<div>
								<input name="userInfo.userInfoId"
									value="${_CURRENT_USER.userInfo.userInfoId } " type="hidden">
							</div>

							<div class="form_row">
								<label class="contact"><strong>用户名:</strong></label> <input
									class="contact_input" type="text" name="username"
									value="${_CURRENT_USER.username }" readonly="readonly" />
							</div>


							<div class="form_row">
								<label class="contact"><strong>状态:</strong></label> <input
									disabled="disabled" type="radio" name="state" value="1"
									<c:if test="${_CURRENT_USER.state==1 }">checked="checked"</c:if> />启用
								<input disabled="disabled" type="radio" name="state" value="0"
									<c:if test="${_CURRENT_USER.state==0 }">checked="checked"</c:if> />关闭

							</div>

							<div class="form_row">
								<label class="contact"><strong>昵称:</strong></label> <input
									class="contact_input" type="text" name="userInfo.nickname"
									value="${_CURRENT_USER.userInfo.nickname }" />
							</div>


							<div class="form_row">
								<label class="contact"><strong>email:</strong></label> <input
									type="hidden" name="old_userInfo.email"
									value="${_CURRENT_USER.userInfo.email }" /> <input
									class="contact_input" type="text" name="userInfo.email"
									value="${_CURRENT_USER.userInfo.email }" onblur="checkEmail()" />
								<span></span> <input hidden="hidden" class="register"
									style="width: 60px; height: 18px; font-size: 10px"
									type="button" value="验证邮箱" onclick="onclickVerifyEamil(this)" />

							</div>

							<div class="form_row">
								<label class="contact"><strong>性别:</strong></label> <input
									class="contact_input" type="text" name="userInfo.gender"
									value="${_CURRENT_USER.userInfo.gender }" />
							</div>

							<div class="form_row">
								<label class="contact"><strong>地址:</strong></label> <input
									class="contact_input" type="text" name="userInfo.address"
									value="${_CURRENT_USER.userInfo.address }" />
							</div>


							<div class="form_row">
								<label class="contact"><strong>身份证号:</strong></label> <input
									class="contact_input" type="text" name="userInfo.cardNo"
									value="${_CURRENT_USER.userInfo.cardNo }" />
							</div>

							<div class="form_row">
								<label class="contact"><strong>积分:</strong></label> <input
									class="contact_input" type="text" name="userInfo.score"
									value="${_CURRENT_USER.userInfo.score }" readonly="readonly" />

							</div>


							<div class="form_row">
								<label class="contact"><strong>电话号码:</strong></label> <input
									class="contact_input" type="text" name="userInfo.telephone"
									value="${_CURRENT_USER.userInfo.telephone }" />
							</div>


							<div class="form_row">
								<input type="submit" class="register" value="提交" />
							</div>


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
							<%@include file="../graphCopy.jsp"%>
						</p>
					</div>
				</div>
			</div>
			<!--end of right content-->

			<div class="clear"></div>
		</div>




		</div>
	</form>
</body>
<%@include file="../_foot.jsp"%>
</html>