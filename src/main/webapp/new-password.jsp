<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đặt lại mật khẩu - Movie369</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>

<section class="form-section">
    <div class="form-container">
        <h2 class="heading" style="border: none; margin-bottom: 20px;">Đặt lại mật khẩu</h2>

        <% if (request.getAttribute("mess") != null) { %>
        <div style="color: #ff6b6b; text-align: center; margin-bottom: 15px; background: rgba(255,0,0,0.1); padding: 10px; border-radius: 4px;">
            ${mess}
        </div>
        <% } %>

        <form action="newPassword" method="post" class="form-content">
            <div class="form-input-group">
                <label class="form-label">Mật khẩu mới</label>
                <input type="password" name="newPass" class="form-input" required placeholder="Nhập mật khẩu mới...">
            </div>

            <div class="form-input-group">
                <label class="form-label">Xác nhận mật khẩu</label>
                <input type="password" name="confirmPass" class="form-input" required placeholder="Nhập lại mật khẩu...">
            </div>

            <button type="submit" class="btn btn-full" style="width: 100%; margin-top: 10px; cursor: pointer;">Lưu mật khẩu</button>

            <div class="form-switch">
                <a href="login.jsp" class="form-link">Quay lại đăng nhập</a>
            </div>
        </form>
    </div>
</section>

</body>
</html>