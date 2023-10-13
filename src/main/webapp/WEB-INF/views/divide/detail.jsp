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
  <link href="../resources/assets/img/main/icon-title.png" rel="icon">
  <link href="../resources/assets/img/main/icon-title.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
    rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="../resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="../resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <!-- <link href="../resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet"> -->
  <!-- <link href="../resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet"> -->
  <!-- <link href="../resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet"> -->

  <!-- Template Main CSS File -->
  <link href="../resources/assets/css/style.css" rel="stylesheet">
  <link href="../resources/assets/css/common.css" rel="stylesheet">

  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=043e510b873d1287a23e00d8444a6b47"></script>
  <style>
    .carousel{
      width: 850px;
      height: 550px;
      position: relative;
      margin: 0 auto;
      border-radius: 10px;
      overflow: hidden;
    }
    /* 모달 */
    /* 모달 스타일 */
    .img-modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.7);
        overflow: auto; /* 이미지가 화면을 벗어나면 스크롤 가능하도록 설정 */
    }
    
    .img-modal-content {
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        max-height: 70vh; /* 이미지 높이를 화면 높이의 80%로 제한 */
        max-width: 70%; /* 이미지 최대 너비를 화면 너비의 80%로 제한 */
        width: auto;
        height: auto;
        margin: auto;
        display: block;
    }
    
    .img-close {
        position: absolute;
        top: 15px;
        right: 15px;
        color: #fff;
        font-size: 30px;
        cursor: pointer;
    }
  </style>
</head>

<body>

  <!-- 헤더 -->
  <jsp:include page="/include/header.jsp"></jsp:include>

  <div style="width: 100%;height: 74px;"></div>
    
  <main style="width: 100%;margin: 0 auto;padding-top: 50px;">
    <!-- 캐러셀 영역 -->
    <div id="carouselExampleIndicators" data-aos="fade-up" class="carousel slide" style="margin-bottom: 45px;">
      <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
      </div>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <div style="width: 850px; height: 600px; background-image: url(/resources/assets/img/divide/냄비.webp); background-position: 50% 50%; background-repeat: no-repeat;background-size: cover;">
          </div>
        </div>
        <div class="carousel-item">
          <div style="width: 850px; height: 600px; background-image: url(/resources/assets/img/divide/스팸.webp); background-position: 50% 50%; background-repeat: no-repeat;background-size: cover;">
          </div>
        </div>
        <div class="carousel-item">
          <div style="width: 850px; height: 600px; background-image: url(/resources/assets/img/divide/냄비.webp); background-position: 50% 50%; background-repeat: no-repeat;background-size: cover;">
          </div>
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true" style="background-color: #222;border-radius: 20px;"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true" style="background-color: #222;border-radius: 20px;"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>

    <div style="width: 850px;margin: 0 auto;" data-aos="fade-up">
      <!-- 프로필 영역 -->
      <div style="width: 100%;height: 130px;border-bottom: 2px solid #ccc;border-top: 2px solid #ccc;">
        <div style="float: left;">
          <img style="width: 50px;height: 50px;margin-top: 35px;margin-left: 10px;" src="../../../resources/assets/img/divide/free-icon-user-847969.png" alt="">
        </div>
        <div style="float: left;padding: 35px 15px;">
          <h5>닉네임</h5>
          <p>서울특별시 중구</p>
        </div>
        <div style="display: flex;float: right;height: 100%;flex-direction: column;justify-content: space-evenly;">
          <button type="button" class="btn btn-success">글 수정</button>
          <button data-bs-toggle="modal" data-bs-target="#exampleModal" type="button" class="btn btn-success">글 삭제</button>
        </div>
      </div>
      <!-- 제목 영역 -->
      <div style="width: 100%;border-bottom: 1px solid #ccc;" data-aos="fade-up">
        <div style="padding: 35px 15px;">
          <h3>제목이 들어갈 자리입니다.</h3>
          <p style="margin-bottom: 5px;">카테고리</p>
          <p style="margin: 0px;">2023.10.05</p>
        </div>
      </div>
      <!-- 내용 영역 -->
      <div data-aos="fade-up" style="width: 100%; border-bottom: 2px solid #ccc; display: flex; flex-direction: column; align-items: flex-end;">
        <div style="padding: 35px 15px;">
          <textarea cols="88" rows="15" style="resize: none; border: none; outline: none; width: 100%;">내용이 들어갈 자리입니다.</textarea>
        </div>
        <div style="margin: 0px 10px 7px 0px;">
          <i class="bi bi-chat"></i>
          2 &nbsp;
          <i class="bi bi-heart"></i>
          2
        </div>
      </div>      
      <!-- 거래 희망장소 영역 -->
      <div data-aos="fade-up" style="width: 100%;">
        <div style="padding: 35px 15px;">
          <h3>거래 희망 장소</h3>
          <p style="margin-bottom: 5px;">서울시 중구 남대문로 15</p>
        </div>
      </div>
      <!-- 지도 영역 -->
      <div data-aos="fade-up" id="map" style="width: 100%;height: 300px;border: 1px solid #ccc;"></div>
      <!-- 버튼 영역 -->
      <div data-aos="fade-up" style="margin: 0 auto;text-align: center;margin-top: 100px;">
        <button onclick="openPopup('../chatting/list.html', 600, 1200)" class="btn btn-success btn-lg">1:1 채팅 신청</button>
      </div>
    </div>

  </main>
  <!-- 메인 -->
  <!-- 모달 영역 -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">신고하기</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <select class="form-select" aria-label="Default select example">
            <option selected>신고할 항목을 선택해주세요</option>
            <option value="1">One</option>
            <option value="2">Two</option>
            <option value="3">Three</option>
          </select>
          <textarea name="" id="" cols="30" rows="10" style="width: 100%;resize: none;border: 1px solid #dee2e6;margin-top: 10px;border-radius: 7px;"></textarea>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
          <button type="button" class="btn btn-success">작성 완료</button>
        </div>
      </div>
    </div>
  </div>
  <!-- 모달 창 -->
  <div id="myModal" class="img-modal">
    <span class="img-close">&times;</span>
    <img class="img-modal-content" id="modalImage">
  </div>
<!-- End #main -->

  <!-- 푸터 -->
  <jsp:include page="/include/footer.jsp"></jsp:include>

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

  <!-- jquery -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <!-- Template Main JS File -->
  <script src="../../../resources/assets/js/main.js"></script>

  <!-- 채널톡 api -->
  <script>
    (function () { var w = window; if (w.ChannelIO) { return w.console.error("ChannelIO script included twice."); } var ch = function () { ch.c(arguments); }; ch.q = []; ch.c = function (args) { ch.q.push(args); }; w.ChannelIO = ch; function l() { if (w.ChannelIOInitialized) { return; } w.ChannelIOInitialized = true; var s = document.createElement("script"); s.type = "text/javascript"; s.async = true; s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js"; var x = document.getElementsByTagName("script")[0]; if (x.parentNode) { x.parentNode.insertBefore(s, x); } } if (document.readyState === "complete") { l(); } else { w.addEventListener("DOMContentLoaded", l); w.addEventListener("load", l); } })();

        ChannelIO('boot', {
          "pluginKey": "3e438b51-7087-4b0c-b50f-c1cb50c8f770"
        });

      </script>
      <script>
        var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
    var options = { //지도를 생성할 때 필요한 기본 옵션
      center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
      level: 3 //지도의 레벨(확대, 축소 정도)
    };

    var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

    // 마커가 표시될 위치입니다
    var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667);

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
      position: markerPosition
    })

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
    // marker.setMap(null);

    // 마커를 표시할 위치와 title 객체 배열입니다
    //     var positions = [
    //         {
    //             title: '카카오',
    //             latlng: new kakao.maps.LatLng(33.450705, 126.570677)
    //         },
    //         {
    //             title: '생태연못',
    //             latlng: new kakao.maps.LatLng(33.450936, 126.569477)
    //         },
    //         {
    //             title: '텃밭',
    //             latlng: new kakao.maps.LatLng(33.450879, 126.569940)
    //         },
    //         {
    //             title: '근린공원',
    //             latlng: new kakao.maps.LatLng(33.451393, 126.570738)
    //         }
    //     ];

    // 컨트롤러에서 보낸 데이터를 저장받는 변수

    // 데이터들을 저장할 배열 선언
    var positions = [];

    //   // 100개의 데이터를 추가하는 for 루프
    //   for (var i = 0; i < ${size }; i++) {
    //     var title =  "${title }";
    //     var address =  "${address }";
    //     var lat =  "${lat }";
    //     var lng =  "${lng }";
    //     console.log(${size})
    // //            var title = "데이터 " + (i + 1);
    // //            var lat = Math.random() * 90; // 임의의 위도 생성
    // //            var lng = Math.random() * 180; // 임의의 경도 생성
    //
    //     positions.push({
    //       title: title,
    //       latlng: new kakao.maps.LatLng(lat, lng)
    //     });
    //   }

    //         // 데이터를 저장한 변수를 positions 배열에 담음
    //         var positions = [{
    //          title: title,
    //             latlng: new kakao.maps.LatLng(parseFloat(lat), parseFloat(lng))
    //         }
    //         ]
    console.log(positions);
    // 마커 이미지의 이미지 주소입니다
    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

    for (var i = 0; i < positions.length; i ++) {

      // 마커 이미지의 이미지 크기 입니다
      var imageSize = new kakao.maps.Size(24, 35);

      // 마커 이미지를 생성합니다
      var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

      // 마커를 생성합니다
      var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지
      });
    }


    document.addEventListener('DOMContentLoaded', () => {
        // 이미지 모달 기능
        const carouselItems = document.querySelectorAll('.carousel-item');

        carouselItems.forEach((item, index) => {
            // 각 이미지 div를 클릭하면 모달 열기
            item.addEventListener('click', () => {
                const modal = document.getElementById('myModal');
                const modalImage = document.getElementById('modalImage');
                const closeModal = document.querySelector('.img-close');
                
                modal.style.display = 'block';
                document.querySelector(".carousel-indicators").style.display = "none";
                const backgroundImageStyle = window.getComputedStyle(item.querySelector('div'));
                modalImage.src = backgroundImageStyle.backgroundImage.replace('url("', '').replace('")', '');
            });
        });

        // 모달 닫기
        const closeModal = document.querySelector('.img-close');
        closeModal.addEventListener('click', () => {
            const modal = document.getElementById('myModal');
            modal.style.display = 'none';
            document.querySelector(".carousel-indicators").style.display = "";
        });

        // 모달 외부를 클릭하면 모달 닫기
        window.addEventListener('click', (event) => {
            const modal = document.getElementById('myModal');
            if (event.target == modal) {
                modal.style.display = 'none';
                document.querySelector(".carousel-indicators").style.display = "";
            }
        });
    });
    
    <!-- 로그인, 로그아웃 -->
    <jsp:include page="/include/loginJs.jsp"></jsp:include>
  </script>
</body>

</html>