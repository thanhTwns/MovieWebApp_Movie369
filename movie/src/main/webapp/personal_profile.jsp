<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Hồ sơ cá nhân - Movie369</title>


    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">


</head>


<body class="profile-page">

<jsp:include page="header.jsp" />

<div class="page">
    <div class="profile-card">
        <!-- LEFT -->
        <aside class="left">
            <div class="avatar">AV</div>

            <h3 class="name">
                <c:choose>
                    <c:when test="${sessionScope.account != null}">
                        ${sessionScope.account.username}
                    </c:when>
                    <c:otherwise>Khách</c:otherwise>
                </c:choose>
            </h3>

            <p class="sub">Hồ sơ cá nhân • Movie369</p>

            <div class="chip">Vai trò: User</div>

            <div class="side-actions">
                <button class="btn-ghost" type="button" onclick="location.href='change_password.jsp'">
                    Đổi mật khẩu
                </button>
                <button class="btn-ghost" type="button" onclick="location.href='LogoutServlet'">
                    Đăng xuất
                </button>
            </div>
        </aside>

        <!-- RIGHT -->
        <main class="right">
            <h1 class="title">HỒ SƠ CÁ NHÂN</h1>
            <div class="underline"></div>

            <form action="profile" method="post">
                <div class="grid">
                    <div class="field">
                        <label>Họ và tên</label>
                        <input name="fullName" type="text" placeholder="Nhập họ và tên" value="">
                    </div>

                    <div class="field">
                        <label>Email</label>
                        <input name="email" type="email" placeholder="Nhập email" value="">
                    </div>

                    <div class="field">
                        <label>Số điện thoại</label>
                        <input name="phone" type="text" placeholder="VD: 0909xxxxxx" value="">
                    </div>

                    <div class="field">
                        <label>Giới tính</label>
                        <select name="gender">
                            <option value="">-- Chọn --</option>
                            <option value="male">Nam</option>
                            <option value="female">Nữ</option>
                            <option value="other">Khác</option>
                        </select>
                    </div>

                    <div class="field full">
                        <label>Địa chỉ</label>
                        <input name="address" type="text" placeholder="Nhập địa chỉ" value="">
                    </div>

                    <div class="field full">
                        <label>Giới thiệu</label>
                        <textarea name="bio" rows="4" placeholder="Mô tả ngắn về bạn..."></textarea>
                        <div class="note">.</div>
                    </div>
                </div>

                <div class="row-actions">
                    <button class="btn btn-secondary" type="reset">Hủy</button>
                    <button class="btn btn-primary" type="submit">Lưu thay đổi</button>
                </div>
            </form>
        </main>
    </div>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>
