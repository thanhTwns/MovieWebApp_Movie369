<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Thông tin phim - Movie369</title>

    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css"/>
</head>

<body class="movie-info-page">

<jsp:include page="header.jsp" />
<section class="mi-wrap">
    <div class="mi-grid">

        <aside class="mi-card mi-left">

            <div class="mi-poster-side">
                <img src="${pageContext.request.contextPath}/nhetanhdoday/thầy%20bạch.jpg"
                     alt="Poster phim"/>
            </div>

            <div class="mi-watch-btn-container">
                <a href="#" class="btn-watch-main">
                    <i class='bx bx-play-circle'></i> XEM PHIM
                </a>
            </div>

            <div class="mi-left-title-box">
                <h1 class="mi-title-left">Biến chất </h1>
                <p class="mi-muted-left">Anh / Mỹ / Portugal • 2025</p>
            </div>

            <div class="mi-separator"></div>

            <h3 class="mi-h">Nội dung / Giới thiệu</h3>
            <p class="mi-desc">
                Đây là phần mô tả phim (demo). Sau này bạn có thể thay bằng dữ liệu từ DB:
                <br/>
                <span class="mi-muted">Ví dụ: ${movie.description}</span>
            </p>

            <div class="mi-badges">
                <span class="movie-badge">2025</span>
                <span class="movie-badge">HD</span>
                <span class="movie-badge">1 Season</span>
            </div>

            <h3 class="mi-h mi-h2">Thể loại</h3>
            <div class="mi-genres">
                <a class="mi-pill" href="#">Hành động</a>
                <a class="mi-pill" href="#">Viễn tưởng</a>
                <a class="mi-pill" href="#">Tình cảm</a>
            </div>

            <h3 class="mi-h mi-h2">Thông tin</h3>
            <ul class="mi-list">
                <li><span>Đạo diễn:</span> <b>Đang cập nhật</b></li>
                <li><span>Quốc gia:</span> <b>Đang cập nhật</b></li>
                <li><span>Thời lượng:</span> <b>45 phút/tập</b></li>
            </ul>
        </aside>

        <main class="mi-main">

            <div class="mi-card mi-hero">
                <div class="mi-hero-upper">
                    <div class="mi-trailer-box">
                        <video width="100%" height="100%" controls>
                            <source src="${pageContext.request.contextPath}/nhetanhdoday/breakingbad%20trailer.mp4" type="video/mp4">
                            Trình duyệt của bạn không hỗ trợ thẻ video.
                        </video>
                    </div>
                </div>
            </div>

            <div class="mi-card mi-episodes">
                <div class="mi-episodes-head">
                    <h3 class="mi-h">Số tập</h3>
                    <div class="mi-season">
                        <label for="seasonSelect" class="mi-muted">Phần</label>
                        <select id="seasonSelect" name="season">
                            <option value="1">Phần 1</option>
                            <option value="2">Phần 2</option>
                        </select>
                    </div>
                </div>

                <div class="mi-episode-list">
                    <a class="mi-ep active" href="#">1</a>
                    <a class="mi-ep" href="#">2</a>
                    <a class="mi-ep" href="#">3</a>
                    <a class="mi-ep" href="#">4</a>
                    <a class="mi-ep" href="#">5</a>
                    <a class="mi-ep" href="#">6</a>
                </div>
            </div>

            <div class="mi-actions">
                <button class="mi-action-btn" type="button"><i class='bx bx-plus'></i> Thêm vào</button>
                <button class="mi-action-btn" type="button"><i class='bx bx-heart'></i> Yêu thích</button>
                <button class="mi-action-btn" type="button"><i class='bx bx-share-alt'></i> Chia sẻ</button>
                <a class="mi-action-btn mi-action-link" href="#comments"><i class='bx bx-message-dots'></i> Bình luận</a>
            </div>

            <div id="comments" class="mi-card mi-comments">
                <h3 class="mi-h">Bình luận</h3>
                <p class="mi-muted">Demo giao diện bình luận.</p>
                <form class="mi-comment-form" action="#" method="post">
                    <textarea rows="3" placeholder="Viết bình luận..."></textarea>
                    <button class="btn" type="submit">Gửi</button>
                </form>
            </div>

        </main>

        <aside class="mi-card mi-right">
            <h3 class="mi-h">Phim tương tự</h3>
            <div class="mi-related">
                <a class="mi-related-item" href="#">
                    <img src="${pageContext.request.contextPath}/nhetanhdoday/default-poster.jpg" alt="Related"/>
                    <div class="mi-related-text">
                        <div class="mi-related-title">Tên phim tương tự 1</div>
                        <div class="mi-muted">2024 • 1 Season</div>
                    </div>
                </a>
                <a class="mi-related-item" href="#">
                    <img src="${pageContext.request.contextPath}/nhetanhdoday/default-poster.jpg" alt="Related"/>
                    <div class="mi-related-text">
                        <div class="mi-related-title">Tên phim tương tự 2</div>
                        <div class="mi-muted">2023 • HD</div>
                    </div>
                </a>
                <a class="mi-related-item" href="#">
                    <img src="${pageContext.request.contextPath}/nhetanhdoday/default-poster.jpg" alt="Related"/>
                    <div class="mi-related-text">
                        <div class="mi-related-title">Tên phim tương tự 3</div>
                        <div class="mi-muted">2022 • 16+</div>
                    </div>
                </a>
            </div>
        </aside>

    </div>
</section> <a class="mi-ep" href="#">5</a>
                    <a class="mi-ep" href="#">6</a>
                </div>

<jsp:include page="footer.jsp" />

</body>
</html>