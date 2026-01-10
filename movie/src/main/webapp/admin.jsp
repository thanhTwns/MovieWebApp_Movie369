<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Movie369</title>

    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css?v=999">
</head>

<body class="admin-page">

<div class="sidebar">
    <a href="#" class="logo">
        <i class='bx bx-movie-play'></i>
        <span>Movie369 Admin</span>
    </a>

    <ul class="menu">
        <li><a href="admin" class="menu-item active"><i class='bx bxs-dashboard'></i> <span>Dashboard</span></a></li>
        <li><a href="LogoutServlet" class="menu-item" style="color: #dc3545;"><i class='bx bx-log-out'></i>
            <span>Đăng xuất</span></a></li>
    </ul>
</div>

<main class="main-content">

    <div class="header-admin">
        <h2>Tổng quan</h2>
        <div class="user-info">
            <span>Xin chào, <b>${sessionScope.account.username != null ? sessionScope.account.username : 'Admin'}</b></span>
            <img src="${sessionScope.account.avatarUrl != null ? sessionScope.account.avatarUrl : pageContext.request.contextPath.concat('/nhetanhdoday/default-avatar.jpg')}"
                 alt="Admin" class="user-img">
        </div>
    </div>

    <div class="stats-grid">
        <div class="card">
            <div class="card-info">
                <h3>${totalMovies}</h3>
                <p>Tổng số phim</p>
            </div>
            <div class="card-icon"><i class='bx bxs-movie-play'></i></div>
        </div>

        <div class="card">
            <div class="card-info">
                <h3><fmt:formatNumber value="${totalUsers}" type="number"/></h3>
                <p>Người dùng</p>
            </div>
            <div class="card-icon"><i class='bx bxs-group'></i></div>
        </div>

        <div class="card">
            <div class="card-info">
                <h3><fmt:formatNumber value="${totalViews}" type="number"/></h3>
                <p>Lượt xem</p>
            </div>
            <div class="card-icon"><i class='bx bxs-show'></i></div>
        </div>

        <div class="card">
            <div class="card-info">
                <h3><fmt:formatNumber value="${totalRevenue}" type="currency" currencySymbol="VND"/></h3>
                <p>Doanh thu ước tính</p>
            </div>
            <div class="card-icon"><i class='bx bxs-dollar-circle'></i></div>
        </div>
    </div>

    <div class="table-container">
        <div class="table-header">
            <h3>Danh sách phim mới nhất</h3>

            <a href="movie-form" class="btn-add" style="text-decoration: none; display: inline-flex; align-items: center; justify-content: center; gap: 5px;">
                <i class='bx bx-plus'></i> Thêm phim mới
            </a>
        </div>

        <table>
            <thead>
            <tr>
                <th>#ID</th>
                <th>Poster</th>
                <th>Tên phim</th>
                <th>Thể loại</th>
                <th>Năm</th>
                <th>Trạng thái</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listMovies}" var="m">
                <tr>
                    <td>#${m.id}</td>
                    <td class="poster-cell">
                        <img src="${m.posterUrl.startsWith('http') ? m.posterUrl : pageContext.request.contextPath.concat('/').concat(m.posterUrl)}"
                             alt="${m.title}">
                    </td>
                    <td>${m.title}</td>

                    <td>${m.series ? "Phim Bộ" : "Phim Lẻ"}</td>

                    <td>${m.releaseYear}</td>

                    <td>
                        <span class="status ${m.premium ? 'active' : 'pending'}">
                                ${m.premium ? "Premium" : "Free"}
                        </span>
                    </td>

                    <td>
                        <a href="movie-form?id=${m.id}" class="action-btn btn-edit" style="display: inline-block; padding: 6px;">
                            <i class='bx bx-edit'></i>
                        </a>

                        <a href="#" onclick="confirmDelete(${m.id})" class="action-btn btn-delete" style="display: inline-block; padding: 6px;">
                            <i class='bx bx-trash'></i>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>

<script>
    function confirmDelete(id) {
        if (confirm("Bạn có chắc chắn muốn xóa phim có ID = " + id + " không?")) {
            window.location.href = "deleteMovie?id=" + id;
        }
    }
</script>
</body>
</html>