<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header>
	<a href="home" class="logo"> <i class="bx bx-movie-play"></i>
		Movie369
	</a>

	<div class="bx bx-menu" id="menu-icon" aria-label="Open menu"></div>

	<ul class="navbar">
		<li><a href="home" class="${empty activeType || activeType == 'home' ? 'active' : ''}">Trang Chủ</a></li>
		<li><a href="listMovie?type=single" class="${activeType == 'single' ? 'active' : ''}">Phim lẻ</a></li>
		<li><a href="listMovie?type=series" class="${activeType == 'series' ? 'active' : ''}">Phim bộ</a></li>

		<li class="dropdown-item" id="genre-dropdown">
			<a href="javascript:void(0);">Thể loại <i class='bx bx-chevron-down'></i></a>
			<ul class="dropdown-menu">
				<c:forEach var="g" items="${GLOBAL_GENRES}">
					<li><a href="filter?genreId=${g.id}">${g.genresName}</a></li>
				</c:forEach>
			</ul>
		</li>

		<li class="search-item">
			<div class="search-box-wrapper" style="position: relative;">
				<form action="search" method="GET" class="search-box">
					<input type="text" name="query" class="search-input" placeholder="Tìm kiếm phim..." autocomplete="off" oninput="searchByName(this)">
					<button type="submit" class="search-button"><i class='bx bx-search'></i></button>
				</form>
				<div id="search-results-container"></div>
			</div>
		</li>

		<c:if test="${sessionScope.account == null}">
			<li class="btn-item"><a href="login.jsp" class="btn">Đăng Nhập</a></li>
		</c:if>

		<c:if test="${sessionScope.account != null}">
			<li class="user-profile dropdown-item">
				<div class="profile-toggle">
					<img src="${sessionScope.account.avatarUrl}" alt="User" class="user-img">
					<span class="user-name">${sessionScope.account.username}</span>
					<i class='bx bx-chevron-down'></i>
				</div>

				<ul class="dropdown-menu user-menu">
					<c:if test="${sessionScope.account.role == '1'}">
						<li>
							<a href="admin.jsp" style="color: #ffc107; font-weight: bold; border-bottom: 1px dashed #555;">
								<i class='bx bxs-dashboard'></i> Trang Quản Trị
							</a>
						</li>
					</c:if>
					<li><a href="${pageContext.request.contextPath}/user-profile">Hồ sơ cá nhân</a></li>
					<li><a href="my-favorites">Phim yêu thích</a></li>
					<li><a href="LogoutServlet">Đăng Xuất</a></li>
				</ul>
			</li>
		</c:if>
	</ul>
	<script src="${pageContext.request.contextPath}/main.js"></script>
</header>