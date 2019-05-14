<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:message code="employee.menu.revenue" /></title>
</head>
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
						<s:message code="employee.menu.revenue" />
					</h3>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)"><s:message
									code="employee.menu.home" /></a></li>
						<li class="breadcrumb-item active"><s:message
								code="employee.menu.revenue" /></li>
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


			<!-- End PAge Content -->
			<div class="row">
				<div class="col-lg-3 col-xlg-5 col-md-5">
					<div class="card">
						<img class="card-img-top"
							src="lite/images/background/profile-bg.jpg" height="75px">
						<div class="card-block little-profile text-center">
							<div class="pro-img">
								<img src="lite/images/tk.jpeg" alt="tk">
							</div>
							<h3 class="m-b-0">
								<s:message code="employee.inventory.revenue" />
							</h3>
							<p>
								<s:message code="revenue.byCategory" />
							</p>
							<a href="employee/revenue/by-category"
								class="m-t-10 waves-effect waves-dark btn btn-primary btn-md btn-rounded"><s:message
									code="employee.detail" /></a>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-xlg-5 col-md-5">
					<div class="card">
						<img class="card-img-top"
							src="lite/images/background/profile-bg.jpg" height="75px">
						<div class="card-block little-profile text-center">
							<div class="pro-img">
								<img src="lite/images/tk.jpeg" alt="tk">
							</div>
							<h3 class="m-b-0">
								<s:message code="employee.inventory.revenue" />
							</h3>
							<p>
								<s:message code="revenue.byProducer" />
							</p>
							<a href="employee/revenue/by-producer"
								class="m-t-10 waves-effect waves-dark btn btn-primary btn-md btn-rounded"><s:message
									code="employee.detail" /></a>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-xlg-5 col-md-5">
					<div class="card">
						<img class="card-img-top"
							src="lite/images/background/profile-bg.jpg" height="75px">
						<div class="card-block little-profile text-center">
							<div class="pro-img">
								<img src="lite/images/tk.jpeg" alt="tk">
							</div>
							<h3 class="m-b-0">
								<s:message code="employee.inventory.revenue" />
							</h3>
							<p>
								<s:message code="revenue.byCustomer" />
							</p>
							<a href="employee/revenue/by-customer"
								class="m-t-10 waves-effect waves-dark btn btn-primary btn-md btn-rounded"><s:message
									code="employee.detail" /></a>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-xlg-5 col-md-5">
					<div class="card">
						<img class="card-img-top"
							src="lite/images/background/profile-bg.jpg" height="75px">
						<div class="card-block little-profile text-center">
							<div class="pro-img">
								<img src="lite/images/tk.jpeg" alt="tk">
							</div>
							<h3 class="m-b-0">
								<s:message code="employee.inventory.revenue" />
							</h3>
							<p>
								<s:message code="revenue.byProduct" />
							</p>
							<a href="employee/revenue/by-product"
								class="m-t-10 waves-effect waves-dark btn btn-primary btn-md btn-rounded"><s:message
									code="employee.detail" /></a>
						</div>
					</div>
				</div>

			</div>
			<!-- End PAge Content -->
			<div class="row">
				<div class="col-lg-4 col-xlg-5 col-md-5">
					<div class="card">
						<img class="card-img-top"
							src="lite/images/background/profile-bg.jpg" height="75px">
						<div class="card-block little-profile text-center">
							<div class="pro-img">
								<img src="lite/images/bc.jpg" alt="bc">
							</div>
							<h3 class="m-b-0">
								<s:message code="employee.inventory.revenue" />
							</h3>
							<p>
								<s:message code="revenue.byQuarter" />
							</p>
							<a href="employee/revenue/by-quarter"
								class="m-t-10 waves-effect waves-dark btn btn-danger btn-md btn-rounded"><s:message
									code="employee.detail" /></a>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-xlg-5 col-md-5">
					<div class="card">
						<img class="card-img-top"
							src="lite/images/background/profile-bg.jpg" height="75px">
						<div class="card-block little-profile text-center">
							<div class="pro-img">
								<img src="lite/images/bc.jpg" alt="bc">
							</div>
							<h3 class="m-b-0">
								<s:message code="employee.inventory.revenue" />
							</h3>
							<p>
								<s:message code="revenue.byMonth" />
							</p>
							<a href="employee/revenue/by-month"
								class="m-t-10 waves-effect waves-dark btn btn-danger btn-md btn-rounded"><s:message
									code="employee.detail" /></a>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-xlg-5 col-md-5">
					<div class="card">
						<img class="card-img-top"
							src="lite/images/background/profile-bg.jpg" height="75px">
						<div class="card-block little-profile text-center">
							<div class="pro-img">
								<img src="lite/images/bc.jpg" alt="bc">
							</div>
							<h3 class="m-b-0">
								<s:message code="employee.inventory.revenue" />
							</h3>
							<p>
								<s:message code="revenue.byYear" />
							</p>
							<a href="employee/revenue/by-year"
								class="m-t-10 waves-effect waves-dark btn btn-danger btn-md btn-rounded"><s:message
									code="employee.detail" /></a>
						</div>
					</div>
				</div>



			</div>
			<!--  -->
		</div>
		<!-- End Container fluid  -->
		<!-- footer -->
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</div>
</html>