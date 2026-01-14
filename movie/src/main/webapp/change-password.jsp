<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đổi mật khẩu - Movie369</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>


<section class="form-section" style="padding-top: 100px; min-height: 80vh;">
    <div class="form-container">
        <h2 class="heading">Đổi Mật Khẩu</h2>

        <c:if test="${not empty mess}">
            <div style="text-align: center; margin-bottom: 15px; padding: 10px; border-radius: 5px;
                    background-color: ${messageType == 'success' ? '#d4edda' : '#f8d7da'};
                    color: ${messageType == 'success' ? '#155724' : '#721c24'};">
                    ${mess}
            </div>
        </c:if>

        <form action="changePassword" method="POST" class="form-content">

            <div class="form-input-group">
                <label class="form-label">Mật khẩu hiện tại</label>
                <input type="password" name="oldPass" class="form-input" placeholder="Nhập mật khẩu cũ..." required>
            </div>

            <div class="form-input-group">
                <label class="form-label">Mật khẩu mới</label>
                <input type="password" name="newPass" class="form-input" placeholder="Nhập mật khẩu mới..." required>
            </div>

            <div class="form-input-group">
                <label class="form-label">Xác nhận mật khẩu mới</label>
                <input type="password" name="confirmPass" class="form-input" placeholder="Nhập lại mật khẩu mới..." required>
            </div>

            <button type="submit" class="btn btn-full">Lưu thay đổi</button>

            <div style="text-align: center; margin-top: 15px;">
                <a href="home" class="form-link">Hủy bỏ</a>
            </div>
        </form>
    </div>
</section>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>