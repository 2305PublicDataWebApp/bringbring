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
  <link href="../assets/img/main/title-icon.png" rel="icon">
  <link href="../assets/img/main/title-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
    rel="stylesheet">

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
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- include summernote css/js -->
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
  integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
  crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
  <script src="../assets/js/summernote/summernote-lite.js"></script>
  <script src="../assets/js/summernote/lang/summernote-ko-KR.js"></script>
  <style>
    main ul li{
      list-style: none;
      display: flex; 
      align-items: center;
      padding: 15px;
      
    }
    main .divide-insert-menu label{
      width: 150px;
      text-align: center;
    }
    main .divide-insert-menu input[type="text"]{
      width: 600px;
      height: 35px;
      /* font-size: 13px; */
      border: 1px solid rgba(133, 133, 133, 0.5);
      border-radius: 3px;
    }
    select{
      border: 1px solid rgba(133, 133, 133, 0.5);
      border-radius: 3px;
    }
    #file::-webkit-file-upload-button {
      margin-right: 8px;
    }
    main select{
      height: 35px;
    }
    /* 썸머노트 css*/
    .note-icon-caret:before {
        width: 7px;
    }
    .dropdown-toggle::after {
        border: 0px;
    }
  </style>
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top ">
    <div class="container d-flex align-items-center">
      <img src="../assets/img/main/title-icon.png" style="width: 26px;border-radius: 3px;margin: 0px 5px 4px 0px;" alt="">
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
    
  <main style="width: 100%;margin: 0 auto;padding-top: 50px;">
    <!-- 글쓰기 텍스트 영역 -->
    <div style="margin: 0 auto;text-align: center;margin: 30px 0px 70px 0px;">
      <h2>문의 글 작성</h2>
    </div>
    <div style="width: 1000px; margin: 0 auto; border: 2px solid #ccc;padding: 20px 0px;">
      <div style="margin: 0 auto;width: 800px;">
        <ul class="divide-insert-menu" style="padding: 0px;">
          <li>
            <label for="title">제목</label>
            <input type="text" id="title">
          </li>
          <li class="file-li" style="padding-bottom: 10px;">
            <label for="image">사진</label>
            <i style="font-size: 20px;width: 30px;" class="bi bi-plus-circle-fill" id="addFileInput"></i>
            <input style="font-size: 15px;border: 1px solid rgba(133, 133, 133, 0.5);width: 570px;border-radius: 3px;" class="form-control" type="file" id="image">
            <!-- <input style="font-size: 15px;" type="file" id="image"> -->
          </li>
          <li>
            <label for="region">지역</label>
            <select name="" id="region" style="width: 60px;margin-right: 15px;">
              <option value="seoul">서울</option>
              <option value="seoul">경기</option>
              <option value="seoul">경상</option>
              <option value="seoul">충청</option>
              <option value="seoul">강원</option>
              <option value="seoul">전라</option>
            </select>
            <select name="" id="" style="width: 100px;margin-right: 15px;">
              <option value="seoul">서울</option>
              <option value="seoul">경기</option>
              <option value="seoul">경상</option>
              <option value="seoul">충청</option>
              <option value="seoul">강원</option>
              <option value="seoul">전라</option>
            </select>
            <input type="text" placeholder="상세주소를 입력해주세요(선택)" style="width: 409px;">
          </li>
          <li>
            <label for="type">종류</label>
            <select name="" id="type" style="width: 600px;margin-right: 15px;">
              <option value="seoul">허위 나눔을 홍보하는 게시글입니다.</option>
              <option value="seoul">욕설, 비방 등 불쾌감을 주는 단어가 포함되어 있습니다.</option>
            </select>
          </li>
          <li>
            <label for="summernote">내용</label>
            <div id="" class="d-flex justify-content-center flex-column" style="width: 600px;">
              <textarea id="summernote" spellcheck="false" required></textarea>
            </div>
          </li>
        </ul>
      </div>
    </div>
    <div style="margin: 0 auto;text-align: center;margin-top: 100px;">
      <button type="button" class="btn btn-success btn-lg">글 작성 완료</button>
    </div>
  </main>
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

    $(document).ready(function () {
        // "플러스" 아이콘 클릭 이벤트 처리
        $('#addFileInput').click(function () {
            // 새로운 input 요소 생성
            var newInput = '<li style="margin: 0px 0px 10px 195px; padding: 0;"><input class="form-control" style="font-size: 15px;border: 1px solid rgba(133, 133, 133, 0.5);width: 570px;border-radius: 3px;" type="file"></li>';
            // 새로운 input 요소를 다음 li로 추가
            $(this).parent().after(newInput);
        });
    });

    // 썸머노트
        $(document).ready(function() {  
            //여기 아래 부분
            $('#summernote').summernote({
                height: 300,                 // 에디터 높이
                minHeight: '300px',             // 최소 높이
                maxHeight: '400px',             // 최대 높이
                focus: false,                // 에디터 로딩후 포커스를 맞출지 여부
                lang: "ko-KR",				// 한글 설정
                placeholder: '나눔 물품에 대한 설명이나 추가적인 정보를 적어주세요~.',	//placeholder 설정
                toolbar: [
                    ['fontname', ['fontname']],
                    ['fontsize', ['fontsize']],
                    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                    ['color', ['forecolor','color']],
                    ['table', ['table']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['height', ['height']],
                    ['insert',['link']],
                    ['view', ['fullscreen', 'help']]
                ],
                fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
                fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
            });
        });
        
        // 이미지 업로드 미리보기
        // function setThumbnail(event){
        //     for(const image of event.target.files){
        //         const reader = new FileReader();
        //         reader.onload = function(event){
        //           const img = document.getElementById("imagePreview");
        //           img.src = event.target.result;
        //         }
        //         reader.readAsDataURL(image);
        //     }
        // }   

        function removeAfterPseudoElement() {
            // 선택한 요소의 가상 요소를 가져옵니다.
            var afterPseudoElement = document.querySelector('.dropdown-toggle::after');
            
            // 가상 요소를 제거합니다.
            if (afterPseudoElement) {
                afterPseudoElement.remove();
            }
        }

        // 페이지가 로드될 때 위의 함수를 실행
        document.addEventListener('DOMContentLoaded', removeAfterPseudoElement);
  </script>
  
  
</body>

</html>