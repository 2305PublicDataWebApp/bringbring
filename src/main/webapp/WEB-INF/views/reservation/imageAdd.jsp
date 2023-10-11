<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      <img src="../../../resources/assets/img/reservation/picture.png" style="width: 250px;" alt="">
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
        <tr>
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

  const imgCount = {};
  const imgUploads = document.querySelectorAll('.uploadImg');


  function handlerInputChange(e) {

    const tr = e.target.closest('tr');

    if (!imgCount[tr]) {
      imgCount[tr] = 0;
    }
    imgCount[tr]++;

    console.log('뭔데?????' + imgCount[tr]);

    if (imgCount[tr] > 2) {
      alert('이미지는 물품당 2개까지 첨부할 수 있습니다.');
      e.target.value = '';
      imgCount[tr] = 2;
    }




  }




  imgUploads.forEach((input) => {
    input.addEventListener('change', handlerInputChange)
  // => {
  //     // const tr = e.target.closest('tr');
  //     const imgPreview = tr.querySelector('.img-preview');
  //
  //     //
  //     // if (!imgCount[tr]) {
  //     //   imgCount[tr] = 0;
  //     // }
  //     // imgCount[tr]++;
  //     //
  //     // if (imgCount[tr] > 2) {
  //     //   alert('이미지는 물품당 2개까지 첨부할 수 있습니다.');
  //     //   input.value = '';
  //     //   imgCount[tr] = 2;
  //     // }
    });

  function getImgs(e) {
    const uploadFiles = [];
    const files = e.currentTarget.files;
    const imgPreview = document.querySelector('.img-preview');
    const docFrag = new DocumentFragment();
    // 파일 갯수 검사
    if([...files].length >= 2 ){
      alert('이미지는 물품당 2개까지 첨부할 수 있습니다.');
      return;
    }

    // 파일 타입 검사
    for (let i = 0; i < [...files].length; i++) {
      if (!files[i].type.match("image/.*")) {
        alert('이미지 파일만 업로드가 가능합니다.');
        return;
      }
    // 파일 처리
    uploadFiles.push(files[i]);
    const reader = new FileReader();
    reader.onload = (e) => {
      const preview = createElement(e, files[i]);
      imgPreview.appendChild(preview);
    };
    reader.readAsDataURL(files[i]);

    }
  }


  // function getValue() {
  //   var table = document.getElementById("myTable");
  //   var cells = table.getElementsByTagName("td");
  //   for (var i = 0; i < cells.length; i++) {
  //     var cellValue = cells[i].innerHTML; // or cells[i].textContent.
  //     console.log(cellValue);
  //   }
  // }



  function createElement(e, file) {
    // const tr = e.target.closest('tr');

    // const tr = findClosestTR(e.target);

    let tr = e.target;

    for (let i = 0; i < tr.length; i++) {
      let cellValue = tr[i].innerHTML; // or cells[i].textContent.
      console.log(cellValue);
    }


    // while (tr && tr.tagName !== 'TR') {
    //   tr = tr.parentElement;
    // }
    // if (tr) {
    //   // tr 엘리먼트를 사용할 수 있음
    //   // ...
    //   console.log("제발 있어라")
    // } else {
    //   console.error("TR 엘리먼트를 찾을 수 없음");
    // }

    // ...




    const li = document.createElement('li');
    const img = document.createElement('img');
    const div = document.createElement('div');
    const deleteBtn = document.createElement('button');
    // const deleteBtnImg = document.createElement('img');
    img.setAttribute('src', e.target.result);
    img.setAttribute('data-file', file.name);
    div.appendChild(img);
    img.style.width='100%';
    img.style.height='100%';
    img.style.borderRadius='10px';

    div.style.border='1px solid #ccc';
    div.style.width='120px';
    div.style.height='120px';
    div.style.borderRadius='10px';
    div.style.marginRight='10px';

    deleteBtn.textContent= '삭제하기';
    deleteBtn.className = 'deleteBtn';
    deleteBtn.style.width="100px";
    deleteBtn.style.height="28px";
    deleteBtn.style.borderRadius="5px";
    deleteBtn.style.border = "1px solid #198754";
    deleteBtn.style.background = "#fff";
    deleteBtn.style.color = "#198754";
// 호버 스타일을 JavaScript로 추가합니다.
    deleteBtn.addEventListener('mouseenter', () => {
      deleteBtn.style.backgroundColor = '#198754'; // 호버 상태일 때의 배경 색상을 설정합니다.
      deleteBtn.style.color = "#fff";
    });

    deleteBtn.addEventListener('mouseleave', () => {
      deleteBtn.style.backgroundColor = '#fff'; // 호버 상태가 해제될 때 원래 배경 색상으로 복원합니다.
      deleteBtn.style.color = "#198754";
    });

    div.appendChild(deleteBtn);
    li.appendChild(div);

    console.log(imgCount);

    deleteBtn.addEventListener('click', () => {
      li.remove();

      let trClicked = e.target;

      while (trClicked && trClicked.tagName !== 'TR') {
        trClicked = trClicked.parentElement;
      }

      if (trClicked) {
        imgCount[trClicked]--; // trClicked 엘리먼트가 존재하면 imgCount[trClicked]를 감소
      }

      console.log('이미지' + imgCount);

      // li.remove();
      //
      // if(tr) {
      //   imgCount[tr]--;
      //   console.log(imgCount);
      // }

    })

    li.style.display="flex";
    li.style.flexDirection = "column";
    li.style.justifyContent = "center";
    li.style.alignItems = "center";
    return li;

  }


  // // 가장 가까운 tr 엘리먼트를 찾는 함수
  // function findClosestTR(element) {
  //   while (element) {
  //     if (element.tagName === "TR") {
  //       return element;
  //     }
  //     element = element.parentElement;
  //   }
  //   return null;
  // }

  // 이미지 버튼 눌렀을 때 파일 첨부 누르는 효과
  const uploadImg = document.querySelector('.uploadImg');
  const upload = document.querySelector('.pic-Add-Btn');



  upload.addEventListener('click', () => uploadImg.click());
  uploadImg.addEventListener('change', getImgs);



</script>


</body>

</html>