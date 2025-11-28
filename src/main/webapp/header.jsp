<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header>
    <a href="#" class="logo"> <i class="bx bx-movie-play"></i>
        Movie369
    </a>
    <div class="bx bx-menu" id="menu-icon" aria-label="Open menu"></div>
    <ul class="navbar">
        <li><a href="#home" class="active">Trang Chủ</a></li>
        <li><a href="#phimle">Phim lẻ</a></li>
        <li><a href="#phimbo">Phim bộ</a></li>
        <li class="dropdown-item">
    <a href="#">Thể loại <i class='bx bx-chevron-down'></i></a>
    
    <ul class="dropdown-menu">
        <li><a href="#">Hành động</a></li>
        <li><a href="#">Kinh dị</a></li>
        <li><a href="#">Tình cảm</a></li>
        <li><a href="#">Viễn tưởng</a></li>
        <li><a href="#">Hoạt hình</a></li>
    </ul>
</li>
        <li class="search-item">
            <form action="search" method="GET" class="search-box">
                <input type="text" name="query" class="search-input"
                    placeholder="Tìm kiếm phim...">
                <button type="submit" class="search-button" aria-label="Search">
                    <i class='bx bx-search'></i>
                </button>
            </form>
        </li>
        <li class="btn-item"><a href="login.jsp" class="btn">Đăng Nhập</a></li>
    </ul>
</header>