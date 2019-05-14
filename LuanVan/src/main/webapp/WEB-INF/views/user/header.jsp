<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<base href="${pageContext.servletContext.contextPath}/">

<div id="header">
	<div class="container">
		<div id="welcomeLine" class="row">

			<div class="span6">
				<c:choose>
					<c:when test="${ sessionScope.user.fullName == null }">
						<%-- <a href="user/forgot"><span class="btn btn-sm btn-success">Quên
								mật khẩu</span></a> --%>
					</c:when>
					<c:when test="${ sessionScope.user.fullName != null}">
						<span>Xin chào: <strong>
								${sessionScope.user.fullName }</strong></span>
						<a href="user/logout"
							onclick="return confirm ('Bạn chắc chắn muốn đăng xuất ?')"><span
							class="btn btn-mini btn-danger">Đăng xuất</span></a>
					</c:when>
				</c:choose>
			</div>
			<div class="span6">
				<div class="pull-right">
					<a href="en"><span class="btn btn-mini">English</span> </a><a
						href="vi"><span class="btn btn-mini">Tiếng Việt</span></a> <a
						href="shopping-cart/index"><span id="cart-amount"
						class="btn btn-danger btn-sm">$ <fmt:formatNumber
								value="${cart.amount}" pattern="###,###" /> VNĐ
					</span> </a> <a href="shopping-cart/index"><span id="cart-count"
						class="btn btn-sm btn-primary"><i
							class="icon-shopping-cart icon-white"></i> ${cart.count } Sản
							phẩm trong giỏ hàng</span> </a>
				</div>
			</div>
		</div>
		<!-- Navbar ================================================== -->
		<div id="logoArea" class="navbar">
			<a id="smallScreen" data-target="#topMenu" data-toggle="collapse"
				class="btn btn-navbar"> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
			</a>
			<div class="navbar-inner">
				<!-- <a class="brand" href="user/home">
				<img src="themes/images/logo.png" alt="Bootsshop">
				</a>  -->
				<form action="user/product/search-product.htm"
					class="form-inline navbar-search" method="post">
					<input id="" name="search" type="text">
					<%-- <select
						class="srchTxt">
						<option>All</option>
						<option>CLOTHES</option>
						<option>FOOD AND BEVERAGES</option>
						<option>HEALTH &amp; BEAUTY</option>
						<option>SPORTS &amp; LEISURE</option>
						<option>BOOKS &amp; ENTERTAINMENTS</option>
					</select> --%>
					<button type="submit" id="submitButton" class="btn btn-danger">Tìm
						kiếm</button>
				</form>
				<ul id="topMenu" class="nav pull-right">
					<li class=""><a href="user/home">Trang chủ</a></li>
					<li class=""><a href="user/about">Giới thiệu</a></li>
					<li class=""><a href="user/feedback">Góp ý</a></li>
					<li class=""><a href="user/contact">Liên hệ</a></li>
					<li class=""><a href="user/product/list">Sản phẩm</a></li>
					<c:choose>
						<c:when test="${empty sessionScope.user.fullName}">
							<li class=""><a href="user/register"><span
									class="btn-xs btn-info">Đăng ký</span></a></li>
							<li class=""><a href="user"><span
									class="btn-xs btn-success">Đăng nhập</span></a></li>
						</c:when>
						<c:when test="${sessionScope.user.fullName != null}">
							<li class=""><a
								href="user/change-info/${sessionScope.user.id}.htm"><span
									class="btn btn-lg btn-info">Cập nhật</span></a></li>
							<li class=""><a
								href="user/change-pass/${sessionScope.user.id }.htm"><span
									class="btn btn-lg btn-success">Đổi mật khẩu</span></a></li>
						</c:when>
					</c:choose>
					<%-- <li class=""><a href="#login" role="button"
						data-toggle="modal" style="padding-right: 0"><span
							class="btn btn-large btn-success">Đăng nhập</span></a>
						<div id="login" class="modal hide fade in" tabindex="-1"
							role="dialog" aria-labelledby="login" aria-hidden="false">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h3>Thông tin đăng nhập</h3>
							</div>
							<div class="modal-body">
								<form class="form-horizontal loginFrm">
									<div class="control-group">
										<input type="text" id="inputEmail" placeholder="Email">
									</div>
									<div class="control-group">
										<input type="password" id="inputPassword"
											placeholder="Password">
									</div>
									<div class="control-group">
										<label class="checkbox"> <input type="checkbox">
											Ghi nhớ
										</label>
									</div>
								</form>
								<button type="submit" class="btn btn-success">Đăng nhập</button>
								<button class="btn" data-dismiss="modal" aria-hidden="true">Đóng</button>
							</div>
						</div></li> --%>
				</ul>
			</div>
		</div>
	</div>
</div>
<script>
	$(function() {
		$(".language a").click(function() {
			$.ajax({
				url : "user/set-language.htm?language=" + $(this).attr("href"),
				success : function() {
					location.reload();
				}
			});
			return false;
		});
	});

	
</script>