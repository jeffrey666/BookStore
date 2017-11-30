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
<
<script type="text/javascript"
	src="<%=request.getContextPath()%>/staticfile/js/jquery-1.6.2.js"></script>

<script type="text/javascript">

	function promptMsg(msg) {
		$errMsg = $("#errMsg");
		$errMsg.css("color", "red").text(msg);
	}
	
	function checkNull(name, msg) {
		promptMsg("");

		isOK = true;
		$o = $("input[name='" + name + "']");

		if ($o.val() == "") {
			promptMsg(msg);
			isOK = false;
		}

		return isOK;
	}
	
	function checkOldPsw() {
		isOK = true;

		isOK = checkNull("old_psw", "密码不能为空");

		return isOK;
	}

	function checkNewPsw() {
		isOK = true;

		isOK = checkNull("new_password", "密码不能为空");

		return isOK;
	}

	function checkNewPswConfirm() {
		isOK = true;

		isOK = checkNull("new_password_confirm", "密码不能为空");

		if (isOK) {
			if ($("input[name='new_password']").val() != $("input[name='new_password_confirm']").val()) {
				promptMsg("两次输入的密码不一致！");
				isOK = false;
			}

		}

		return isOK;
	}	

	function checkForm() {
		isOK = true;

		isOK = checkOldPsw();
		
		if(isOK){
			isOK = checkNewPsw();
		}
		
		if(isOK){
			isOK = checkNewPswConfirm();
		}
		
		return isOK;
	}






	

</script>
</head>
<%@include file="../_head.jsp"%>
<body>
	<form onsubmit="return checkForm()" name="icform" method="post"
		target="_self" action="/user/password/update">

		<div id="wrap">

			<div class="center_content">
				<div class="left_content">
					<div class="title">
						<span class="title_icon"><img
							src="${app}/staticfile/images/bullet1.gif" alt="" title="" /></span>密码管理
					</div>

					<div class="feat_prod_box_details">
						<p class="details"></p>

						<div class="contact_form">
							<div class="form_subtitle">修改密码</div>


							<div class="details">
								<span id="errMsg" style="color: red;">${errMsg }</span>
							</div>

							<div>
								<input name="user_id" value="${_CURRENT_USER.id } "
									type="hidden">
							</div>
							<div>
								<input name="userInfo.userInfoId"
									value="${_CURRENT_USER.userInfo.userInfoId } " type="hidden">
							</div>

							<div class="form_row">
								<label class="contact"><strong>旧密码:</strong></label> <input
									class="contact_input" type="password" name="old_psw" onblur="checkOldPsw()" />
							</div>
							<div class="form_row">
								<label class="contact"><strong>新密码:</strong></label> <input
									class="contact_input" type="password" name="new_password"  onblur="checkNewPsw()" />
							</div>
							<div class="form_row">
								<label class="contact"><strong>确认密码:</strong></label> <input
									class="contact_input" type="password"   onblur="checkNewPswConfirm()"
									name="new_password_confirm" />
							</div>

							<div class="form_row">
								<input type="submit" class="register" value="提交" />
							</div>

							<div class="form_row">
								<input type="button" class="register" value="返回"
									onclick="window.history.back();" />

							</div>



						</div>

					</div>






					<div class="clear"></div>
				</div>
				<!--end of left content-->

				<div class="right_content">


			<div class="cart">
					<div id="view_cart">
						<span><img src="${app}/staticfile/images/cart.gif" alt=""  /> &nbsp;&nbsp;<a href="/search/toborrow"
							style="text-align: center; font-family: 微软雅黑; font-size: 22px;color:#860606">我的借阅</a></span>
					</div>
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