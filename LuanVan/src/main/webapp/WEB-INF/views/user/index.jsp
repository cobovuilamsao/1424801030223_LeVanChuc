<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${pageContext.servletContext.contextPath }/" />
<meta charset="utf-8">
<title>Website Bán Hàng Online</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="slideshow.jsp"></jsp:include>
	<div id="mainBody">
		<div class="container">
			<div class="row">
				<jsp:include page="menu.jsp"></jsp:include>
				<!--  -->
				<div class="span9">
					<ul class="breadcrumb">
						<li><a href="user/home">Home</a> <span class="divider">/</span></li>
						<li class="active">Sản phẩm giảm giá</li>
					</ul>

					<h3>Sản Phẩm Đang Giảm Giá</h3>
					<br>
					<ul class="thumbnails">
						<c:forEach var="p" items="${saleOffProducts}">
							<li class="span3">
								<div class="thumbnail">
									<!-- <i class="tag"></i> -->
									<i class="tag"></i><a href="user/product/detail/${p.id }.htm"><img
										src="images/products/${p.photo }" width="200px" height="150px"></a>
									<div class="caption">
										<h5>${p.nameProduct }</h5>
										<p>Số lượng: ${p.quantity }</p>
										<h4 style="text-align: center">
											<%-- <a class="btn" href="user/product/detail/${p.id }.htm"> 
											 <i class="icon-zoom-in"></i> 
											</a> --%>
											 <a class="btn" href="shopping-cart/add/${p.id }">Thêm
												vào <i class="icon-shopping-cart"></i>
											</a> <a class="btn btn-warning">-<f:formatNumber
													value="${p.discount}" type="percent" /></a>
											 		 <a
												style="text-decoration: line-through;"
												class="btn btn-success">Giá gốc: <f:formatNumber
													value="${p.unitPrice}" pattern="###,###" /> VNĐ
											</a>  
											<br> <a class="btn btn-danger">Giá mới nhất: <f:formatNumber
													value="${p.unitPrice*(1-p.discount)}" pattern="###,###" />
												VNĐ
											</a>
										</h4>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>

				</div>
				<!--  -->
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>



</html>