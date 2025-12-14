<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header>
	<a href="index.jsp" class="logo"> <i class="bx bx-movie-play"></i>
		Movie369
	</a>

	<div class="bx bx-menu" id="menu-icon" aria-label="Open menu"></div>

	<ul class="navbar">
		<li><a href="index.jsp#home" class="active">Trang Chủ</a></li>
		<li><a href="index.jsp#phimle">Phim lẻ</a></li>
		<li><a href="index.jsp#phimbo">Phim bộ</a></li>

		<li class="dropdown-item"><a href="#">Thể loại <i
				class='bx bx-chevron-down'></i></a>
			<ul class="dropdown-menu">
				<li><a href="#">Hành động</a></li>
				<li><a href="#">Kinh dị</a></li>
				<li><a href="#">Tình cảm</a></li>
				<li><a href="#">Viễn tưởng</a></li>
				<li><a href="#">Hoạt hình</a></li>
			</ul></li>

		<li class="search-item">
			<form action="search" method="GET" class="search-box">
				<input type="text" name="query" class="search-input"
					placeholder="Tìm kiếm phim...">
				<button type="submit" class="search-button" aria-label="Search">
					<i class='bx bx-search'></i>
				</button>
			</form>
		</li>

		<c:if test="${sessionScope.account == null}">
			<li class="btn-item"><a href="login.jsp" class="btn">Đăng
					Nhập</a></li>
		</c:if>

		<c:if test="${sessionScope.account != null}">
			<li class="user-profile dropdown-item">
				<div class="profile-toggle">
					<img src="nhetanhdoday/default-avatar.jpg" alt="User"
						class="user-img"> <span class="user-name">${sessionScope.account.username}</span>

					<i class='bx bx-chevron-down'></i>
				</div>

				<ul class="dropdown-menu user-menu">
					<li><a href="#">Hồ sơ cá nhân</a></li>
					<li><a href="#">Phim yêu thích</a></li>
					<li><a href="LogoutServlet">Đăng Xuất</a></li>
				</ul>
			</li>
		</c:if>
	</ul>
</header>