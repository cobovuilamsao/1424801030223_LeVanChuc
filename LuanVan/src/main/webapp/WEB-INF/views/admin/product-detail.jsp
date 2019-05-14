<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:message code="admin.detail" /></title>
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

	<div class="wrapper">
		<jsp:include page="menu.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="header.jsp"></jsp:include>
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="col-lg-12 col-md-10">
									<div class="card card-user">
										<div class="image">
											<img src="assets/img/background.jpg" alt="...">
										</div>
										<div class="content">
											<div class="author">
												<img class="avatar border-white"
													src="images/products/${product.photo }" alt="...">
												<h4 class="title">
													${product.nameProduct }<br> <a href="#"><small>${product.nameProduct }</small></a>
												</h4>
											</div>
											<div style="text-align: center">
												<img src="images/products/${product.photo }" width="450"
													height="500"
													style="border-radius: 40px; border-color: black;" />

											</div>

											<h5 style="text-align: center;">
												<span><s:message code="admin.model.category" />: </span>
												${product.category.nameCategory}
											</h5>


											<h5 style="text-align: center;">
												<span><s:message code="admin.model.producer" />: </span>
												${product.producer.nameProducer}
											</h5>

											<h5 style="text-align: center;">
												<span><s:message code="admin.product.quantity" />: </span>
												${product.quantity}
											</h5>

											<h5 style="text-align: center;">
												<span><s:message code="admin.product.unitBrief" />:
												</span> ${product.unitBrief}
											</h5>

											<h5 style="text-align: center;">
												<span><s:message code="admin.product.unitPrice" />:
												</span>
												<f:formatNumber value="${product.unitPrice}"
													pattern="###,###" />
												VNĐ
											</h5>

											<h5 style="text-align: center;">
												<span><s:message code="admin.product.discount" />: </span>
												<c:choose>
													<c:when test="${product.discount == null}">0%</c:when>
													<c:when test="${product.discount == 0}">0%</c:when>
													<c:otherwise>
														<f:formatNumber value="${product.discount }"
															type="percent" />
													</c:otherwise>
												</c:choose>
											</h5>
											<h5 style="text-align: center;">
												<span><s:message code="admin.product.available" />:
												</span>
												<c:if test="${product.available == false}">
													<s:message code="admin.no" />
												</c:if>
												<c:if test="${product.available == true}">
													<s:message code="admin.yes" />
												</c:if>
											</h5>

											<h5 style="text-align: center;">
												<span><s:message code="admin.product.special" />: </span>
												<c:if test="${product.special == false}">
													<s:message code="admin.no" />
												</c:if>
												<c:if test="${product.special == true}">
													<s:message code="admin.yes" />
												</c:if>
											</h5>

											<h5 style="text-align: center;">
												<span><s:message code="admin.product.latest" />: </span>
												<c:if test="${product.latest == false}">
													<s:message code="admin.no" />
												</c:if>
												<c:if test="${product.latest == true}">
													<s:message code="admin.yes" />
												</c:if>
											</h5>

											<hr>
											<form:form
												action="admin/product/changePhoto-detail/${product.id}.htm"
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
													<h5 style="text-align: center;">
														<s:message code="admin.product.photo" />
														:
													</h5>
													<center>
														<input id="photo" type="file" name="file_image"
															style="text-align: center;" class="btn btn-info btn-fill" />

													</center>
													<br>
													<form:errors path="photo" />
													<button class="btn btn-danger btn-fill">
														<s:message code="admin.save" />
													</button>
												</div>
											</form:form>

										</div>
										<hr>
										<h5 style="text-align: center;">
											<span><s:message code="admin.product.description" />:
												<br> </span> ${product.description}
										</h5>
										<hr>
										<div class="text-center">
											<div class="row">
												<div class="col-md-3 col-md-offset-1">
													<h5></h5>
												</div>
												<div class="col-md-4">
													<h5>
														<a href="admin/product" class="btn btn-success btn-fill">
															<s:message code="admin.return" />
														</a>
													</h5>
												</div>
												<div class="col-md-3">
													<h5></h5>
												</div>
											</div>
										</div>
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