<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Phim Yêu Thích | Movie369</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css"/>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>

<body style="background: var(--bg-color); color: var(--text-color);">

<jsp:include page="header.jsp"/>

<div class="fav-wrapper">
    <h1 class="fav-heading">Phim Yêu Thích Của Bạn</h1>

    <div class="fav-grid">
        <c:forEach items="${listMovies}" var="o">
            <div class="fav-item" onclick="window.location.href='detail?id=${o.id}'">

                <div class="fav-img-box">
                    <c:if test="${o.premium}">
                        <span class="vip-badge">VIP</span>
                    </c:if>

                    <img src="${o.posterUrl.startsWith('http') ? o.posterUrl : pageContext.request.contextPath.concat('/').concat(o.posterUrl)}"
                         alt="${o.title}">
                </div>

                <div class="fav-info">
                    <h3 class="fav-title">${o.title}</h3>
                </div>
            </div>
        </c:forEach>
    </div>

    <c:if test="${empty listMovies}">
        <div class="empty-state">
            <i class='bx bx-heart' style="font-size: 60px; margin-bottom: 15px; opacity: 0.5;"></i>
            <p style="font-size: 1.1rem;">Bạn chưa lưu phim nào vào danh sách yêu thích.</p>
            <a href="home" class="btn-explore">Khám phá ngay</a>
        </div>
    </c:if>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>