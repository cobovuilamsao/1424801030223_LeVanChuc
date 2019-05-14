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
<title><s:message code="employee.menu.producer" /></title>
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
							<s:message code="employee.menu.producer" />
						</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)"><s:message
										code="employee.menu.home" /></a></li>
							<li class="breadcrumb-item active"><s:message
									code="employee.producer.list" /></li>
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
									<s:message code="employee.producer.list" />
								</h4>
								<h6 class="card-subtitle">
									<s:message code="employee.here" />
								</h6>
								<!-- Tìm Kiếm -->

								<form:form action="employee/category/search.htm" method="get">
									<div class="row">
										<div class="col-md-3">
											<input type="text" name="search" placeholder="Tìm kiếm tên"
												class="form-control form-control-line" />
										</div>

										<div class="col-md-7">
											<button type="submit" class="btn btn-danger">
												<s:message code="employee.search" />
											</button>
										</div>
										<div>
											<a type="submit" href="employee/producer/add-producer.htm"
												class="btn waves-effect waves-light btn-primary pull-right hidden-sm-down"><s:message
													code="employee.producer.add" /></a>
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
												<th><s:message code="employee.producer.nameProducer" /></th>
												<th><s:message code="employee.producer.logo" /></th>
												<th><s:message code="employee.producer.address" /></th>
												<th><s:message code="employee.producer.numberPhone" /></th>
												<th><s:message code="employee.producer.email" /></th>
												<th><s:message code="employee.function" /></th>
											</tr>
										</thead>

										<tbody>
											<c:forEach items="${listProducer}" var="producer">
												<tr>
													<c:set var="count" value="${count+1 }" />
													<td>${count}</td>
													<td>${producer.nameProducer }</td>
													<td><img src="images/producers/${producer.logo }"
														height="100px" width="120px" style="border-radius: 20px"></td>
													<td>${producer.address }</td>
													<td>${producer.numberPhone }</td>
													<td>${producer.email }</td>
													<td width="180px"><a
														href="employee/producer/edit-producer/${producer.id}.htm"
														class="btn btn-info btn-simple btn-sm"> <i
															class="fa fa-edit"></i> <s:message code="employee.edit" />
													</a> <a
														href="employee/producer/delete-producer/${producer.id}.htm"
														onclick="return confirm('Bạn chắc chắn chứ ?')"
														class="btn btn-warning btn-simple btn-sm"> <i
															class="fa fa-times"></i> <s:message
																code="employee.delete" />
													</a>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<!-- Phân Trang -->
									<div style="margin: 10px; text-align: right;">
										<c:forEach begin="1" end="${rowCount}" varStatus="row">
											<a type="button" href="employee/producer/?page=${row.index}"
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
