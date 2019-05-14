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
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="mainBody">
		<div class="container">
			<div class="row">
				<jsp:include page="menu.jsp"></jsp:include>
				<!--  -->
				<div class="span9" id="mainCol">
					<ul class="breadcrumb">
						<li><a href="user/home">Trang Chủ</a> <span class="divider">/</span></li>
						<li class="active">Liên Hệ</li>
					</ul>
					<h3>Liên Hệ Với Chúng Tôi</h3>
					<hr class="soft">
				</div>
				<div class="row">
					<div class="span4">
						<h4>Địa Chỉ Liên Hệ</h4>
						<p>
							Số 06, Trần Văn Ơn, Phú Hòa, Thủ Dầu Một, Bình Dương
							Ngõ 58/23 phố Trần Bình,<br> Thủ Dầu Một 
							Bình Dương  <br> Việt Nam  <br>Email: caogiachuc@gmail.com<br>
							﻿Phone: 0383539845<br> Facebook: <a
								href="https://www.facebook.com/charlieavral">Charlie Avral</a><br>
							Website:<a href="https://www.facebook.com/edmmusic102/?__tn__=kCH-R&eid=ARD6qOlUOmKl66RAVRiudCZu7RWc6Y6Vuw07qI0u0_i6kmwc1XtztseysUCUrChyVxMJh4s3LvZCQU5I&hc_ref=ARTw2NYIJqj9qjz2MnvAr1cqSjWO3F_givhOeQHa_ClBWWyri3r2XePHKxak5Est0bM">http://OnlineShop.com.vn</a><br>

							
						<!-- 	<iframe
								src="https://www.facebook.com/plugins/follow?href=https%3A%2F%2Fwww.facebook.com%2FHieuDTPH04388&amp;layout=standard&amp;show_faces=true&amp;colorscheme=light&amp;width=450&amp;height=80"
								scrolling="no" frameborder="0"
								style="border: none; overflow: hidden; width: 450px; height: 80px;"
								allowTransparency="true">
							</iframe> -->
							
						</p>
					</div>

					<div class="span4">
						<h4>Thời Gian Mở Cửa</h4>
						<h5>Thứ 2 -> Thứ 6:</h5>
						<span> 08:30 AM - 09:00 PM </span> <br>
						<h5>Thứ 7:</h5>
						<span> 09:00 AM - 07:00 PM </span><br>
						<h5>Chủ Nhật:</h5>
						<span>12:30 PM - 06:00 PM</span> <br>
					</div>
					<br>
					<hr class="soft">
					<div class="span9" id="mainCol">
						<h3>Vị Trí Địa Lý</h3>
						<hr class="soft">
					
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3371.074831469578!2d106.67225901430845!3d10.980659758394461!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3174d12739bb468f%3A0xe2bf4f397d0aa76!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBUaOG7pyBE4bqndSBN4buZdA!5e1!3m2!1svi!2s!4v1557460062189!5m2!1svi!2s" 
					width="600" height="450" frameborder="0" style="border:0" allowfullscreen>
					</iframe>
					
					<!-- 	<iframe
							src="https://www.google.com/maps/embed?pb=!1m23!1m12!1m3!1d1659.8957657286749!2d105.77473204953684!3d21.034255325195605!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m8!3e3!4m0!4m5!1s0x313454c99efca4a3%3A0x9bc6ec435a975338!2zTWFpIEThu4tjaCwgQ-G6p3UgR2nhuqV5LCBIw6AgTuG7mWksIFZp4buHdCBOYW0!3m2!1d21.040860499999997!2d105.7732633!5e0!3m2!1svi!2s!4v1524640625869"
							width="870" height="650" frameborder="0" style="border: 0"
							allowfullscreen>
						</iframe> -->

					</div>
				</div>



				<!--  -->
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>



</html>