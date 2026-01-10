<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vn">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng Nhập - Movie369</title>

    <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
</head>
<body>

    <section class="form-section" id="login">
        <div class="form-container">
            <h2 class="heading">Đăng Nhập</h2>
            <c:if test="${not empty mess}">
                <div class="alert alert-danger" style="color: red; text-align: center; margin-bottom: 10px;">
                        ${mess}
                </div>
            </c:if>
            <form action="login" method="POST" class="form-content">
                <input type="hidden" name="redirect" value="${param.redirect}">
                <div class="form-input-group">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" id="email" name="email" class="form-input" placeholder="Email" required>
                </div>

                <div class="form-input-group">
                    <label for="password" class="form-label">Mật khẩu</label>
                    <input type="password" id="password" name="password" class="form-input" placeholder="••••••••" required>
                </div>
                
                <div class="form-options">
                    <a href="forgot-password.jsp" class="form-link">Quên mật khẩu?</a>
                </div>

                <button type="submit" class="btn btn-full">Đăng Nhập</button>

                <p class="form-switch">
                    Chưa có tài khoản? <a href="register.jsp" class="form-link">Đăng ký ngay</a>
                </p>
            </form>
        </div>
    </section>

    <script
        src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src="main.js"></script>
</body>
</html>