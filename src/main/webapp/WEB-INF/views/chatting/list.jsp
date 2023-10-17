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
  <link href="../resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="../resources/assets/css/style.css" rel="stylesheet">
  <link href="../resources/assets/css/common.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Arsha
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/arsha-free-bootstrap-html-template-corporate/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  
</head>

<body>

  <main style="width: 100%; margin: 0 auto; padding: 50px 0px 50px 0px;">
    <div style="width: 600px; height: 1150px; margin: 0 auto; background-color: black; border-radius: 50px;">
      <div style="width: 100%;height: 15px;"></div>
      <div style="width: 570px;height: 1120px;border-radius: 35px;background-color: white;margin: 0 auto;">
        <div style="width: 100%;height: 100px;text-align: center;margin: 0 auto;">
          <!-- <i class="bi bi-dot" style="font-size: 75px;"></i> -->
          <i class="bi bi-dash-lg" style="font-size: 80px;"></i>
          <!-- <i class="bi bi-dot" style="font-size: 50px;"></i> -->
        </div>  
        <div style="margin: 0 auto;width: 550px; height: 750px; background-color: #00AD7C;">
          <div style="width: 100%;height: 80px;margin-top: 15px;border-bottom: 1px solid #17594A;">
            <i class="bi bi-chevron-left" style="float: left;font-size: 32px;margin: 0px 10px 0px 10px;padding-top: 15px;"></i>
            <h3 style="padding-top: 26px;">닉네임</h3>
          </div>
          <div style="width: 100%;display: flex;height: 62px;padding: 12px 0px 12px 12px;border-bottom: 1px solid #17594A;">
            <button class="btn btn-dark">나눔 완료</button>
            <h6 style="padding: 10px 0px 0px 10px;">게시글 제목이 들어갈 자리입니다.</h6>
          </div>
          <div style="width: 100%;height: 608px;padding: 20px;">
            <div style="width: 100%;height: 60px;float: left;">
              <img src="../resources/assets/img/divide/free-icon-user-847969.png" style="width: 40px;float: left;margin: 10px 10px 0px 0px;" alt="">
              <textarea type="text" style="float: left;;width: 300px;height: 40px;border-radius: 8px;border: 0px;resize: none;margin-top: 10px;"></textarea>
              <p style="padding-top: 30px;letter-spacing: 1px;">&nbsp;&nbsp;12:03</p>
            </div>
            <div style="width: 100%;height: 60px;float: left;">
              <textarea type="text" style="width: 300px;height: 40px;resize: none;margin-top: 10px;border-radius: 8px;border: 0px;float: right;margin-right: 20px;"></textarea>
              <p style="padding-top: 30px;margin-right: 10px;letter-spacing: 1px;float: right;">&nbsp;&nbsp;12:03</p>
            </div>
          </div>
        </div>
        <div style="width: 550px;margin: 0 auto;height: 80px;display: flex;flex-direction: row;justify-content: flex-end;background-color: #F0F3F3;border: 2px solid #00AD7C;;">
          <input type="text" style="border-top-left-radius: 8px;border-bottom-left-radius: 8px;width: 475px;height: 40px;margin-top: 20px;border: 2px solid #00AD7C;" placeholder=" 채팅 내용을 입력해주세요.">
          <button class="btn btn-success" style="border-bottom-left-radius: 0px;border-top-left-radius: 0px;height: 40px;margin: 20px 10px 0px 10px;"><i class="bi bi-send-fill"></i></button>
        </div>
        <div style="width: 100%;height: 100px;margin: 0 auto;text-align: center;margin-top: 20px;">
          <i class="bi bi-circle" style="font-size: 90px;"></i>
        </div>
      </div>
    </div>
  </main>
  <!-- 메인 -->
<!-- End #main -->



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

  <!-- 채널톡 api -->
  <script>
    // (function () { var w = window; if (w.ChannelIO) { return w.console.error("ChannelIO script included twice."); } var ch = function () { ch.c(arguments); }; ch.q = []; ch.c = function (args) { ch.q.push(args); }; w.ChannelIO = ch; function l() { if (w.ChannelIOInitialized) { return; } w.ChannelIOInitialized = true; var s = document.createElement("script"); s.type = "text/javascript"; s.async = true; s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js"; var x = document.getElementsByTagName("script")[0]; if (x.parentNode) { x.parentNode.insertBefore(s, x); } } if (document.readyState === "complete") { l(); } else { w.addEventListener("DOMContentLoaded", l); w.addEventListener("load", l); } })();
    //
    // ChannelIO('boot', {
    //   "pluginKey": "3e438b51-7087-4b0c-b50f-c1cb50c8f770"
    // });

  </script>
  
  
</body>

</html>