<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>브링브링</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <!-- Favicons -->
    <link href="../resources/assets/img/main/title-icon.png" rel="icon">
    <link href="../resources/assets/img/main/title-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
        rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="../resources/assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="../resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="../resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="../resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="../resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="../resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="../resources/assets/css/style.css" rel="stylesheet">
    <link href="../resources/assets/css/common.css" rel="stylesheet">
    <link href="../resources/assets/css/user/update.css" rel="stylesheet">

    <!-- =======================================================
  * Template Name: Arsha
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/arsha-free-bootstrap-html-template-corporate/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
    
</head>

<body>

	<!-- 헤더 -->
  	<jsp:include page="/include/header.jsp"></jsp:include>
  	
    <!-- ======= Hero Section ======= -->
    <!-- <div id="hero" style="width: 100%;margin: 0 auto;height: 70px;" ></div> -->

    <!-- 메인 -->
    <main>
        <div class="form_update_div w-100 m-auto rounded">
            <h1 class="h3 mb-3 fw-normal text-center">정보 수정</h1>

            <form id="update_form" action="#" method="post" novalidate>
            	<div id="prorile_img_div" class="text-center mb-3">
                    <label for="profile-img"></label>
                    <div class="profile-image-container">
                        <img src="../resources/assets/img/mypage/Test_img2.png" id="profile-image-preview" alt="프로필 이미지">
                        <input type="file" id="profile-img" name="uploadFile" >
                        <label for="profile-img" class="upload-icon"><img src="../resources/assets/img/mypage/mypage_gear.png" id="camera" class="upload-icon" alt=""></label>
                    </div>
                </div>
            
                <div class="form-floating mb-4">
                    <input type="email" id="floatingEmail" class="form-control" placeholder="name@example.com" value="user01@kh.com" readonly>
                    <label for="floatingEmail">이메일 주소</label>
                </div>
                
                <div class="form-floating mb-4">
                    <input type="text" class="form-control" id="floatingName" placeholder="Name"  value="일용자" required>
                    <label for="floatingName">이름</label>
                    <div class="invalid-feedback">
                        이름을 입력해주세요.
                    </div>
                </div>
                <div class="form-floating mb-4">
                    <input type="text" id="floatingPhone" class="form-control" placeholder="Phone" value="01012345678" required>
                    <label for="floatingPhone">전화번호</label>
                    <div class="invalid-feedback">
                        전화번호를 입력해주세요.
                    </div>
                </div>
                <div class="container">
                    <div class="row mb-4">
                        <div class="form-floating col-10 p-0">
                            <input type="text" id="floatingPostcode" class="form-control" placeholder="Postcode" value="01123" required>
                            <label for="floatingPostcode">우편번호</label>
                            <div class="invalid-feedback">
                                주소를 검색하여 입력해주세요.
                            </div>
                        </div>
                        <div class="col-2 pe-0">
                            <input type="button" class="address_input w-100 rounded" value="우편 번호">
                        </div>
                    </div>
                </div>
                <div class="form-floating mb-4">
                    <input type="text" id="floatingAddress" class="form-control" placeholder="Address" 
                            value="서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) " required>
                    <label for="floatingAddress">주소</label>
                    <div class="invalid-feedback">
                        주소를 검색하여 선택해주세요.
                    </div>
                </div>
                <div class="form-floating mb-4">
                    <input type="text" id="floatingAddressDetail" class="form-control" placeholder="AddressDetail" value="2층, 3층" required>
                    <label for="floatingAddressDetail">상세주소</label>
                    <div class="invalid-feedback">
                        상세주소를 입력해주세요.
                    </div>
                </div>
                
                <input type="submit" id="register_btn" class="insert_btn_input w-100 text-center fw-bold fs-4 rounded" value="회원가입">
                
            </form>

            <a href="#" class="text-right">탈퇴하기</a>

        </div>
    </main>
    <!-- End #main -->

	<!-- 푸터 -->
  	<jsp:include page="/include/footer.jsp"></jsp:include>

    <div id="preloader"></div>
    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
            class="bi bi-arrow-up-short"></i></a>

    <!-- Vendor JS Files -->
    <script src="../resources/assets/vendor/aos/aos.js"></script>
    <script src="../resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="../resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="../resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="../resources/assets/vendor/waypoints/noframework.waypoints.js"></script>
    <script src="../resources/assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="../resources/assets/js/main.js"></script>

    <!-- 회원가입 유효성 -->
    <script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
        const form = document.getElementById('update_form');

        form.addEventListener('submit', function (event) {
            if (!form.checkValidity()) {
                // 폼 유효성 검사가 실패하면
                event.preventDefault(); // 폼 제출 방지
                event.stopPropagation(); // 이벤트 버블링 중지
            }
            form.classList.add('was-validated'); // 부트스트랩 유효성 클래스 추가
        
        });
    });
    </script>
    <!-- 프로필 업로드 및 미리보기 -->
    <script>
        const profileImageInput = document.getElementById('profile-img');
        const profileImagePreview = document.getElementById('profile-image-preview');
        const defaultProfileImage = 'Test_img2.png';

        profileImageInput.addEventListener('change', (e) => {
            const file = e.target.files[0];

            if (file) {
                const reader = new FileReader();

                reader.onload = (e) => {
                    profileImagePreview.src = e.target.result;
                };

                reader.readAsDataURL(file);
            } else {
                // 이미지가 선택되지 않았을 때 디폴트 이미지로 변경
                profileImagePreview.src = defaultProfileImage;
            }
        });
    </script>
    <!-- 채널톡 api -->
    <script>
        (function () { var w = window; if (w.ChannelIO) { return w.console.error("ChannelIO script included twice."); } var ch = function () { ch.c(arguments); }; ch.q = []; ch.c = function (args) { ch.q.push(args); }; w.ChannelIO = ch; function l() { if (w.ChannelIOInitialized) { return; } w.ChannelIOInitialized = true; var s = document.createElement("script"); s.type = "text/javascript"; s.async = true; s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js"; var x = document.getElementsByTagName("script")[0]; if (x.parentNode) { x.parentNode.insertBefore(s, x); } } if (document.readyState === "complete") { l(); } else { w.addEventListener("DOMContentLoaded", l); w.addEventListener("load", l); } })();

        ChannelIO('boot', {
            "pluginKey": "3e438b51-7087-4b0c-b50f-c1cb50c8f770"
        });

    </script>


</body>

</html>