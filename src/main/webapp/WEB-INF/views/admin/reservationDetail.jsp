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
  <link href="../resources/assets/css/admin/emissionDetail.css" rel="stylesheet">
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

  <!-- 메인 -->
  <main>
    <section>
      <div style="display: flex; flex-direction: column; justify-content: space-between">
        <div style="margin: 0 auto; margin-top: 40px;">
          <h2>예약 상세 내역</h2>
        </div>
        <div>
          <div class="card" style="width: 500px; margin: 0 auto; border: none;">
            <div class="card-body">
              <table class="table align-middle text-center">
                  <tr>
                    <td>예약 번호</td>
                    <td>1</td>
                  </tr>
                  <tr>
                    <td>예약자 이름</td>
                    <td>정수댕</td>
                  </tr>
                  <tr>
                    <td>이메일</td>
                    <td>johndoe@example.com</td>
                  </tr>
                  <tr>
                    <td>주소</td>
                    <td>123 Main St, City</td>
                  </tr>
                  <tr>
                    <td>배출지역</td>
                    <td>전농동</td>
                  </tr>
                  <tr>
                    <td>신청일</td>
                    <td>2023-10-03</td>
                  </tr>
                  <tr>
                    <td>배출 희망일</td>
                    <td>2023-10-05</td>
                  </tr>
                  <tr>
                    <td>배출 물품</td>
                    <td>세탁기</td>
                  </tr>
                  <tr>
                    <td>결제 금액</td>
                    <td>3000</td>
                  </tr>
                  <tr>
                    <td>상태</td>
                    <td>신청완료</td>
                  </tr>           
              </table>
              <div style="display: flex; justify-content: space-around;">
                <button class="btn btn-success" style="width: 150px;">접수처리</button>
                <button class="btn btn-success"  style="width: 150px;" onclick="location.href='../admin/localReservationManageMent.html'">목록으로</button>
              </div>
            </div>
          </div>
        </div>
      </div>
      <br/>
  
    </section>

  </main>
<!-- End #main -->

  <!-- 푸터 -->
  <jsp:include page="/include/footer.jsp"></jsp:include>ooter -->

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