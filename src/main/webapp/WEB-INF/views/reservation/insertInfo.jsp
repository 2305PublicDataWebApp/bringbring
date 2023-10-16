<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>정보 입력</title>
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

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
  <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>

  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=043e510b873d1287a23e00d8444a6b47&libraries=services"></script>

<!--  달력-->
<!--  <link rel="stylesheet" href="../../../resources/assets/css/reservation/bootstrap-material-datetimepicker.css" />-->
<!--  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">-->
  <%--  얘 지우면 작동은 되는데 뭔가 이상한 오류가 뜸--%>
  <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<!--  <link rel="stylesheet" href="/css/jquery-ui.min.css">-->
<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>-->
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

<%--  얘 지우면 작동 안됨--%>
  <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
<%--  <script type='text/javascript' src='../../../resources/assets/js/reservation/jquery-1.8.3.js'></script>--%>


<!-- 얘 지우면 오류도 안 나고 작동도 안됨 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
  <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>


<%--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css"/>--%>
<%--  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>--%>



    <!-- 달력 한글로 출력 js 파일-->
  <script src="../../../resources/assets/js/reservation/bootstrap-datepicker.kr.js" charset="UTF-8"></script>



<%--  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepickr/1.9.0/js/bootstrap-datepicker.min.js">--%>

<%--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker3.min.css">--%>

  <link rel="stylesheet" href="../../../resources/assets/css/reservation/inputInfo.css">
  <link rel="stylesheet" href="../../../resources/assets/css/reservation/common.css">
</head>

<body>

<!-- 헤더 -->
<jsp:include page="/include/header.jsp"></jsp:include>

<div style="width: 100%;height: 74px;"></div>
<!-- ======= Hero Section ======= -->
<section id="hero" class="d-flex align-items-center" style="width: 100%;margin: 0 auto;">
  <div style="width: 1300px;margin: 0 auto;">
    <div style="float: left;margin-top: 60px;">
      <h1>신청자 정보 입력</h1>
      <div style="width: 100%;height: 30px;"></div>
      <h4 style="color: rgb(189, 245, 229);">쓰레기 수거를 위해 신청자 정보를 입력해주세요</h4>
    </div>
    <div style="display: flex;flex-direction: row;justify-content: flex-end;">
      <img src="../../../resources/assets/img/reservation/applicationInformation.png" style="width: 250px;" alt="">
    </div>
  </div>

</section>
<div style="width: 100%;height: 1000px;">

<main>
  <h2 class="subject">정보 입력</h2>
  <div>
    <div class="progress-bar out-progress-bar">
      <div class="progress-bar in-progress-bar"></div>
    </div>
  </div>
  <div id="title-flex">
    <p class="title">신청자 정보</p>
    <div>
      <input type="radio" name="infoCheck" onclick="printUserInfo()"> 신청자 정보와 동일
      <input type="radio" name="infoCheck" onclick="printInsertInfo()" checked> 직접 입력
    </div>
  </div>
  <hr>
  <div id="container-out">
    <form name="insertInfoForm" action="/reservation/insertInfo.do" method="post">
      <input type="hidden" id="sessionId" value="${sessionScope.sessionId}">
      <div id="infoContainer">
        <div class="container-in">
          <label>배출 주소</label>
          <div id="address" class="input-div">
            <input type="text" id="sample6_postcode" placeholder="우편번호">
            <input type="button" onclick="sample5_execDaumPostcode();" value="우편번호 찾기"><br>
            <input type="text" id="sample6_address" placeholder="주소" style="width: 400px"><br>
            <input type="text" id="sample6_detailAddress" placeholder="상세주소" style="width: 400px">
<%--            <input type="text" id="sample6_extraAddress" placeholder="참고항목">--%>
          </div>
        </div>
        <div class="container-in">
          <label>물품 배출 위치</label>
          <div class="input-div">
          <div id="map"></div>
            <input type="text" name="rvAddrDetail" placeholder="배출할 장소의 상세 정보를 입력해주세요" style="width: 400px">
          </div>
        </div>
        <div class="container-in">
          <label>배출일</label>
          <div class="input-group date input-div" style="width: 520px">
            <input type="text" name="rvRvDate" class="form-control" id="calenderControll"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
            <label type="button" id="calenderClick" for="calenderControll">
              <img src="../../../resources/assets/img/reservation/calendar.png" id="calender">
            </label>
          </div>
        </div>
        <div class="container-in">
          <label>신청자명</label>
          <div class="input-div">
            <input type="text" id="userName" name="userName" style="width: 400px">
          </div>
        </div>
        <div class="container-in">
          <label>휴대폰</label>
          <div class="input-div">
            <input type="number" id="rvPhone" name="rvPhone" style="width: 400px">
          </div>
        </div>
      </div>
    </form>
  </div>
    <div>
    <p class="title">유의사항</p>
    <hr>
    <ul>
      <li>외부 지정장소에 배출하여 주시면 담당수거기사가 배출번호를 확인 후 수거를 진행하게 됩니다.</li>
      <li>예약 접수량이 많은 경우 방문일정이 지연될 수 있습니다.</li>
      <li>환불 규정은 각 지자체 별 상이할 수 있습니다.</li>
      <li>대형폐기물은 무단투기할 경우, 폐기물 관리법 제 68조에 의거 과태료가 부과됩니다.</li>
    </ul>
  </div>
  <div id="submit_btn_box">
    <button class="btn btn-success" id="submitBtn" type="button">정보 입력</button>
  </div>
</main>
</div><!-- End Hero -->

<!-- 메인 -->
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

<!-- Template Main JS File -->
<script src="../../../resources/assets/js/main.js"></script>

<!--주소 api 사용 script-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 채널톡 api -->
<script>
  (function () { var w = window; if (w.ChannelIO) { return w.console.error("ChannelIO script included twice."); } var ch = function () { ch.c(arguments); }; ch.q = []; ch.c = function (args) { ch.q.push(args); }; w.ChannelIO = ch; function l() { if (w.ChannelIOInitialized) { return; } w.ChannelIOInitialized = true; var s = document.createElement("script"); s.type = "text/javascript"; s.async = true; s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js"; var x = document.getElementsByTagName("script")[0]; if (x.parentNode) { x.parentNode.insertBefore(s, x); } } if (document.readyState === "complete") { l(); } else { w.addEventListener("DOMContentLoaded", l); w.addEventListener("load", l); } })();

  ChannelIO('boot', {
    "pluginKey": "3e438b51-7087-4b0c-b50f-c1cb50c8f770"
  });

  // 지도에 장소 표시할 거~~~~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div
          mapOption = {
            center: new kakao.maps.LatLng(37.566535, 126.9779692), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
          };

  console.log("지도 생성");
  // 지도를 생성합니다
  var map = new kakao.maps.Map(mapContainer, mapOption);

  // 주소-좌표 변환 객체를 생성합니다
  var geocoder = new kakao.maps.services.Geocoder();

  //마커를 미리 생성
  var marker = new daum.maps.Marker({
    // position: new daum.maps.LatLng(37.537187, 127.005476),
    map: map
  });


  function sample5_execDaumPostcode() {
    new daum.Postcode({
      oncomplete: function (data) {
        var addr = data.address; // 최종 주소 변수
        var postCode = data.zonecode;
        // 주소 정보를 해당 필드에 넣는다.
        document.getElementById("sample6_address").value = addr;
        document.getElementById("sample6_postcode").value = postCode;
        // 주소로 상세 정보를 검색
        geocoder.addressSearch(data.address, function (results, status) {
          // 정상적으로 검색이 완료됐으면
          if (status === daum.maps.services.Status.OK) {

            var result = results[0]; //첫번째 결과의 값을 활용

            // 해당 주소에 대한 좌표를 받아서
            var coords = new daum.maps.LatLng(result.y, result.x);
            // 지도를 보여준다.
            mapContainer.style.display = "block";
            map.relayout();
            // 지도 중심을 변경한다.
            map.setCenter(coords);
            // 마커를 결과값으로 받은 위치로 옮긴다.
            marker.setPosition(coords)
          }
        });
      }
    }).open();
  }


</script>


<!--<script src="https://code.jquery.com/jquery-3.2.1.js"></script>-->
<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>-->

<script type="text/javascript">

  // 달력 설정
  $(function(){
    $('.input-group.date').datepicker({
      title : "배출일자 선택",
      calendarWeeks: false,
      todayHighlight: true,
      autoclose: true,
      format: "yyyy-mm-dd",
      language: "kr",
      startDate : '+3d',
      endDate: '+1m',
      daysOfWeekDisabled: [0, 6], //선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
    });
  });

</script>

<script>

  // 주소-좌표 변환 객체를 생성합니다
  var geocoder = new kakao.maps.services.Geocoder();
  // 전역 레벨에서 marker 변수를 선언하고 초기화
  var marker = new daum.maps.Marker({
    map: map
  });

  function printUserInfo() {
    const userId = document.querySelector('#sessionId').value;
    console.log(userId);

    $.ajax({
      url: '/reservation/select/userInfo.do',
      data: {userId: userId},
      type: 'post',
      success: function (data) {
        document.getElementById('sample6_postcode').value = data.userPostCode;
        document.getElementById('sample6_address').value = data.userAddress;
        document.getElementById('sample6_detailAddress').value = data.userAddressDetail;
        document.getElementById('userName').value = data.userName;
        document.getElementById('rvPhone').value = data.userPhone;

        geocoder.addressSearch(data.userAddress, function (results, status) {
          // 정상적으로 검색이 완료됐으면
          if (status === daum.maps.services.Status.OK) {
            var result = results[0]; // 첫번째 결과의 값을 활용

            // 해당 주소에 대한 좌표를 받아서
            var coords = new daum.maps.LatLng(result.y, result.x);

            // 지도를 보여준다.
            mapContainer.style.display = "block";
            map.relayout();

            // 지도 중심을 변경한다.
            map.setCenter(coords);

            // 마커를 결과값으로 받은 위치로 옮긴다.
            marker.setPosition(coords);
          }
        })
      },
      error: function () {
        alert("Ajax 오류! 관리자에게 문의하세요");
      }
    })
  }

  function printInsertInfo() {
    document.getElementById('sample6_postcode').value = '';
    document.getElementById('sample6_address').value = '';
    document.getElementById('sample6_detailAddress').value = '';
    document.getElementById('userName').value = '';
    document.getElementById('rvPhone').value = '';

    marker.setMap(null);
    // 새로운 마커 생성
    marker = new daum.maps.Marker({
      map: map
    });
  }



</script>

</body>

</html>