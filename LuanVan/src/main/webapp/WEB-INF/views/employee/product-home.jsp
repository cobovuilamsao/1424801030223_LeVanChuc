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
<title><s:message code="employee.menu.product" /></title>
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
							<s:message code="employee.menu.product" />
						</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)"><s:message
										code="employee.menu.home" /></a></li>
							<li class="breadcrumb-item active"><s:message
									code="employee.product.list" /></li>
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
									<s:message code="employee.product.list" />
								</h4>
								<h6 class="card-subtitle">
									<s:message code="employee.here" />
								</h6>
								<!-- Tìm Kiếm -->
								<form:form action="employee/product/filter.htm" method="get">
									<div class="row">
										<div class="col-md-3">
											<input type="text" name="SP" placeholder="Tìm kiếm tên"
												class="form-control form-control-line" />
										</div>
										<div class="col-md-2">
											<select name="DM" class="form-control form-control-line">
												<option selected="selected" value=""><s:message
														code="employee.category" /></option>
												<c:forEach var="category" items="${listCategory }">
													<option value="${category.id}">${category.nameCategory }</option>
												</c:forEach>
											</select>
										</div>

										<div class="col-md-2">
											<select name="HSX" class="form-control form-control-line">
												<option selected="selected" value=""><s:message
														code="employee.producer" /></option>
												<c:forEach var="producer" items="${listProducer }">
													<option value="${producer.id }">${producer.nameProducer }</option>
												</c:forEach>
											</select>
										</div>

										<div class="col-md-3">
											<button type="submit" class="btn btn-danger">
												<s:message code="employee.search" />
											</button>
										</div>
										<div>
											<a type="submit" href="employee/product/add-product.htm"
												class="btn waves-effect waves-light btn-primary pull-right hidden-sm-down"><s:message
													code="employee.product.add" /></a>
										</div>
									</div>
								</form:form>
								<br>
								<form:form action="employee/product/filterStatus.htm"
									method="get">
									<div class="row">
										<div class="col-md-2">
											<select name="filter" class="form-control border-input">
												<option selected="selected" value=""><s:message
														code="admin.status" /></option>
												<option value="0"><s:message
														code="admin.product.warning" /></option>
												<option value="1"><s:message
														code="admin.product.accept" /></option>
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
												<th><s:message code="employee.product.id" /></th>
												<th><s:message code="employee.product.nameProduct" /></th>
												<th><s:message code="employee.product.nameProducer" /></th>
												<th><s:message code="employee.product.nameCategory" /></th>
												<th><s:message code="employee.product.photo" /></th>
												<th><s:message code="employee.product.quantity" /></th>
												<th><s:message code="employee.product.productDate" /></th>
												<th><s:message code="employee.product.unitPrice" /></th>
												<th><s:message code="employee.product.discount" /></th>
												<th><s:message code="employee.product.status" /></th>
												<th><s:message code="employee.function" /></th>
											</tr>
										</thead>

										<tbody>
											<c:forEach items="${listProduct }" var="product">
												<tr>
													<c:set var="count" value="${count+1 }" />
													<td>${count }</td>
													<td>${product.id }</td>
													<td width="200px"><a
														href="employee/product/detail/${product.id }.htm">${product.nameProduct }</a></td>
													<td>${product.category.nameCategory }</td>
													<td>${product.producer.nameProducer }</td>
													<td><img src="images/products/${product.photo}"
														height="100px" width="120px" style="border-radius: 20px"></td>
													<td>${product.quantity }</td>
													<td><f:formatDate value="${product.productDate }"
															pattern="dd/MM/yyy" /></td>
													<td><f:formatNumber value="${product.unitPrice }"
															pattern="000,000" /> VNĐ</td>
													<td><c:choose>
															<c:when test="${product.discount == null}">0%</c:when>
															<c:when test="${product.discount == 0}">0%</c:when>
															<c:otherwise>
																<f:formatNumber value="${product.discount }"
																	type="percent" />
															</c:otherwise>
														</c:choose></td>
													<td><c:choose>
															<c:when test="${product.status == false }">
																<span class="btn btn-warning btn-sm"><s:message
																		code="employee.product.warning" /></span>
															</c:when>
															<c:when test="${product.status == true}">
																<span class="btn btn-primary btn-sm"><s:message
																		code="employee.product.accept" /></span>
															</c:when>
														</c:choose></td>
													<td><a
														href="employee/product/edit-product/${product.id }.htm"
														class="btn btn-info btn-simple btn-sm"> <i
															class="fa fa-edit"></i> <s:message code="employee.edit" /></a>
														<br> <a
														href="employee/product/detail/${product.id }.htm"
														class="btn btn-success btn-simple btn-sm"> <i
															class="fa fa-video-camera"></i> <s:message
																code="employee.detail" />
													</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<!-- Phân Trang -->
									<div style="margin: 10px; text-align: right;">
										<c:forEach begin="1" end="${rowCount}" varStatus="row">
											<a type="button" href="employee/product/?page=${row.index}"
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