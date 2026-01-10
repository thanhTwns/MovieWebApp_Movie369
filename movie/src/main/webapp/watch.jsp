<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="vn">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Xem phim ${movie.title} | Movie369</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />
</head>
<body class="watch-page" style="background: var(--bg-color); color: var(--text-color);">

<jsp:include page="header.jsp"></jsp:include>

<div class="watch-container"> <div class="watch-main">
    <div class="video-frame">
        <iframe src="${videoUrl}"
                title="${movie.title}"
                allowfullscreen
                frameborder="0"
                width="100%" height="100%"></iframe>
    </div>

    <div class="server-list">
        <button class="server-btn active"><i class='bx bx-play-circle'></i> Server VIP</button>
        <button class="server-btn"><i class='bx bx-server'></i> Server Dự phòng</button>
    </div>

    <h1 class="movie-title-large">${movie.title}</h1>

    <div class="watch-meta-data">
        <span><i class='bx bxs-calendar'></i> ${movie.releaseYear}</span>
        <span><i class='bx bxs-time'></i> ${movie.durationMinutes} phút</span>
        <span><i class='bx bxs-star'></i> ${movie.rating}/5 (${movie.rateCount} lượt)</span>
    </div>

    <c:if test="${movie.series}">
        <div class="episode-section">
            <h3><i class='bx bx-list-ul'></i> Danh sách tập</h3>
            <div class="ep-grid">
                <c:forEach items="${listEp}" var="ep">
                    <a href="watch?id=${movie.id}&ep=${ep.numEpisode}"
                       class="btn-ep ${ep.numEpisode == currentEpNum ? 'active' : ''}">
                        ${ep.numEpisode}
                    </a>
                </c:forEach>
            </div>
        </div>
    </c:if>

    <div class="movie-desc">
        <p><strong>Nội dung:</strong> ${movie.description}</p>
    </div>

    <div class="sidebar-heading" style="margin-top: 30px;">Bình luận</div>
    <div id="comments" class="comment-section">
        <form action="post-comment" method="POST" style="margin-bottom: 20px;">
            <input type="hidden" name="movieId" value="${movie.id}">

            <input type="hidden" name="origin" value="watch">

            <input type="hidden" name="ep" value="${param.ep}">

            <textarea name="commentContent" class="comment-input" rows="3"
                      placeholder="Chia sẻ cảm nghĩ của bạn..." required></textarea>

            <div style="text-align: right; margin-top: 10px;">
                <c:if test="${sessionScope.account == null}">
                    <button type="button" class="btn"
                            onclick="window.location.href='login.jsp?redirect=watch?id=${movie.id}%26ep=${param.ep != null ? param.ep : 1}%23comments'">
                        Đăng nhập để gửi
                    </button>
                </c:if>

                <c:if test="${sessionScope.account != null}">
                    <button type="submit" class="btn">
                        Gửi bình luận
                    </button>
                </c:if>
            </div>
        </form>
        <div class="comment-list">
            <c:if test="${empty listComments}">
                <p style="color: #777; font-style: italic;">Chưa có bình luận nào.</p>
            </c:if>

            <c:forEach items="${listComments}" var="c">
                <div class="comment-item" style="display: flex; gap: 15px; margin-bottom: 20px; border-bottom: 1px solid #333; padding-bottom: 15px;">
                    <div class="cmt-avatar">
                        <img src="${c.avatarUrl != null ? c.avatarUrl : 'https://via.placeholder.com/50'}"
                             style="width: 45px; height: 45px; border-radius: 50%; object-fit: cover;">
                    </div>

                    <div class="cmt-content">
                        <div style="margin-bottom: 5px;">
                            <span style="color: var(--main-color); font-weight: bold; margin-right: 10px;">${c.username}</span>
                            <span style="color: #666; font-size: 0.8rem;">
                            <fmt:formatDate value="${c.createdAt}" pattern="dd/MM/yyyy HH:mm"/>
                        </span>
                        </div>
                        <p style="color: #ddd; margin: 0; line-height: 1.4; font-size: 0.95rem;">${c.content}</p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

    <div class="watch-sidebar" style="flex: 1; min-width: 300px; margin-top: 20px;">

        <div class="sidebar-box" style="background: #111; padding: 20px; border-radius: 10px; border: 1px solid #333;">

            <div class="sidebar-heading" style="font-size: 1.2rem; font-weight: bold; color: #fff; margin-bottom: 20px; border-left: 4px solid var(--main-color); padding-left: 10px; text-transform: uppercase;">
                Có thể bạn thích
            </div>

            <div class="related-list" style="display: flex; flex-direction: column; gap: 15px;">

                <c:forEach items="${relatedMovies}" var="r">
                    <a href="detail?id=${r.id}" class="related-item" style="display: flex; gap: 12px; text-decoration: none; transition: 0.3s; padding: 0;">

                        <div class="related-img" style="position: relative; width: 80px; height: 120px; flex-shrink: 0;">
                            <img src="${r.posterUrl.startsWith('http') ? r.posterUrl : pageContext.request.contextPath.concat('/').concat(r.posterUrl)}"
                                 alt="${r.title}"
                                 style="width: 100%; height: 100%; object-fit: cover; border-radius: 4px;">

                            <c:if test="${r.premium}">
                                <span style="position: absolute; top: 2px; left: 2px; background: gold; color: black; font-size: 0.6rem; padding: 1px 4px; border-radius: 2px; font-weight: bold;">VIP</span>
                            </c:if>
                        </div>

                        <div class="related-info" style="display: flex; flex-direction: column; justify-content: center;">
                            <h4 style="color: #fff; font-size: 0.95rem; margin: 0 0 5px 0; line-height: 1.3; font-weight: 500;">
                                    ${r.title}
                            </h4>

                            <div style="font-size: 0.8rem; color: #888; display: flex; align-items: center; gap: 5px;">
                                <span>${r.releaseYear}</span>
                                <span>•</span>
                                <span style="color: gold; display: flex; align-items: center; gap: 2px;">
                             <i class='bx bxs-star'></i> ${r.rating > 0 ? r.rating : 'N/A'}
                        </span>
                            </div>
                        </div>
                    </a>
                </c:forEach>

                <c:if test="${empty relatedMovies}">
                    <p style="color: #666; font-style: italic; text-align: center;">Chưa có phim đề xuất.</p>
                </c:if>

            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>