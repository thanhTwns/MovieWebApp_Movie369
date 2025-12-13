/* ====================================================== */
/* MAIN.JS - ĐÃ SỬA LỖI & TỐI ƯU CHO MỌI TRANG            */
/* ====================================================== */

document.addEventListener("DOMContentLoaded", function () {

    /* ====================================================== */
    /* 1. Code cho "Hero Slider" (Chỉ chạy nếu có .home.swiper) */
    /* ====================================================== */
    if (document.querySelector(".home.swiper")) {
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
    }

    /* ====================================================== */
    /* 2. Slider Phim (Movies Slider)                         */
    /* ====================================================== */
    if (document.querySelector(".movies-slider")) {
        var swiperMovies = new Swiper(".movies-slider", {
            loop: true,
            spaceBetween: 25,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            breakpoints: {
                0: { slidesPerView: 1.5, spaceBetween: 15 },
                520: { slidesPerView: 2, spaceBetween: 15 },
                768: { slidesPerView: 3, spaceBetween: 20 },
                1024: { slidesPerView: 5, spaceBetween: 25 },
                1200: { slidesPerView: 5, spaceBetween: 25 }
            }
        });
    }

    /* ====================================================== */
    /* 3. Slider Trending (Nếu có sử dụng)                    */
    /* ====================================================== */
    if (document.querySelector(".trending-slider")) {
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
    }

    /* ====================================================== */
    /* 4. Slider Explore (Bộ sưu tập - 3 phim/hàng)           */
    /* ====================================================== */
    if (document.querySelector(".explore-slider")) {
        var swiperExplore = new Swiper(".explore-slider", {
            slidesPerView: 1,
            spaceBetween: 20,
            loop: true,
            centeredSlides: false,
            navigation: {
                nextEl: ".explore-slider .swiper-button-next",
                prevEl: ".explore-slider .swiper-button-prev",
            },
            breakpoints: {
                768: { slidesPerView: 2, spaceBetween: 20 },
                1200: { slidesPerView: 3, spaceBetween: 25 },
            },
        });
    }

    /* ====================================================== */
    /* 5. Header "Thu nhỏ khi cuộn"                           */
    /* ====================================================== */
    let header = document.querySelector('header');
    if (header) {
        window.addEventListener('scroll', () => {
            if (window.scrollY > 50) {
                header.classList.add('scrolled');
            } else {
                header.classList.remove('scrolled');
            }
        });
    }

    /* ====================================================== */
    /* 6. Xử lý Dropdown Menu & User Profile                  */
    /* ====================================================== */
    
    // 6.1 Xử lý Menu "Thể loại"
    const categoryDropdown = document.querySelector('.dropdown-item:not(.user-profile)');
    const userProfile = document.querySelector('.user-profile');

    if (categoryDropdown) {
        const categoryLink = categoryDropdown.querySelector('a');
        const categoryMenu = categoryDropdown.querySelector('.dropdown-menu');

        categoryLink.addEventListener('click', function (e) {
            e.preventDefault();
            // Đóng menu User nếu đang mở
            if (userProfile) userProfile.classList.remove('active');
            
            categoryDropdown.classList.toggle('active');
            categoryMenu.classList.toggle('show');
        });
    }

    // 6.2 Xử lý Menu "User Profile" (Avatar)
    if (userProfile) {
        const profileToggle = userProfile.querySelector('.profile-toggle');
        
        profileToggle.addEventListener('click', function (e) {
            e.preventDefault();
            e.stopPropagation(); // Ngăn sự kiện nổi bọt
            
            // Đóng menu Thể loại nếu đang mở
            if (categoryDropdown) {
                categoryDropdown.classList.remove('active');
                const catMenu = categoryDropdown.querySelector('.dropdown-menu');
                if (catMenu) catMenu.classList.remove('show');
            }

            // Bật/Tắt menu User
            userProfile.classList.toggle('active');
        });
    }

    // 6.3 Click ra ngoài thì đóng tất cả
    document.addEventListener('click', function (e) {
        // Nếu click ra ngoài Thể loại
        if (categoryDropdown && !categoryDropdown.contains(e.target)) {
            categoryDropdown.classList.remove('active');
            const menu = categoryDropdown.querySelector('.dropdown-menu');
            if (menu) menu.classList.remove('show');
        }

        // Nếu click ra ngoài User Profile
        if (userProfile && !userProfile.contains(e.target)) {
            userProfile.classList.remove('active');
        }
    });

});
if (document.querySelector(".spotlight-slider")) {
    var swiperSpotlight = new Swiper(".spotlight-slider", {
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: {
            delay: 4000,
            disableOnInteraction: false,
        },
        // Hiệu ứng mờ dần (Fade) cho đẹp
        effect: 'fade', 
        fadeEffect: { crossFade: true },
        
        // KÍCH HOẠT NÚT MŨI TÊN
        navigation: {
            nextEl: ".spotlight-slider .swiper-button-next",
            prevEl: ".spotlight-slider .swiper-button-prev",
        },
    });
}