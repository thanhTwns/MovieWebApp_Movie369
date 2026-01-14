<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>${detail.title} - Movie369</title> <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css"/>
</head>

<body class="movie-info-page">

<jsp:include page="header.jsp"/>
<section class="mi-wrap">
    <div class="mi-grid">

        <aside class="mi-card mi-left">

            <div class="mi-poster-side">
                <img src="${detail.posterUrl.startsWith('http') ? detail.posterUrl : pageContext.request.contextPath.concat('/').concat(detail.posterUrl)}"
                     alt="${detail.title}"/>
            </div>

            <div class="mi-watch-btn-container">
                <a href="watch?id=${detail.id}" class="btn-watch-main">
                    <i class='bx bx-play-circle'></i> XEM PHIM
                </a>
            </div>

            <div class="mi-left-title-box">
                <h1 class="mi-title-left">${detail.title}</h1>
            </div>

            <div class="mi-separator"></div>

            <h3 class="mi-h">Nội dung / Giới thiệu</h3>
            <p class="mi-desc">
                <br/>
                <span class="mi-muted">${detail.description}</span>
            </p>

            <div class="mi-badges">
                <span class="movie-badge">${detail.releaseYear}</span>

                <c:if test="${detail.series}">
                    <span class="movie-badge">Series</span>
                </c:if>
                <c:if test="${!detail.series}">
                    <span class="movie-badge">${detail.durationMinutes} Phút</span>
                </c:if>

                <c:if test="${detail.premium}">
                    <span class="movie-badge" style="background: gold; color: black;">VIP</span>
                </c:if>
            </div>

            <h3 class="mi-h mi-h2">Đánh giá</h3>

            <div class="mi-rating-box" style="background: rgba(255,255,255,0.05); padding: 15px; border-radius: 8px; text-align: center; margin-bottom: 20px;">

                <div style="font-size: 2rem; color: gold; font-weight: bold; line-height: 1;">
                    ${detail.rating}<span style="font-size: 1rem; color: #aaa;">/5</span>
                </div>
                <div style="font-size: 0.8rem; color: #888; margin-bottom: 10px;">
                    (${detail.rateCount} lượt đánh giá)
                </div>

                <div style="display: flex; justify-content: center; gap: 5px; flex-direction: row-reverse;">

                    <form action="rating" method="POST" style="margin:0;">
                        <input type="hidden" name="movieId" value="${detail.id}">
                        <input type="hidden" name="star" value="5">
                        <button type="submit" style="background:none; border:none; padding:0; cursor: pointer;">
                            <i class='bx bxs-star' style="font-size: 24px; color: ${myRating >= 5 ? 'gold' : '#444'};"></i>
                        </button>
                    </form>

                    <form action="rating" method="POST" style="margin:0;">
                        <input type="hidden" name="movieId" value="${detail.id}">
                        <input type="hidden" name="star" value="4">
                        <button type="submit" style="background:none; border:none; padding:0; cursor: pointer;">
                            <i class='bx bxs-star' style="font-size: 24px; color: ${myRating >= 4 ? 'gold' : '#444'};"></i>
                        </button>
                    </form>

                    <form action="rating" method="POST" style="margin:0;">
                        <input type="hidden" name="movieId" value="${detail.id}">
                        <input type="hidden" name="star" value="3">
                        <button type="submit" style="background:none; border:none; padding:0; cursor: pointer;">
                            <i class='bx bxs-star' style="font-size: 24px; color: ${myRating >= 3 ? 'gold' : '#444'};"></i>
                        </button>
                    </form>

                    <form action="rating" method="POST" style="margin:0;">
                        <input type="hidden" name="movieId" value="${detail.id}">
                        <input type="hidden" name="star" value="2">
                        <button type="submit" style="background:none; border:none; padding:0; cursor: pointer;">
                            <i class='bx bxs-star' style="font-size: 24px; color: ${myRating >= 2 ? 'gold' : '#444'};"></i>
                        </button>
                    </form>

                    <form action="rating" method="POST" style="margin:0;">
                        <input type="hidden" name="movieId" value="${detail.id}">
                        <input type="hidden" name="star" value="1">
                        <button type="submit" style="background:none; border:none; padding:0; cursor: pointer;">
                            <i class='bx bxs-star' style="font-size: 24px; color: ${myRating >= 1 ? 'gold' : '#444'};"></i>
                        </button>
                    </form>
                </div>

                <c:if test="${myRating > 0}">
                    <div style="margin-top: 8px; font-size: 0.8rem; color: gold;">
                        Bạn đã chấm: <b>${myRating} sao</b>
                    </div>
                </c:if>
                <c:if test="${myRating == 0}">
                    <div style="margin-top: 8px; font-size: 0.8rem; color: #666;">
                        Hãy đánh giá phim này
                    </div>
                </c:if>

            </div>
            <h3 class="mi-h mi-h2">Thông tin</h3>
            <ul class="mi-list">
                <li><span>Đạo diễn:</span> <b>Đang cập nhật</b></li>
                <li><span>Quốc gia:</span> <b>Đang cập nhật</b></li>
                <li><span>Thời lượng:</span> <b>${detail.durationMinutes} phút</b></li>
                <li><span>Lượt xem:</span> <b>${detail.viewCount}</b></li>
            </ul>
        </aside>

        <main class="mi-main">

            <div class="mi-card mi-hero">
                <div class="mi-hero-upper">
                    <div class="mi-trailer-box">
                        <video width="100%" height="100%" controls poster="${pageContext.request.contextPath}/nhetanhdoday/${detail.posterUrl}">
                            <source src="${pageContext.request.contextPath}/nhetanhdoday/${detail.trailerUrl}" type="video/mp4">
                            Trình duyệt của bạn không hỗ trợ thẻ video.
                        </video>
                    </div>
                </div>
            </div>

            <c:if test="${detail.series}">
                <div class="mi-card mi-episodes">
                    <div class="mi-episodes-head">
                        <h3 class="mi-h">Danh sách tập</h3>

                        <div class="mi-season">
                            <label for="seasonSelect" class="mi-muted">Phần</label>
                            <select id="seasonSelect" name="season">
                                <option value="1">Phần 1</option>
                            </select>
                        </div>
                    </div>

                    <div class="mi-episode-list">
                        <c:forEach items="${listEp}" var="ep">
                            <a class="mi-ep" href="watch?id=${detail.id}&ep=${ep.numEpisode}">
                                    ${ep.numEpisode}
                            </a>
                        </c:forEach>

                        <c:if test="${empty listEp}">
                            <span class="mi-muted" style="font-size: 0.9rem; padding: 10px;">Đang cập nhật tập mới...</span>
                        </c:if>
                    </div>
                </div>
            </c:if>

            <div class="mi-actions">
                <a href="favorite?movieId=${detail.id}" class="mi-action-btn" style="text-decoration: none; display: inline-flex; align-items: center; gap: 5px;">
                    <c:if test="${isFavorite}">
                        <i class='bx bxs-heart' style="color: #ff4081;"></i> Đã thích
                    </c:if>
                    <c:if test="${!isFavorite}">
                        <i class='bx bx-heart'></i> Yêu thích
                    </c:if>
                </a>
                <a class="mi-action-btn mi-action-link" href="#comments"><i class='bx bx-message-dots'></i> Bình luận</a>
            </div>

            <div id="comments" class="mi-card mi-comments">
                <h3 class="mi-h">Bình luận</h3>
                <form class="mi-comment-form" action="post-comment" method="post">
                    <input type="hidden" name="movieId" value="${detail.id}">
                    <textarea name="commentContent" rows="3" placeholder="Viết bình luận của bạn..." required></textarea>
                    <c:if test="${sessionScope.account == null}">
                        <button class="btn" type="button" onclick="window.location.href='login.jsp?redirect=detail?id=${detail.id}%23comments'" >Đăng nhập để gửi</button>
                    </c:if>
                    <c:if test="${sessionScope.account != null}">
                        <button class="btn" type="submit">Gửi</button>
                    </c:if>
                </form>

                <div class="comment-list" style="margin-top: 20px;">
                    <c:if test="${empty listComments}">
                        <p style="color: #777; font-style: italic;">Chưa có bình luận nào. Hãy là người đầu tiên!</p>
                    </c:if>

                    <c:forEach items="${listComments}" var="c">
                        <div class="comment-item" style="display: flex; gap: 15px; margin-bottom: 20px; border-bottom: 1px solid #333; padding-bottom: 15px;">
                            <div class="cmt-avatar">
                               <img src="${pageContext.request.contextPath}/${c.avatarUrl}" ... />
                                     style="width: 50px; height: 50px; border-radius: 50%; object-fit: cover;">
                            </div>

                            <div class="cmt-content">
                                <div style="margin-bottom: 5px;">
                                    <span style="color: var(--main-color); font-weight: bold; margin-right: 10px;">${c.username}</span>
                                    <span style="color: #666; font-size: 0.8rem;">
                                        <fmt:formatDate value="${c.createdAt}" pattern="dd/MM/yyyy HH:mm"/>
                                    </span>
                                </div>
                                <p style="color: #ccc; margin: 0; line-height: 1.4;">${c.content}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </main>

        <aside class="mi-card mi-right">
            <h3 class="mi-h">Có thể bạn muốn xem</h3>
            <div class="mi-related">

                <c:forEach items="${relatedMovies}" var="r">
                    <a class="mi-related-item" href="detail?id=${r.id}">
                        <div class="mi-related-img-box" style="position: relative; width: 80px; height: 120px; flex-shrink: 0;">
                            <img src="${r.posterUrl.startsWith('http') ? r.posterUrl : pageContext.request.contextPath.concat('/').concat(r.posterUrl)}"
                                 alt="${r.title}"
                                 style="width: 100%; height: 100%; object-fit: cover; border-radius: 4px;">

                            <c:if test="${r.premium}">
                                <span style="position: absolute; top: 2px; left: 2px; background: gold; color: black; font-size: 0.6rem; padding: 1px 4px; border-radius: 2px; font-weight: bold;">VIP</span>
                            </c:if>
                        </div>

                        <div class="mi-related-text">
                            <div class="mi-related-title" style="font-weight: 500; color: #fff; margin-bottom: 5px;">${r.title}</div>

                            <div class="mi-muted" style="font-size: 0.8rem; color: #888; display: flex; align-items: center; gap: 5px;">
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
                    <p style="color: #666; font-size: 0.9rem; font-style: italic; padding: 10px;">Chưa có phim cùng thể loại.</p>
                </c:if>

            </div>
        </aside>
    </div>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>