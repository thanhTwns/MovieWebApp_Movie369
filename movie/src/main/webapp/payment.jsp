<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Thanh toán - Movie369</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>

<jsp:include page="header.jsp" />

<div class="payment-wrapper">

    <div class="payment-card">

        <h2 style="color: #fff; margin-bottom: 5px;">Thanh Toán</h2>
        <p style="color: #888; font-size: 14px;">Quét mã để nâng cấp Premium</p>

        <div class="pay-amount">
            <c:choose>
                <c:when test="${param.plan == '1'}">50.000đ</c:when>
                <c:when test="${param.plan == '2'}">250.000đ</c:when>
                <c:when test="${param.plan == '3'}">450.000đ</c:when>
                <c:otherwise>0đ</c:otherwise>
            </c:choose>
        </div>

        <img src="${pageContext.request.contextPath}/assets/img/newqr.jpg"
             class="qr-image" alt="QR Code">

        <div class="bank-info-box">
            <p>Ngân hàng: <strong>MB Bank</strong></p>
            <p>Số tài khoản: <strong>0355 041 532</strong></p> <hr style="border: 0; border-top: 1px solid #444; margin: 10px 0;">
            <p>Nội dung CK:</p>
            <div style="background: #3a3a3a; padding: 8px; border-radius: 4px; color: #ffd700; text-align: center; font-weight: bold; letter-spacing: 1px; margin-top: 5px;">
                M369 ${sessionScope.account.username}
            </div>
        </div>

        <form action="ProcessPaymentServlet" method="POST">
            <input type="hidden" name="planId" value="${param.plan}">

            <button type="submit" class="btn-buy" style="background: #00e676; color: #000; font-weight: 800; font-size: 16px;">
                <i class='bx bx-check-circle'></i> Xác nhận đã chuyển khoản
            </button>
        </form>

        <div style="margin-top: 20px;">
            <a href="personal_profile.jsp" style="color: #666; font-size: 13px; text-decoration: none;">
                <i class='bx bx-arrow-back'></i> Chọn gói khác
            </a>
        </div>

    </div>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>