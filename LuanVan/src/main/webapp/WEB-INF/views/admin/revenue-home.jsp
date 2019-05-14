<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:message code="admin.menu.report" /></title>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="menu.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="header.jsp"></jsp:include>
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-3 col-sm-6">
							<div class="card">
								<div class="content">
									<div class="row">
										<div class="col-xs-5">
											<div class="icon-big icon-warning text-center">
												<i class="ti-server"></i>
											</div>
										</div>
										<div class="col-xs-7">
											<div class="numbers">
												<p>
													<s:message code="admin.inventory.revenue" />
												</p>
												<p style="font-weight: bold;">
													<s:message code="revenue.byCategory" />
												</p>
											</div>
										</div>
									</div>
									<div class="footer">
										<hr>
										<div class="stats">
											<a href="admin/revenue/by-category"><i
												class="ti-pie-chart"></i> <s:message code="revenue.view" /></a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-sm-6">
							<div class="card">
								<div class="content">
									<div class="row">
										<div class="col-xs-5">
											<div class="icon-big icon-success text-center">
												<i class="ti-wallet"></i>
											</div>
										</div>
										<div class="col-xs-7">
											<div class="numbers">
												<p>
													<s:message code="admin.inventory.revenue" />
												</p>
												<p style="font-weight: bold;">
													<s:message code="revenue.byProducer" />
												</p>
											</div>
										</div>
									</div>
									<div class="footer">
										<hr>
										<div class="stats">
											<a href="admin/revenue/by-producer"><i
												class="ti-pie-chart"></i> <s:message code="revenue.view" /></a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-sm-6">
							<div class="card">
								<div class="content">
									<div class="row">
										<div class="col-xs-5">
											<div class="icon-big icon-danger text-center">
												<i class="ti-pulse"></i>
											</div>
										</div>
										<div class="col-xs-7">
											<div class="numbers">
												<p>
													<s:message code="admin.inventory.revenue" />
												</p>
												<p style="font-weight: bold;">
													<s:message code="revenue.byCustomer" />
												</p>
											</div>
										</div>
									</div>
									<div class="footer">
										<hr>
										<div class="stats">
											<a href="admin/revenue/by-customer"><i
												class="ti-pie-chart"></i> <s:message code="revenue.view" /></a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-sm-6">
							<div class="card">
								<div class="content">
									<div class="row">
										<div class="col-xs-5">
											<div class="icon-big icon-info text-center">
												<i class="ti-twitter-alt"></i>
											</div>
										</div>
										<div class="col-xs-7">
											<div class="numbers">
												<p>
													<s:message code="admin.inventory.revenue" />
												</p>
												<p style="font-weight: bold;">
													<s:message code="revenue.byProduct" />
												</p>
											</div>
										</div>
									</div>
									<div class="footer">
										<hr>
										<div class="stats">
											<a href="admin/revenue/by-product"><i
												class="ti-pie-chart"></i> <s:message code="revenue.view" /></a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-4 col-sm-8">
							<div class="card">
								<div class="content">
									<div class="row">
										<div class="col-xs-5">
											<div class="icon-big icon-danger text-center">
												<i class="ti-shopping-cart-full"></i>
											</div>
										</div>
										<div class="col-xs-7">
											<div class="numbers">
												<p>
													<s:message code="admin.inventory.revenue" />
												</p>
												<s:message code="revenue.byQuarter" />
											</div>
										</div>
									</div>
									<div class="footer">
										<hr>
										<div class="stats">
											<a href="admin/revenue/by-quarter"><i
												class="ti-pie-chart"></i> <s:message code="revenue.view" /></a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-sm-8">
							<div class="card">
								<div class="content">
									<div class="row">
										<div class="col-xs-5">
											<div class="icon-big icon-info text-center">
												<i class="ti-money"></i>
											</div>
										</div>
										<div class="col-xs-7">
											<div class="numbers">
												<p>
													<s:message code="admin.inventory.revenue" />
												</p>
												<s:message code="revenue.byMonth" />
											</div>
										</div>
									</div>
									<div class="footer">
										<hr>
										<div class="stats">
											<a href="admin/revenue/by-month"><i class="ti-pie-chart"></i>
												<s:message code="revenue.view" /></a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-sm-8">
							<div class="card">
								<div class="content">
									<div class="row">
										<div class="col-xs-5">
											<div class="icon-big icon-warning text-center">
												<i class="ti-harddrives"></i>
											</div>
										</div>
										<div class="col-xs-7">
											<div class="numbers">
												<p>
													<s:message code="admin.inventory.revenue" />
												</p>
												<s:message code="revenue.byYear" />
											</div>
										</div>
									</div>
									<div class="footer">
										<hr>
										<div class="stats">
											<a href="admin/revenue/by-year"><i class="ti-pie-chart"></i>
												<s:message code="revenue.view" /></a>
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