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
var swiperTrending = new Swiper(".trending-slider", {
  slidesPerView: 1,
  spaceBetween: 15,
  loop: true,
  breakpoints: {
    450: { slidesPerView: 2, spaceBetween: 15 },
    768: { slidesPerView: 3, spaceBetween: 20 },
    1024: { slidesPerView: 4, spaceBetween: 20 },
    1200: { slidesPerView: 5, spaceBetween: 20 }
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
/* ========================================== */
/* JS cho Dropdown Menu (Click để mở/đóng)    */
/* ========================================== */

// 1. Lấy thẻ "Thể loại" và cái menu con của nó
const dropdownItem = document.querySelector('.dropdown-item');
const dropdownLink = dropdownItem.querySelector('a'); // Cái link chữ "Thể loại"
const dropdownMenu = dropdownItem.querySelector('.dropdown-menu');

// 2. Bắt sự kiện click vào chữ "Thể loại"
dropdownLink.addEventListener('click', function(e) {
    e.preventDefault(); // Ngăn không cho nó load lại trang hay nhảy link
    
    // Bật/Tắt class 'show' cho menu con
    dropdownMenu.classList.toggle('show');
    
    // Bật/Tắt class 'active' cho mục cha (để xoay mũi tên)
    dropdownItem.classList.toggle('active');
});

// 3. (Tùy chọn) Click ra ngoài thì tự đóng menu
document.addEventListener('click', function(e) {
    // Nếu cái mình click KHÔNG nằm trong dropdown
    if (!dropdownItem.contains(e.target)) {
        dropdownMenu.classList.remove('show');
        dropdownItem.classList.remove('active');
    }
});
var swiperSpotlight = new Swiper(".spotlight-slider", {
  spaceBetween: 30,
  centeredSlides: true,
  autoplay: {
    delay: 4000,
    disableOnInteraction: false,
  },
  pagination: {
    el: ".swiper-pagination",
    clickable: true,
  },

  effect: 'fade', 
  fadeEffect: {
    crossFade: true
  },
});
var swiperExplore = new Swiper(".explore-slider", {
    spaceBetween: 20,
    loop: true,
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
    },
    breakpoints: {
        968: {
            slidesPerView: 3, // Laptop hiện 3 cái
            spaceBetween: 20,
        },
        1200: {
            slidesPerView: 4, // Màn to hiện 4 cái
            spaceBetween: 20,
        },
    },
});