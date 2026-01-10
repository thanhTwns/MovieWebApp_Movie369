<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <li><a href="#" class="menu-item active"><i class='bx bxs-dashboard'></i> <span>Dashboard</span></a></li>
        <li><a href="#" class="menu-item"><i class='bx bxs-movie'></i> <span>Quản lý Phim</span></a></li>
        <li><a href="#" class="menu-item"><i class='bx bxs-user-detail'></i> <span>Người dùng</span></a></li>
        <li><a href="#" class="menu-item"><i class='bx bxs-comment-detail'></i> <span>Bình luận</span></a></li>
        <li><a href="#" class="menu-item"><i class='bx bxs-cog'></i> <span>Cài đặt</span></a></li>
        <li><a href="#" class="menu-item" style="color: #dc3545;"><i class='bx bx-log-out'></i> <span>Đăng xuất</span></a></li>
    </ul>
</div>

<main class="main-content">

    <div class="header-admin">
        <h2>Tổng quan</h2>
        <div class="user-info">
            <span>Xin chào, <b>Admin</b></span>
            <img src="${pageContext.request.contextPath}/nhetanhdoday/default-avatar.jpg" alt="Admin" class="user-img">
        </div>
    </div>

    <div class="stats-grid">
        <div class="card">
            <div class="card-info">
                <h3>150</h3>
                <p>Tổng số phim</p>
            </div>
            <div class="card-icon"><i class='bx bxs-movie-play'></i></div>
        </div>
        <div class="card">
            <div class="card-info">
                <h3>1,250</h3>
                <p>Người dùng</p>
            </div>
            <div class="card-icon"><i class='bx bxs-group'></i></div>
        </div>
        <div class="card">
            <div class="card-info">
                <h3>45.2K</h3>
                <p>Lượt xem</p>
            </div>
            <div class="card-icon"><i class='bx bxs-show'></i></div>
        </div>
        <div class="card">
            <div class="card-info">
                <h3>$3,400</h3>
                <p>Doanh thu</p>
            </div>
            <div class="card-icon"><i class='bx bxs-dollar-circle'></i></div>
        </div>
    </div>

    <div class="table-container">
        <div class="table-header">
            <h3>Danh sách phim mới nhất</h3>
            <button class="btn-add"><i class='bx bx-plus'></i> Thêm phim mới</button>
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
            <tr>
                <td>#001</td>
                <td class="poster-cell">
                    <img src="${pageContext.request.contextPath}/nhetanhdoday/thầy bạch.jpg" alt="">
                </td>
                <td>Breaking Bad</td>
                <td>Hành động, Tội phạm</td>
                <td>2025</td>
                <td><span class="status active">Hiển thị</span></td>
                <td>
                    <button class="action-btn btn-edit"><i class='bx bx-edit'></i></button>
                    <button class="action-btn btn-delete"><i class='bx bx-trash'></i></button>
                </td>
            </tr>

            <tr>
                <td>#002</td>
                <td class="poster-cell">
                    <img src="${pageContext.request.contextPath}/nhetanhdoday/arcane.jpg" alt="">
                </td>
                <td>Arcane</td>
                <td>Hoạt hình, Viễn tưởng</td>
                <td>2024</td>
                <td><span class="status pending">Chờ duyệt</span></td>
                <td>
                    <button class="action-btn btn-edit"><i class='bx bx-edit'></i></button>
                    <button class="action-btn btn-delete"><i class='bx bx-trash'></i></button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>