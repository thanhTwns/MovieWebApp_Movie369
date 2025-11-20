/* ====================================================== */
/* 1. Code cho "Hero Slider"*/
/* ====================================================== */
var swiperHome = new Swiper(".home.swiper", {
	spaceBetween: 30,
	centeredSlides: true,
	loop: true,
	autoplay: {
		delay: 5000,
		disableOnInteraction: false,
	},
	pagination: {
		el: ".swiper-pagination",
		clickable: true,
	},
});

/* ====================================================== */
/* 2. (Code này để chạy slider, tạo khoảng cách 25px và kích hoạt nút) */
/* ====================================================== */
var swiperMovies = new Swiper(".movies-slider", {
	loop: true,

	// Khoảng cách 25px
	spaceBetween: 25,

	// Kích hoạt 2 nút mũi tên
	navigation: {
		nextEl: ".swiper-button-next",
		prevEl: ".swiper-button-prev",
	},

	// Responsive: Hiển thị 4 phim trên desktop
	breakpoints: {
		0: { slidesPerView: 1.5, spaceBetween: 15 },
		520: { slidesPerView: 2, spaceBetween: 15 },
		768: { slidesPerView: 3, spaceBetween: 20 },
		// Yêu cầu của bạn: 4 phim
		1024: {
			slidesPerView: 5,
			spaceBetween: 25
		},
		1200: {
			slidesPerView: 5,
			spaceBetween: 25
		}
	}
});


/* ====================================================== */
/* 3. Code cho Header "Thu nhỏ khi cuộn" */
/* ====================================================== */
let header = document.querySelector('header');

window.addEventListener('scroll', () => {
	// Nếu cuộn chuột xuống hơn 50px
	if (window.scrollY > 50) {
		header.classList.add('scrolled');
	} else {
		header.classList.remove('scrolled');
	}
});