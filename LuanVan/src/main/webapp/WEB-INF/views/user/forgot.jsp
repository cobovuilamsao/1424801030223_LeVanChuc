

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html lang="en">
<head>
<base href="${pageContext.servletContext.contextPath }/" />
<meta charset="utf-8">
<title>Website Bán Hàng Online</title>
</head>
<script src='https://www.google.com/recaptcha/api.js'></script>
<script src="themes/js/jquery-1.7.1.min.js"></script>
<script src="themes/js/jquery.validate.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#forgot").validate({
			rules : {
				id : {
					required : true
				},
				email : {
					required : true,
					email : true
				}
			},
			messages : {
				id : {
					required : 'Vui lòng nhập tài khoản'
				},
				email : {
					required : 'Vui lòng nhập địa chỉ email !',
					email : 'Vui lòng nhập đúng định dạng email !'
				}
			}
		});
	});
</script>
<style>
label.error {
	color: red;
	font-style: italic;
	padding-left: 33px;
	background: url("images/hieuboy2.gif") no-repeat left center;
}
</style>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="mainBody">
		<div class="container">
			<div class="row">
				<jsp:include page="menu.jsp"></jsp:include>
				<!--  -->
				<div class="span9">
					<ul class="breadcrumb">
						<li><a href="user/home">Home</a> <span class="divider">/</span></li>
						<li class="active">Quên mật khẩu</li>
					</ul>
					<h3>Đổi Mật Khẩu</h3>
					<div class="well">

						<form:form action="user/forgot" method="post"
							modelAttribute="user" class="form-horizontal" role="form"
							id="forgot">
							<h4>Vui lòng nhập thông tin !</h4>
							<label class="error">${message}</label>
							<div class="control-group">
								<label class="control-label">Username: <sup
									style="color: red">*</sup>
								</label>
								<div class="controls">
									<form:input path="id" id="id" placeholder="Username"
										cssClass="form-control" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Email Address: <sup
									style="color: red">*</sup></label>
								<div class="controls">
									<form:input path="email" name="email"
										placeholder="Email Address" />
								</div>
							</div>

							<div class="control-group">
								<div class="controls">
									<input class="btn btn-large btn-success" type="submit"
										value="Forgot">
								</div>
							</div>

						</form:form>
					</div>

				</div>
				<!--  -->
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>