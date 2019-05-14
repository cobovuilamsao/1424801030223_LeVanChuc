<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
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
				<div class="span9">
					<ul class="breadcrumb">
						<li><a href="index.html">Trang Chủ</a> <span class="divider">/</span></li>
						<li class="active">Danh Sách Sản Phẩm</li>
					</ul>
					<h3>
						Products Name <small class="pull-right"> 40 products are
							available </small>
					</h3>
					<hr class="soft">
					<p>Nowadays the lingerie industry is one of the most successful
						business spheres.We always stay in touch with the latest fashion
						tendencies - that is why our goods are so popular and we have a
						great number of faithful customers all over the country.</p>
					<hr class="soft">
					<form:form action="user/product/search-product.htm" method="post"
						class="form-horizontal span6">
						<div class="control-group">
							<div class="md-col-6">
								<input name="search" type="text">
								<button type="submit" class="btn btn-danger">Tìm kiếm</button>
							</div>
						</div>
					</form:form>
					<div id="myTab" class="pull-right">
						<a href="#listView" data-toggle="tab"><span
							class="btn btn-large"><i class="icon-list"></i></span></a> <a
							href="#blockView" data-toggle="tab"><span
							class="btn btn-large btn-success"><i class="icon-th-large"></i></span></a>
					</div>
					<br class="clr">
					<div class="tab-content">
						<div class="tab-pane" id="listView">
							<c:forEach var="product" items="${list }">
								<div class="row">
									<div class="span2">
										<img src="images/products/${product.photo }" width="200px"
											height="150px">
									</div>
									<div class="span4">
										<h3>New | Available</h3>
										<hr class="soft">
										<h4>${product.nameProduct }</h4>
										<h5>Số lượng: ${product.quantity }</h5>
										<h5>Đơn vị tính: ${product.unitBrief }</h5>
										<a class="btn btn-danger pull-right"
											href="user/product/detail/${product.id }.htm">Xem Chi
											Tiết</a> <br class="clr">
									</div>
									<div class="span3 alignR">
										<form class="form-horizontal qtyFrm">
											<h3>
												<fmt:formatNumber value="${product.unitPrice }"
													pattern="###,###" />
												VNĐ
											</h3>

											<br> <a class="add-to-cart btn btn-large  btn-success"  href="shopping-cart/add/${product.id}" >
												Thêm vào giỏ <i class=" icon-shopping-cart"></i>
											</a> <a href="#" class="btn btn-large"><i
												class="icon-zoom-in"></i></a>

										</form>
									</div>
								</div>
								<hr class="soft">
							</c:forEach>
						</div>

						<div class="tab-pane  active" id="blockView">
							<ul class="thumbnails">
								<c:forEach var="product" items="${list }">
									<li class="span3">
										<div class="thumbnail">
											<a href="user/product/detail/${product.id }.htm"><img
												src="images/products/${product.photo }" width="200px"
												height=150px></a>
											<div class="caption">
												<h5>${product.nameProduct }</h5>
												<h5>Số lượng: ${product.quantity }</h5>
												<h4 style="text-align: center">
											<%-- 		 <a class="btn"
														href="user/product/detail/${product.id }.htm">
														  <i
														class="icon-zoom-in"></i>Xem 
													</a> --%>
													 <a class="btn" title='Thêm vào giỏ' href="shopping-cart/add/${product.id}">Thêm Vào Giỏ <i
														class="icon-shopping-cart"></i>
													</a> <br> <a class="btn btn-success"><fmt:formatNumber
															value="${product.unitPrice }" pattern="###,###" /> VNĐ </a>
												<%-- 	<span class="btn btn-danger">Xem: ${product.views }</span> --%>
												</h4>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
							<hr class="soft">
						</div>
					</div>

					<!-- <a href="compair.html" class="btn btn-large pull-right">Compair
						Product</a> -->
	<div class="pagination">
						<!--Pagination  -->
<form class="pager" 
	<c:choose>
		<c:when test="${flat == 'search-product'}">
			action="user/product/${flat}.htm?search=${search}"
		</c:when>
		<c:otherwise>
			action="user/product/${flat}.htm"
		</c:otherwise>
	</c:choose>
method="post">
	<c:choose>	
		<c:when test="${acpager.pageNo != 0}">
			<input type="submit" name="btnPageNo:${0}" value="<<"/>
			<input type="submit" name="btnPageNo:${acpager.pageNo-1}" value="<"/>
		</c:when>
		<c:otherwise>
			<input disabled="disabled" type="submit" name="btnPageNo:${0}" value="<<"/>
			<input disabled="disabled" type="submit" name="btnPageNo:${acpager.pageNo-1}" value="<"/>
		</c:otherwise>			
	</c:choose>
	
	<c:forEach var="i" begin="${acpager.startPage}"  end="${acpager.endPage}">
		<input style="box-shadow:0 0 5px ${i==acpager.pageNo?'red':'gray'};" type="submit" name="btnPageNo:${i}" value="${i+1}"/>
	</c:forEach>
	
	<c:choose>
		<c:when test="${acpager.pageNo != acpager.lastPageNo}">
			<input type="submit" name="btnPageNo:${acpager.pageNo+1}" value=">"/>
			<input type="submit" name="btnPageNo:${acpager.lastPageNo}" value=">>"/>
		</c:when>
		<c:otherwise>
			<input disabled="disabled" type="submit" name="btnPageNo:${acpager.pageNo+1}" value=">"/>
			<input disabled="disabled" type="submit" name="btnPageNo:${acpager.lastPageNo}" value=">>"/>
		</c:otherwise>
	</c:choose>
</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>

<style>
.pager input {
	background-color: #C6C6C6;
	border-radius: 100%;
}

.pager input[disabled] {
	background-color: #F9F9F9;
}

.box>ul img[id]:hover {
	opacity: 0.6;
}

.box>ul:hover {
	box-shadow: 0 0 5px red;
}
</style>

<!--End Pagination  -->

<script>
	/* Xử lý button like (Hàng yêu thích) */
	$(function() {
		$("a.like").click(function() {
			id = $(this).attr("data-id");
			$("#like-" + id).effect("puff", 500, function() {
				setTimeout(function() {
					$("#like-" + id).removeAttr("style").hide().fadeIn();
				}, 500);
			});
			$.ajax({
				url : "user/product/like-product.htm",
				data : "id=" + id
			});
			return false;
		});
	});
</script>
</html>