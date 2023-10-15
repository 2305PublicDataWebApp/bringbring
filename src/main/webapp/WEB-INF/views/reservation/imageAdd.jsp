<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>대형 폐기물 사진 추가</title>
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

  
  <link rel="stylesheet" href="../../../resources/assets/css/reservation/imageAdd.css">
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
      <h1>대형 폐기물 사진 추가</h1>
      <div style="width: 100%;height: 30px;"></div>
      <h4 style="color: rgb(189, 245, 229);">폐기물 사진을 추가해주세요</h4>
    </div>
    <div style="display: flex;flex-direction: row;justify-content: flex-end;">
      <img class="addImg" src="../../../resources/assets/img/reservation/picture.png" style="width: 250px;" alt="">
    </div>
  </div>

</section>
<div style="width: 100%;height: 1000px;">

<main>
  <h2 class="subject">대형 폐기물 사진 추가</h2>
  <div>
    <div class="progress-bar out-progress-bar">
      <div class="progress-bar in-progress-bar"></div>
    </div>
  </div>
  <p class="title">선택할 물품 사진 추가</p>
  <hr>
  <div>
    <table class="table">
      <tbody>
      <c:forEach items="${wasteDataList}" var="item" varStatus="i">
        <tr>
          <th scope="row">선택 ${i.index + 1}</th>
          <td>${item.wasteType.wasteTypeName}</td>
          <td>${item.wasteInfo.wasteInfoStandard}</td>
          <td>${item.wasteInfo.wasteInfoFee}원</td>
          <input type="hidden" class="wasteInfoNo" name="wasteInfoNo" value="${item.wasteInfo.wasteInfoNo}"></input>
<%--          <td>1개</td>--%>
<%--          <td>--%>
<%--            <button class="selectBtn"><img src="../../../resources/assets/img/reservation/X.png"></button>--%>
<%--          </td>--%>
        </tr>
        <tr class="pic-tr">
          <td style="width: 12%">
            <div class="file-Add-Td">
              <div class="file-Add-Div">
                <div class="pic-Add-Btn">
                  <img src="../../../resources/assets/img/reservation/pic-add.png">
                </div>
                <input type="file" id="uploadImg" class="uploadImg" accept="image/*" required multiple style="display: none;">
                <div class="pic-Add-Btn">
                  <button class="btn btn-outline-success pic-Add-Btn" onclick="document.getElementById('uploadImg').click()">사진 추가</button>
                </div>
              </div>
            </div>
          </td>
          <td colspan="5">
            <ul class="img-preview">
            </ul>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
  <div id="submit_btn_box">
    <button class="btn btn-success" id="submitBtn" type="button">사진 추가하기</button>
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

  const imgCount = new Map();
  const imgUploads = document.querySelectorAll('.uploadImg');

  function handlerInputChange(e) {
    const tr = e.target.closest('tr');

    imgCount.set(tr, 0);

    if (!imgCount.has(tr)) {
      imgCount.set(tr, 0);
    }

    imgCount.set(tr, imgCount.get(tr) + 1);

    console.log('뭔데?????' + imgCount.get(tr));

    if (imgCount.get(tr) > 2) {
      alert('이미지는 물품당 2개까지 첨부할 수 있습니다.');
      e.target.value = '';
      imgCount.set(tr, 2);
    }
  }

  imgUploads.forEach((input) => {
    input.addEventListener('change', function (e) {
      handlerInputChange(e);
    });
  });

  // 파일 업로드 버튼과 관련된 "사진 추가" 버튼들을 선택합니다.
  const uploadBtns = document.querySelectorAll('.pic-Add-Btn');
  uploadBtns.forEach((upload) => {
    const relatedUpload = upload.previousElementSibling;
    console.log("relatedUpload: ", relatedUpload);

    if (relatedUpload) {
      upload.addEventListener('click', () => relatedUpload.click());
    }
  });

  const rows = document.querySelectorAll('.pic-tr');

  rows.forEach((row) => {
    const uploadImg = row.querySelector('.uploadImg');
    const uploadBtn = row.querySelector('.pic-Add-Btn');
    const preview = row.querySelector('.img-preview');

    uploadBtn.addEventListener('click', () => uploadImg.click());
    uploadImg.addEventListener('change', (e) => getImgs(e, preview));
  });

  function getImgs(e, preview) {
    const uploadFiles = [];
    const files = e.currentTarget.files;
    const imgPreview = e.target.closest('tr').querySelector('.img-preview');
    const docFrag = new DocumentFragment();

    // 파일 갯수 검사
    if (imgPreview.children.length + e.currentTarget.files.length > 2) {
      alert('이미지는 물품당 2개까지 첨부할 수 있습니다.');
      e.target.value = '';
      return;
    }

    // 이미지 파일만 처리
    const imageFiles = Array.from(e.currentTarget.files).filter(file => file.type.match("image/.*"));
    for (const imageFile of imageFiles) {
      const reader = new FileReader();
      reader.onload = (e) => {
        const preview = createElement(e, imageFile);
        imgPreview.appendChild(preview);
      };
      reader.readAsDataURL(imageFile);
    }

    // 이미지를 추가한 후 현재 파일 목록을 업데이트
    e.target.value = ''; // 파일 input 초기화
  }

  function createElement(e, file) {
    let tr = e.target;

    for (let i = 0; i < tr.length; i++) {
      let cellValue = tr[i].innerHTML; // or cells[i].textContent.
      console.log(cellValue);
    }

    const li = document.createElement('li');
    const img = document.createElement('img');
    const outDiv = document.createElement('div');
    const div = document.createElement('div');
    const deleteBtn = document.createElement('button');
    // const deleteBtnImg = document.createElement('img');
    img.setAttribute('src', e.target.result);
    img.setAttribute('data-file', file.name);
    img.setAttribute('class', 'imgFile');
    div.appendChild(img);
    div.setAttribute('class', 'imgDiv');

    outDiv.setAttribute('class', 'outDiv');

    outDiv.appendChild(div);

    deleteBtn.textContent = '삭제하기';
    deleteBtn.className = 'deleteBtn';

    outDiv.appendChild(deleteBtn);
    li.appendChild(outDiv);

    console.log(imgCount);

    deleteBtn.addEventListener('click', (e) => {
      li.remove();
      // 더 많은 처리 작업이 있을 경우 여기에 추가
      // 이미지를 삭제하면 files 배열에서도 해당 파일을 제거
      const tr = e.target.closest('tr');
      if (tr) {
        const input = tr.querySelector('.uploadImg');
        const files = input.files;
        const fileIndex = Array.from(files).findIndex(f => f.name === file.name);

        if (fileIndex !== -1) {
          files.splice(fileIndex, 1);
        }
      }
    });

    return li;

  }
</script>


</body>

</html>