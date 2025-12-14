<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vn">
<head>
<meta charset="UTF-8">
<title>Phim lẻ | Movie369</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
</head>
<body>

	<jsp:include page="header.jsp" />

	<section class="all-movies">

		<div class="phimle-header">
			<h2 class="heading-title">Phim Lẻ</h2>

			<div class="phimle-filter">
				<span>Lọc theo:</span> <select>
					<option>Mới nhất</option>
					<option>Xem nhiều</option>
					<option>Năm 2024</option>
					<option>Hành động</option>
				</select>
			</div>
		</div>

		<div class="phimle-grid">

			<div class="movie-box">
				<a href="#" class="movie-box-link">
					<div class="movie-img-wrapper">
						<img src="nhetanhdoday/ares.jpg" alt="Poster"
							class="movie-box-img">
					</div>
					<div class="box-text">
						<h3 class="movie-title">Ares: Trò chơi ảo giác</h3>
						<span class="movie-type">Khoa học / Viễn tưởng</span>
					</div>
				</a>
			</div>

			<div class="movie-box">
				<a href="#" class="movie-box-link">
					<div class="movie-img-wrapper">
						<img src="nhetanhdoday/ares.jpg" alt="Poster"
							class="movie-box-img">
					</div>
					<div class="box-text">
						<h3 class="movie-title">Ares: Trò chơi ảo giác</h3>
						<span class="movie-type">Khoa học / Viễn tưởng</span>
					</div>
				</a>
			</div>

			<div class="movie-box">
				<a href="#" class="movie-box-link">
					<div class="movie-img-wrapper">
						<img src="nhetanhdoday/fantasic4.jpg" alt="Poster"
							class="movie-box-img">
					</div>
					<div class="box-text">
						<h3 class="movie-title">Bộ tứ siêu đẳng</h3>
						<span class="movie-type">Hành động / Marvel</span>
					</div>
				</a>
			</div>

			<div class="movie-box">
				<a href="#" class="movie-box-link">
					<div class="movie-img-wrapper">
						<img src="nhetanhdoday/jw4.jpg" alt="Poster" class="movie-box-img">
					</div>
					<div class="box-text">
						<h3 class="movie-title">John Wick 4</h3>
						<span class="movie-type">Hành động / Kịch tính</span>
					</div>
				</a>
			</div>

			<div class="movie-box">
				<a href="#" class="movie-box-link">
					<div class="movie-img-wrapper">
						<img src="nhetanhdoday/hp.jpg" alt="Poster" class="movie-box-img">
					</div>
					<div class="box-text">
						<h3 class="movie-title">Harry Potter: Hoàng Tử Lai</h3>
						<span class="movie-type">Phép thuật / Kinh điển</span>
					</div>
				</a>
			</div>

			<div class="movie-box">
				<a href="#" class="movie-box-link">
					<div class="movie-img-wrapper">
						<img src="nhetanhdoday/antman.jpg" alt="Poster"
							class="movie-box-img">
					</div>
					<div class="box-text">
						<h3 class="movie-title">Người Kiến & Chiến Binh Ong</h3>
						<span class="movie-type">Marvel / Hài hước</span>
					</div>
				</a>
			</div>

		</div>

		<div class="phimle-pagination">
			<a href="#" class="page-btn active">1</a> <a href="#"
				class="page-btn">2</a> <a href="#" class="page-btn">3</a> <a
				href="#" class="page-btn">...</a> <a href="#" class="page-btn">10</a>
		</div>

	</section>

	<jsp:include page="footer.jsp" />
	<script src="main.js"></script>
</body>
</html>