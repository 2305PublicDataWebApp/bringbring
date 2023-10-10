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
    <link href="../../assets/img/main/title-icon.png" rel="icon">
    <link href="../../assets/img/main/title-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
        rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="../../assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="../../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="../../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="../../assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="../../assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="../../assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="../../assets/css/style.css" rel="stylesheet">
    <link href="../../assets/css/common.css" rel="stylesheet">
    <link href="../../assets/css/member/insert.css" rel="stylesheet">

    <!-- =======================================================
  * Template Name: Arsha
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/arsha-free-bootstrap-html-template-corporate/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
    
</head>

<body>

    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top ">
        <div class="container d-flex align-items-center">
            <img src="../../assets/img/main/cargo-truck-green.png" style="width: 46px;padding: 0px 7px 5px 0px;" alt="">
            <h1 class="logo me-auto" style="font-family: 'RixYeoljeongdo_Regular';"><a href="index.html">브링브링</a></h1>
            <!-- Uncomment below if you prefer to use an image logo -->
            <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

            <nav id="navbar" class="navbar">
                <ul>
                    <li><a class="nav-link scrollto" href="#about">배출안내</a></li>
                    <!-- <li><a class="nav-link scrollto" href="#services">수거신고</a></li> -->
                    <li><a class="nav-link   scrollto" href="#portfolio">공지사항</a></li>
                    <li><a class="nav-link scrollto" href="#team">문의게시판</a></li>
                    <li><a class="nav-link scrollto" href="#team">나눔게시판</a></li>

                    </li>
                    <li><button class="getstarted scrollto">로그인</button>
                        <!-- <a  href="#login">로그인</a> -->
                    </li>
                </ul>
                <i class="bi bi-list mobile-nav-toggle"></i>
            </nav><!-- .navbar -->

        </div>
    </header><!-- End Header -->

    <div style="width: 100%;height: 74px;"></div>
    <!-- ======= Hero Section ======= -->
    <!-- <div id="hero" style="width: 100%;margin: 0 auto;height: 70px;" ></div> -->

    <!-- 메인 -->
    <main>
        <div class="form_insert w-100 m-auto rounded">
            <h1 class="h3 mb-3 fw-normal text-center">회원가입</h1>

            <form id="register_form" action="#" method="post" novalidate>
                <div class="container">
                    <div class="row mb-4">
                        <div class="form-floating col-10 p-0">
                            <input type="email" id="floatingEmail" class="form-control" placeholder="name@example.com" required>
                            <label for="floatingEmail">이메일 주소</label>
                            <div class="invalid-feedback">
                                이메일을 입력해주세요.
                            </div>
                        </div>
                        <div class="col-2 pe-0">
                            <input type="button" id="email_check_input" class="email_check_input w-100 rounded" value="중복 확인">
                        </div>
                    </div>
                </div>
                
                <div class="form-floating mb-4">
                    <input type="password" id="floatingPassword" class="form-control" placeholder="Password" required>
                    <label for="floatingPassword">비밀번호</label>
                    <div class="invalid-feedback">
                        비밀번호를 입력해주세요.
                    </div>
                </div>
                <div class="form-floating mb-4">
                    <input type="password" id="floatingPasswordCheck" class="form-control" placeholder="Password" required>
                    <label for="floatingPasswordCheck">비밀번호 확인</label>
                    <div id="member_pw_check_div" class="invalid-feedback">
                        <!-- 비밀번호를 한번 더 입력해주세요. -->
                    </div>
                    <!-- <div id="check_pw"></div> -->
                </div>
                <div class="form-floating mb-4">
                    <input type="text" class="form-control" id="floatingName" placeholder="Name" required>
                    <label for="floatingName">이름</label>
                    <div class="invalid-feedback">
                        이름을 입력해주세요.
                    </div>
                </div>
                <div class="form-floating mb-4">
                    <input type="text" id="floatingPhone" class="form-control" placeholder="Phone" required>
                    <label for="floatingPhone">전화번호</label>
                    <div class="invalid-feedback">
                        전화번호를 입력해주세요.
                    </div>
                </div>
                <div class="container">
                    <div class="row mb-4">
                        <div class="form-floating col-10 p-0">
                            <input type="text" id="floatingPostcode" class="form-control" placeholder="Postcode" required>
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
                    <input type="text" id="floatingAddress" class="form-control" placeholder="Address" required>
                    <label for="floatingAddress">주소</label>
                    <div class="invalid-feedback">
                        주소를 검색하여 선택해주세요.
                    </div>
                </div>
                <div class="form-floating mb-4">
                    <input type="text" id="floatingAddressDetail" class="form-control" placeholder="AddressDetail" required>
                    <label for="floatingAddressDetail">상세주소</label>
                    <div class="invalid-feedback">
                        상세주소를 입력해주세요.
                    </div>
                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input">
                    <label class="form-check-label">동의하기</label>
                </div>
                <p class="ps-4 pe-4">실명 인증된 아이디로 가입, 위치기반 서비스 이용약관(선택), 이벤트 혜택 정보 수신 (선택) 동의를 포함합니다. </p>
                
                <input type="submit" id="register_btn" class="insert_btn_input w-100 text-center fw-bold fs-4 rounded" value="회원가입">
                
            </form>

        </div>
    </main>
    <!-- End #main -->

    <!-- ======= Footer ======= -->
    <footer id="footer">
        <div class="footer-top">
            <div class="container">
                <div class="row">

                    <div class="col-lg-3 col-md-6 footer-contact">
                        <h3>브링브링</h3>
                        <p>
                            A108 Adam Street <br>
                            New York, NY 535022<br>
                            United States <br><br>
                            <strong>Phone:</strong> +1 5589 55488 55<br>
                            <strong>Email:</strong> info@example.com<br>
                        </p>
                    </div>

                    <div class="col-lg-3 col-md-6 footer-links">
                        <h4>Useful Links</h4>
                        <ul>
                            <li><i class="bx bx-chevron-right"></i> <a href="#"></a></li>
                            <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
                            <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
                            <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
                            <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
                        </ul>
                    </div>

                    <div class="col-lg-3 col-md-6 footer-links">
                        <h4>Our Services</h4>
                        <ul>
                            <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
                            <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
                            <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
                            <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
                            <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
                        </ul>
                    </div>

                    <div class="col-lg-3 col-md-6 footer-links">
                        <h4>Our Social Networks</h4>
                        <p>Cras fermentum odio eu feugiat lide par naso tierra videa magna derita valies</p>
                        <div class="social-links mt-3">
                            <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                            <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                            <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                            <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                            <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="container footer-bottom clearfix">
            <div class="copyright">
                &copy; Copyright <strong><span>Arsha</span></strong>. All Rights Reserved
            </div>
            <div class="credits">
                <!-- All the links in the footer should remain intact. -->
                <!-- You can delete the links only if you purchased the pro version. -->
                <!-- Licensing information: https://bootstrapmade.com/license/ -->
                <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/arsha-free-bootstrap-html-template-corporate/ -->
                Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
            </div>
        </div>
    </footer><!-- End Footer -->

    <div id="preloader"></div>
    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
            class="bi bi-arrow-up-short"></i></a>

    <!-- Vendor JS Files -->
    <script src="../../assets/vendor/aos/aos.js"></script>
    <script src="../../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../../assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="../../assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="../../assets/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="../../assets/vendor/waypoints/noframework.waypoints.js"></script>
    <script src="../../assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="../../assets/js/main.js"></script>

    <!-- 회원가입 유효성 -->
    <script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
        const form = document.getElementById('register_form');
        const password_check = document.getElementById('member_pw_check_div');

        form.addEventListener('submit', function (event) {
            if (!form.checkValidity()) {
                // 폼 유효성 검사가 실패하면
                event.preventDefault(); // 폼 제출 방지
                event.stopPropagation(); // 이벤트 버블링 중지
            }
            password_check.innerHTML="비밀번호를 한번 더 입력해주세요."
            form.classList.add('was-validated'); // 부트스트랩 유효성 클래스 추가
        
        });
    });
    // 비밀번호 재확인(최종하려면 JQuery CDN 지워야 함)
    document.getElementById('floatingPasswordCheck').addEventListener('keyup', function() {
        var pass1 = document.getElementById('floatingPassword').value;
        var pass2 = this.value; // 현재 이벤트가 발생한 요소 (member_pw_check)의 값

        var member_pw_Check_Div = document.getElementById('member_pw_check_div');

        member_pw_Check_Div.classList.remove('invalid-feedback');
        member_pw_Check_Div.classList.add('mt-1')
        member_pw_Check_Div.style.fontSize = "14px";
        member_pw_Check_Div.style.height = "10px";
        if (pass1 !== "" || pass2 !== "") {
            if (pass1 === pass2) {
                member_pw_Check_Div.innerHTML = "비밀번호가 일치합니다.";
                member_pw_Check_Div.style.color = "green";
            } else {
                member_pw_Check_Div.innerHTML = "비밀번호가 일치하지 않습니다.";
                member_pw_Check_Div.style.color = "red";
            }
        }

        if (pass2 === "") {
            member_pw_Check_Div.innerHTML = "비밀번호를 한번 더 입력해주세요.";
            member_pw_Check_Div.classList.remove('mt-1')
            member_pw_Check_Div.classList.add('invalid-feedback');
        }
    });
    // ** JQuery **
    // $('#member_pw_check').keyup(function() {
    //     const pass1 = $('#member_pw').val(); 
	// 	const pass2 = $('#member_pw_check').val();
    //     const password_check = document.getElementById('member_pw_check_div');

	// 	if (pass1 != "" || pass2 != "") {
	// 		if (pass1 == pass2) {
	// 			$('#check_pw').text("비밀번호가 일치합니다.");  // .innerHTML는 자바스크립트
	// 			$('#check_pw').css("color", "green");
	// 			$('#check_pw').css("font-size", "14px");
	// 			$('#check_pw').css("margin-top", "4px");
    //         }else if(pass2 == "") {
    //         $('#check_pw').text(""); 
    //         } else {
	// 			$('#check_pw').text("비밀번호가 일치하지 않습니다.");
	// 			$('#check_pw').css("color", "red");
	// 			$('#check_pw').css("font-size", "14px");
	// 			$('#check_pw').css("margin-top", "4px");
	// 		}
    //         password_check.classList.replace('invalid-feedback', 'd-none');
	// 	}
    //     if(pass2 == "") {
    //         password_check.classList.replace('d-none', 'invalid-feedback');
    //     }
		
	// });
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