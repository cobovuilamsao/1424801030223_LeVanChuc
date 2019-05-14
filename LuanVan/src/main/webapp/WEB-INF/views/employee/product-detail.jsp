<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:message code="employee.detail" /></title>
<style type="text/css">
*[id$=errors] {
	color: red;
	font-style: italic;
	padding-left: 33px;
	background: url("images/hieuboy2.gif") no-repeat left center;
}
</style>
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
				<div class="row">
					<div class="col-lg-12 col-xlg-5 col-md-5">
						<div class="card">
							<img class="card-img-top" src="images/products/${product.photo }"
								height="400px" />
							<div class="card-block little-profile text-center">
								<div class="pro-img">
									<img src="images/products/${product.photo }" />
								</div>
								<h3 class="m-b-0">${product.nameProduct }</h3>
								<p>${product.nameProduct }</p>

								<h5 style="text-align: center;">
									<span><s:message code="employee.product.nameProducer" />:
									</span> ${product.producer.nameProducer}
								</h5>

								<h5 style="text-align: center;">
									<span><s:message code="employee.product.nameCategory" />:
									</span> ${product.category.nameCategory}
								</h5>

								<h5 style="text-align: center;">
									<span><s:message code="employee.product.quantity" />: </span>
									${product.quantity}
								</h5>

								<h5 style="text-align: center;">
									<span><s:message code="employee.product.unitPrice" />:
									</span> ${product.unitPrice}
								</h5>

								<h5 style="text-align: center;">
									<span><s:message code="employee.product.unitBrief" />:
									</span> ${product.unitBrief}
								</h5>

								<h5 style="text-align: center;">
									<span><s:message code="employee.product.discount" />: </span>
									<c:choose>
										<c:when test="${product.discount == null}">0%</c:when>
										<c:when test="${product.discount == 0}">0%</c:when>
										<c:otherwise>
											<f:formatNumber value="${product.discount }" type="percent" />
										</c:otherwise>
									</c:choose>							
								</h5>

								<h5 style="text-align: center;">
									<span><s:message code="employee.product.views" />: </span>
									${product.views}
								</h5>

								<hr>
								<!-- Đặc Điểm -->
								<div style="text-align: center;">
									<form:form
										action="employee/product/change-detail/${product.id }.htm"
										method="POST" commandName="product">
										<%-- <div>
							<label>Đặc Điểm: </label> <label><form:checkbox
									path="available" /> Available</label> <label><form:checkbox
									path="special" /> Special</label> <label><form:checkbox
									path="latest" /> Latest</label>
							<button>Lưu</button>
						</div> --%>
										<div class="row">
											<div class="col-md-3">
												<label><s:message code="employee.product.available" />:
												</label>
												<form:select path="available"
													class="form-control form-control-line">
													<form:option value="0">
														<s:message code="employee.select" />
													</form:option>
													<form:option value="1">
														<s:message code="employee.yes" />
													</form:option>
												</form:select>
											</div>
											<div class="col-md-3">
												<label><s:message code="employee.product.special" />:
												</label>
												<form:select path="special"
													class="form-control form-control-line">
													<form:option value="0">
														<s:message code="employee.select" />
													</form:option>
													<form:option value="1">
														<s:message code="employee.yes" />
													</form:option>
												</form:select>
											</div>
											<div class="col-md-3">
												<label><s:message code="employee.product.latest" />:
												</label>
												<form:select path="latest"
													class="form-control form-control-line">
													<form:option value="0">
														<s:message code="employee.select" />
													</form:option>
													<form:option value="1">
														<s:message code="employee.yes" />
													</form:option>
												</form:select>
											</div>
											<div class="col-md-3">
												<label><s:message code="employee.function" /></label> <br>
												<button class="btn btn-danger">
													<s:message code="employee.save" />
												</button>
											</div>
										</div>
										<div>
											<form:hidden path="status" />
											<form:hidden path="description" />
											<form:hidden path="photo" />
											<form:hidden path="nameProduct" />
											<form:hidden path="quantity" />
											<form:hidden path="unitBrief" />
											<form:hidden path="unitPrice" />
											<form:hidden path="productDate" />
											<form:hidden path="producer.id" items="${producer}"
												itemValue="id" itemLabel="nameProducer" />

											<form:hidden path="category.id" items="${category}"
												itemValue="id" itemLabel="nameCategory" />
										</div>

									</form:form>
								</div>
								<br>
								<!-- Thay Ảnh -->
								<div style="text-align: center;">
									<form:form
										action="employee/product/changePhoto-detail/${product.id }.htm"
										method="POST" commandName="product"
										enctype="multipart/form-data">
										<div>
											<form:hidden path="status" />
											<form:hidden path="description" />
											<form:hidden path="available" />
											<form:hidden path="special" />
											<form:hidden path="latest" />
											<form:hidden path="photo" />
											<form:hidden path="nameProduct" />
											<form:hidden path="quantity" />
											<form:hidden path="unitBrief" />
											<form:hidden path="unitPrice" />
											<form:hidden path="productDate" />
											<form:hidden path="producer.id" items="${producer}"
												itemValue="id" itemLabel="nameProducer" />

											<form:hidden path="category.id" items="${category}"
												itemValue="id" itemLabel="nameCategory" />
										</div>
										<div style="text-align: center;">
											<label><s:message code="employee.product.photo" />:
											</label> <input id="photo" type="file" name="file_image" /> <br>
											<form:errors path="photo" />
											<br>
											<button class="btn btn-warning">
												<s:message code="employee.save" />
											</button>
										</div>
									</form:form>

								</div>
								<hr>
								<h5 style="text-align: center;">
									<span><s:message code="employee.product.description" />:
									</span><br> ${product.description}
								</h5>
								<hr>
								<a href="employee/product"
									class="m-t-10 waves-effect waves-dark btn btn-primary btn-md btn-rounded"><s:message
										code="employee.return" /></a>
								<!--  -->
								<div class="row text-center m-t-20"></div>
							</div>
							<!--  -->

						</div>

					</div>
				</div>
				<!-- End Bread crumb and right sidebar toggle -->

			</div>
			<!-- End Container fluid  -->
			<!-- footer -->
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>


</body>
</html>