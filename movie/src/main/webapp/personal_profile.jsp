<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

<div class="profile-container">

    <aside class="profile-sidebar">
        <div class="avatar-card">
            <div class="avatar-box" style="overflow: hidden; border: none;">
                <img src="${sessionScope.account.avatarUrl != null ? sessionScope.account.avatarUrl : 'https://via.placeholder.com/100'}"
                     style="width: 100%; height: 100%; object-fit: cover;">
            </div>

            <h3 class="user-name">
                <c:out value="${sessionScope.account.username}" default="Khách" />
            </h3>

            <c:if test="${sessionScope.account.premium}">
                     <span class="role-badge" style="border-color: gold; color: gold;">
                        <i class='bx bxs-crown'></i> Premium Member
                     </span>
            </c:if>
            <c:if test="${!sessionScope.account.premium}">
                <span class="role-badge">Thành viên thường</span>
            </c:if>
        </div>
        <c:set var="isMembershipTab" value="${param.tab == 'membership'}" />
        <button onclick="switchProfileTab('profile')" id="btn-profile" class="sidebar-btn ${isMembershipTab ? 'active' : ''}">
            Thông tin cá nhân
        </button>
        <button onclick="switchProfileTab('membership')" id="btn-membership" class="sidebar-btn ${isMembershipTab ? 'active' : ''}" >
            Gói hội viên & Thanh toán
        </button>

        <div style="height: 1px; background: #333; margin: 10px 0;"></div>

        <a href="changePassword" class="sidebar-btn">Đổi mật khẩu</a>
        <a href="LogoutServlet" class="sidebar-btn" style="color: #ff4444; border-color: #552222;">Đăng xuất</a>
    </aside>

    <main class="profile-content">

        <div id="tab-profile" class="tab-content ${!isMembershipTab ? 'active' : ''}">
            <h2 class="section-title">Hồ sơ cá nhân</h2>

            <c:if test="${param.msg == 'success'}">
                <div style="color: #00e676; margin-bottom: 15px;">Cập nhật Email thành công!</div>
            </c:if>
            <c:if test="${param.msg == 'error'}">
                <div style="color: #ff4444; margin-bottom: 15px;">Lỗi! Có thể Email đã tồn tại.</div>
            </c:if>

            <form action="UpdateProfileServlet" method="POST">
                <div class="form-grid">
                    <div class="form-group">
                        <label style="color: #fff; margin-bottom: 5px; display: block;">Email</label>
                        <input type="email" name="email" class="form-control" required
                               value="${sessionScope.account.email}"
                               placeholder="Nhập email mới..."
                               style="background: #252525; color: #fff; border: 1px solid #444; padding: 10px; width: 100%; border-radius: 4px;">
                    </div>
                </div>
                <div class="form-actions" style="margin-top: 20px;">
                    <button type="button" class="btn btn-cancel" onclick="window.location.reload()" style="background: #444; color: #fff; padding: 8px 16px; border: none; border-radius: 4px; cursor: pointer; margin-right: 10px;">Hủy</button>
                    <button type="submit" class="btn btn-save" style="background: var(--main-color); color: var(--text-color); padding: 8px 16px; border: none; border-radius: 4px; cursor: pointer; font-weight: bold;">Lưu thay đổi</button>
                </div>
            </form>
        </div>

        <div id="tab-membership" class="tab-content ${isMembershipTab ? 'active' : ''}">
            <h2 class="section-title">Nâng cấp tài khoản</h2>
            <c:if test="${param.msg == 'vip_required'}">
                <div style="background: rgba(255, 68, 68, 0.2); border: 1px solid #ff4444; color: #ff4444; padding: 15px; border-radius: 5px; margin-bottom: 20px; display: flex; align-items: center; gap: 10px;">
                    <i class='bx bxs-error-circle' style="font-size: 1.5rem;"></i>
                    <span>Bạn cần nâng cấp lên gói <strong>Premium</strong> để xem bộ phim này!</span>
                </div>
            </c:if>
            <p style="color: #aaa; margin-bottom: 20px;">Xem phim không giới hạn, không quảng cáo và chất lượng 4K.</p>
            <c:if test="${sessionScope.account.premium}">
                <div style="background: linear-gradient(to right, #1e3c00, #0f0f0f); padding: 20px; border-radius: 8px; border: 1px solid gold;">
                    <h3 style="color: gold; margin-bottom: 10px;">
                        <i class='bx bxs-check-shield'></i> Bạn đang là thành viên Premium
                    </h3>
                    <p style="color: #fff;">Hạn sử dụng đến:
                        <strong style="color: #fff; font-size: 1.1em;">
                            <fmt:formatDate value="${sessionScope.account.endPremium_date}" pattern="dd/MM/yyyy"/>
                        </strong>
                    </p>
                </div>
            </c:if>

            <c:if test="${!sessionScope.account.premium}">
                <div class="plan-container">
                    <div class="plan-card">
                        <div class="plan-title">Gói 1 Tháng</div>
                        <div class="plan-price">50.000đ</div>
                        <a href="payment.jsp?plan=1" class="btn-buy">Chọn gói này</a>
                    </div>

                    <div class="plan-card premium">
                        <div class="plan-title">Gói 6 Tháng</div>
                        <div class="plan-price">250.000đ</div>
                        <a href="payment.jsp?plan=2" class="btn-buy">Đăng ký ngay</a>
                    </div>

                    <div class="plan-card">
                        <div class="plan-title">Gói 1 Năm</div>
                        <div class="plan-price">450.000đ</div>
                        <a href="payment.jsp?plan=3" class="btn-buy">Chọn gói này</a>
                    </div>
                </div>
            </c:if>

            <div class="history-section">
                <h4 style="color: #fff;">Lịch sử giao dịch gần đây</h4>
                <table class="history-table">
                    <thead>
                    <tr>
                        <th>Ngày</th>
                        <th>Gói</th>
                        <th>Số tiền</th>
                        <th>Trạng thái</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%-- Nếu không có dữ liệu --%>
                    <c:if test="${empty historyList}">
                        <tr>
                            <td colspan="4" style="text-align: center; color: #888; padding: 20px;">
                                Chưa có giao dịch nào
                            </td>
                        </tr>
                    </c:if>

                    <%-- Nếu có dữ liệu --%>
                    <c:forEach var="item" items="${historyList}">
                        <tr>
                            <td><fmt:formatDate value="${item.createdDate}" pattern="dd/MM/yyyy"/></td>
                            <td style="color: #fff;">${item.planName}</td>
                            <td style="color: #00e676;"><fmt:formatNumber value="${item.price}" type="number"/>đ</td>
                            <td>${item.status}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

    </main>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
