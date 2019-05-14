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
				<div class="span9" id="mainCol">
					<ul class="breadcrumb">
						<li><a href="user/home">Trang Chủ</a> <span class="divider">/</span></li>
						<li class="active">Giới Thiệu</li>
					</ul>
					<h3>Giới Thiệu Hoạt Động Của Cửa Hàng</h3>
					<hr class="soft">
					<h4>1. Hình Thức Mua Hàng Online Tại Website</h4>
					<p>- Bạn đăt hàng trên Web → Nhân viên Website sẽ gọi
						điện thoại xác nhận đơn hàng của bạn → Giao hàng và Thu tiền tận
						nơi trên toàn quốc.</p>
					<br>

					<h4>2. Thời gian mở cửa tại các Shop của Website</h4>
					<p>- Các shop của Website mở cửa từ 8h tới 21h tất cả các
						ngày, kể cả thứ 7 và Chủ Nhật</p>
					<br>

					<h4>3. Có phải đặt hàng online trên trang website trước khi
						đến các Shop của Website hay không?</h4>
					<p>- Website có đầy đủ các mặt hàng mà trên website bán,
						bạn có thể tới trực tiếp mua hàng không cần đặt trước trên website</p>
					<br>

					<h4>4. Mua tại các shop của Website có nhận được tiền
						tích lũy không ?</h4>
					<p>- Tiền tích lũy chỉ áp dụng cho các thành viên của Website
						Website mua hàng online bạn nhé.</p>
					<br>

					<h4>5. Giá các sản phẩm tại các shop Website có giống
						giá trên Website Website không ?</h4>
					<p>- Tất cả sản phẩm trên Website Website bán giống giá
						với tất cả các hệ thống Shop của Website.</p>
					<br>

					<h4>6. Địa chỉ các Shop của Website xem ở đâu ?</h4>
					<p>- Bạn bấm phần “Liên Hệ” trên đầu trang website để coi địa
						chỉ và số điện thoại các của các Shop của Website.</p>
					<br>

					<h4>7. Xem phí vận chuyển như thế nào ?</h4>
					<p>- Tất cả các mặt hàng tại Website có dịch vụ giao hàng
						miễn phí trong nội thành.</p>
					<p>- Bạn chỉ cần bấm “Đặt Hàng”, sau khi điền đầy đủ các thông
						tin hệ thống sẽ hiển thị đầy đủ chi tiết giá sp và tổng đơn hàng
						của bạn là bao nhiêu.</p>
					<br>

					<h4>8. Thời gian giao hàng đối với Hà Nội và các tỉnh thành
						trên cả nước</h4>
					<p>- Thời gian giao hàng: 1 - 3 ngày làm việc tại Hà Nội và 4 -
						6 ngày làm việc đối với các tỉnh thành khác. Không tính thời gian
						nghỉ lễ, thứ 7 - CN.</p>
					<br>

					<h4>9. Hàng của Website đổi có giao hàng tận nơi không?</h4>
					<p>- Nếu bạn cho địa chỉ chính xác mà bưu điện có thể giao tới
						thì sẽ giao tận nơi bạn nhé, nếu bưu điện đã giao 1 lần, lần 2 mà
						ko liên lạc cho bạn đc thì bưu điện sẽ để lại giấy mời bạn lên bưu
						điện nhận hàng – đối với các địa chỉ ở các tỉnh.</p>
					<p>- Ở Hà Nội nhân viên Website giao hàng tận nơi.</p>
					<br>

					<h4>10. Quyền lợi khi đăng ký thành viên và trở thành khách
						hàng thân thiết ntn?</h4>
					<p>- Bạn trở thành khách hàng thân thiện sẽ được tham gia miễn
						phí tất cả các chương trình giảm giá của Website và còn được
						giảm thêm 5% - 10% tính trực tiếp trên giá trị từng đơn hàng.</p>
					<br>

					<h4>11. Muốn kiếm sản phẩm EShop như thế nào nhanh nhất</h4>
					<p>- Bạn có thể gõ các từ khóa vào khung “ Tìm kiếm” phía bên
						phải để tìm sản phẩm bạn cần.</p>
					<p>- Hoặc bạn có thể xem các sản phẩm đã được nhóm theo từng
						danh mục ở phía dưới phần tìm kiếm.</p>
					<br>

					<h4>12. Hình thức đổi trả hàng như thế nào, nếu Sản Phẩm bị
						lỗi do Website hoặc nhà sản xuất ?</h4>
					<p>- Bạn Có thể đổi trong vòng 7 ngày theo quy định của shop ,
						bạn gửi lại qua đường bưu điện về địa chỉ Ngách 58/23 Trần Bình,
						phường Mai Dịch, quận Cầu Giấy, Hà Nội hoặc bạn có thể mang tới
						tận nơi bạn nhé.</p>
					<br>

					<h4>13. Muốn hủy đơn hàng sau khi đã hoàn tất thanh toán thì
						phải làm sao?</h4>
					<p>- Bạn vừa đặt hàng xong thì sẽ có nhận viên gọi xác nhận lại
						đơn hàng, bạn cứ trao đổi với nhân viên đó và có thể yêu cầu hủy
						đơn hàng.</p>
					<br>

					<h4>14. Một số sản phầm không chọn được màu</h4>
					<p>- Một số mặt hàng bên Website giao màu ngẫu nhiên, bên
						Website có nói rõ trong phần chi tiết sản phẩm.</p>
					<br>

					<h4>15. Sản phẩm bên ngoài có giống trong hình trên Website
						không?</h4>
					<p>- Sản phẩm được Website được đặt riêng với tiêu chí
						chất lượng đặt lên hàng đầu, tiếp đến là mẫu mã đa dạng đẹp và
						giống hình ảnh cung cấp bạn nhé.</p>
					<br>

					<h4>16. Làm sao để mua các sản phẩm trên cùng một đơn hàng</h4>
					<p>- Bạn bấm “Đặt Hàng” sản phẩm đầu tiên →Tiếp tục mua hàng→
						Chọn sản phẩm muốn mua tiếp theo → “Đặt Hàng” sản phẩm tiếp theo →
						Thanh Toán → Điền đầy đủ thông tin và Hoàn Tất nhé. (Quá trình
						thanh toán sẽ yêu cầu phải đăng nhập vào tài khoản cá nhân)</p>
					<br>

				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>



</html>