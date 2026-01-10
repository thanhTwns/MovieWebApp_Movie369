<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vn">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Xác thực tài khoản</title>
    <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />
</head>
<body>

<section class="form-section">
    <div class="form-container">
        <h2 class="heading">Xác thực Email</h2>

        <div style="text-align: center; margin-bottom: 20px; color: #666;">
            <i class='bx bx-envelope' style="font-size: 50px; color: var(--main-color);"></i>
            <p>Mã xác thực đã được gửi tới email của bạn.</p>
        </div>

        <form action="verify" method="POST" class="form-content">
            <div class="form-input-group">
                <label class="form-label">Nhập mã 6 số</label>
                <input type="text" name="otp" class="form-input" placeholder="Ví dụ: 123456"
                       style="text-align: center; letter-spacing: 5px; font-weight: bold; font-size: 1.2rem;" required>
            </div>

            <p style="text-align: center; margin-bottom: 15px; font-weight: 500;
                    color: ${messageType == 'success' ? '#28a745' : '#ff4d4d'};">
                ${mess}
            </p>

            <button type="submit" class="btn btn-full">Xác nhận</button>

            <p class="form-switch" style="margin-top: 20px;">
                Chưa nhận được mã? <a href="resend" class="form-link">Gửi lại</a>
            </p>
        </form>
    </div>
</section>

</body>
</html>