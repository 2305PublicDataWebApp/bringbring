<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>브링브링</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- JQuery -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <!-- Favicons -->
  <link href="../resources/assets/img/main/title-icon.png" rel="icon">
  <link href="../resources/assets/img/main/title-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
    rel="stylesheet">ㅂ
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
  <link href="../resources/assets/css/admin/management.css" rel="stylesheet">
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
      <img src="../resources/assets/img/main/cargo-truck-green.png" style="width: 46px;padding: 0px 7px 5px 0px;" alt="">
      <h1 class="logo me-auto" style="font-family: 'RixYeoljeongdo_Regular';"><a href="index.jsp">브링브링</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto" href="#about">배출안내</a></li>
          <!-- <li><a class="nav-link scrollto" href="#services">수거신고</a></li> -->
          <li><a class="nav-link   scrollto" href="#portfolio">공지사항</a></li>
          <li><a class="nav-link scrollto" href="#team">나눔게시판</a></li>
          <li class="dropdown"><a href="#"><span>관리자 메뉴</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <!-- 최고 관리자 기능 -->
              <li><a href="/admin/memberM.do">회원 관리</a></li> 
              <li><a href="/admin/reportM.do">신고 관리</a></li>
              <li><a href="/admin/contactM.do">문의 관리</a></li>
              <li><a href="/admin/reservationM.do">배출 관리</a></li>
              
            </ul>
          </li>
          <li>
            <button class="getstarted scrollto">로그인</button>
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
        <h1>관리자 회원 관리</h1>
        <div style="width: 100%;height: 30px;"></div>
        <h4 style="color: rgb(189, 245, 229);">회원 정보 조회, 회원 탈퇴 관리, 관리자 권한 부여 페이지입니다. </h4>
      </div>
      <div style="display: flex;flex-direction: row;justify-content: flex-end;">
        <img src="../resources/assets/img/admin/page-icon.png" style="width: 250px;" alt="">
      </div>
    </div>
  </section>

  <!-- 메인 -->
  <main>
    <section>
      <div class="row">
        <div class="four col-md-3">
          <div class="counter-box colored">
            <h4>회원 수 : ${userCount}</h4>
          </div>
        </div>
        <div class="col-md-3">
          <div class="counter-box colored">
              <h4>관리자 수 : ${adminCount}</h4>
          </div>
        </div>
        <div class="col-md-3">
          <div class="counter-box colored">
              <h4>탈퇴한 회원 : 100</h4>
          </div>
        </div>
        <div class="col-md-3">
          <button onclick="location.href='/admin/memberList.do'" class="region-btn" style="width: 300px; height: 80px; border: none;">
            <h4>회원 조회</h4>
          </button>
        </div>
      </div>
    </section>
    <section>
      <div style="display: flex; justify-content: space-between">
        <div>
          <h2>관리자 리스트</h2>
        </div>
        <div class="input-group" style="width: 400px; height: 30px;">
          <select class="form-select" aria-label=".form-select-lg example" style="width: 20%;">
            <option selected>아이디</option>
            <option value="1">회원번호</option>
            <option value="2">전화번호</option>
            <option value="3">관활지역</option>
          </select>
          <input type="search" class="form-control rounded" placeholder="검색" aria-label="Search" aria-describedby="search-addon" style="width: 50%;" />
          <button type="button" class="btn btn-outline-success" id="user-serch-btn">검색</button>
        </div>
      </div>
      <br/>
      <div class="table-responsive">
        <table class="table align-middle text-center">
            <thead class="table-light align-middle">
                <tr>
                    <th>번호</th>
                    <th>회원 아이디</th>
                    <th>담당자 번호</th>
                    <th>관리자 임명일</th>
                    <th>관할 지역</th>
                    <th>-</th>
                </tr>
            </thead>
          <tbody>
          <c:forEach var="admin" items="${adminList}" varStatus="a">
            <tr>
              <td>${admin.adminNo}</td>
              <td>${admin.userId}</td>
              <td>${admin.userPhone}</td>
              <td>${admin.adminCreateDate}</td>
              <td>${admin.regionName}</td>
              <td>
                <button class="btn btn-success" data-toggle="modal" data-target="#myModal${user.userNo}">관리자 해임</button>
              </td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
    </div>
    </section>
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
  <script src="../resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.10.2/umd/popper.min.js"></script>


  <!-- Template Main JS File -->
  <script src="../resources/assets/js/main.js"></script>

  <!-- 채널톡 api -->
  <script>
    (function () { var w = window; if (w.ChannelIO) { return w.console.error("ChannelIO script included twice."); } var ch = function () { ch.c(arguments); }; ch.q = []; ch.c = function (args) { ch.q.push(args); }; w.ChannelIO = ch; function l() { if (w.ChannelIOInitialized) { return; } w.ChannelIOInitialized = true; var s = document.createElement("script"); s.type = "text/javascript"; s.async = true; s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js"; var x = document.getElementsByTagName("script")[0]; if (x.parentNode) { x.parentNode.insertBefore(s, x); } } if (document.readyState === "complete") { l(); } else { w.addEventListener("DOMContentLoaded", l); w.addEventListener("load", l); } })();

    ChannelIO('boot', {
      "pluginKey": "3e438b51-7087-4b0c-b50f-c1cb50c8f770"
    });

    $(document).ready(function () {
      var trigger = $('.hamburger'),
          overlay = $('.overlay'),
          isClosed = false;
    
        trigger.click(function () {
          hamburger_cross();      
        });
    
        function hamburger_cross() {
    
          if (isClosed == true) {          
            overlay.hide();
            trigger.removeClass('is-open');
            trigger.addClass('is-closed');
            isClosed = false;
          } else {   
            overlay.show();
            trigger.removeClass('is-closed');
            trigger.addClass('is-open');
            isClosed = true;
          }
      }
      
      $('[data-toggle="offcanvas"]').click(function () {
            $('#wrapper').toggleClass('toggled');
      });  
    });
    function submitAdminForm(userNo) {
      var regionNo = document.getElementById("regionNo" + userNo).value;
      var adminOrg = document.getElementById("adminOrg" + userNo).value;

      // 서버로 데이터를 보내고 관리자 정보를 인서트하는 API 호출
      // 여기에 AJAX 호출 코드를 추가해야 합니다.

      // 모달을 닫음
      $('#myModal' + userNo).modal('hide');
    }
  </script>


</body>

</html>