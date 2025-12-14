<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vn">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng Ký - Movie369</title>

    <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
</head>
<body>

    <section class="form-section" id="register">
        <div class="form-container">
            <h2 class="heading">Tạo Tài Khoản</h2>
            
            <form action="register" method="POST" class="form-content">
                
                <div class="form-input-group">
                    <label for="username" class="form-label">Tên tài khoản</label>
                    <input type="text" id="username" name="username" class="form-input" placeholder="Tên tài khoản..." required>
                </div>

                <div class="form-input-group">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" id="email" name="email" class="form-input" placeholder="nhapemail@gmail.com" required>
                </div>

                <div class="form-input-group">
                    <label for="password" class="form-label">Mật khẩu</label>
                    <input type="password" id="password" name="password" class="form-input" placeholder="••••••••" required>
                </div>
                
                <div class="form-input-group">
                    <label for="re-password" class="form-label">Nhập lại Mật khẩu</label>
                    <input type="password" id="re-password" name="re-password" class="form-input" placeholder="••••••••" required>
                </div>

                <button type="submit" class="btn btn-full">Đăng Ký</button>

                <p class="form-switch">
                    Đã có tài khoản? <a href="login.jsp" class="form-link">Đăng nhập</a>
                </p>
            </form>
        </div>
    </section>

    <script
        src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src="main.js"></script>
</body>
</html>