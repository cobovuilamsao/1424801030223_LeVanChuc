<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:message code="employee.menu.inventory" /></title>
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
							<s:message code="employee.menu.inventory" />
						</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)"><s:message
										code="employee.menu.home" /></a></li>
							<li class="breadcrumb-item active"><s:message
									code="employee.menu.inventory" /></li>
						</ol>
					</div>
					<div class="col-md-7 col-4 align-self-center">
						<a href="http://facebook.com/HieuDTPH04388" target="blank"
							class="btn waves-effect waves-light btn-danger pull-right hidden-sm-down">
							Liên Hệ Với Chúng Tôi</a>
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
									<s:message code="employee.inventory.catepro" />
								</h4>

								<!-- Show -->

								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th><s:message code="employee.inventory.producer" /></th>
												<th><s:message code="employee.inventory.category" /></th>
												<th><s:message code="employee.inventory.quantity" /></th>
												<th><s:message code="employee.inventory.total" /></th>

											</tr>
										</thead>
										<tbody>
											<c:forEach var="a" items="${crrays}">
												<tr>
													<td>${a[0]}</td>
													<td>${a[1]}</td>
													<td>${a[2]}</td>
													<td><fmt:formatNumber value="${a[3]}" type="currency"
															pattern="000,000" /> VNĐ</td>


												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--  -->
				<div class="row">
					<!-- column -->
					<div class="col-lg-12">
						<div class="card">
							<div class="card-block">
								<h4 class="card-title">
									<s:message code="employee.inventory.cate" />
								</h4>

								<!-- Show -->

								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th><s:message code="employee.inventory.group" /></th>
												<th><s:message code="employee.inventory.quantity" /></th>
												<th><s:message code="employee.inventory.total" /></th>
												<th><s:message code="employee.inventory.lowest" /></th>
												<th><s:message code="employee.inventory.highest" /></th>
												<th><s:message code="employee.inventory.average" /></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="a" items="${arrays}">
												<tr>

													<td>${a[0]}</td>
													<td>${a[1]}</td>
													<td><fmt:formatNumber value="${a[2]}" type="currency"
															pattern="000,000" /> VNĐ</td>
													<td><fmt:formatNumber value="${a[3]}" type="currency"
															pattern="000,000" /> VNĐ</td>
													<td><fmt:formatNumber value="${a[4]}" type="currency"
															pattern="000,000" /> VNĐ</td>
													<td><fmt:formatNumber value="${a[5]}" type="currency"
															pattern="000,000" /> VNĐ</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--  -->
				<div class="row">
					<!-- column -->
					<div class="col-lg-12">
						<div class="card">
							<div class="card-block">
								<h4 class="card-title">
									<s:message code="employee.inventory.pro" />
								</h4>

								<!-- Show -->

								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th><s:message code="employee.inventory.group" /></th>
												<th><s:message code="employee.inventory.quantity" /></th>
												<th><s:message code="employee.inventory.total" /></th>
												<th><s:message code="employee.inventory.lowest" /></th>
												<th><s:message code="employee.inventory.highest" /></th>
												<th><s:message code="employee.inventory.average" /></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="a" items="${brrays}">
												<tr>
													<td>${a[0]}</td>
													<td>${a[1]}</td>
													<td><fmt:formatNumber value="${a[2]}" type="currency"
															pattern="000,000" /> VNĐ</td>
													<td><fmt:formatNumber value="${a[3]}" type="currency"
															pattern="000,000" /> VNĐ</td>
													<td><fmt:formatNumber value="${a[4]}" type="currency"
															pattern="000,000" /> VNĐ</td>
													<td><fmt:formatNumber value="${a[5]}" type="currency"
															pattern="000,000" /> VNĐ</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
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
	<!--  -->
</body>
</html>

