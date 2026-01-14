<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vn">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Movie369</title>
    <%--	<base href="${pageContext.request.contextPath}">--%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css"/>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css"/>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
</head>
<body class="home-page">
<jsp:include page="header.jsp"/>
<section class="home swiper" id="home">
    <div class="swiper-wrapper">

        <c:forEach items="${phimtrending}" var="t">
            <div class="swiper-slide container">
                <img src="${t.bannerUrl.startsWith('http') ? t.bannerUrl : pageContext.request.contextPath.concat('/').concat(t.bannerUrl)}"
                     alt="${t.title}"
                     class="movie-box-img">

                <div class="home-text">
                    <div class="home-tags">
                        <span class="tag-trending">#Top Trending</span>
                        <c:if test="${t.premium}">
                            <span class="tag-quality">VIP</span>
                        </c:if>
                    </div>

                    <h1>${t.title}</h1>

                    <div class="home-meta">
                        <span>${t.releaseYear}</span>
                        <i class='bx bxs-circle'></i>

                        <c:choose>
                            <c:when test="${t.series}">
                                <c:if test="${t.lastestEp > 0}">
                                    <span>${t.lastestEp} Tập</span>
                                </c:if>
                                <c:if test="${t.lastestEp == 0}">
                                    <span>Full Season</span>
                                </c:if>
                            </c:when>

                            <c:otherwise>
                                <span>${t.durationMinutes} phút</span>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <p class="home-desc" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
                            ${t.description}
                    </p>

                    <div class="home-btns">
                        <a href="watch?id=${t.id}" class="btn">Xem Ngay</a>
                        <a href="detail?id=${t.id}" class="play" aria-label="Chi tiết">
                            <i class='bx bx-info-circle'></i>
                        </a>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>
    <div class="swiper-pagination"></div>
</section>

<section class="movies" id="phimle">
    <h2 class="heading">Phim Chiếu Rạp Mới</h2>

    <div class="movies-slider swiper">
        <div class="swiper-wrapper">

            <jsp:useBean id="phimle" scope="request" type="java.util.List"/>
            <c:forEach items="${phimle}" var="o">
                <div class="movie-box swiper-slide">
                    <a href="detail?id=${o.id}" class="movie-box-link">
                        <div class="movie-img-wrapper">
                            <c:if test="${o.premium}">
                                <span class="vip-badge">
                                    <i class='bx bxs-crown'></i> VIP
                                </span>
                            </c:if>
                            <img src="${o.posterUrl.startsWith('http') ? o.posterUrl : pageContext.request.contextPath.concat('/').concat(o.posterUrl)}"
                                 alt="${o.title}"
                                 class="movie-box-img">
                        </div>
                        <div class="box-text">
                            <h3 class="movie-title">${o.title}</h3>

                            <span class="movie-type">Chiếu rạp / Full HD</span>

                            <div class="movie-meta">
                                <span class="movie-badge">${o.releaseYear}</span> <span class="movie-badge">
								${o.durationMinutes} phút</span>
                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>
</section>

<section class="genres" id="genres">
    <h2 class="heading">Khám Phá Thể Loại</h2>
    <div class="genres-grid">
        <jsp:useBean id="GLOBAL_GENRES" scope="application" type="java.util.List"/>
        <c:forEach items="${GLOBAL_GENRES}" var="g">
            <a href="filter?genreId=${g.id}">
                <div class="genre-box">
                    <h3>${g.genresName}</h3>
                </div>
            </a>
        </c:forEach>
    </div>
</section>

<section class="movies" id="phimbo">
    <h2 class="heading">Phim Bộ Hot</h2>
    <div class="movies-slider swiper">
        <div class="swiper-wrapper">

            <c:forEach items="${phimbo}" var="s">
                <div class="movie-box swiper-slide">
                    <a href="detail?id=${s.id}" class="movie-box-link">
                        <div class="movie-img-wrapper">
                            <c:if test="${s.premium}">
                                <span class="vip-badge">
                                    <i class='bx bxs-crown'></i> VIP
                                </span>
                            </c:if>
                            <img src="${s.posterUrl.startsWith('http') ? s.posterUrl : pageContext.request.contextPath.concat('/').concat(s.posterUrl)}"
                                 alt="${s.title}"
                                 class="movie-box-img">
                        </div>
                        <div class="box-text">
                            <h3 class="movie-title">${s.title}</h3>

                            <span class="movie-type">Series / ${s.releaseYear}</span>

                            <div class="movie-meta">
                                <c:if test="${s.lastestEp > 0}">
                        <span class="movie-badge">Tập ${s.lastestEp}</span>
                                </c:if>
                                <c:if test="${s.lastestEp == 0}">
                                    <span class="movie-badge">Sắp chiếu</span>
                                </c:if>
                            </div>

                        </div>
                    </a>
                </div>
            </c:forEach>

        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>
</section>

<section class="spotlight" id="spotlight">
    <h2 class="spotlight-heading">
        <i class='bx bx-line-chart'></i> Xu Hướng Nổi Bật
    </h2>

    <div class="spotlight-slider swiper">
        <div class="swiper-wrapper">

            <c:if test="${spotlightAction != null}">
                <div class="swiper-slide spotlight-inner">
                    <div class="spotlight-content">
                        <span class="spotlight-tag">#1 Hành Động</span>
                        <h2 class="spotlight-title">${spotlightAction.title}</h2>
                        <p class="spotlight-desc" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
                                ${spotlightAction.description}
                        </p>
                        <div class="home-btns" style="display: flex; gap: 1rem; margin-top: 1rem;">
                            <a href="detail?id=${spotlightAction.id}" class="btn">Xem Ngay</a>
                            <a href="detail?id=${spotlightAction.id}" class="play"><i class='bx bx-info-circle'></i></a>
                        </div>
                    </div>
                    <div class="spotlight-img">
                        <img src="${spotlightAction.posterUrl}" alt="${spotlightAction.title}">
                    </div>
                </div>
            </c:if>

            <c:if test="${spotlightDrama != null}">
                <div class="swiper-slide spotlight-inner">
                    <div class="spotlight-content">
                        <span class="spotlight-tag">#1 Chính Kịch</span>
                        <h2 class="spotlight-title">${spotlightDrama.title}</h2>
                        <p class="spotlight-desc" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
                                ${spotlightDrama.description}
                        </p>
                        <div class="home-btns" style="display: flex; gap: 1rem; margin-top: 1rem;">
                            <a href="detail?id=${spotlightDrama.id}" class="btn">Xem Ngay</a>
                            <a href="detail?id=${spotlightDrama.id}" class="play"><i class='bx bx-info-circle'></i></a>
                        </div>
                    </div>
                    <div class="spotlight-img">
                        <img src="${spotlightDrama.posterUrl}" alt="${spotlightDrama.title}">
                    </div>
                </div>
            </c:if>

        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>
</section>

<div class="explore-slider swiper">
    <div class="swiper-wrapper">
    <c:forEach items="${collections}" var="c">
        <div class="swiper-slide wide-box">
                <div class="wide-img">
                    <img src="${c.bannerUrl.startsWith('http') ? c.bannerUrl : pageContext.request.contextPath.concat('/').concat(c.bannerUrl)}"
                         alt="${c.name}"
                         style="width: 100%; height: 100%; object-fit: cover;">

                    <div class="wide-play">
                        <i class='bx bx-play'></i>
                    </div>

                    <div class="wide-overlay">
                        <div class="wide-text">
                            <span>Bộ Sưu Tập Tuyển Chọn</span>
                            <h3>${c.name}</h3>
                            <p>${c.description}</p>
                        </div>
                    </div>
                </div>
        </div>
    </c:forEach>
</div>
</div>

<section class="movies" id="sapchieu">
    <h2 class="heading">Phim Sắp Chiếu</h2>

    <div class="movies-slider swiper">
        <div class="swiper-wrapper">

            <c:forEach items="${phimsapchieu}" var="o">
                <div class="movie-box swiper-slide">
                    <a href="detail?id=${o.id}" class="movie-box-link">
                        <div class="movie-img-wrapper">
                            <c:if test="${o.premium}">
                                <span class="vip-badge">
                                    <i class='bx bxs-crown'></i> VIP
                                </span>
                            </c:if>
                            <img src="${o.posterUrl.startsWith('http') ? o.posterUrl : pageContext.request.contextPath.concat('/').concat(o.posterUrl)}"
                                 alt="${o.title}"
                                 class="movie-box-img">
                        </div>
                        <div class="box-text">
                            <h3 class="movie-title">${o.title}</h3>
                            <span class="movie-type">Coming Soon</span>
                            <div class="movie-meta">
                                <span class="movie-badge">${o.releaseYear}</span>
                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>
</section>
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<jsp:include page="footer.jsp"/>
</body>

</html>