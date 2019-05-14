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
		$("#feedback").validate({
			rules : {
				name : {
					required : true
				},
				email : {
					required : true,
					email : true
				},
				info : {
					required : true
				}
			},
			messages : {
				name : {
					required : 'Vui lòng nhập tên của bạn !'
				},
				email : {
					required : 'Vui lòng nhập địa chỉ email !',
					email : 'Vui lòng nhập đúng định dạng email !'
				},
				info : {
					required : 'Vui lòng nhập thông tin !'
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
				<div class="span9" id="mainCol">
					<ul class="breadcrumb">
						<li><a href="user/home">Trang Chủ</a> <span class="divider">/</span></li>
						<li class="active">Góp Ý</li>
					</ul>
					<h3>Ý kiến phản hồi của khách hàng.</h3>
					<hr class="soft">
					<p class="help-block">
						Hoạt động với phương châm "Sự hài lòng của khách hàng là niềm vui
						của Hiếu Boy Shop", <br> chúng tôi luôn cố gắng để từng bước
						cải thiện chất lượng dịch vụ.<br> Vui lòng để lại thông tin
						cho chúng tôi nếu bạn có bất kỳ góp ý gì.
					</p>
					<label class="error">${message }</label>
					<form action="user/feedback" method="post" role="form"
						id="feedback">
						<div class="form-group">
							<label>Tên của bạn: </label> <input type="text" class="required"
								class="form-control border-input" name="name"
								placeholder="Enter your name" style="width: 530px; height: 25px">
						</div>
						<div class="form-group">
							<label>Địa chỉ email: </label> <input type="email"
								class="required email" class="form-control" name="email"
								placeholder="Enter email" style="width: 530px; height: 25px">
						</div>
						<label for="cat">Chủ đề góp ý: </label> <select
							class="form-control" id="cat" name="comboCate"
							style="width: 542px; height: 36px">
							<option value="web">Trang web</option>
							<option value="service">Chất lượng sản phẩm - dịch vụ</option>
							<option value="employee">Thái độ phục vụ của nhân viên</option>
						</select> <br> <label for="info">Nội dung ý kiến: </label>
						<textarea name="info" class="required" class="form-control"
							rows="5" style="width: 530px"></textarea>
						<br>
						<button type="submit" class="btn btn-danger btn-large">Gửi</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>