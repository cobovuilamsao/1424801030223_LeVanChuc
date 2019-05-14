<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
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
	<div id="mainBody">
		<div class="container">
			<div class="row">
				<jsp:include page="menu.jsp"></jsp:include>
				<div class="span9">
					<ul class="breadcrumb">
						<li><a href="index.html">Home</a> <span class="divider">/</span></li>
						<li class="active">Order List</li>
					</ul>
					<h3>Order List</h3>

					<hr class="soft">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>ID</th>
								<th>Customer ID</th>
								<th>Order Date</th>
								<th>Require Date</th>
								<th>Receiver</th>
								<th>Amount</th>
								<th>Number Phone</th>
								<th>Status</th>
								<th>Chức năng</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${order }" var="o">
								<tr>
									<td>${o.id}</td>
									<td>${o.customer.id }</td>
									<td><f:formatDate value="${o.orderDate}"
											pattern="dd/MM/yyy" /></td>
									<td><f:formatDate value="${o.requireDate}"
											pattern="dd/MM/yyy" /></td>
									<td>${o.receiver}</td>
									<td><f:formatNumber value="${o.amount}" pattern="###,###" />
										VNĐ</td>
									<td>${o.numberPhone }</td>
									<td><c:choose>
											<c:when test="${o.status == 1 }">
												<span class="btn btn-warning btn-small">Đang chờ</span>
											</c:when>
											<c:when test="${o.status == 2 }">
												<span class="btn btn-danger btn-small">Đã hủy</span>
											</c:when>
											<c:when test="${o.status == 3 }">
												<span class="btn btn-info btn-small">Đang xử lý</span>
											</c:when>
											<c:when test="${o.status == 4 }">
												<span class="btn btn-success btn-small">Đã chuyển</span>
											</c:when>
										</c:choose></td>
									<td><c:choose>
											<c:when test="${o.status == 1 }">
												<a type="submit" class="btn btn-success btn-small"
													href="order/detail/${o.id}">Xem chi tiết</a>
												<a type="submit" class="btn btn-danger btn-small"
													href="order/cannel-order/${o.id}"
													onclick="return confirm('Bạn chắc chắ muốn hủy đơn hàng ?')">Hủy
													đơn hàng</a>
											</c:when>
											<c:when test="${o.status == 2 }">
												<a type="submit" class="btn btn-primary btn-small"
													href="order/detail/${o.id}">Xem chi tiết</a>
											</c:when>
											<c:when test="${o.status == 3 }">
												<a type="submit" class="btn btn-primary btn-small"
													href="order/detail/${o.id}">Xem chi tiết</a>
											</c:when>
											<c:otherwise>
												<a type="submit" class="btn btn-primary btn-small"
													href="order/detail/${o.id}">Xem chi tiết</a>
											</c:otherwise>
										</c:choose></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>



</html>