<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:message code="admin.menu.product" /></title>
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
								<div class="header">
									<h4 class="title">
										<s:message code="admin.product.list" />
									</h4>
									<p class="category">
										<s:message code="admin.here" />
										<span style="color: red"> ${message}</span>
									</p>
								</div>

								<div style="clear: both; width: 98%; margin: 10px auto;">
									<!-- Tìm Kiếm -->
									<form:form action="admin/product/filter.htm" method="get">
										<div class="col-md-2">
											<div class="form-group">
												<input type="text" name="SP" placeholder="Tìm kiếm"
													class="form-control border-input" />
											</div>
										</div>

										<div class="col-md-2">
											<div class="form-group">
												<select name="HSX" class="form-control border-input">
													<option selected="selected" value=""><s:message
															code="admin.producer" /></option>
													<c:forEach var="producer" items="${listProducer}">
														<option value="${producer.id}">${producer.nameProducer}</option>
													</c:forEach>
												</select>
											</div>
										</div>

										<div class="col-md-2">
											<div class="form-group">
												<select name="DM" class="form-control border-input">
													<option selected="selected" value=""><s:message
															code="admin.category" /></option>
													<c:forEach var="category" items="${listCategory}">
														<option value="${category.id}">${category.nameCategory}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
												<button type="submit" class="btn btn-danger btn-fill">
													<s:message code="admin.search" />
												</button>
											</div>
										</div>
									</form:form>

									<!-- Lọc trạng thái -->
									<form:form action="admin/product/filterStatus.htm" method="get">

										<div class="col-md-2">
											<div class="form-group">
												<select name="filter" class="form-control border-input">
													<option selected="selected" value=""><s:message
															code="admin.status" /></option>
													<option value="0"><s:message
															code="admin.product.warning" /></option>
													<option value="1"><s:message
															code="admin.product.accept" /></option>
												</select>
											</div>
										</div>

										<div class="col-md-2">
											<div class="form-group">
												<button type="submit" class="btn btn-primary btn-fill">
													<s:message code="admin.filter" />
												</button>
											</div>
										</div>
									</form:form>

								</div>
								<!-- Show -->
								<div class="content table-responsive table-full-width">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>#</th>
												<th><s:message code="admin.product.id" /></th>
												<th><s:message code="admin.product.nameProduct" /></th>
												<th><s:message code="admin.product.nameCategory" /></th>
												<th><s:message code="admin.product.nameProducer" /></th>
												<th><s:message code="admin.product.photo" /></th>
												<th><s:message code="admin.product.quantity" /></th>
												<th><s:message code="admin.product.unitPrice" /></th>
												<th><s:message code="admin.product.discount" /></th>
												<th><s:message code="admin.product.status" /></th>
												<th><s:message code="admin.function" /></th>
											</tr>

										</thead>
										<tbody>
											<c:forEach items="${listProduct}" var="product">
												<tr>
													<c:set var="count" value="${count+1 }" />
													<td>${count}</td>
													<td>${product.id }</td>
													<td width="160px"><i class="fa fa-video-camera"></i><a
														href="admin/product/detail/${product.id }.htm">${product.nameProduct }</a></td>
													<td>${product.category.nameCategory }</td>
													<td>${product.producer.nameProducer }</td>
													<td><img src="images/products/${product.photo }"
														height="100px" width="120px" style="border-radius: 25px"></td>
													<td>${product.quantity }</td>
													<td><f:formatNumber value="${product.unitPrice }"
															pattern="###,###" /> VNĐ</td>
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
																<span class="btn btn-warning btn-fill btn-sm"><s:message
																		code="admin.product.warning" /></span>

															</c:when>
															<c:when test="${product.status == true}">
																<span class="btn btn-success btn-fill btn-sm"><s:message
																		code="admin.product.accept" /></span>
															</c:when>
														</c:choose></td>
													<td><c:if test="${product.status == false }">
															<a href="admin/product/accept-product/${product.id}.htm"
																class="btn btn-info btn-simple btn-xs"> <i
																class="fa ti-help"></i> <s:message code="admin.confirm" />
															</a>
															<br>
															<a href="admin/product/edit-product/${product.id}.htm"
																class="btn btn-success btn-simple btn-xs"> <i
																class="fa fa-save"></i> <s:message code="admin.edit" />
															</a>
															<br>
															<a href="admin/product/cannel-product/${product.id}.htm"
																onclick="return confirm('Bạn chắc chắn muốn hủy bỏ sản phẩm ?')"
																class="btn btn-danger btn-simple btn-xs"> <i
																class="fa fa-times"></i> <s:message code="admin.cannel" />
															</a>

														</c:if> <c:if test="${product.status == true }">
															<a href="admin/product/edit-product/${product.id}.htm"
																class="btn btn-success btn-simple btn-xs"> <i
																class="fa fa-save"></i> <s:message code="admin.edit" />
															</a>
															<br>
															<a href="admin/product/cannel-product/${product.id}.htm"
																onclick="return confirm('Bạn chắc chắn chứ ?')"
																class="btn btn-danger btn-simple btn-xs"> <i
																class="fa fa-times"></i> <s:message code="admin.delete" />
															</a>

														</c:if></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>

									<!-- Phân Trang -->
									<div style="margin: 10px; text-align: right;">
										<c:forEach begin="1" end="${rowCount}" varStatus="row">
											<a type="button" href="admin/product/?page=${row.index}"
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