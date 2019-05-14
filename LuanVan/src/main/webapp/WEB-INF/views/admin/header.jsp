<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar bar1"></span> <span class="icon-bar bar2"></span> <span
					class="icon-bar bar3"></span>
			</button>

			<c:if test="${sessionScope.account.fullName != null}">
				<a class="navbar-brand"><s:message code="admin.header.hello" />
					<span style="color: #EB5E28">${sessionScope.account.fullName}</span></a>
			</c:if>

			<c:if test="${sessionScope.account.fullName == null}">
				<a class="navbar-brand" href="admin"> <i class="ti-user"></i> <span><s:message
							code="admin.header.login" /></span></a>
			</c:if>

		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right">



				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> <i class="ti-panel"></i> <span><s:message
								code="admin.header.language" /></span> <b class="caret"></b>

				</a>
					<ul class="dropdown-menu">
						<li><a href="?lang=vi" data-lang="vi">Tiếng việt</a></li>
						<li><a href="?lang=en" data-lang="en">English</a></li>
					</ul></li>



				<c:if test="${sessionScope.account.fullName != null}">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <i class="ti-settings"></i> <span><s:message
									code="admin.header.account" /></span> <b class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li><a href="#"><s:message
										code="admin.header.updateInfo" /></a></li>
							<li><a href="admin/change-pass/${account.username}.htm"><s:message
										code="admin.header.updatePass" /></a></li>
							<li><a href="admin/logout"
								onclick="return confirm('Bạn chắc chắn muốn đăng xuất ?')"><s:message
										code="admin.header.logout" /></a></li>
						</ul>
					</li>
				</c:if>
			</ul>

		</div>
	</div>
</nav>

