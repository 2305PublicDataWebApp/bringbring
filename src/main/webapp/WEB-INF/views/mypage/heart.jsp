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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
    <link href="../../assets/css/mypage/mypage.css" rel="stylesheet">

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
    <section id="hero" class="d-flex align-items-center" style="width: 100%;margin: 0 auto;">
        <div style="width: 1300px;margin: 0 auto;">
            <div style="float: left;margin-top: 60px;">
                <h1>마이 페이지</h1>
                <div style="width: 100%;height: 30px;"></div>
                <h4 style="color: rgb(189, 245, 229);">내역을 편리하게 확인하고, 나만의 정보를 관리하는 특별한 공간입니다.</h4>
            </div>
            <div style="display: flex;flex-direction: row;justify-content: flex-end;">
                <img src="../../assets/img/mypage/mypage_book.png" style="width: 250px;" alt="">
            </div>
        </div>
    
    </section>

    <!-- 메인 -->
    <main>
        <div class="mypage_top m-auto rounded">
            <div class="mypage_top_div ps-5 pb-3 mt-3" style="height:75px;">
                <h1 class="d-inline">일용자님</h1>
                <div class="d-inline">
                    <a href="#">
                        <img src="../../assets/img/mypage/mypage_gear.png" class="h-100 pb-3">
                    </a>
                </div>
            </div>

            <div class="container">
                <div class="row" style="min-height:750px;">
                    <div class="mypage_sidebar col-3 p-5">
                        <a href="#" class="fs-1">신청 내역</a>
                        <a href="#" class="fs-1">문의 내역</a>
                        <a href="#" class="fs-1">채팅 내역</a>
                        <a href="#" class="fs-1">찜 내역</a>
                    </div>
                    <div class="col-9 ps-5 pt-5">
                        
                        <!-- 채팅 목록 -->
                        <div class="container mt-3 p-0">
                            <h1 style="float: left;">찜한 게시물</h1>
                            <table class="table table-hover table-bordered">
                                <colgroup>
                                    <col width=8%>
                                    <col width=50%>
                                    <col width=17%>
                                    <col width=14%>
                                </colgroup>
                                <thead class="table-light">
                                    <tr>
                                        <th class="text-center">번호</th>
                                        <th class="text-center">제목</th>
                                        <th class="text-center">아이디</th>
                                        <th class="text-center">작성날짜</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="text-center align-middle">1</td>
                                        <td class="align-middle"><a href="#">냉장고, 침대 나눔합니다.</a></td>
                                        <td class="text-center align-middle">kh</td>
                                        <td class="text-center align-middle">2023.09.12</td>
                                    </tr>
                                    <tr>
                                        <td class="text-center align-middle">2</td>
                                        <td class="align-middle"><a href="#">스팸 나눔합니다.</a></td>
                                        <td class="text-center align-middle">kh2</td>
                                        <td class="text-center align-middle">2023.09.12</td>
                                    </tr>
                                    <tr>
                                        <td class="text-center align-middle">3</td>
                                        <td class="align-middle"><a href="#">돼지저금통 나눔합니다.</a></td>
                                        <td class="text-center align-middle">kh3</td>
                                        <td class="text-center align-middle">2023.09.12</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- 페이징 -->
                        <div style="width: 100%;margin: 0 auto;margin-top: 60px;">
                            <nav aria-label="Page navigation example" style="display: flex;">
                                <ul class="pagination" style="margin: 0 auto;">
                                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                </ul>
                            </nav>
                        </div>
                        
                    </div>
                </div>
            </div>
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

    <!-- 채널톡 api -->
    <script>
        (function () { var w = window; if (w.ChannelIO) { return w.console.error("ChannelIO script included twice."); } var ch = function () { ch.c(arguments); }; ch.q = []; ch.c = function (args) { ch.q.push(args); }; w.ChannelIO = ch; function l() { if (w.ChannelIOInitialized) { return; } w.ChannelIOInitialized = true; var s = document.createElement("script"); s.type = "text/javascript"; s.async = true; s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js"; var x = document.getElementsByTagName("script")[0]; if (x.parentNode) { x.parentNode.insertBefore(s, x); } } if (document.readyState === "complete") { l(); } else { w.addEventListener("DOMContentLoaded", l); w.addEventListener("load", l); } })();

        ChannelIO('boot', {
            "pluginKey": "3e438b51-7087-4b0c-b50f-c1cb50c8f770"
        });

    </script>


</body>

</html>