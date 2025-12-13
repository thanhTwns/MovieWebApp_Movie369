<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vn">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Movie369</title>
<%--	<base href="${pageContext.request.contextPath}">--%>

<link rel="stylesheet" href="style.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
</head>
<body class="home-page">

	<jsp:include page="header.jsp" />

	<section class="home swiper" id="home">
		<div class="swiper-wrapper">
			<div class="swiper-slide container">
				<img src="nhetanhdoday/asm.jpg" alt="Amazing Spider-Man-bg" />
				<div class="home-text">
					<div class="home-tags">
						<span class="tag-trending">#1 Top Trending</span> <span
							class="tag-quality">4K Ultra HD</span>
					</div>

					<h1>Amazing Spider-Man</h1>

					<div class="home-meta">
						<span>2012</span> <i class='bx bxs-circle'></i> <span>Hành
							Động, Phiêu Lưu</span> <i class='bx bxs-circle'></i> <span>2h 16m</span>
					</div>

					<p class="home-desc">Peter Parker, một học sinh trung học bị
						ruồng bỏ, bị nhện nhiễm phóng xạ cắn và có được những khả năng
						siêu phàm giống như nhện. Anh phải đối mặt với Lizard để bảo vệ
						thành phố.</p>

					<div class="home-btns">
						<a href="#" class="btn">Xem Ngay</a> <a href="#" class="play"
							aria-label="Chi tiết"> <i class='bx bx-info-circle'></i></a>
					</div>
				</div>
			</div>
			<div class="swiper-slide container">
				<img src="nhetanhdoday/genv.jpg" alt="GenV-bg" />
				<div class="home-text">
					<div class="home-tags">
						<span class="tag-trending">Top 10 Series</span> <span
							class="tag-quality">HD</span>
					</div>

					<h1>Gen V: The Boys Spinoff</h1>

					<div class="home-meta">
						<span>2023</span> <i class='bx bxs-circle'></i> <span>Viễn
							Tưởng, Học Đường</span> <i class='bx bxs-circle'></i> <span>1
							Season</span>
					</div>

					<p class="home-desc">Từ thế giới của The Boys, Gen V khám phá
						lứa siêu anh hùng đầu tiên biết rằng sức mạnh của họ là do Hợp
						chất V tiêm vào chứ không phải do Chúa ban tặng.</p>

					<div class="home-btns">
						<a href="#" class="btn">Xem Ngay</a> <a href="#" class="play"
							aria-label="Chi tiết"> <i class='bx bx-info-circle'></i></a>
					</div>
				</div>
			</div>
		</div>
		<div class="swiper-pagination"></div>
	</section>

	<section class="movies" id="phimle">
		<h2 class="heading">Phim Chiếu Rạp Mới</h2>

		<div class="movies-slider swiper">
			<div class="swiper-wrapper">
				<div class="movie-box swiper-slide">
					<a href="movie-page.html" class="movie-box-link">
						<div class="movie-img-wrapper">
							<img src="nhetanhdoday/ares_poster.jpg" alt="Poster phim"
								class="movie-box-img">
						</div>
						<div class="box-text">
							<h3 class="movie-title">Tron: Ares</h3>

							<span class="movie-type">Chiếu rạp / Hành động / Khoa học</span>

							<div class="movie-meta">
								<span class="movie-badge">2025</span> <span class="movie-badge">120
									phút</span>
							</div>
						</div>
					</a>
				</div>
				<div class="movie-box swiper-slide">
					<a href="movie-page.html" class="movie-box-link">
						<div class="movie-img-wrapper">
							<img src="nhetanhdoday/conjuring_poster.jpg" alt="Poster phim"
								class="movie-box-img">
						</div>
						<div class="box-text">
							<h3 class="movie-title">The Conjuring: Nghi Lễ Cuối Cùng</h3>
							<span class="movie-type">Chiếu rạp / Kinh dị</span>
						</div>
					</a>
				</div>
				<div class="movie-box swiper-slide">
					<a href="movie-page.html" class="movie-box-link">
						<div class="movie-img-wrapper">
							<img src="nhetanhdoday/f1.jpg" alt="Poster phim"
								class="movie-box-img">
						</div>
						<div class="box-text">
							<h3 class="movie-title">Tay Đua F1</h3>
							<span class="movie-type">Chiếu rạp / Chính kịch / Hành
								động</span>
						</div>
					</a>
				</div>
				<div class="movie-box swiper-slide">
					<a href="movie-page.html" class="movie-box-link">
						<div class="movie-img-wrapper">
							<img src="nhetanhdoday/spm.jpg" alt="Poster phim"
								class="movie-box-img">
						</div>
						<div class="box-text">
							<h3 class="movie-title">Superman</h3>
							<span class="movie-type">Chiếu rạp / DC / Siêu anh hùng</span>
						</div>
					</a>
				</div>
				<div class="movie-box swiper-slide">
					<a href="movie-page.html" class="movie-box-link">
						<div class="movie-img-wrapper">
							<img src="nhetanhdoday/fdb.jpg" alt="Poster phim"
								class="movie-box-img">
						</div>
						<div class="box-text">
							<h3 class="movie-title">Lưỡi Hái Tử Thần: Huyết Thống</h3>
							<span class="movie-type">Chiếu rạp / Gay cấn / Kinh dị</span>
						</div>
					</a>
				</div>
				<div class="movie-box swiper-slide">
					<a href="movie-page.html" class="movie-box-link">
						<div class="movie-img-wrapper">
							<img src="nhetanhdoday/hp.jpg" alt="Poster phim"
								class="movie-box-img">
						</div>
						<div class="box-text">
							<h3 class="movie-title">Harry Potter: Hoàng Tử Lai</h3>
							<span class="movie-type">Kinh điển / Phép thuật / Phiêu
								lưu</span>
						</div>
					</a>
				</div>
				<div class="movie-box swiper-slide">
					<a href="movie-page.html" class="movie-box-link">
						<div class="movie-img-wrapper">
							<img src="nhetanhdoday/fantasic4.jpg" alt="Poster phim"
								class="movie-box-img">
						</div>
						<div class="box-text">
							<h3 class="movie-title">Bộ Tứ Siêu Đẳng: Bước Đi Đầu Tiên</h3>
							<span class="movie-type">Chiếu rạp / Marvel / Siêu anh
								hùng</span>
						</div>
					</a>
				</div>
				<div class="movie-box swiper-slide">
					<a href="movie-page.html" class="movie-box-link">
						<div class="movie-img-wrapper">
							<img src="nhetanhdoday/exit8.jpg" alt="Poster phim"
								class="movie-box-img">
						</div>
						<div class="box-text">
							<h3 class="movie-title">Exit 8: Ga Tàu Vô Tận</h3>
							<span class="movie-type">Chiếu rạp / Kinh dị / Bí ẩn</span>
						</div>
					</a>
				</div>
			</div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</div>
	</section>
	</section>

	<section class="genres" id="genres">
		<h2 class="heading">Khám Phá Thể Loại</h2>
		<div class="genres-grid">
			<div class="genre-box">
				<h3>Hành Động</h3>
			</div>
			<div class="genre-box">
				<h3>Kinh Dị</h3>
			</div>
			<div class="genre-box">
				<h3>Khoa Học</h3>
			</div>
			<div class="genre-box">
				<h3>Tình Cảm</h3>
			</div>
			<div class="genre-box">
				<h3>Hoạt Hình</h3>
			</div>
		</div>
	</section>
	<section class="movies" id="phimbo">
		<h2 class="heading">Phim Bộ Hot</h2>
		<div class="movies-slider swiper">
			<div class="swiper-wrapper">
				<div class="movie-box swiper-slide">
					<a href="movie-page.html" class="movie-box-link">
						<div class="movie-img-wrapper">
							<img src="nhetanhdoday/thầy bạch.jpg" alt="Poster phim"
								class="movie-box-img">
						</div>
						<div class="box-text">
							<h3 class="movie-title">Biến chất</h3>
							<span class="movie-type">Phim bộ / Hành động / Tâm lý</span>
							<div class="movie-meta">
								<span class="movie-badge">SS 4</span> <span class="movie-badge">EP
									08</span>
							</div>
						</div>
					</a>
				</div>
				<div class="movie-box swiper-slide">
					<a href="movie-page.html" class="movie-box-link">
						<div class="movie-img-wrapper">
							<img src="nhetanhdoday/IT.jpg" alt="Poster phim"
								class="movie-box-img">
						</div>
						<div class="box-text">
							<h3 class="movie-title">IT: chào mừng tới Derry</h3>
							<span class="movie-type">Phim bộ / Kinh dị / tâm lý</span>
						</div>
					</a>
				</div>
				<div class="movie-box swiper-slide">
					<a href="movie-page.html" class="movie-box-link">
						<div class="movie-img-wrapper">
							<img src="nhetanhdoday/GenV-part2.jpg" alt="Poster phim"
								class="movie-box-img">
						</div>
						<div class="box-text">
							<h3 class="movie-title">GenV</h3>
							<span class="movie-type">Phim bộ / Hài hước / Hành động</span>
						</div>
					</a>
				</div>
				<div class="movie-box swiper-slide">
					<a href="movie-page.html" class="movie-box-link">
						<div class="movie-img-wrapper">
							<img src="nhetanhdoday/Hannibal.jpg" alt="Poster phim"
								class="movie-box-img">
						</div>
						<div class="box-text">
							<h3 class="movie-title">Giáo sư ăn thịt người</h3>
							<span class="movie-type">Phim bộ / Kinh dị / Hành động</span>
						</div>
					</a>
				</div>
				<div class="movie-box swiper-slide">
					<a href="movie-page.html" class="movie-box-link">
						<div class="movie-img-wrapper">
							<img src="nhetanhdoday/Arcane.jpg" alt="Poster phim"
								class="movie-box-img">
						</div>
						<div class="box-text">
							<h3 class="movie-title">Arcane</h3>
							<span class="movie-type">Phim Bộ / Gay cấn / Hành động</span>
						</div>
					</a>
				</div>
				<div class="movie-box swiper-slide">
					<a href="movie-page.html" class="movie-box-link">
						<div class="movie-img-wrapper">
							<img src="nhetanhdoday/marvelZombies.jpg" alt="Poster phim"
								class="movie-box-img">
						</div>
						<div class="box-text">
							<h3 class="movie-title">Marvel Zombies</h3>
							<span class="movie-type">Phim bộ / Giật gân / Phiêu lưu</span>
						</div>
					</a>
				</div>
				<div class="movie-box swiper-slide">
					<a href="movie-page.html" class="movie-box-link">
						<div class="movie-img-wrapper">
							<img src="nhetanhdoday/theboys ốm hơnjpg.webp" alt="Poster phim"
								class="movie-box-img">
						</div>
						<div class="box-text">
							<h3 class="movie-title">The Boys</h3>
							<span class="movie-type">Phim bộ / Hành động / Hài hước</span>
						</div>
					</a>
				</div>
				<div class="movie-box swiper-slide">
					<a href="movie-page.html" class="movie-box-link">
						<div class="movie-img-wrapper">
							<img src="nhetanhdoday/naruto.jpg" alt="Poster phim"
								class="movie-box-img">
						</div>
						<div class="box-text">
							<h3 class="movie-title">Naruto</h3>
							<span class="movie-type">Phim bộ / Hành động / Shounen</span>
						</div>
					</a>
				</div>
			</div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</div>
	</section>
	</section>

	<section class="spotlight" id="spotlight">
		<h2 class="spotlight-heading">
			<i class='bx bx-line-chart'></i> Xu Hướng Nổi Bật
		</h2>

		<div class="spotlight-slider swiper">
			<div class="swiper-wrapper">

				<div class="swiper-slide spotlight-inner">
					<div class="spotlight-content">
						<span class="spotlight-tag">#1 Hành Động</span>
						<h2 class="spotlight-title">John Wick: Chapter 4</h2>
						<p class="spotlight-desc">Sát thủ huyền thoại John Wick tìm ra
							con đường để đánh bại High Table. Nhưng trước khi có thể kiếm
							được tự do, Wick phải đối đầu với một kẻ thù mới.</p>
						<div class="home-btns"
							style="display: flex; gap: 1rem; margin-top: 1rem;">
							<a href="#" class="btn">Xem Ngay</a> <a href="#" class="play"><i
								class='bx bx-info-circle'></i></a>
						</div>
					</div>
					<div class="spotlight-img">
						<img src="nhetanhdoday/f1.jpg" alt="John Wick Poster">
					</div>
				</div>

				<div class="swiper-slide spotlight-inner">
					<div class="spotlight-content">
						<span class="spotlight-tag">#1 Chính Kịch</span>
						<h2 class="spotlight-title">Oppenheimer</h2>
						<p class="spotlight-desc">Câu chuyện về nhà vật lý người Mỹ J.
							Robert Oppenheimer và vai trò của ông trong việc phát triển bom
							nguyên tử.</p>
						<div class="home-btns"
							style="display: flex; gap: 1rem; margin-top: 1rem;">
							<a href="#" class="btn">Xem Ngay</a> <a href="#" class="play"><i
								class='bx bx-info-circle'></i></a>
						</div>
					</div>
					<div class="spotlight-img">
						<img src="nhetanhdoday/f1.jpg" alt="Oppenheimer Poster">
					</div>
				</div>

			</div>
			<div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
		</div>
	</section>
	<section class="explore" id="explore">
		<h2 class="heading"
			style="text-align: left; border: none; margin-left: 0;">
			<i class='bx bx-collection'></i> Bộ Sưu Tập Tuyển Chọn
		</h2>

		<div class="explore-slider swiper">
			<div class="swiper-wrapper">

				<div class="swiper-slide wide-box">
					<a href="movie-page.html">
						<div class="wide-img">
							<img src="nhetanhdoday/asm.jpg" alt="">
							<div class="wide-play">
								<i class='bx bx-play'></i>
							</div>
							<div class="wide-overlay">
								<div class="wide-text">
									<span>Marvel</span>
									<h3>Vũ Trụ Người Nhện</h3>
								</div>
							</div>
						</div>
					</a>
				</div>

				<div class="swiper-slide wide-box">
					<a href="movie-page.html">
						<div class="wide-img">
							<img src="nhetanhdoday/f1.jpg" alt="">
							<div class="wide-play">
								<i class='bx bx-play'></i>
							</div>
							<div class="wide-overlay">
								<div class="wide-text">
									<span>Thể Thao</span>
									<h3>Tốc Độ & Kịch Tính</h3>
								</div>
							</div>
						</div>
					</a>
				</div>

				<div class="swiper-slide wide-box">
					<a href="movie-page.html">
						<div class="wide-img">
							<img src="nhetanhdoday/conjuring_poster.jpg" alt="">
							<div class="wide-play">
								<i class='bx bx-play'></i>
							</div>
							<div class="wide-overlay">
								<div class="wide-text">
									<span>Kinh Dị</span>
									<h3>Vũ Trụ The Conjuring</h3>
								</div>
							</div>
						</div>
					</a>
				</div>

				<div class="swiper-slide wide-box">
					<a href="movie-page.html">
						<div class="wide-img">
							<img src="nhetanhdoday/genv.jpg" alt="">
							<div class="wide-play">
								<i class='bx bx-play'></i>
							</div>
							<div class="wide-overlay">
								<div class="wide-text">
									<span>Series</span>
									<h3>Thế Giới The Boys</h3>
								</div>
							</div>
						</div>
					</a>
				</div>

				<div class="swiper-slide wide-box">
					<a href="movie-page.html">
						<div class="wide-img">
							<img src="nhetanhdoday/fantasic4.jpg" alt="">
							<div class="wide-play">
								<i class='bx bx-play'></i>
							</div>
							<div class="wide-overlay">
								<div class="wide-text">
									<span>Marvel</span>
									<h3>Biệt Đội Siêu Anh Hùng</h3>
								</div>
							</div>
						</div>
					</a>
				</div>

			</div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</div>
	</section>
	<section class="movies" id="phimle">
		<h2 class="heading">Phim Sắp Chiếu</h2>

		<div class="movies-slider swiper">
			<div class="swiper-wrapper">
				<div class="movie-box swiper-slide">
					<a href="movie-page.html" class="movie-box-link">
						<div class="movie-img-wrapper">
							<img src="nhetanhdoday/ares_poster.jpg" alt="Poster phim"
								class="movie-box-img">
						</div>
						<div class="box-text">
							<h3 class="movie-title">Tron: Ares</h3>

							<span class="movie-type">Chiếu rạp / Hành động / Khoa học</span>

							<div class="movie-meta">
								<span class="movie-badge">2025</span> <span class="movie-badge">120
									phút</span>
							</div>
						</div>
					</a>
				</div>
				<div class="movie-box swiper-slide">
					<a href="movie-page.html" class="movie-box-link">
						<div class="movie-img-wrapper">
							<img src="nhetanhdoday/conjuring_poster.jpg" alt="Poster phim"
								class="movie-box-img">
						</div>
						<div class="box-text">
							<h3 class="movie-title">The Conjuring: Nghi Lễ Cuối Cùng</h3>
							<span class="movie-type">Chiếu rạp / Kinh dị</span>
						</div>
					</a>
				</div>
				<div class="movie-box swiper-slide">
					<a href="movie-page.html" class="movie-box-link">
						<div class="movie-img-wrapper">
							<img src="nhetanhdoday/f1.jpg" alt="Poster phim"
								class="movie-box-img">
						</div>
						<div class="box-text">
							<h3 class="movie-title">Tay Đua F1</h3>
							<span class="movie-type">Chiếu rạp / Chính kịch / Hành
								động</span>
						</div>
					</a>
				</div>
				<div class="movie-box swiper-slide">
					<a href="movie-page.html" class="movie-box-link">
						<div class="movie-img-wrapper">
							<img src="nhetanhdoday/spm.jpg" alt="Poster phim"
								class="movie-box-img">
						</div>
						<div class="box-text">
							<h3 class="movie-title">Superman</h3>
							<span class="movie-type">Chiếu rạp / DC / Siêu anh hùng</span>
						</div>
					</a>
				</div>
				<div class="movie-box swiper-slide">
					<a href="movie-page.html" class="movie-box-link">
						<div class="movie-img-wrapper">
							<img src="nhetanhdoday/fdb.jpg" alt="Poster phim"
								class="movie-box-img">
						</div>
						<div class="box-text">
							<h3 class="movie-title">Lưỡi Hái Tử Thần: Huyết Thống</h3>
							<span class="movie-type">Chiếu rạp / Gay cấn / Kinh dị</span>
						</div>
					</a>
				</div>
				<div class="movie-box swiper-slide">
					<a href="movie-page.html" class="movie-box-link">
						<div class="movie-img-wrapper">
							<img src="nhetanhdoday/hp.jpg" alt="Poster phim"
								class="movie-box-img">
						</div>
						<div class="box-text">
							<h3 class="movie-title">Harry Potter: Hoàng Tử Lai</h3>
							<span class="movie-type">Kinh điển / Phép thuật / Phiêu
								lưu</span>
						</div>
					</a>
				</div>
				<div class="movie-box swiper-slide">
					<a href="movie-page.html" class="movie-box-link">
						<div class="movie-img-wrapper">
							<img src="nhetanhdoday/fantasic4.jpg" alt="Poster phim"
								class="movie-box-img">
						</div>
						<div class="box-text">
							<h3 class="movie-title">Bộ Tứ Siêu Đẳng: Bước Đi Đầu Tiên</h3>
							<span class="movie-type">Chiếu rạp / Marvel / Siêu anh
								hùng</span>
						</div>
					</a>
				</div>
				<div class="movie-box swiper-slide">
					<a href="movie-page.html" class="movie-box-link">
						<div class="movie-img-wrapper">
							<img src="nhetanhdoday/exit8.jpg" alt="Poster phim"
								class="movie-box-img">
						</div>
						<div class="box-text">
							<h3 class="movie-title">Exit 8: Ga Tàu Vô Tận</h3>
							<span class="movie-type">Chiếu rạp / Kinh dị / Bí ẩn</span>
						</div>
					</a>
				</div>
			</div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<script src="main.js"></script>

</body>
</html>