<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<script src="/HieuBoyShop/nicEditor/nicEdit.js" type="text/javascript"></script>
<script type="text/javascript">
	bkLib.onDomLoaded(function() {
		//new nicEditor().panelInstance('description');
		new nicEditor({
			fullPanel : true,
			iconsPath : '/HieuBoyShop/nicEditor/nicEditorIcons.gif',
			uploadURI : '/HieuBoyShop/nicEditor/upload',
			buttonList : [ 'fontSize', 'bold', 'italic', 'underline',
					'strikeThrough', 'subscript', 'superscript', 'html',
					'image' ],
			maxHeight : 150
		}).panelInstance('description');
	});
</script>
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:message code="employee.product.edit" /></title>
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
							<s:message code="employee.menu.product" />
						</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)"><s:message
										code="employee.menu.home" /></a></li>
							<li class="breadcrumb-item active"><s:message
									code="employee.product.edit" /></li>
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
									<s:message code="employee.product.edit" />
								</h4>
								<form:form
									action="employee/product/edit-product/${product.id }.htm"
									method="POST" commandName="product">
									<div class="row">
										<div class="col-md-6">
											<label><s:message code="employee.product.nameProduct" />:
												(<span style="color: red;">*</span>)<form:errors
													path="nameProduct" /></label>
											<form:input path="nameProduct" placeholder="Tên sản phẩm"
												size="30" maxlength="30"
												class="form-control form-control-line" />
										</div>
										<div class="col-md-6">
											<label><s:message code="employee.product.quantity" />:
												(<span style="color: red;">*</span>)<form:errors
													path="quantity" /></label>
											<form:input path="quantity" placeholder="Số lượng" size="30"
												maxlength="30" class="form-control form-control-line"
												type="number" />
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-md-6">
											<label><s:message code="employee.product.unitBrief" />:
												(<span style="color: red;">*</span>)<form:errors
													path="unitBrief" /></label>
											<form:input path="unitBrief" placeholder="Đơn vị tính"
												size="30" maxlength="30"
												class="form-control form-control-line" />
										</div>
										<div class="col-md-6">
											<label><i class="fa fa-calendar bigger-110"> </i> <s:message
													code="employee.product.productDate" />: (<span
												style="color: red;">*</span>)<form:errors path="productDate" /></label>
											<form:input path="productDate" id="datepicker"
												placeholder="dd/MM/yyyy" size="30" maxlength="30"
												class="form-control form-control-line" />
										</div>
									</div>
									<br>

									<div class="row">
										<div class="col-md-6">
											<label><s:message code="employee.product.unitPrice" />:
												(<span style="color: red;">*</span>)<form:errors
													path="unitPrice" /></label>
											<form:input path="unitPrice" placeholder="Đơn giá" size="30"
												maxlength="30" type="number"
												class="form-control form-control-line" readonly="true" />
										</div>
										<div class="col-md-6">
											<label><s:message code="employee.product.discount" />:
											</label>

											<form:select path="discount"
												class="form-control form-control-line">
												<form:option value="0">
													<s:message code="employee.select" />
												</form:option>
												<form:option value="0.03">3 %</form:option>
												<form:option value="0.05">5 %</form:option>
												<form:option value="0.09">8 %</form:option>
												<form:option value="0.10">10 %</form:option>
											</form:select>
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-md-6">
											<label for="category.id"><s:message
													code="employee.product.nameCategory" /> (<span
												style="color: red;">*</span>) </label>
											<form:select path="category.id" items="${category}"
												itemValue="id" itemLabel="nameCategory"
												class="form-control form-control-line" />
										</div>
										<div class="col-md-6">
											<label for="producer.id"><s:message
													code="employee.product.nameProducer" /> (<span
												style="color: red;">*</span>) </label>
											<form:select path="producer.id" items="${producer}"
												itemValue="id" itemLabel="nameProducer"
												class="form-control form-control-line" />
										</div>
									</div>
									<br>

									<div class="row">
										<div class="col-md-4">
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
										<div class="col-md-4">
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
										<div class="col-md-4">
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
									</div>

									<%-- <label class="checkbox-inline">Đặc Điểm: </label>
									<label><form:checkbox path="available"
											class="form-control form-control-line" /> Available</label>
									<label><form:checkbox path="special"
											class="form-control form-control-line" /> Special</label>
									<label><form:checkbox path="latest"
											class="form-control form-control-line" /> Latest</label> --%>

									<br>
									<div class="row">
										<div class="col-md-6">
											<form:hidden path="photo" />
											<br> <br> <br> <br>
											<div style="text-align: center;">
												<button class="btn btn-danger btn-lg">
													<s:message code="employee.product.edit" />
												</button>
											</div>
										</div>
										<div class="col-md-6">
											<label for="description"><s:message
													code="employee.product.description" />:</label>
											<form:textarea path="description" rows="5"
												style="text-align: center; width:570px; height:200px"
												class="form-control form-control-line" />
										</div>
									</div>
									<br>
									<form:hidden path="status" />
								</form:form>

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