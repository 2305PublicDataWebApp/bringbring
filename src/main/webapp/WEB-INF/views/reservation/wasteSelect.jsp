<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>대형 폐기물 수거 신청</title>
  <meta content="" name="description">
  <meta content="" name="keywords">


  <!-- Favicons -->
  <link href="../../../resources/assets/img/main/title-icon.png" rel="icon">
    <link href="../../../resources/assets/img/main/title-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link
          href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="../../../resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="../../../resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../../../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../../../resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../../../resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="../../../resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="../../../resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="../../../resources/assets/css/style.css" rel="stylesheet">
  <link href="../../../resources/assets/css/common.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Arsha
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/arsha-free-bootstrap-html-template-corporate/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->


  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  
  <link rel="stylesheet" href="../../../resources/assets/css/reservation/wasteSelect.css">
  <link rel="stylesheet" href="../../../resources/assets/css/reservation/common.css">
</head>

<body>

<!-- ======= Header ======= -->
<header id="header" class="fixed-top ">
  <div class="container d-flex align-items-center">
    <img src="./assets/img/main/cargo-truck-green.png" style="width: 46px;padding: 0px 7px 5px 0px;" alt="">
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
      <h1>대형 폐기물 수거 신청</h1>
      <div style="width: 100%;height: 30px;"></div>
      <h4 style="color: rgb(189, 245, 229);">버리기 어려운 폐기물을 수거해드립니다</h4>
    </div>
    <div style="display: flex;flex-direction: row;justify-content: flex-end;">
      <img src="../../../resources/assets/img/reservation/truck.png" style="width: 250px;" alt="">
    </div>
  </div>

</section>
<div style="width: 100%;height: 1000px;">

<main>
  <h2 class="subject">대형 폐기물 수거 신청</h2>
  <div>
    <div class="progress-bar out-progress-bar">
      <div class="progress-bar in-progress-bar"></div>
    </div>
  </div>
  <p class="title">배출 물품 선택</p>
  <hr>
  <div class="container">
    <div id="category_box">
<!--      포기한다..!!!!!!!!!!!! -->
      <button type="button" class="btn btn-outline-success" id="furniture" value="가구" onclick="wasteSelect(this);">가구</button>
      <button type="button" class="btn btn-outline-success" id="electronics" value="가전" onclick="wasteSelect(this);">가전</button>
      <button type="button" class="btn btn-outline-success" id="appliance" value="운동용품" onclick="wasteSelect(this);">운동용품</button>
      <button type="button" class="btn btn-outline-success" id="household" value="생활/주방" onclick="wasteSelect(this);">생활/주방</button>
      <button type="button" class="btn btn-outline-success" id="instrument" value="악기" onclick="wasteSelect(this);">악기</button>
      <button type="button" class="btn btn-outline-success" id="digital" value="디지털" onclick="wasteSelect(this);">디지털</button>
      <button type="button" class="btn btn-outline-success" id="other" value="기타" onclick="wasteSelect(this);">기타</button>
    </div>
  </div>
  <div>
    <div>
      <table class="table" id="listTable">
        <tbody>
        <tr>
          <td>
            <input class="form-check-input me-1" type="checkbox" value="거울">
            <label class="align-items-center">
              거울
            </label>
          </td>
          <td>
            <select name="mirror" class="form-select selectBox">
              <option>높이 50cm 이상</option>
              <option>높이 50cm 미만</option>
            </select>
          </td>
          <td>
            <div class="fee">
              <p class="m-0">3,000원</p>
            </div>
          </td>
          <td>
            <button class="selectBtn" onclick="count('minus');" value='+'><img src="../../../resources/assets/img/reservation/minus.png"></button>
              <input type="number" minlength="0" maxlength="10" id="numberInput" value="0">
            <button class="selectBtn" onclick="count('plus');" value='-'><img src="../../../resources/assets/img/reservation/plus.png"></button>
          </td>
        </tr>
        </tbody>
      </table>
    </div>
  </div>
  <span>최대 10개까지 선택할 수 있습니다.</span>
  <div>
    <p class="title">선택한 물품</p>
    <hr>
    <table class="table">
      <tbody>
      <tr>
        <th scope="row">선택 1</th>
        <td>거울</td>
        <td>높이 50cm 이상</td>
        <td>3,000원</td>
        <td>1개</td>
        <td>
          <button class="selectBtn"><img src="../../../resources/assets/img/reservation/X.png"></button>
        </td>
      </tr>
      </tbody>
    </table>
  </div>
  <div id="submit_btn_box">
    <button class="btn btn-success" id="submitBtn" type="button">신청하기</button>
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
<script src="../../../resources/assets/vendor/aos/aos.js"></script>
<script src="../../../resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../../resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="../../../resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="../../../resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="../../../resources/assets/vendor/waypoints/noframework.waypoints.js"></script>
<script src="../../../resources/assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="../../../resources/assets/js/main.js"></script>

<!-- 채널톡 api -->
<script>
  (function () { var w = window; if (w.ChannelIO) { return w.console.error("ChannelIO script included twice."); } var ch = function () { ch.c(arguments); }; ch.q = []; ch.c = function (args) { ch.q.push(args); }; w.ChannelIO = ch; function l() { if (w.ChannelIOInitialized) { return; } w.ChannelIOInitialized = true; var s = document.createElement("script"); s.type = "text/javascript"; s.async = true; s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js"; var x = document.getElementsByTagName("script")[0]; if (x.parentNode) { x.parentNode.insertBefore(s, x); } } if (document.readyState === "complete") { l(); } else { w.addEventListener("DOMContentLoaded", l); w.addEventListener("load", l); } })();

  ChannelIO('boot', {
    "pluginKey": "3e438b51-7087-4b0c-b50f-c1cb50c8f770"
  });

  // document.getElementById('minus').addEventListener("click" , (e)=> {
  //   let inputNumber = document.querySelector("#numberInput");
  //   inputNumber.val-1;
  // });
  function count(type) {
    const result = document.querySelector("#numberInput");
    let i = parseInt(result.value);

    if (type === 'plus' && i < 10) {
      i++;
      result.value = i;
      console.log(i);
    } else if (type === 'minus' && i > 0) {
      i--;
      result.value = i;
      console.log(i);
    }

  }

</script>

<script type="text/javascript">
  // 버튼 선택 시 리스트 출력
  function wasteSelect(button) {

    let selectItem = button.value;
    console.log("선택된 값: " + selectItem);

    let encodedItem = encodeURIComponent(selectItem);
    let url = "/reservation/selectItem.do?" + encodedItem;

    $.ajax({
      url: url,
      data: {selectItem: selectItem},
      type: "GET",
      success: function (data) {
        // for (var i = 0; i < data.length; i++) {
        //   var item = data[i];
        //   console.log(item);
        //   console.log("wasteCategoryName: " + item.wasteType.wasteTypeName);
        //   console.log("wasteInfoStandard: " + item.wasteInfo.wasteInfoStandard);
        //   console.log("wasteInfoFee: " + item.wasteInfo.wasteInfoFee);
        //   // 추가로 데이터를 화면에 표시하거나 원하는 동작 수행
        // }

        // 이전 테이블을 삭제 (만약 이미 테이블이 있는 경우)
        var tableBody = document.getElementById('listTable');
        while (tableBody.firstChild) {
          tableBody.removeChild(tableBody.firstChild);
        }

        var groupedData = {}; // wasteType를 기준으로 데이터를 그룹화할 객체

        for (var i = 0; i < data.length; i++) {
          var item = data[i];
          var wasteTypeName = item.wasteType.wasteTypeName;

          if (!groupedData[wasteTypeName]) {
            // 그룹이 존재하지 않는 경우 새로운 그룹을 만들고 초기화
            groupedData[wasteTypeName] = {
              wasteCategoryName: wasteTypeName,
              wasteInfoStandards: [], // wasteInfoStandard 값을 저장할 배열
              wasteInfoFees: [] // wasteInfoFee 값을 저장할 배열
            };
          }

          // 데이터를 해당 그룹에 추가
          groupedData[wasteTypeName].wasteInfoStandards.push(item.wasteInfo.wasteInfoStandard);
          groupedData[wasteTypeName].wasteInfoFees.push(item.wasteInfo.wasteInfoFee);
        }

// 테이블을 생성하고 그룹화된 데이터를 사용하여 행을 추가
        var tableBody = document.getElementById('listTable');

        for (var wasteTypeName in groupedData) {
          var item = groupedData[wasteTypeName];
          var row = document.createElement('tr');

          // 첫 번째 열 (wasteTypeName)
          var firstCell = document.createElement('td');
          firstCell.textContent = item.wasteCategoryName;

          // 두 번째 열 (wasteInfoStandards)
          var secondCell = document.createElement('td');
          var selectElement = document.createElement('select');

          // 각 wasteInfoStandard을 option으로 추가
          item.wasteInfoStandards.forEach(function (standard) {
            var option = document.createElement('option');
            option.textContent = standard;
            selectElement.appendChild(option);
          });
          secondCell.appendChild(selectElement);

          // 세 번째 열 (wasteInfoFees)
          var thirdCell = document.createElement('td');
          thirdCell.textContent = item.wasteInfoFees.join(', ');

          // 네 번째 열 (버튼 또는 다른 필드)

          // 행을 테이블에 추가
          row.appendChild(firstCell);
          row.appendChild(secondCell);
          row.appendChild(thirdCell);
          tableBody.appendChild(row);
        }

      }
      })
    }







</script>


</body>

</html>