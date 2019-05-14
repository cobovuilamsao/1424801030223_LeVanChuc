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
<title><s:message code="employee.order.edit" /></title>
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
									code="employee.detail" /></li>
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
									<s:message code="employee.detail" />
								</h4>
								<form:form modelAttribute="order">
									<div class="row">
										<div class="col-md-4">
											<label><s:message code="employee.order.receiver" /></label>
											<form:input path="receiver"
												class="form-control form-control-line" readonly="true" />
										</div>
										<div class="col-md-4">
											<label><s:message code="employee.order.address" /></label>
											<form:input path="address" readonly="true"
												class="form-control form-control-line" />
										</div>
										<div class="col-md-4">
											<label><s:message code="employee.order.numberPhone" /></label>
											<form:input path="numberPhone" readonly="true"
												class="form-control form-control-line" />
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-md-6">
											<label><i class="fa fa-calendar bigger-110"> </i> <s:message
													code="employee.order.orderDate" /></label>
											<form:input path="orderDate" readonly="true"
												class="form-control form-control-line" />
										</div>
										<div class="col-md-6">
											<label><i class="fa fa-calendar bigger-110"> </i> <s:message
													code="employee.order.requireDate" /></label>
											<form:input path="requireDate" readonly="true"
												class="form-control form-control-line" />
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-md-6">
											<label><s:message code="employee.order.amount" /></label>
											<form:input path="amount" readonly="true"
												class="form-control form-control-line" />
										</div>
										<div class="col-md-6">
											<label> <s:message code="employee.order.description" /></label>
											<form:input path="description" readonly="true"
												class="form-control form-control-line" />
										</div>
									</div>
									<br>
									<br>
								</form:form>
								<!--  -->
								<hr class="soft">

								<table class="table table-bordered">
									<thead>
										<tr>
											<th><s:message code="employee.product.id" /></th>
											<th><s:message code="employee.product.nameProduct" /></th>
											<th><s:message code="employee.product.photo" /></th>
											<th><s:message code="employee.od.amount" /></th>
											<th><s:message code="employee.od.discount" /></th>
											<th><s:message code="employee.od.quantity" /></th>
											<th><s:message code="employee.od.total" /></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="d" items="${detail}">
											<tr>
												<td>${d.product.id}</td>
												<td>${d.product.nameProduct}</td>
												<td><img src="images/products/${d.product.photo}"
													height="100px" width="120px" style="border-radius: 20px"></td>
												<td><f:formatNumber value="${d.amount }"
														pattern="###,###" /> VNĐ</td>
												<td><c:choose>
														<c:when test="${d.discount == null}">0%</c:when>
														<c:when test="${d.discount == 0}">0%</c:when>
														<c:otherwise>
															<f:formatNumber value="${d.discount }" type="percent" />
														</c:otherwise>
													</c:choose></td>
												<td>${d.quantity}</td>												
												<td><f:formatNumber
														value="${d.amount*d.quantity*(1-d.discount)}"
														pattern="###,###" /> VNĐ</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!--  -->
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