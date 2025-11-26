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
document.addEventListener("DOMContentLoaded", function () {
    
    // 1. Xử lý Menu "Thể loại" (Category)
    // Chọn đúng cái dropdown không phải là user-profile
    const categoryDropdown = document.querySelector('.dropdown-item:not(.user-profile)');
    
    if (categoryDropdown) {
        const categoryLink = categoryDropdown.querySelector('a');
        const categoryMenu = categoryDropdown.querySelector('.dropdown-menu');

        categoryLink.addEventListener('click', function (e) {
            e.preventDefault();
            // Đóng menu User nếu đang mở
            if(userProfile) userProfile.classList.remove('active');
            
            categoryDropdown.classList.toggle('active');
            categoryMenu.classList.toggle('show');
        });
    }

    // 2. Xử lý Menu "User Profile" (Avatar)
    const userProfile = document.querySelector('.user-profile');
    
    if (userProfile) {
        const profileToggle = userProfile.querySelector('.profile-toggle');
        
        profileToggle.addEventListener('click', function (e) {
            e.preventDefault();
            e.stopPropagation(); // Ngăn sự kiện nổi bọt
            
            // Đóng menu Thể loại nếu đang mở
            if(categoryDropdown) {
                categoryDropdown.classList.remove('active');
                categoryDropdown.querySelector('.dropdown-menu').classList.remove('show');
            }

            // Bật/Tắt menu User
            userProfile.classList.toggle('active');
        });
    }

    // 3. Click ra ngoài thì đóng tất cả
    document.addEventListener('click', function (e) {
        // Nếu click ra ngoài Thể loại
        if (categoryDropdown && !categoryDropdown.contains(e.target)) {
            categoryDropdown.classList.remove('active');
            const menu = categoryDropdown.querySelector('.dropdown-menu');
            if(menu) menu.classList.remove('show');
        }

        // Nếu click ra ngoài User Profile
        if (userProfile && !userProfile.contains(e.target)) {
            userProfile.classList.remove('active');
        }
    });

});