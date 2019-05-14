<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:message code="admin.menu.od" /></title>
</head>
<style type="text/css">
*[id$=errors] {
	color: red;
	font-style: italic;
	padding-left: 33px;
	background: url("images/hieuboy2.gif") no-repeat left center;
}
</style>
<body>
	<div class="wrapper">
		<jsp:include page="menu.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="header.jsp"></jsp:include>
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="header">
									<h4 class="title">
										<s:message code="admin.menu.od" />
									</h4>
									<p class="category">
										<s:message code="admin.here" />
									</p>
								</div>
								<div style="clear: both; width: 98%; margin: 10px auto;">
									<!-- Tìm Kiếm -->
									<form action="admin/orderDetail/search.htm">
										<div class="col-md-2">
											<div class="form-group">
												<input type="text" name="search" placeholder="Tìm kiếm..."
													class="form-control border-input" />
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
												<button type="submit" class="btn btn-danger btn-fill">
													<s:message code="admin.search" />
												</button>
											</div>
										</div>
									</form>
								</div>
								<div class="content table-responsive table-full-width">
									<table class="table table-striped">
										<thead>
											<tr>
												<td>#</td>
												<td><s:message code="admin.od.id" /></td>
												<td><s:message code="admin.od.nameCustomer" /></td>
												<td><s:message code="admin.od.nameProduct" /></td>
												<td><s:message code="admin.od.orderDate" /></td>
												<td><s:message code="admin.od.requireDate" /></td>
												<td><s:message code="admin.od.unitPrice" /></td>
												<td><s:message code="admin.od.quantity" /></td>
												<td><s:message code="admin.od.discount" /></td>
												<td><s:message code="admin.od.amount" /></td>
												<td><s:message code="admin.od.address" /></td>
												<td><s:message code="admin.od.receiver" /></td>
												<td><s:message code="admin.function" /></td>
											</tr>
										</thead>
										<c:set var="count" value="0" />
										<tbody>
											<c:forEach items="${listOrderDetail}" var="orderDetail">
												<tr>
													<c:set var="count" value="${count+1 }" />
													<td>${count }</td>
													<td>${orderDetail.order.id }</td>
													<td>${orderDetail.order.customer.fullName }</td>
													<td>${orderDetail.product.nameProduct }</td>
													<td><f:formatDate
															value="${orderDetail.order.orderDate }"
															pattern="dd/MM/yyyy" /></td>
													<td><f:formatDate
															value="${orderDetail.order.requireDate }"
															pattern="dd/MM/yyyy" /></td>
													<td><f:formatNumber type="currency"
															value="${orderDetail.product.unitPrice }"
															pattern="###,###,###" /> VNĐ</td>
													<td>${orderDetail.quantity }</td>
													<td><f:formatNumber value="${orderDetail.discount }"
															type="percent" /></td>
													<td><f:formatNumber type="currency"
															value="${orderDetail.amount }" pattern="###,###,###" />
														VNĐ</td>
													<td>${orderDetail.order.address }</td>
													<td>${orderDetail.order.receiver }</td>
													<td><a
														href="admin/orderDetail/delete-orderDetail/${orderDetail.id}.htm"
														onclick="return confirm('Bạn chắc chắn chứ ?')"
														type="button" class="btn btn-success btn-fill btn-sm"><s:message
																code="admin.delete" /> </a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>

									<!-- Phân Trang -->
									<div style="margin: 10px; text-align: right;">
										<c:forEach begin="1" end="${rowCount}" varStatus="row">
											<a type="button" href="admin/orderDetail/?page=${row.index}"
												class="btn btn-danger btn-xs btn-fill">${row.index}</a>
										</c:forEach>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>