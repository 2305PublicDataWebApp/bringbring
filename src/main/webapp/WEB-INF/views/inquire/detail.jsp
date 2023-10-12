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


  <!-- Vendor CSS Files -->
  <link href="../assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <!-- <link href="../assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet"> -->
  <!-- <link href="../assets/vendor/remixicon/remixicon.css" rel="stylesheet"> -->
  <!-- <link href="../assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet"> -->

  <!-- Template Main CSS File -->
  <link href="../assets/css/style.css" rel="stylesheet">
  <link href="../assets/css/common.css" rel="stylesheet">


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
    
  <main style="width: 100%;margin: 0 auto;padding-top: 50px;">
    
    

    <div style="width: 850px;margin: 0 auto;">
      <!-- 프로필 영역 -->
      <div  data-aos="fade-up" style="width: 100%;height: 130px;border-bottom: 2px solid #ccc;border-top: 2px solid #ccc;">
        <div style="float: left;">
          <img style="width: 50px;height: 50px;margin-top: 35px;margin-left: 10px;" src="../assets/img/divide/free-icon-user-847969.png" alt="">
        </div>
        <div style="float: left;padding: 35px 15px;">
          <h5>닉네임</h5>
          <p">서울특별시 중구</p>
        </div>
        <div style="display: flex;float: right;height: 100%;flex-direction: column;justify-content: space-evenly;">
          <button type="button" class="btn btn-success">글 수정</button>
          <button type="button" class="btn btn-success">글 삭제</button>
        </div>
      </div>
      <!-- 제목 영역 -->
      <div data-aos="fade-up" style="width: 100%;border-bottom: 1px solid #ccc;">
        <div style="padding: 35px 15px;">
          <h3>제목이 들어갈 자리입니다.</h3>
          <p style="margin-bottom: 5px;">지역 : </p>
          <p style="margin: 0px;">2023.10.05</p>
        </div>
      </div>
      <!-- 내용 영역 -->
      <div data-aos="fade-up" style="width: 100%; border-bottom: 2px solid #ccc; display: flex; flex-direction: column; align-items: flex-end;background-color: #eee;">
        <div style="padding: 35px">
          <textarea name="" id="" cols="86" rows="15" style="resize: none; border: none; outline: none; width: 100%;padding: 10px;" readonly>내용이 들어갈 자리입니다.</textarea>
        </div>
      </div>      
    </div>
    <div data-aos="fade-up">
      <div style="width: 850px;height: 130px;border-bottom: 1px solid #ccc;border-top: 2px solid #ccc;margin: 0 auto;margin-top: 200px;">
        <div style="padding-top: 35px;padding-left: 15px;float: left;">
          <h4>답변</h4>
          <p">서울특별시 관리자</p>
        </div>
        <div style="display: flex;float: right;height: 100%;flex-direction: column;justify-content: center;">
          <button type="button" class="btn btn-success">글 수정</button>
        </div>
      </div>
  
      <div style="width: 850px;margin: 0 auto;">
        <div style="width: 100%; border-bottom: 2px solid #ccc; display: flex; flex-direction: column; align-items: flex-end;background-color: #eee;">
          <div style="padding: 35px">
            <textarea name="" id="" cols="86" rows="15" style="resize: none; border: none; outline: none; width: 100%;padding: 10px;" readonly>내용이 들어갈 자리입니다.</textarea>
          </div>
        </div> 
      </div>
    </div>
  </main>
  <!-- 메인 -->
<!-- End #main -->

  <!-- 푸터 -->
  <jsp:include page="/include/footer.jsp"></jsp:include>

  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
      class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="../assets/vendor/aos/aos.js"></script>
  <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="../assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="../assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="../assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="../assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="../assets/js/main.js"></script>

  <!-- 채널톡 api -->
  <script>
    (function () { var w = window; if (w.ChannelIO) { return w.console.error("ChannelIO script included twice."); } var ch = function () { ch.c(arguments); }; ch.q = []; ch.c = function (args) { ch.q.push(args); }; w.ChannelIO = ch; function l() { if (w.ChannelIOInitialized) { return; } w.ChannelIOInitialized = true; var s = document.createElement("script"); s.type = "text/javascript"; s.async = true; s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js"; var x = document.getElementsByTagName("script")[0]; if (x.parentNode) { x.parentNode.insertBefore(s, x); } } if (document.readyState === "complete") { l(); } else { w.addEventListener("DOMContentLoaded", l); w.addEventListener("load", l); } })();

        ChannelIO('boot', {
          "pluginKey": "3e438b51-7087-4b0c-b50f-c1cb50c8f770"
        });

    <!-- 로그인, 로그아웃 -->
    <jsp:include page="/include/loginJs.jsp"></jsp:include>
  </script>
    
</body>

</html>