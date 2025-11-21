<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vn">
<head>
    <meta charset="UTF-8">
    <title>Phim lẻ | Movie369</title>

    <!-- CSS chung của site -->
    <link rel="stylesheet" href="style.css">
    <!-- Boxicons (nếu bạn dùng) -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
</head>
<body>

    <%-- Nếu sau này teammate muốn include header/footer thì chèn ở đây --%>
    <%-- <jsp:include page="header.jsp" /> --%>

    <main class="phimle-page">
        <div class="phimle-header">
    <h1 class="page-title">Phim lẻ</h1>

    <div class="phimle-filter">
        <span>Lọc:</span>
        <select>
            <option>Mới cập nhật</option>
            <option>Năm 2024</option>
            <option>Năm 2023</option>
            <option>Hành động</option>
            <option>Tình cảm</option>
        </select>
    </div>
</div>


        <!-- GRID PHIM -->
        <section class="phimle-grid">

            <!-- 1 CARD PHIM -->
            <article class="phim-card">
                <div class="phim-poster">
                    <img src="nhetanhdoday/spm.jpg" alt="Rắc rối săn phù thủy">
                    <span class="phim-quality">HD Vietsub</span>
                </div>
                <h2 class="phim-title">Rắc rối săn phù thủy</h2>
                <p class="phim-meta">2024 • Hài hước, Viễn tưởng</p>
            </article>

            <article class="phim-card">
                <div class="phim-poster">
                    <img src="nhetanhdoday/naruto.jpg" alt="Naruto the Movie">
                    <span class="phim-quality">Full HD</span>
                </div>
                <h2 class="phim-title">Naruto the Movie</h2>
                <p class="phim-meta">2012 • Hành động, Phiêu lưu</p>
            </article>

            <article class="phim-card">
                <div class="phim-poster">
                    <img src="nhetanhdoday/fdb.jpg" alt="Furiosa">
                    <span class="phim-quality">1080p</span>
                </div>
                <h2 class="phim-title">Furiosa</h2>
                <p class="phim-meta">2024 • Hành động</p>
            </article>

            <%-- Cứ copy thêm nhiều <article class="phim-card"> ... </article> để đủ 4–5 hàng như hình --%>

        </section>

        <!-- PHÂN TRANG -->
        <nav class="phimle-pagination">
            <button class="page-btn">&laquo;</button>
            <button class="page-btn active">1</button>
            <button class="page-btn">2</button>
            <button class="page-btn">3</button>
            <button class="page-btn">&raquo;</button>
        </nav>
    </main>

    <%-- <jsp:include page="footer.jsp" /> --%>
</body>
</html>
