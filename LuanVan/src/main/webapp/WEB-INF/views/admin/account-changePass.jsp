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
<title><s:message code="admin.account.changePass" /></title>
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
										<s:message code="admin.account.changePass" />
										${message }
									</h4>
								</div>

								<div class="content">
									<form:form
										action="admin/change-pass/${account.username}.htm"
										method="POST" commandName="account">
										<div>
											<form:hidden path="access" />
											<form:hidden path="username" />
											<form:hidden path="fullName" />
										</div>
										<div class="row">
											<!-- Dòng đầu -->
											<div class="col-md-4">
												<div class="form-group">
													<label><s:message code="admin.account.oldPass" />:
													</label>
													<form:input path="password" readonly="true" size="30"
														maxlength="30" class="form-control border-input" />
												</div>
											</div>

											<div class="col-md-4">
												<div class="form-group">
													<label><s:message code="admin.account.newPass" />:
														(<span style="color: red;">*</span>)<form:errors
															path="password" /></label> <input id="password" name="password1"
														type="password" placeholder="Nhập mật khẩu" size="30"
														maxlength="30" class="form-control border-input" />
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label><s:message code="admin.account.confirmPass" />:
														(<span style="color: red;">*</span>)<form:errors
															path="password" /></label> <input id="password" name="password2"
														type="password" placeholder="Nhập mật khẩu" size="30"
														maxlength="30" class="form-control border-input" />
												</div>
											</div>
										</div>
										<br>
										<div class="text-center">
											<button type="submit" class="btn btn-danger btn-fill btn-wd">
												<s:message code="admin.account.changePass" />
											</button>
										</div>
										<div class="clearfix"></div>
										<br>

									</form:form>
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