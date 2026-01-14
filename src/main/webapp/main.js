document.addEventListener("DOMContentLoaded", function () {

    /* ====================================================== */
    /* 1. Code cho "Hero Slider" (Trang chủ)                  */
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
    /* 3. Slider Trending                                     */
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
    /* 4. Slider Explore                                      */
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
    /* 5. Header "Thu nhỏ/Đổi màu khi cuộn"                   */
    /* ====================================================== */
    let header = document.querySelector('header');
    if (header) {
        window.addEventListener('scroll', () => {
            // Khi cuộn xuống quá 50px thì thêm class 'scrolled'
            if (window.scrollY > 50) {
                header.classList.add('scrolled');
            } else {
                header.classList.remove('scrolled');
            }
        });
    }

    /* ====================================================== */
    /* 6. Xử lý Dropdown Menu (ĐÃ SỬA LẠI LOGIC)              */
    /* ====================================================== */

    // Tìm phần tử bằng ID để chính xác tuyệt đối (Tránh nhầm class)
    const genreDropdown = document.getElementById('genre-dropdown');
    const userProfile = document.querySelector('.user-profile');

    // 6.1 Xử lý Menu "Thể loại"
    if (genreDropdown) {
        genreDropdown.addEventListener('click', function (e) {
            // Nếu click vào chính cái menu thì không làm gì (để nó xổ xuống)
            // Chỉ ngăn chặn hành vi nếu thẻ a có href="#"

            // Đóng User Profile nếu đang mở
            if (userProfile && userProfile.classList.contains('active')) {
                userProfile.classList.remove('active');
            }

            // Toggle class active
            this.classList.toggle('active');

            // Tìm menu con bên trong và toggle class show
            const menu = this.querySelector('.dropdown-menu');
            if (menu) menu.classList.toggle('show');

            e.stopPropagation(); // Ngăn không cho sự kiện lan ra ngoài
        });
    }

    // 6.2 Xử lý Menu "User Profile"
    if (userProfile) {
        userProfile.addEventListener('click', function (e) {
            // Đóng menu Thể loại nếu đang mở
            if (genreDropdown) {
                genreDropdown.classList.remove('active');
                const gMenu = genreDropdown.querySelector('.dropdown-menu');
                if (gMenu) gMenu.classList.remove('show');
            }

            // Toggle bản thân nó
            this.classList.toggle('active');
            e.stopPropagation();
        });
    }

    // 6.3 Click ra ngoài khoảng trống thì đóng tất cả
    document.addEventListener('click', function (e) {
        // Nếu click ra ngoài Thể loại
        if (genreDropdown && !genreDropdown.contains(e.target)) {
            genreDropdown.classList.remove('active');
            const menu = genreDropdown.querySelector('.dropdown-menu');
            if (menu) menu.classList.remove('show');
        }

        // Nếu click ra ngoài User Profile
        if (userProfile && !userProfile.contains(e.target)) {
            userProfile.classList.remove('active');
        }
    });

});

// Slider Spotlight (nếu có)
if (document.querySelector(".spotlight-slider")) {
    var swiperSpotlight = new Swiper(".spotlight-slider", {
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: {
            delay: 4000,
            disableOnInteraction: false,
        },
        effect: 'fade',
        fadeEffect: { crossFade: true },
        navigation: {
            nextEl: ".spotlight-slider .swiper-button-next",
            prevEl: ".spotlight-slider .swiper-button-prev",
        },
    });
}
/* =========================================
   XỬ LÝ TÌM KIẾM AJAX (LIVE SEARCH)
   ========================================= */

function searchByName(param) {
    var txtSearch = param.value;
    var resultContainer = document.getElementById("search-results-container");

    if (txtSearch.trim() === "") {
        resultContainer.style.display = "none";
        resultContainer.innerHTML = "";
        return;
    }

    fetch("ajax-search?query=" + encodeURIComponent(txtSearch))
        .then(response => response.text())
        .then(data => {
            // Nhét HTML nhận được vào hộp
            resultContainer.innerHTML = data;

            // Nếu có phim thì hiện lên, không thì ẩn
            if (data.trim() !== "") {
                resultContainer.style.display = "block";
            } else {
                resultContainer.style.display = "none";
            }
        })
        .catch(error => console.error('Lỗi Ajax Search:', error));
}


document.addEventListener('click', function(e) {
    var container = document.querySelector('.search-box-wrapper');
    var resultBox = document.getElementById("search-results-container");


    if (container && resultBox && !container.contains(e.target)) {
        resultBox.style.display = "none";
    }
});
    // Phần Hồ Sơ Cá Nhân : Switch Tab
function switchProfileTab(tabName) {
    // 1. Ẩn tất cả tab nội dung
    var contents = document.querySelectorAll('.tab-content');
    contents.forEach(function(content) {
        content.classList.remove('active');
    });

    // 2. Bỏ active ở tất cả nút sidebar
    document.getElementById('btn-profile').classList.remove('active');
    document.getElementById('btn-membership').classList.remove('active');

    // 3. Hiện tab được chọn
    if(tabName === 'profile') {
        document.getElementById('tab-profile').classList.add('active');
        document.getElementById('btn-profile').classList.add('active');
    } else if (tabName === 'membership') {
        document.getElementById('tab-membership').classList.add('active');
        document.getElementById('btn-membership').classList.add('active');
    }
}