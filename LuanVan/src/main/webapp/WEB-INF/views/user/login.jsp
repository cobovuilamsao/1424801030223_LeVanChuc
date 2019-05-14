
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
<script src="themes/js/jquery-1.7.1.min.js"></script>
<script src="themes/js/jquery.validate.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#register").validate({
			rules : {
				id : {
					required : true
				},
				password : {
					required : true,
					minlength : 6
				}
			},
			messages : {
				id : {
					required : 'Vui lòng nhập tài khoản !'
				},
				password : {
					required : 'Vui lòng nhập mật khẩu !',
					minlength : 'Mật khẩu phải lớn hơn 6 ký tự !'
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
						<li class="active">Login</li>
					</ul>
					<h3>Login</h3>
					<h5 style="color: red">Hãy đăng ký tài khoản nếu không có tài khoản đăng nhập nhé</h5>
					<div class="well">
						<h3>Thông Tin Đăng Nhập</h3>

						<form:form action="user" method="post" modelAttribute="user"
							class="form-horizontal" role="form" id="register">
							<label class="error">${message}</label>
							<div class="control-group">
								<label class="control-label">Username: <sup
									style="color: red">*</sup></label>
								<div class="controls">
									<form:input path="id" id="id" placeholder="Username"
										cssClass="form-control" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Password: <sup
									style="color: red">*</sup></label>
								<div class="controls">
									<form:password path="password" id="password"
										placeholder="Password" cssClass="form-control" />
								</div>
							</div>

							<div class="control-group">
								<label class="control-label"> </label>
								<div class="controls">
									<input type="checkbox" name="remember" value="true">
									Ghi nhớ ?
								</div>
							</div>

							<div class="control-group">
								<div class="controls">
									<input class="btn btn-large btn-danger" type="submit"
										value="Login">
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