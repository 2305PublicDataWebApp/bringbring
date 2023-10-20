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
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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

<!-- 헤더 -->
<jsp:include page="/include/header.jsp"></jsp:include>

  <div style="width: 100%;height: 74px;"></div>
  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center" style="width: 100%;margin: 0 auto;">
    <div style="width: 1300px;margin: 0 auto;">
      <div style="float: left;margin-top: 60px;">
        <h1>배출 관리</h1>
        <div style="width: 100%;height: 30px;"></div>
        <h4 style="color: rgb(189, 245, 229);">회원들이 예약한 배출 정보를 관리할 수 있습니다.</h4>
      </div>
      <div style="display: flex;flex-direction: row;justify-content: flex-end;">
        <img src="../resources/assets/img/admin/page-icon3.png" style="width: 250px;" alt="">
      </div>
    </div>
  </section>

  <!-- 메인 -->
  <main>
    <section>
      <div class="row">
        <div class="four col-md-3">
          <div class="counter-box colored">
            <h4>배출예약 건수 : 100</h4>
          </div>
        </div>
        <div class="col-md-3">
          <div class="counter-box colored">
              <h4>접수된 건수 : 50</h4>
          </div>
        </div>
        <div class="col-md-3">
          <div class="counter-box colored">
              <h4>완료된 건수 : 50</h4>
          </div>
        </div>
        <div class="col-md-3">
          <button onclick="location.href='/admin/localM.do'" class="region-btn" style="width: 300px; height: 80px; border: none;">
              <h4>관할 지역조회</h4> 
          </button>
          </div>
        </div>
    </section>
    <section>
      <div style="display: flex; justify-content: space-between">
        <div>
          <h2>예약 내역</h2>
        </div>
        <div class="input-group" style="width: 400px; height: 30px;">
          <select class="form-select" aria-label=".form-select-lg example" style="width: 20%;">
            <option selected>배출지역</option>
            <option value="1">신청일</option>
            <option value="2">주소</option>
          </select>
          <input type="search" class="form-control" placeholder="검색" aria-label="Search" aria-describedby="search-addon" style="width: 50%;" />
          <button type="button" class="btn btn-outline-success" id="user-serch-btn">검색</button>
        </div>
      </div>
      <br/>
      <div class="table-responsive">
        <table class="table align-middle text-center table-hover">
            <thead class="table-light align-middle">
                <tr>
                    <th>예약 번호</th>
                    <th>이름</th>
                    <th>주소</th>
                    <th>배출지역</th>
                    <th>신청일</th>
                    <th>예약일</th>
                    <th>결제여부</th>
                    <th>상태</th>
                </tr>
            </thead>
            <tbody>
                <tr onclick="location.href='../admin/emissionManagement.html'" style="cursor:pointer;">
                  <td>1</td>
                  <td>정수댕</td>
                  <td>서울시 동대문구 전농동</td>
                  <td>전농동</td>
                  <td>2023-10-01</td>
                  <td>2023-10-03</td>
                  <td>O</td>
                  <td>예약 완료</td>
                </tr>
                <tr onclick="location.href='../admin/emissionManagement.html'" style="cursor:pointer;">
                  <td>2</td>
                  <td>김아름</td>
                  <td>의정부시</td>
                  <td>수댕동</td>
                  <td>2023-10-02</td>
                  <td>2023-10-05</td>
                  <td>O</td>
                  <td>접수 완료</td>
                </tr> 
            </tbody>
        </table>
    </div>
    </section>

  </main>
<!-- End #main -->

  <!-- 푸터 -->
  <jsp:include page="/include/footer.jsp"></jsp:include>nd Footer -->

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

  </script>
  
  
</body>

</html>