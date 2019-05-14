<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:message code="employee.menu.order" /></title>
</head>
<body>
	<div id="main-wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div class="page-wrapper">
			<!-- Container fluid  -->
			<div class="container-fluid">
				<!-- Bread crumb and right sidebar toggle -->
				<div class="row page-titles">
					<div class="col-md-5 col-8 align-self-center">
						<h3 class="text-themecolor m-b-0 m-t-0">
							<s:message code="employee.menu.order" />
						</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)"><s:message
										code="employee.menu.home" /></a></li>
							<li class="breadcrumb-item active"><s:message
									code="employee.order.list" /></li>
						</ol>
					</div>
					<div class="col-md-7 col-4 align-self-center">
						<a href="http://facebook.com/HieuDTPH04388" target="blank"
							class="btn waves-effect waves-light btn-danger pull-right hidden-sm-down">
							<s:message code="employee.menu.contact" />
						</a>
					</div>
				</div>
				<!-- End Bread crumb and right sidebar toggle -->
				<!-- Start Page Content -->
				<div class="row">
					<!-- column -->
					<div class="col-lg-12">
						<div class="card">
							<div class="card-block">
								<h4 class="card-title">
									<s:message code="employee.order.list" />
								</h4>
								<h6 class="card-subtitle">
									<s:message code="employee.here" />
								</h6>
								<!-- Tìm Kiếm -->

								<form:form action="employee/order/search.htm" method="get">
									<div class="row">
										<div class="col-md-3">
											<input type="text" name="search" placeholder="Tìm kiếm"
												class="form-control form-control-line" />
										</div>
										<div class="col-md-3">
											<button type="submit" class="btn btn-danger">
												<s:message code="employee.search" />
											</button>
										</div>
									</div>

								</form:form>
								<!-- Lọc -->
								<br>
								<form:form action="employee/order/filter.htm" method="get">
									<div class="row">
										<div class="col-md-2">
											<select name="filter" class="form-control form-control-line">
												<option selected="selected" value=""><s:message
														code="employee.select" /></option>
												<option value="1"><s:message
														code="employee.order.status.1" /></option>
												<option value="2"><s:message
														code="employee.order.status.2" /></option>
												<option value="3"><s:message
														code="employee.order.status.3" /></option>
												<option value="4"><s:message
														code="employee.order.status.4" /></option>
											</select>
										</div>

										<div class="col-md-3">
											<button type="submit" class="btn btn-warning">
												<s:message code="employee.filter" />
											</button>
										</div>
									</div>
								</form:form>
								<br>
								<!-- Show -->
								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>#</th>
												<th><s:message code="employee.order.id" /></th>
												<th><s:message code="employee.order.customerID" /></th>
												<th><s:message code="employee.order.orderDate" /></th>
												<th><s:message code="employee.order.requireDate" /></th>
												<th><s:message code="employee.order.amount" /></th>
												<th><s:message code="employee.order.receiver" /></th>
												<th><s:message code="employee.order.address" /></th>
												<th><s:message code="employee.order.numberPhone" /></th>
												<th><s:message code="employee.order.description" /></th>
												<th><s:message code="employee.order.status" /></th>
												<th><s:message code="employee.function" /></th>
											</tr>
										</thead>

										<tbody>
											<c:forEach items="${listOrder }" var="order">
												<tr>
													<c:set var="count" value="${count+1 }" />
													<td>${count }</td>
													<td>${order.id }</td>
													<td>${order.customer.id }</td>
													<td><f:formatDate value="${order.orderDate }"
															pattern="dd/MM/yyy" /></td>
													<td><f:formatDate value="${order.requireDate }"
															pattern="dd/MM/yyy" /></td>
													<td><f:formatNumber value="${order.amount }"
															pattern="###,###" /> VNĐ</td>
													<td>${order.receiver }</td>
													<td>${order.address }</td>
													<td>${order.numberPhone }</td>
													<td>${order.description }</td>
													<td><c:choose>
															<c:when test="${order.status == 1 }">
																<span class="btn btn-warning btn-sm"><s:message
																		code="employee.order.status.1" /></span>
															</c:when>
															<c:when test="${order.status == 2}">
																<span class="btn btn-danger btn-sm"><s:message
																		code="employee.order.status.2" /></span>
															</c:when>
															<c:when test="${order.status == 3}">
																<span class="btn btn-success btn-sm"><s:message
																		code="employee.order.status.3" /></span>
															</c:when>
															<c:when test="${order.status == 4}">
																<span class="btn btn-success btn-sm"><s:message
																		code="employee.order.status.4" /></span>
															</c:when>
														</c:choose></td>
													<td><c:choose>
															<c:when test="${order.status == 1 }">
																<a href="employee/order/handling-order/${order.id }.htm"
																	class="btn btn-primary btn-simple btn-sm"
																	onclick="return confirm ('Bạn đồng ý xử lý đơn hàng ?')">
																	<i class="fa fa-save"></i> <s:message
																		code="employee.order.handling" />
																</a>
																<br>
																<a href="employee/order/edit-order/${order.id }.htm"
																	class="btn btn-success btn-simple btn-sm"> <i
																	class="fa fa-edit"></i> <s:message code="employee.edit" /></a>
																<br>
																<a href="employee/order/detail-order/${order.id }.htm"
																	class="btn btn-danger btn-simple btn-sm"> <i
																	class="fa fa-edit"></i> <s:message
																		code="employee.detail" /></a>
																<br>
																<a href="employee/order/cannel-order/${order.id }.htm"
																	class="btn btn-warning btn-simple btn-sm"
																	onclick="return confirm ('Bạn đồng ý hủy đơn hàng ?')">
																	<i class="fa fa-save"></i> <s:message
																		code="employee.order.cannel" />
																</a>

															</c:when>
															<c:when test="${order.status == 3 }">
																<a href="employee/order/confirm-order/${order.id }.htm"
																	class="btn btn-primary btn-simple btn-sm"
																	onclick="return confirm ('Bạn chắc chắn rằng đơn hàng đã được gửi thành công ?')">
																	<i class="fa fa-edit"></i> <s:message
																		code="employee.order.confirm" />
																</a>
																<br>
																<a href="employee/order/detail-order/${order.id }.htm"
																	class="btn btn-danger btn-simple btn-sm"> <i
																	class="fa fa-edit"></i> <s:message
																		code="employee.detail" /></a>
															</c:when>
															<c:otherwise>
																<a href="employee/order/detail-order/${order.id }.htm"
																	class="btn btn-warning btn-simple btn-sm"> <i
																	class="fa fa-edit"></i> <s:message
																		code="employee.detail" /></a>
															</c:otherwise>
														</c:choose></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<!-- Phân Trang -->
									<div style="margin: 10px; text-align: right;">
										<c:forEach begin="1" end="${rowCount}" varStatus="row">
											<a type="button" href="employee/order/?page=${row.index}"
												class="btn btn-danger btn-xs btn-fill">${row.index}</a>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- End PAge Content -->
			</div>
			<!-- End Container fluid  -->
			<!-- footer -->
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>

</body>
</html>