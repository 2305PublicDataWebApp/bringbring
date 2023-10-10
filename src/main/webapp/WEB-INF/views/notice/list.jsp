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
  <link href="../../assets/vendor/bootstrap/css/bootstrap.notice.css" rel="stylesheet">


  <!-- Template Main CSS File -->
  <link href="../../assets/css/style.css" rel="stylesheet">
  <link href="../../assets/css/common.css" rel="stylesheet">
  <link href="../../assets/css/notice/list.css" rel="stylesheet">

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
      <img src="../../assets/img/main/cargo-truck-green.png" style="width: 46px;padding: 0px 7px 5px 0px;" alt="">
      <h1 class="logo me-auto" style="font-family: 'RixYeoljeongdo_Regular';"><a href="../../index.html">브링브링</a></h1>
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
        <h1>공지사항</h1>
        <div style="width: 100%;height: 30px;"></div>
        <h4 style="color: rgb(189, 245, 229);">브링브링의 업데이트 정보 등 다양한 소식을 알려드립니다.</h4>
      </div>
      <div style="display: flex;flex-direction: row;justify-content: flex-end;">
        <img src="../../assets/img/notice/free-icon-noticeboard-3000428.png" style="width: 250px;" alt="">
      </div>
    </div>

  </section>

  <!-- <div style="width: 100%;height: 1000px;"></div> -->
  <!-- End Hero -->

  <!-- 메인 -->
  <main id="main" class="main">
    <!-- 카테고리 메뉴 -->
    <div class="head">
      <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
        <li class="nav-item" role="presentation">
          <button class="nav-link active" id="pills-all-tab" data-bs-toggle="pill" data-bs-target="#pills-all"
            type="button" role="tab" aria-controls="pills-all" aria-selected="true" value="all">전체</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="pills-service-tab" data-bs-toggle="pill" data-bs-target="#pills-service"
            type="button" role="tab" aria-controls="pills-service" aria-selected="false" value="service">서비스</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="pills-update-tab" data-bs-toggle="pill" data-bs-target="#pills-update"
            type="button" role="tab" aria-controls="pills-update" aria-selected="false" value="update">업데이트</button>
        </li>
      </ul>

      <form class="d-flex" action="./search.html" method="get">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="searchKeyword">
        <button class="btn btn-outline-success" type="submit">검색</button>
      </form>
    </div>

    <!-- 테이블 -->
    <div class="tab-content" id="noticeContent">
      <div class="tab-pane fade show active" id="pills-all" role="tabpanel" aria-labelledby="all-tab">
        <div class="col-lg-12">
          <table class="table table-hover text-center">
            <thead class="table-light">
              <tr>
                <th scope="row">No</th>
                <th scope="row">카테고리</th>
                <th scope="row">지역</th>
                <th scope="row">제목</th>
                <th scope="row">조회수</th>
                <th scope="row">작성일</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row">1</th>
                <td>서비스</td>
                <td>강남구</td>
                <td style="width: 641.15px;">브링브링 서비스 이용약관 개정 공지문</td>
                <td>45</td>
                <td>2023-09-30</td>
              </tr>
              <tr>
                <th scope="row">2</th>
                <td>업데이트</td>
                <td>전체</td>
                <td>브링브링 비정기 업데이트 소식</td>
                <td>68</td>
                <td>2023-09-25</td>
              </tr>
              <tr>
                <th scope="row">3</th>
                <td>서비스</td>
                <td>은평구</td>
                <td>브링브링 서비스 접속 정상화 안내</td>
                <td>4455</td>
                <td>2023-09-25</td>
              </tr>
              <tr>
                <th scope="row">4</th>
                <td>서비스</td>
                <td>성북구</td>
                <td>브링브링 서비스 접근 제한 공지</td>
                <td>564</td>
                <td>2023-09-23</td>
              </tr>
              <tr>
                <th scope="row">5</th>
                <td>서비스</td>
                <td>강남구</td>
                <td>주소 입력 방법 안내</td>
                <td>879</td>
                <td>2023-09-22</td>
              </tr>
              <tr>
                <th scope="row">6</th>
                <td>서비스</td>
                <td>강남구</td>
                <td>결제 수단 일부 서비스 종료 안내</td>
                <td>356</td>
                <td>2023-09-18</td>
              </tr>
              <tr>
                <th scope="row">7</th>
                <td>서비스</td>
                <td>강남구</td>
                <td>브링브링 서비스 공식 지원 환경 변경 사전 안내</td>
                <td>869</td>
                <td>2023-09-14</td>
              </tr>
              <tr>
                <th scope="row">8</th>
                <td>업데이트</td>
                <td>전체</td>
                <td>[중요] 브링브링 V3.7 정기 업데이트 소식</td>
                <td>13</td>
                <td>2023-09-14</td>
              </tr>
              <tr>
                <th scope="row">9</th>
                <td>업데이트</td>
                <td>전체</td>
                <td>[중요]브링브링 일부 기능의 사양 변경 및 종료 안내</td>
                <td>578</td>
                <td>2023-09-08</td>
              </tr>
              <tr>
                <th scope="row">10</th>
                <td>서비스</td>
                <td>강남구</td>
                <td>브링브링 일부 기능 종료 안내</td>
                <td>988</td>
                <td>2023-09-05</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      <div class="tab-pane fade" id="pills-service" role="tabpanel" aria-labelledby="service-tab">
        <div class="col-lg-12">
          <table class="table table-hover text-center">
            <thead  class="table-light">
              <tr>
                <th scope="row">No</th>
                <th scope="row">카테고리</th>
                <th scope="row">지역</th>
                <th scope="row">제목</th>
                <th scope="row">조회수</th>
                <th scope="row">작성일</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row">1</th>
                <td>서비스</td>
                <td>강남구</td>
                <td style="width: 641.15px;">브링브링 서비스 이용약관 개정 공지문</td>
                <td>45</td>
                <td>2023-09-30</td>
              </tr>
              <tr>
                <th scope="row">2</th>
                <td>서비스</td>
                <td>은평구</td>
                <td>서비스제목</td>
                <td>68</td>
                <td>2023-09-25</td>
              </tr>
              <tr>
                <th scope="row">3</th>
                <td>서비스</td>
                <td>은평구</td>
                <td>브링브링 서비스 접속 정상화 안내</td>
                <td>4455</td>
                <td>2023-09-25</td>
              </tr>
              <tr>
                <th scope="row">4</th>
                <td>서비스</td>
                <td>성북구</td>
                <td>브링브링 서비스 접근 제한 공지</td>
                <td>564</td>
                <td>2023-09-23</td>
              </tr>
              <tr>
                <th scope="row">5</th>
                <td>서비스</td>
                <td>강남구</td>
                <td>주소 입력 방법 안내</td>
                <td>879</td>
                <td>2023-09-22</td>
              </tr>
              <tr>
                <th scope="row">6</th>
                <td>서비스</td>
                <td>강남구</td>
                <td>결제 수단 일부 서비스 종료 안내</td>
                <td>356</td>
                <td>2023-09-18</td>
              </tr>
              <tr>
                <th scope="row">7</th>
                <td>서비스</td>
                <td>성북구</td>
                <td>서비스제목</td>
                <td>869</td>
                <td>2023-09-14</td>
              </tr>
              <tr>
                <th scope="row">8</th>
                <td>서비스</td>
                <td>은평구</td>
                <td>은평구 브링브링 서비스 이용 중단 및 안내 사항</td>
                <td>13</td>
                <td>2023-09-14</td>
              </tr>
              <tr>
                <th scope="row">9</th>
                <td>서비스</td>
                <td>강남구</td>
                <td>서비스제목</td>
                <td>578</td>
                <td>2023-09-08</td>
              </tr>
              <tr>
                <th scope="row">10</th>
                <td>서비스</td>
                <td>강남구</td>
                <td>브링브링 일부 기능 종료 안내</td>
                <td>988</td>
                <td>2023-09-05</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      <div class="tab-pane fade" id="pills-update" role="tabpanel" aria-labelledby="update-tab">
        <div class="col-lg-12">
          <table class="table table-hover text-center">
            <thead  class="table-light">
              <tr>
                <th scope="row">No</th>
                <th scope="row">카테고리</th>
                <th scope="row">지역</th>
                <th scope="row">제목</th>
                <th scope="row">조회수</th>
                <th scope="row">작성일</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row">1</th>
                <td>업데이트</td>
                <td>전체</td>
                <td style="width: 641.15px;">[중요]브링브링 일부 기능의 사양 변경 및 종료 안내</td>
                <td>45</td>
                <td>2023-09-30</td>
              </tr>
              <tr>
                <th scope="row">2</th>
                <td>업데이트</td>
                <td>전체</td>
                <td>[중요]브링브링 일부 기능의 사양 변경 및 종료 안내</td>
                <td>68</td>
                <td>2023-09-25</td>
              </tr>
              <tr>
                <th scope="row">3</th>
                <td>업데이트</td>
                <td>전체</td>
                <td>[중요]브링브링 일부 기능의 사양 변경 및 종료 안내</td>
                <td>4455</td>
                <td>2023-09-25</td>
              </tr>
              <tr>
                <th scope="row">4</th>
                <td>업데이트</td>
                <td>전체</td>
                <td>[중요]브링브링 일부 기능의 사양 변경 및 종료 안내</td>
                <td>564</td>
                <td>2023-09-23</td>
              </tr>
              <tr>
                <th scope="row">5</th>
                <td>업데이트</td>
                <td>전체</td>
                <td>[중요]브링브링 일부 기능의 사양 변경 및 종료 안내</td>
                <td>879</td>
                <td>2023-09-22</td>
              </tr>
              <tr>
                <th scope="row">6</th>
                <td>업데이트</td>
                <td>전체</td>
                <td>[중요]브링브링 일부 기능의 사양 변경 및 종료 안내</td>
                <td>356</td>
                <td>2023-09-18</td>
              </tr>
              <tr>
                <th scope="row">7</th>
                <td>업데이트</td>
                <td>전체</td>
                <td>[중요]브링브링 일부 기능의 사양 변경 및 종료 안내</td>
                <td>869</td>
                <td>2023-09-14</td>
              </tr>
              <tr>
                <th scope="row">8</th>
                <td>업데이트</td>
                <td>전체</td>
                <td>[중요]브링브링 일부 기능의 사양 변경 및 종료 안내</td>
                <td>13</td>
                <td>2023-09-14</td>
              </tr>
              <tr>
                <th scope="row">9</th>
                <td>업데이트</td>
                <td>전체</td>
                <td>[중요]브링브링 일부 기능의 사양 변경 및 종료 안내</td>
                <td>578</td>
                <td>2023-09-08</td>
              </tr>
              <tr>
                <th scope="row">10</th>
                <td>업데이트</td>
                <td>전체</td>
                <td>[중요]브링브링 일부 기능의 사양 변경 및 종료 안내</td>
                <td>988</td>
                <td>2023-09-05</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <!-- 글쓰기버튼 관리자만 보임 -->
    <button type="button" class="btn btn-success" onclick="showInsertForm()">글쓰기</button>

    <!-- 페이징 -->
    <nav aria-label="Page navigation example">
      <ul class="pagination">
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
          </a>
        </li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#">4</a></li>
        <li class="page-item"><a class="page-link" href="#">5</a></li>
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
      </ul>
    </nav>
  </main>
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

  </script>
  <!-- 버튼 script -->
  <script>
    function showInsertForm() {
      window.location.href = "./insert.html"
    }
  </script>


</body>

</html>