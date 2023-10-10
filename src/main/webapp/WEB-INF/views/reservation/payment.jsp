<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>결제</title>
  <meta content="" name="description">
  <meta content="" name="keywords">


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

  <!-- =======================================================
  * Template Name: Arsha
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/arsha-free-bootstrap-html-template-corporate/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->

<!--  달력-->
<!--  <link rel="stylesheet" href="../../assets/css/reservation/bootstrap-material-datetimepicker.css" />-->
<!--  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">-->
  <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<!--  <link rel="stylesheet" href="/css/jquery-ui.min.css">-->
<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>-->
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
  <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>


  <!--결제-->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>


  <link rel="stylesheet" href="../../assets/css/reservation/payment.css">
  <link rel="stylesheet" href="../../assets/css/reservation/common.css">
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
      <h1>결제</h1>
      <div style="width: 100%;height: 30px;"></div>
      <h4 style="color: rgb(189, 245, 229);">선택하신 상품의 수수료를 결제해주세요</h4>
    </div>
    <div style="display: flex;flex-direction: row;justify-content: flex-end;">
      <img src="../../assets/img/reservation/payment.png" style="width: 250px;" alt="">
    </div>
  </div>

</section>
<div style="width: 100%;height: 1000px;">

<main>
  <h2 class="subject">결제</h2>
  <div>
    <div class="progress-bar out-progress-bar">
      <div class="progress-bar in-progress-bar"></div>
    </div>
  </div>
  <div>
    <p class="title">배출 정보</p>
  </div>
  <hr>
  <div id="infoContainer">
    <table class="table table-borderless">
      <tr>
        <td>
          <label>배출 품목</label>
        </td>
        <td>
          <ul class="list-group list-group-flush">
            <li class="list-group-item">가구 > 거울 > 높이 50cm 이상 > 1개</li>
            <li class="list-group-item">가구 > 식탁(테이블) > 4인용 이상 > 1개</li>
          </ul>
        </td>
      </tr>
      <tr>
        <td>
          <label>배출 장소</label>
        </td>
        <td>
          <ul class="list-group list-group-flush">
            <li class="list-group-item">서울시 중구</li>
          </ul>
        </td>
      </tr>
      <tr>
        <td>
          <label>배출일</label>
        </td>
        <td>
          <ul class="list-group list-group-flush">
            <li class="list-group-item">2023-10-30</li>
          </ul>
        </td>
      </tr>
      <tr>
        <td>
          <label>수수료</label>
        </td>
        <td>
          <ul class="list-group list-group-flush">
            <li class="list-group-item">6,000원</li>
          </ul>
        </td>
      </tr>
    </table>
  </div>
  <div>
    <p class="title">결제 수단</p>
    <hr>
    <div>
      <div class="form-check" id="card-form">
        <div>
          <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
        </div>
        <div id="card-div">
          <label class="form-check-label" for="flexRadioDefault1" id="card-img">
            <img src="../../assets/img/reservation/card.png" id="payment-card">
            <p>신용카드</p>
          </label>
        </div>
      </div>
    </div>
  </div>
  <div id="submit_btn_box">
    <button class="btn btn-success" id="submitBtn" type="button" onclick="requestPay()">결제하기</button>
  </div>
</main>
</div><!-- End Hero -->

<!-- 메인 -->
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


  function requestPay() {

  console.log("뭐야")
  var IMP = window.IMP;
  IMP.init("imp44058332"); // 예: imp00000000
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param
      pg: "html5_inicis",
      pay_method: "card",
      merchant_uid: "ORD20180131-0000011",
      name: "브링브링",
      amount: 6000,
      buyer_email: "gildong@gmail.com",
      buyer_name: "홍길동",
      buyer_tel: "010-4242-4242",
      buyer_addr: "서울특별시 강남구 신사동",
      buyer_postcode: "01181"
    }, function (rsp) { // callback
      if (rsp.success) {
        // 결제 성공 시 로직
      } else {
        // 결제 실패 시 로직
      }
    });
  }
</script>

<script>

</script>

</body>

</html>