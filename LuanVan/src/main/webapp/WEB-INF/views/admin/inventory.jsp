<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:message code="admin.menu.inventory" /></title>
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
										<s:message code="admin.inventory.catepro" />
									</h4>
								</div>

								<div class="content table-responsive table-full-width">
									<table class="table table-striped">
										<thead>
											<tr>
												<th><s:message code="admin.inventory.producer" /></th>
												<th><s:message code="admin.inventory.category" /></th>
												<th><s:message code="admin.inventory.quantity" /></th>
												<th><s:message code="admin.inventory.total" /></th>

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
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="header">
									<h4 class="title">
										<s:message code="admin.inventory.cate" />
									</h4>
								</div>

								<div class="content table-responsive table-full-width">
									<table class="table table-striped">
										<thead>
											<tr>
												<th><s:message code="admin.inventory.group" /></th>
												<th><s:message code="admin.inventory.quantity" /></th>
												<th><s:message code="admin.inventory.total" /></th>
												<th><s:message code="admin.inventory.lowest" /></th>
												<th><s:message code="admin.inventory.highest" /></th>
												<th><s:message code="admin.inventory.average" /></th>
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

					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="header">
									<h4 class="title">
										<s:message code="admin.inventory.pro" />
									</h4>
								</div>

								<div class="content table-responsive table-full-width">
									<table class="table table-striped">
										<thead>
											<tr>
												<th><s:message code="admin.inventory.group" /></th>
												<th><s:message code="admin.inventory.quantity" /></th>
												<th><s:message code="admin.inventory.total" /></th>
												<th><s:message code="admin.inventory.lowest" /></th>
												<th><s:message code="admin.inventory.highest" /></th>
												<th><s:message code="admin.inventory.average" /></th>
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
			</div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>

