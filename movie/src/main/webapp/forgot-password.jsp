<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quên mật khẩu - Movie369</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
</head>
<body>

<section class="form-section">
    <div class="form-container">

        <h2 class="heading" style="border: none; margin-bottom: 10px;">Quên Mật Khẩu</h2>
        <p style="text-align: center; color: #aaa; font-size: 0.9rem; margin-bottom: 25px;">
            Nhập email đăng ký để nhận mã xác thực
        </p>

        <% if (request.getAttribute("mess") != null) { %>
        <div class="alert-msg">
            ${mess}
        </div>
        <% } %>

        <form action="forgotPassword" method="post" class="form-content">
            <div class="form-input-group">
                <label class="form-label" for="email">Email đăng ký</label>
                <input type="email" id="email" name="email" class="form-input" required placeholder="Ví dụ: abc@gmail.com">
            </div>

            <button type="submit" class="btn btn-full" style="width: 100%; margin-top: 10px;">Gửi mã xác nhận</button>

            <div class="form-switch">
                <a href="login.jsp" class="form-link">Quay lại Đăng nhập</a>
            </div>
        </form>
    </div>
</section>

</body>
</html>