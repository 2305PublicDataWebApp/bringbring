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

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <!-- Favicons -->
  <link href="../resources/assets/img/main/icon-title.png" rel="icon">
  <link href="../resources/assets/img/main/icon-title.png" rel="apple-touch-icon">
  
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
  
  <!-- =======================================================
  * Template Name: Arsha
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/arsha-free-bootstrap-html-template-corporate/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  <style>
    @font-face {
        font-family: 'RixInooAriDuriR';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2207-01@1.0/RixInooAriDuriR.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
    }
    @font-face {
      font-family: 'Giants-Bold';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-1@1.1/Giants-Bold.woff2') format('woff2');
      font-weight: 700;
      font-style: normal;
  }
  @font-face {
      font-family: 'TTWanjudaedunsancheB';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/TTWanjudaedunsancheB.woff2') format('woff2');
      font-weight: 700;
      font-style: normal;
  }
  @font-face {
      font-family: 'RixYeoljeongdo_Regular';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2102-01@1.0/RixYeoljeongdo_Regular.woff') format('woff');
      font-weight: normal;
      font-style: normal;
  }
  @font-face {
      font-family: 'SUITE-Regular';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
      font-weight: 400;
      font-style: normal;
  }
  .carousel-control-prev {
    justify-content: left;
  }
  .carousel-control-next {
    justify-content: right;
  }
  </style>
</head>

<body>
  <!-- 헤더 -->
  <jsp:include page="/include/headerMain.jsp"></jsp:include>
  

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">

    <div class="container">
      <div class="row">
        <div class="col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-2 order-lg-1"
          data-aos="fade-up" data-aos-delay="200">
          <h1 style="font-family: 'LINESeedKR-Bd';color: #B9F3E4;">생활에 편리함을 더하다</h1>
          <h1 style="font-family: 'RixYeoljeongdo_Regular';">브링브링</h1>
          <h2 style="font-family: 'SUITE-Regular';">곤란했던 대형폐기물 처리, 브링브링에서 쉽고 간편하게</h2>
          <div class="d-flex justify-content-center justify-content-lg-start">
            <a href="/reservation/select.do" class="btn-get-started scrollto">수거신청</a>
            <!-- <a href="https://www.youtube.com/watch?v=jDDaplaOz7Q" class="glightbox btn-watch-video"><i class="bi bi-play-circle"></i><span>Watch Video</span></a> -->
          </div>
        </div>
        <div class="col-lg-6 order-1 order-lg-2 hero-img" data-aos="zoom-in" data-aos-delay="200">
          <img src="../resources/assets/img/main/main.png" class="img-fluid animated" alt="">
        </div>
      </div>
    </div>

  </section><!-- End Hero -->

  <!-- 메인 -->
  <main id="main">

    <!--  ======= 박스 아이콘 ======= -->
    <section>
      <div class="icon-boxes position-relative" style="padding-bottom: 0px;">
        <div class="container position-relative bring-menu">
          <div class="row gy-4 mt-5">

            <div class="col-xl-3 col-md-6" data-aos="fade-up" data-aos-delay="100">
              <div class="icon-box">
                <div class="icon"><i class="bi bi-truck"></i></div>
                <h4 class="title"><a href="/reservation/select.do" class="stretched-link">수거 신청</a></h4>
              </div>
            </div><!--End Icon Box -->

            <div class="col-xl-3 col-md-6" data-aos="fade-up" data-aos-delay="200">
              <div class="icon-box">
                <div class="icon"><i class="bi bi-wallet2"></i></div>
                <h4 class="title"><a href="/reservation/guide.do" class="stretched-link">금액 안내</a></h4>
              </div>
            </div><!--End Icon Box -->

            <div class="col-xl-3 col-md-6" data-aos="fade-up" data-aos-delay="300">
              <div class="icon-box">
                <div class="icon"><i class="bi bi-geo-alt"></i></div>
                <h4 class="title"><a href="" class="stretched-link">수거 지역</a></h4>
              </div>
            </div><!--End Icon Box -->

            <div class="col-xl-3 col-md-6" data-aos="fade-up" data-aos-delay="500">
              <div class="icon-box">
                <div class="icon"><i class="bi bi-box2-heart"></i></div>
                <h4 class="title"><a href="" class="stretched-link">나눔</a></h4>
              </div>
            </div><!--End Icon Box -->

          </div>
        </div>
      </div>

    </section>
  <section>
    <!-- 날씨 -->
    <div class="container mt-5" data-aos="fade-up">
      <div class="section-title">
        <h2>날씨 서비스</h2>
        <p>기상청에서 제공하는 날씨로 현재 픽업률을 알려줍니다.</p>
      </div>
      <div id="weatherCarousel" class="carousel carousel-dark slide" data-bs-ride="carousel" >
        <div class="carousel-inner">
          </div>
          <button class="carousel-control-prev " type="button" data-bs-target="#weatherCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">이전</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#weatherCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">다음</span>
          </button>
      </div>
  </div>    
  </section>
    <!-- ======= 책같은 레이아웃 ======= -->
    <section id="about" class="about">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>브링브링은 어떤 사이트 인가요?</h2>
          <p>대형 폐기물 처리 과정 신청 한번으로 간편하게</p>
        </div>

        <div class="row gy-4">
          <div class="col-lg-6" style="margin-bottom: 10px;">
            <h3 style="padding-left: 15px;">브링브링에서 나누세요</h3>
            <!-- <img src="../resources/assets/img/main/2041357502_YnIzcZ4u_1.jpg" class="img-fluid rounded-4 mb-4" alt=""> -->
            <img src="../resources/assets/img/main/9313_3641_4444.jpg" style="box-shadow: 6px 5px 8px rgba(0, 0, 0, 0.2);" class="img-fluid rounded-4 mb-4" alt="">
            <h6 style="padding: 10px 0px;">나눔게시판 나눔 ❤️</h6>
            <p>처리 비용은 부담되고 다른 사람에게 도움을 주고 싶으신가요? <br>상태가 좋다면
              다른 사람에게 나눔하는 것은 어떨까요?<br> 여러분의 작은 나눔으로 
              누군가에게는 사랑을 나눌 수 있고 <br>
              세상이 더 행복해질 수 있습니다.😊
            </p>
          </div>
          <div class="col-lg-6">
            <div class="content ps-0 ps-lg-5" style="padding-top: 3rem;">
              <p class="fst-italic" style="padding-top: 2px">
                복잡한 대형 폐기물 처리 과정을<br>
                웹을 통한 수거 예약 후 픽업하는 방식으로 불필요한 과정 없이<br> 
                개인이 간편하게 이용할 수 있는 사이트입니다.
              </p>
              <ul>
                <li><i class="bi bi-check-circle-fill"></i> 브링브링은 여러분께 항상 질 좋은 서비스를 제공합니다.
                </li>
                <li><i class="bi bi-check-circle-fill"></i> 날씨 정보를 통해 만일의 사태를 대비할 수 있습니다.
                </li>
                <li><i class="bi bi-check-circle-fill"></i> 지역과 대형 폐기물의 정보, 날짜를 선택하여 간편하고
                   빠르게 처리하자! <br>브링브링은 전국구 다양한 지자체와 함께합니다 <br> 지금 바로 신청해보시는 건 어떨까요?</li>
              </ul>
              <!-- <p>
                Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
                voluptate
                velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident
              </p> -->

              <div class="position-relative mt-4">
                <img src="../resources/assets/img/main/pngtree-big-truck-picture-image_1675157.png" style="box-shadow: 4px 6px 8px rgba(0, 0, 0, 0.2);" class="img-fluid rounded-4" alt="">
                <a href="https://www.youtube.com/watch?v=9u1HsDBtYpY" class="glightbox play-btn"></a>
              </div>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End About Us Section -->

    
    <!-- ======= 지자체 리스트 ======= -->
    <section id="clients" class="clients">

      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>함께하는 지자체</h2>
          <div style="width: 1000px;height: 90px;margin: 0 auto;text-align: center;">
            <ul>
              <a href="javascript:void(0);" class="filter-button all"><li>전체</li></a>
              <a href="javascript:void(0);" class="filter-button seoul"><li>서울</li></a>
              <a href="javascript:void(0);" class="filter-button gyeonggi"><li>경기</li></a>
              <a href="javascript:void(0);" class="filter-button incheon"><li>인천</li></a>
              <a href="javascript:void(0);" class="filter-button gangwon"><li>강원</li></a>
              <a href="javascript:void(0);" class="filter-button chungcheong"><li>충청</li></a>
              <a href="javascript:void(0);" class="filter-button gyeongsang"><li>경상</li></a>
              <a href="javascript:void(0);" class="filter-button jeolla"><li>전라</li></a>
              <a href="javascript:void(0);" class="filter-button busan"><li>부산</li></a>
            </ul>
          </div>
        </div>
        <div>
        <div class="clients-slider swiper">
          <div class="swiper-wrapper align-items-center">
            <!-- 서울 -->
            <div class="swiper-slide seoul"><img src="/resources/assets/img/localGovernments/seoul1.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide seoul"><img src="/resources/assets/img/localGovernments/seoul2.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide seoul"><img src="/resources/assets/img/localGovernments/seoul3.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide seoul"><img src="/resources/assets/img/localGovernments/seoul4_20230316.jpg" class="img-fluid" alt=""></div>
            <!-- 경기 -->
            <div class="swiper-slide gyeonggi"><img src="/resources/assets/img/localGovernments/kg1.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeonggi"><img src="/resources/assets/img/localGovernments/kg2.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeonggi"><img src="/resources/assets/img/localGovernments/kg3.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeonggi"><img src="/resources/assets/img/localGovernments/kg4.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeonggi"><img src="/resources/assets/img/localGovernments/kg5.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeonggi"><img src="/resources/assets/img/localGovernments/kg6.jpg" class="img-fluid" alt=""></div>
            <!-- 인천 -->
            <div class="swiper-slide incheon"><img src="/resources/assets/img/localGovernments/incheon1_20230316.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide incheon"><img src="/resources/assets/img/localGovernments/incheon3.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide incheon"><img src="/resources/assets/img/localGovernments/incheon4.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide incheon"><img src="/resources/assets/img/localGovernments/incheon5.jpg" class="img-fluid" alt=""></div>
            <!-- 충청 -->
            <div class="swiper-slide chungcheong"><img src="/resources/assets/img/localGovernments/cc1.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide chungcheong"><img src="/resources/assets/img/localGovernments/cc2.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide chungcheong"><img src="/resources/assets/img/localGovernments/cc3.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide chungcheong"><img src="/resources/assets/img/localGovernments/대전시 서구.jpg" class="img-fluid" alt=""></div>
            <!-- 강원 -->
            <div class="swiper-slide gangwon"><img src="/resources/assets/img/localGovernments/kw1.jpg" class="img-fluid" alt=""></div>
            <!-- 경상 -->
            <div class="swiper-slide gyeongsang"><img src="/resources/assets/img/localGovernments/경상 사천시.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeongsang"><img src="/resources/assets/img/localGovernments/경상 밀양시.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeongsang"><img src="/resources/assets/img/localGovernments/경상 울진군.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeongsang"><img src="/resources/assets/img/localGovernments/경상 산청군.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeongsang"><img src="/resources/assets/img/localGovernments/대구 달서구.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeongsang"><img src="/resources/assets/img/localGovernments/대구 동구.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeongsang"><img src="/resources/assets/img/localGovernments/대구 북구.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeongsang"><img src="/resources/assets/img/localGovernments/대구 수성구.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeongsang"><img src="/resources/assets/img/localGovernments/울산 동구.jpg" class="img-fluid" alt=""></div>
            <!-- 전라 -->
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/jeolla1.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/jeolla2.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/jeolla3.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/jeolla4.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/jeolla5.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/jeolla6.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/jeolla7.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/jeolla8.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/광주광역시.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/광주 광산구.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/광주 남구.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/광주 동구.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/광주 북구.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/광주 서구.jpg" class="img-fluid" alt=""></div>
            <!-- 부산 -->
            <div class="swiper-slide busan"><img src="/resources/assets/img/localGovernments/부산광역시.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide busan"><img src="/resources/assets/img/localGovernments/부산 강서구.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide busan"><img src="/resources/assets/img/localGovernments/부산 기장군.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide busan"><img src="/resources/assets/img/localGovernments/부산 연제구.png" class="img-fluid" alt=""></div>
            <div class="swiper-slide busan"><img src="/resources/assets/img/localGovernments/부산 중구.jpg" class="img-fluid" alt=""></div>
            </div>
            <!-- <div class="swiper-pagination"></div> -->
          </div>
        </div>
      </div>
    </section><!-- End Clients Section -->
    <!-- ======= 서비스 ======= -->
    <section id="services" class="services section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>서비스</h2>
          <p>브링브링에서만 할 수 있다!</p>
        </div>

        <div class="row gy-4">
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100">
            <div class="icon-box iconbox-blue">
              <div class="icon">
                <svg width="100" height="100" viewBox="0 0 600 600" xmlns="http://www.w3.org/2000/svg">
                  <path stroke="none" stroke-width="0" fill="#f5f5f5"
                    d="M300,521.0016835830174C376.1290562159157,517.8887921683347,466.0731472004068,529.7835943286574,510.70327084640275,468.03025145048787C554.3714126377745,407.6079735673963,508.03601936045806,328.9844924480964,491.2728898941984,256.3432110539036C474.5976632858925,184.082847569629,479.9380746630129,96.60480741107993,416.23090153303,58.64404602377083C348.86323505073057,18.502131276798302,261.93793281208167,40.57373210992963,193.5410806939664,78.93577620505333C130.42746243093433,114.334589627462,98.30271207620316,179.96522072025542,76.75703585869454,249.04625023123273C51.97151888228291,328.5150500222984,13.704378332031375,421.85034740162234,66.52175969318436,486.19268352777647C119.04800174914682,550.1803526380478,217.28368757567262,524.383925680826,300,521.0016835830174">
                  </path>
                </svg>
                <i class="bi bi-truck"></i>
              </div>
              <h4><a href="">배송 예약 서비스</a></h4>
              <p>배송 예약으로 간편하게 곤란한 대형폐기물 처리하기!</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="200">
            <div class="icon-box iconbox-orange ">
              <div class="icon">
                <svg width="100" height="100" viewBox="0 0 600 600" xmlns="http://www.w3.org/2000/svg">
                  <path stroke="none" stroke-width="0" fill="#f5f5f5"
                    d="M300,532.3542879108572C369.38199826031484,532.3153073249985,429.10787420159085,491.63046689027357,474.5244479745417,439.17860296908856C522.8885846962883,383.3225815378663,569.1668002868075,314.3205725914397,550.7432151929288,242.7694973846089C532.6665558377875,172.5657663291529,456.2379748765914,142.6223662098291,390.3689995646985,112.34683881706744C326.66090330228417,83.06452184765237,258.84405631176094,53.51806209861945,193.32584062364296,78.48882559362697C121.61183558270385,105.82097193414197,62.805066853699245,167.19869350419734,48.57481801355237,242.6138429142374C34.843463184063346,315.3850353017275,76.69343916112496,383.4422959591041,125.22947124332185,439.3748458443577C170.7312796277747,491.8107796887764,230.57421082200815,532.3932930995766,300,532.3542879108572">
                  </path>
                </svg>
                <i class="bi bi-brightness-high"></i>
              </div>
              <h4><a href="">날씨 안내 서비스</a></h4>
              <p>날씨를 미리 안내하여 픽업에 유의사항이 발생하거나<br>만일의 상황을 방지할 수 있습니다!</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="300">
            <div class="icon-box iconbox-pink">
              <div class="icon">
                <svg width="100" height="100" viewBox="0 0 600 600" xmlns="http://www.w3.org/2000/svg">
                  <path stroke="none" stroke-width="0" fill="#f5f5f5"
                    d="M300,541.5067337569781C382.14930387511276,545.0595476570109,479.8736841581634,548.3450877840088,526.4010558755058,480.5488172755941C571.5218469581645,414.80211281144784,517.5187510058486,332.0715597781072,496.52539010469104,255.14436215662573C477.37192572678356,184.95920475031193,473.57363656557914,105.61284051026155,413.0603344069578,65.22779650032875C343.27470386102294,18.654635553484475,251.2091493199835,5.337323636656869,175.0934190732945,40.62881213300186C97.87086631185822,76.43348514350839,51.98124368387456,156.15599469081315,36.44837278890362,239.84606092416172C21.716077023791087,319.22268207091537,43.775223500013084,401.1760424656574,96.891909868211,461.97329694683043C147.22146801428983,519.5804099606455,223.5754009179313,538.201503339737,300,541.5067337569781">
                  </path>
                </svg>
                <i class="bi bi-chat-heart"></i>
              </div>
              <h4><a href="">물품 나눔의 채팅</a></h4>
              <p>버리긴 아깝고 누군가에게 도움이 될 수 있는 물품은<br>마음을 나누어보세요!</p>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Services Section -->
    <!-- ======= 나무 cta  ======= -->
    <section id="cta" class="cta">
      <div class="container" data-aos="zoom-in">

        <div class="row">
          <div class="col-lg-9 text-center text-lg-start">
            <h3>더 많은 정보가 궁금하다면?</h3>
            <p> 카테고리, 무게별 더 많은 정보를 확인해보세요</p>
          </div>
          <div class="col-lg-3 cta-btn-container text-center">
            <a class="cta-btn align-middle" href="#">상세정보</a>
          </div>
        </div>

      </div>
    </section><!-- End Cta Section -->

    <!-- ======= 이것도 FAQ처럼 활용 ======= -->
    <section id="why-us" class="why-us section-bg">
      <div class="container-fluid" data-aos="fade-up">
        <div class="section-title">
          <h2>FAQ</h2>
          <p>자주 묻는 질문</p>
        </div>
        <div class="row">

          <div class="col-lg-7 d-flex flex-column justify-content-center align-items-stretch  order-2 order-lg-1">

            <div class="content">
              <h3 style="color: #17594A;">BEST 질문 Top 3</h3>
              <p><br>
                브링브링을 이용하시는 고객님들이 자주 궁금해하시는 점에 대해 정리해봤어요~
                <br> 이 외에도 궁금한 점이 있으시다면 문의글을 작성해주세요! 각 지역 관리자가 빠르게 답변을 도와드립니다.
              </p>
            </div>

            <div class="accordion-list">
              <ul>
                <li>
                  <a data-bs-toggle="collapse" class="collapse" data-bs-target="#accordion-list-1"><span>01</span> 
                    사이트가 왜 이렇게 예쁜가요? <i class="bx bx-chevron-down icon-show"></i><i
                      class="bx bx-chevron-up icon-close"></i></a>
                  <div id="accordion-list-1" class="collapse show" data-bs-parent=".accordion-list">
                    <p>
                      칭찬 항상 감사드립니다 고객님 ^O^! <br>앞으로도 더 좋은 서비스로 찾아뵙는 브링브링이 되도록 노력하겠습니다!
                    </p>
                  </div>
                </li>

                <li>
                  <a data-bs-toggle="collapse" data-bs-target="#accordion-list-2" class="collapsed"><span>02</span>
                    신청을 하고나면 배달기사님이 연락을 주시나요? 처음 신청해봐서요 ㅠㅠ <i class="bx bx-chevron-down icon-show"></i><i
                      class="bx bx-chevron-up icon-close"></i></a>
                  <div id="accordion-list-2" class="collapse" data-bs-parent=".accordion-list">
                    <p>
                      Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet
                      id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est
                      pellentesque elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt
                      dui.
                    </p>
                  </div>
                </li>

                <li>
                  <a data-bs-toggle="collapse" data-bs-target="#accordion-list-3" class="collapsed"><span>03</span>
                    혹시 어플은 없을까요? <i class="bx bx-chevron-down icon-show"></i><i
                      class="bx bx-chevron-up icon-close"></i></a>
                  <div id="accordion-list-3" class="collapse" data-bs-parent=".accordion-list">
                    <p>
                      Eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Faucibus pulvinar
                      elementum integer enim. Sem nulla pharetra diam sit amet nisl suscipit. Rutrum tellus pellentesque
                      eu tincidunt. Lectus urna duis convallis convallis tellus. Urna molestie at elementum eu facilisis
                      sed odio morbi quis
                    </p>
                  </div>
                </li>

              </ul>
            </div>

          </div>

          <div class="col-lg-5 align-items-stretch order-1 order-lg-2 img"
            style='background-image: url("/resources/assets/img/main/13e4612f2a80c.png")' data-aos="zoom-in" data-aos-delay="150">&nbsp;</div>
        </div>

      </div>
    </section><!-- End Why Us Section -->

    <!-- ======= 게이지 바 ======= -->
    <!-- <section id="skills" class="skills">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>게이지 채우는 부분</h2>
          <p>게이지바</p>
        </div>

        <div class="row">
          <div class="col-lg-6 d-flex align-items-center" data-aos="fade-right" data-aos-delay="100">
            <img src="../resources/assets/img/main/skills.png" class="img-fluid" alt="">
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0 content" data-aos="fade-left" data-aos-delay="100">
            <h3>Voluptatem dignissimos provident quasi corporis voluptates</h3>
            <p class="fst-italic">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
              dolore
              magna aliqua.
            </p>

            <div class="skills-content">

              <div class="progress">
                <span class="skill">HTML <i class="val">100%</i></span>
                <div class="progress-bar-wrap">
                  <div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0"
                    aria-valuemax="100"></div>
                </div>
              </div>

              <div class="progress">
                <span class="skill">CSS <i class="val">90%</i></span>
                <div class="progress-bar-wrap">
                  <div class="progress-bar" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">
                  </div>
                </div>
              </div>

              <div class="progress">
                <span class="skill">JavaScript <i class="val">75%</i></span>
                <div class="progress-bar-wrap">
                  <div class="progress-bar" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">
                  </div>
                </div>
              </div>

              <div class="progress">
                <span class="skill">Photoshop <i class="val">55%</i></span>
                <div class="progress-bar-wrap">
                  <div class="progress-bar" role="progressbar" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100">
                  </div>
                </div>
              </div>

            </div>

          </div>
        </div>

      </div>
    </section> -->
    <!-- End Skills Section -->

  </main><!-- End #main -->
	
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

  <!-- Template Main JS File -->
  <script src="../resources/assets/js/main.js"></script>

  <!-- 채널톡 api -->
  <script>
    (function () { var w = window; if (w.ChannelIO) { return w.console.error("ChannelIO script included twice."); } var ch = function () { ch.c(arguments); }; ch.q = []; ch.c = function (args) { ch.q.push(args); }; w.ChannelIO = ch; function l() { if (w.ChannelIOInitialized) { return; } w.ChannelIOInitialized = true; var s = document.createElement("script"); s.type = "text/javascript"; s.async = true; s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js"; var x = document.getElementsByTagName("script")[0]; if (x.parentNode) { x.parentNode.insertBefore(s, x); } } if (document.readyState === "complete") { l(); } else { w.addEventListener("DOMContentLoaded", l); w.addEventListener("load", l); } })();

    ChannelIO('boot', {
      "pluginKey": "3e438b51-7087-4b0c-b50f-c1cb50c8f770"
    });

  </script>
  <script>
    document.querySelector('.filter-button.all').addEventListener('click', function() {
        var sliderWrapper = document.querySelector('.swiper-wrapper');
        sliderWrapper.innerHTML = ''; // 모든 이미지 제거

        // 모든 이미지 추가
        // 예시로 서울, 경기, 인천, 충청, 강원 이미지를 추가합니다. 필요에 따라 수정하세요.
        sliderWrapper.innerHTML = `
        	<div class="swiper-slide seoul"><img src="/resources/assets/img/localGovernments/seoul1.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide seoul"><img src="/resources/assets/img/localGovernments/seoul2.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide seoul"><img src="/resources/assets/img/localGovernments/seoul3.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide seoul"><img src="/resources/assets/img/localGovernments/seoul4_20230316.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeonggi"><img src="/resources/assets/img/localGovernments/kg1.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeonggi"><img src="/resources/assets/img/localGovernments/kg2.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeonggi"><img src="/resources/assets/img/localGovernments/kg3.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeonggi"><img src="/resources/assets/img/localGovernments/kg4.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeonggi"><img src="/resources/assets/img/localGovernments/kg5.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeonggi"><img src="/resources/assets/img/localGovernments/kg6.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide incheon"><img src="/resources/assets/img/localGovernments/incheon1_20230316.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide incheon"><img src="/resources/assets/img/localGovernments/incheon3.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide incheon"><img src="/resources/assets/img/localGovernments/incheon4.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide incheon"><img src="/resources/assets/img/localGovernments/incheon5.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide chungcheong"><img src="/resources/assets/img/localGovernments/cc1.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide chungcheong"><img src="/resources/assets/img/localGovernments/cc2.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide chungcheong"><img src="/resources/assets/img/localGovernments/cc3.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide chungcheong"><img src="/resources/assets/img/localGovernments/대전시 서구.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gangwon"><img src="/resources/assets/img/localGovernments/kw1.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeongsang"><img src="/resources/assets/img/localGovernments/경상 사천시.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeongsang"><img src="/resources/assets/img/localGovernments/경상 밀양시.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeongsang"><img src="/resources/assets/img/localGovernments/경상 울진군.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeongsang"><img src="/resources/assets/img/localGovernments/경상 산청군.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeongsang"><img src="/resources/assets/img/localGovernments/대구 달서구.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeongsang"><img src="/resources/assets/img/localGovernments/대구 동구.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeongsang"><img src="/resources/assets/img/localGovernments/대구 북구.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeongsang"><img src="/resources/assets/img/localGovernments/대구 수성구.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeongsang"><img src="/resources/assets/img/localGovernments/울산 동구.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/jeolla1.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/jeolla2.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/jeolla3.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/jeolla4.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/jeolla5.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/jeolla6.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/jeolla7.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/jeolla8.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/광주광역시.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/광주 광산구.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/광주 남구.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/광주 동구.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/광주 북구.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide jeolla"><img src="/resources/assets/img/localGovernments/광주 서구.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide busan"><img src="/resources/assets/img/localGovernments/부산광역시.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide busan"><img src="/resources/assets/img/localGovernments/부산 강서구.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide busan"><img src="/resources/assets/img/localGovernments/부산 기장군.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide busan"><img src="/resources/assets/img/localGovernments/부산 연제구.png" class="img-fluid" alt=""></div>
            <div class="swiper-slide busan"><img src="/resources/assets/img/localGovernments/부산 중구.jpg" class="img-fluid" alt=""></div>
        `;
    });
    // 서울 버튼 클릭 시
    document.querySelector('.filter-button.seoul').addEventListener('click', function() {
        var sliderWrapper = document.querySelector('.swiper-wrapper');
        sliderWrapper.innerHTML = ''; // 모든 이미지 제거

        // 서울 이미지 추가
        sliderWrapper.innerHTML = `
            <div class="swiper-slide seoul"><img src="../resources/assets/img/localGovernments/seoul1.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide seoul"><img src="../resources/assets/img/localGovernments/seoul2.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide seoul"><img src="../resources/assets/img/localGovernments/seoul3.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide seoul"><img src="../resources/assets/img/localGovernments/seoul4_20230316.jpg" class="img-fluid" alt=""></div>
        `;
    });

    // 경기 버튼 클릭 시
    document.querySelector('.filter-button.gyeonggi').addEventListener('click', function() {
        var sliderWrapper = document.querySelector('.swiper-wrapper');
        sliderWrapper.innerHTML = ''; // 모든 이미지 제거

        // 경기 이미지 추가
        sliderWrapper.innerHTML = `
            <div class="swiper-slide gyeonggi"><img src="../resources/assets/img/localGovernments/kg1.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeonggi"><img src="../resources/assets/img/localGovernments/kg2.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeonggi"><img src="../resources/assets/img/localGovernments/kg3.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeonggi"><img src="../resources/assets/img/localGovernments/kg4.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeonggi"><img src="../resources/assets/img/localGovernments/kg5.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide gyeonggi"><img src="../resources/assets/img/localGovernments/kg6.jpg" class="img-fluid" alt=""></div>
        `;
    });

    // 인천 버튼 클릭 시
    document.querySelector('.filter-button.incheon').addEventListener('click', function() {
        var sliderWrapper = document.querySelector('.swiper-wrapper');
        sliderWrapper.innerHTML = ''; // 모든 이미지 제거

        // 인천 이미지 추가
        sliderWrapper.innerHTML = `
            <div class="swiper-slide incheon"><img src="../resources/assets/img/localGovernments/incheon1_20230316.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide incheon"><img src="../resources/assets/img/localGovernments/incheon3.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide incheon"><img src="../resources/assets/img/localGovernments/incheon4.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide incheon"><img src="../resources/assets/img/localGovernments/incheon5.jpg" class="img-fluid" alt=""></div>
        `;
    });

    // 충청 버튼 클릭 시
    document.querySelector('.filter-button.chungcheong').addEventListener('click', function() {
        var sliderWrapper = document.querySelector('.swiper-wrapper');
        sliderWrapper.innerHTML = ''; // 모든 이미지 제거

        // 충청 이미지 추가
        sliderWrapper.innerHTML = `
            <div class="swiper-slide chungcheong"><img src="../resources/assets/img/localGovernments/cc1.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide chungcheong"><img src="../resources/assets/img/localGovernments/cc2.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide chungcheong"><img src="../resources/assets/img/localGovernments/cc3.jpg" class="img-fluid" alt=""></div>
            <div class="swiper-slide chungcheong"><img src="../resources/assets/img/localGovernments/대전시 서구.jpg" class="img-fluid" alt=""></div>
        `;
    });

    // 강원 버튼 클릭 시
    document.querySelector('.filter-button.gangwon').addEventListener('click', function() {
        var sliderWrapper = document.querySelector('.swiper-wrapper');
        sliderWrapper.innerHTML = ''; // 모든 이미지 제거

        // 강원 이미지 추가
        sliderWrapper.innerHTML = `
          <div class="swiper-slide gangwon"><img src="../resources/assets/img/localGovernments/kw1.jpg" class="img-fluid" alt=""></div>
        `;
    });

    // 경상 버튼 클릭 시
    document.querySelector('.filter-button.gyeongsang').addEventListener('click', function() {
        var sliderWrapper = document.querySelector('.swiper-wrapper');
        sliderWrapper.innerHTML = ''; // 모든 이미지 제거

        // 경상 이미지 추가
        sliderWrapper.innerHTML = `
          <div class="swiper-slide gyeongsang"><img src="../resources/assets/img/localGovernments/경상 사천시.jpg" class="img-fluid" alt=""></div>
          <div class="swiper-slide gyeongsang"><img src="../resources/assets/img/localGovernments/경상 밀양시.jpg" class="img-fluid" alt=""></div>
          <div class="swiper-slide gyeongsang"><img src="../resources/assets/img/localGovernments/경상 울진군.jpg" class="img-fluid" alt=""></div>
          <div class="swiper-slide gyeongsang"><img src="../resources/assets/img/localGovernments/경상 산청군.jpg" class="img-fluid" alt=""></div>
          <div class="swiper-slide gyeongsang"><img src="../resources/assets/img/localGovernments/대구 달서구.jpg" class="img-fluid" alt=""></div>
          <div class="swiper-slide gyeongsang"><img src="../resources/assets/img/localGovernments/대구 동구.jpg" class="img-fluid" alt=""></div>
          <div class="swiper-slide gyeongsang"><img src="../resources/assets/img/localGovernments/대구 북구.jpg" class="img-fluid" alt=""></div>
          <div class="swiper-slide gyeongsang"><img src="../resources/assets/img/localGovernments/대구 수성구.jpg" class="img-fluid" alt=""></div>
          <div class="swiper-slide gyeongsang"><img src="../resources/assets/img/localGovernments/울산 동구.jpg" class="img-fluid" alt=""></div>
        `;
    });

    // 전라 버튼 클릭 시
    document.querySelector('.filter-button.jeolla').addEventListener('click', function() {
        var sliderWrapper = document.querySelector('.swiper-wrapper');
        sliderWrapper.innerHTML = ''; // 모든 이미지 제거

        // 전라 이미지 추가
        sliderWrapper.innerHTML = `
          <div class="swiper-slide jeolla"><img src="../resources/assets/img/localGovernments/jeolla1.jpg" class="img-fluid" alt=""></div>
          <div class="swiper-slide jeolla"><img src="../resources/assets/img/localGovernments/jeolla2.jpg" class="img-fluid" alt=""></div>
          <div class="swiper-slide jeolla"><img src="../resources/assets/img/localGovernments/jeolla3.jpg" class="img-fluid" alt=""></div>
          <div class="swiper-slide jeolla"><img src="../resources/assets/img/localGovernments/jeolla4.jpg" class="img-fluid" alt=""></div>
          <div class="swiper-slide jeolla"><img src="../resources/assets/img/localGovernments/jeolla5.jpg" class="img-fluid" alt=""></div>
          <div class="swiper-slide jeolla"><img src="../resources/assets/img/localGovernments/jeolla6.jpg" class="img-fluid" alt=""></div>
          <div class="swiper-slide jeolla"><img src="../resources/assets/img/localGovernments/jeolla7.jpg" class="img-fluid" alt=""></div>
          <div class="swiper-slide jeolla"><img src="../resources/assets/img/localGovernments/jeolla8.jpg" class="img-fluid" alt=""></div>
          <div class="swiper-slide jeolla"><img src="../resources/assets/img/localGovernments/광주광역시.jpg" class="img-fluid" alt=""></div>
          <div class="swiper-slide jeolla"><img src="../resources/assets/img/localGovernments/광주 광산구.jpg" class="img-fluid" alt=""></div>
          <div class="swiper-slide jeolla"><img src="../resources/assets/img/localGovernments/광주 남구.jpg" class="img-fluid" alt=""></div>
          <div class="swiper-slide jeolla"><img src="../resources/assets/img/localGovernments/광주 동구.jpg" class="img-fluid" alt=""></div>
          <div class="swiper-slide jeolla"><img src="../resources/assets/img/localGovernments/광주 북구.jpg" class="img-fluid" alt=""></div>
          <div class="swiper-slide jeolla"><img src="../resources/assets/img/localGovernments/광주 서구.jpg" class="img-fluid" alt=""></div>
        `;
    });

    // 부산 버튼 클릭 시
    document.querySelector('.filter-button.busan').addEventListener('click', function() {
        var sliderWrapper = document.querySelector('.swiper-wrapper');
        sliderWrapper.innerHTML = ''; // 모든 이미지 제거

        // 부산 이미지 추가
        sliderWrapper.innerHTML = `
          <div class="swiper-slide busan"><img src="../resources/assets/img/localGovernments/부산광역시.jpg" class="img-fluid" alt=""></div>
          <div class="swiper-slide busan"><img src="../resources/assets/img/localGovernments/부산 강서구.jpg" class="img-fluid" alt=""></div>
          <div class="swiper-slide busan"><img src="../resources/assets/img/localGovernments/부산 기장군.jpg" class="img-fluid" alt=""></div>
          <div class="swiper-slide busan"><img src="../resources/assets/img/localGovernments/부산 연제구.png" class="img-fluid" alt=""></div>
          <div class="swiper-slide busan"><img src="../resources/assets/img/localGovernments/부산 중구.jpg" class="img-fluid" alt=""></div>
        `;
    });
    
   
    <!-- 로그인, 로그아웃 -->
//     <jsp:include page="/include/loginJs.jsp"></jsp:include>

    $(document).ready(function() {
      var today = new Date();
      var year = today.getFullYear();
      var month = (today.getMonth() + 1).toString().padStart(2, '0');
      var day = today.getDate().toString().padStart(2, '0');
      var hours = today.getHours()

      var baseTime;
      if (hours >= 23 || hours < 2) {
        baseTime = "0200";
      } else if (hours < 5) {
        baseTime = "0500";
      } else if (hours < 8) {
        baseTime = "0800";
      } else if (hours < 11) {
        baseTime = "1100";
      } else if (hours < 14) {
        baseTime = "1400";
      } else if (hours < 17) {
        baseTime = "1700";
      } else if (hours < 20) {
        baseTime = "2000";
      } else {
        baseTime = "2300";
      }

      var korea = [
        {'region' : '서울','nx' : 60,'ny' : 127},
        {'region' : '인천','nx' : 55,'ny' : 124},
        {'region' : '경기','nx' : 60,'ny' : 121},
        {'region' : '강원','nx' : 92,'ny' : 131},
        {'region' : '충북','nx' : 69,'ny' : 106},
        {'region' : '충남','nx' : 68,'ny' : 100},
        {'region' : '전북','nx' : 63,'ny' : 89},
        {'region' : '전남','nx' : 50,'ny' : 67},
        {'region' : '경남','nx' : 90,'ny' : 77},
        {'region' : '경북','nx' : 91,'ny' : 106},
        {'region' : '부산','nx' : 98,'ny' : 76},
        {'region' : '대구','nx' : 89,'ny' : 90},
        {'region' : '광주','nx' : 58,'ny' : 74},
        {'region' : '대전','nx' : 67,'ny' : 100},
        {'region' : '울산','nx' : 102,'ny' : 84},
        {'region' : '제주','nx' : 52,'ny' : 38}
      ];

      var apikey = "uy3jYbeNo9pdYLz%2FbZXRO%2F3tFw9FcY6FjN1mlzXiPnfDm4yy4z4ceuYU2ValrUULBJVlrX6JBznSjobmLH1A7w%3D%3D";

      function sendRequest(index) {
        if (index >= korea.length) {
          return; // 모든 요청이 완료되면 함수 종료
        }

        var regionInfo = korea[index];
        var regionName = regionInfo.region;
        var nx = regionInfo.nx;
        var ny = regionInfo.ny;

        var ForecastGribURL = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
        ForecastGribURL += "?ServiceKey=" + apikey;
        ForecastGribURL += "&base_date=" + year + month + day;
        ForecastGribURL += "&base_time=" + baseTime   ;
        ForecastGribURL += "&nx=" + nx + "&ny=" + ny;

        $.ajax({
          url: ForecastGribURL,
          type: 'GET',
          success: function(data) {
            var $data = $(data).find("response>body>items>item");
            var temp = '';
            var rainAmount = '';
            var rain = '';
            var skyValue = '';
            var ptyValue = '';
            var rainProbability = '';

            $.each($data, function(i, o) {
              var category = $(o).find("category").text();
              var fcstValue = $(o).find("fcstValue").text();

              if (category === 'TMP') {
                temp = fcstValue;
              } else if (category === 'SKY') { //하늘상태
                skyValue = parseInt(fcstValue);
              } else if (category === 'PTY') { //강수상태
                ptyValue = parseInt(fcstValue);
              } else if (category === 'PCP') {
                rainAmount = fcstValue; // 강수량 (mm)
              } else if (category === 'POP') {
                rainProbability = fcstValue; // 강수확률 (%)
              }
            });

            // SKY 값과 PTY 값을 기반으로 아이콘 클래스 결정
            var iconClass = '';
            if (ptyValue === 0) {
              switch (skyValue) {
                case 1:
                  iconClass = 'bi-sun'; // 맑음
                  break;
                case 2:
                  iconClass = 'bi-cloud-sun'; // 구름조금
                  break;
                case 3:
                  iconClass = 'bi-cloud'; // 구름많음
                  break;
                case 4:
                  iconClass = 'bi-cloudy'; // 흐림
                  break;
                default:
                  iconClass = 'bi-question'; // 알 수 없는 날씨 상태에 대한 기본 아이콘
              }
            } else if (ptyValue === 1 || ptyValue === 2) {
              iconClass = 'bi-cloud-rain'; // 비
            } else if (ptyValue === 3) {
              iconClass = 'bi-snow'; // 눈
            }

            var ment = "";
            var mentIcon = '';
            if (ptyValue === 0 && skyValue !==null) {
              ment = "픽업 가능 ";
              mentIcon = 'bi-truck';
            } else if (ptyValue === 1 || ptyValue === 2) {
              ment = "픽업 지연";
              mentIcon = 'bi-sign-stop';
            } else if (ptyValue === 3) {
              ment = "픽업 지연";
              mentIcon = 'bi-sign-stop';
            }
            console.log(ment);


// 날씨 정보를 캐러셀에 추가하는 로직
            var weatherInfo = '<div class="col-md-2">' +
                    '<div class=icon-box>' +
                    '<div class="icon"><i class="bi ' + iconClass + '"></i></div>' +
                    '<h5 class="text-center"><a href=#>' + regionName + '</a></h5>' +
                    '<p class="text-center">기온: ' + temp + ' ℃</p>' +
                    '<p class="text-center">강수량: ' + rainAmount + ' </p>' +
                    '<p class="text-center">강수확률: ' + rainProbability + ' %</p>' +
                    '<p class="text-center">'+ ment + '</p>' +
                    '<div class="icon"><i class="bi ' + mentIcon + '"></i></div>' +
                    '</div>';

            if (index % 6 === 0) {
              // 첫 번째 아이템일 때 새로운 캐러셀 아이템을 열 때
              var carouselItem = $('<div class="carousel-item" style="position: relative; padding: 20px;"></div>');
              var row = $('<div class="row"></div>');
              row.append(weatherInfo);
              carouselItem.append(row);

              // 첫 번째 아이템일 때 "active" 클래스 추가
              if (index === 0) {
                carouselItem.addClass('active');
              }

              $('#weatherCarousel .carousel-inner').append(carouselItem);
            } else {
              // 나머지 아이템일 때 현재 캐러셀 아이템에 날씨 정보 추가
              $('#weatherCarousel .carousel-inner .carousel-item:last-child .row').append(weatherInfo);
            }

            console.log(index);

              // $('#weatherCarousel .carousel-inner .carousel-item:last-child .row').append(weatherInfo);


            sendRequest(index + 1);
          },
          error: function() {
            console.error("Failed to fetch data for index: " + index);
            // 다음 요청 보내기 (재귀 호출)
            sendRequest(index + 1);
          }
        });
      }

      // 첫 번째 요청 보내기 (재귀 함수 시작)
      sendRequest(0);
    });

  </script>

</body>

</html>