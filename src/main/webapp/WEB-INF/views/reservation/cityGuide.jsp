<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>수거 지역 안내</title>
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


  <link rel="stylesheet" href="../../../resources/assets/css/reservation/cityGuide.css">
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
      <h1>대형 폐기물 수거 지역 안내</h1>
      <div style="width: 100%;height: 30px;"></div>
      <h4 style="color: rgb(189, 245, 229);">수거 가능한 지역을 알려드립니다</h4>
    </div>
    <div style="display: flex;flex-direction: row;justify-content: flex-end;">
      <img src="../../../resources/assets/img/reservation/cityGuideLine.png" style="width: 250px;" alt="">
    </div>
  </div>

</section>
<div style="width: 100%;">

  <main>
    <div class="container" id="buttonDiv">
      <div class="category_box">
        <button type="button" class="btn btn-outline-success" id="furniture" value="1" onclick="citySelect(this);">서울</button>
        <button type="button" class="btn btn-outline-success" id="electronics" value="2" onclick="citySelect(this);">경기</button>
        <button type="button" class="btn btn-outline-success" id="appliance" value="3" onclick="citySelect(this);">부산</button>
        <button type="button" class="btn btn-outline-success" id="household" value="4" onclick="citySelect(this);">대구</button>
        <button type="button" class="btn btn-outline-success" id="instrument" value="5" onclick="citySelect(this);">인천</button>
        <button type="button" class="btn btn-outline-success" id="digital" value="6" onclick="citySelect(this);">광주</button>
        <button type="button" class="btn btn-outline-success" value="7" onclick="citySelect(this);">대전</button>
        <button type="button" class="btn btn-outline-success" value="8" onclick="citySelect(this);">울산</button>
        <button type="button" class="btn btn-outline-success" value="9" onclick="citySelect(this);">세종</button>

      </div>
      <div class="category_box">
        <button type="button" class="btn btn-outline-success" value="10" onclick="citySelect(this);">강원</button>
        <button type="button" class="btn btn-outline-success" value="11" onclick="citySelect(this);">충북</button>
        <button type="button" class="btn btn-outline-success" value="12" onclick="citySelect(this);">충남</button>
        <button type="button" class="btn btn-outline-success" value="13" onclick="citySelect(this);">전북</button>
        <button type="button" class="btn btn-outline-success" value="14" onclick="citySelect(this);">전남</button>
        <button type="button" class="btn btn-outline-success" value="15" onclick="citySelect(this);">경북</button>
        <button type="button" class="btn btn-outline-success" value="16" onclick="citySelect(this);">경남</button>
        <button type="button" class="btn btn-outline-success" value="17" onclick="citySelect(this);">제주</button>
      </div>
    </div>
    <div>
      <div id="listDiv">
        <table class="table">
          <thead>
          <tr>
            <th id="thead">이용 가능한 지역 정보</th>
          </tr>
          </thead>
          <tbody id="cityTable">
          </tbody>
        </table>
      </div>
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

<!-- 채널톡 api -->
<jsp:include page="/include/chatBot.jsp"></jsp:include>

<script type="text/javascript">
  // 선택한 아이템을 저장할 배열
  let selectedItems = [];

  // 버튼 선택 시 리스트 출력
  function citySelect(button) {

    // 모든 버튼에서 'active' 클래스 제거
    var buttons = document.querySelectorAll('.btn.btn-outline-success');
    buttons.forEach(function(btn) {
      btn.classList.remove('active');
    });

    // 클릭한 버튼에 'active' 클래스 추가
    button.classList.add('active');

    const selectedCity = button.value;

    $.ajax({
      url: "/reservation/cityList.do",
      data: { selectItem: selectedCity },
      type: "GET",
      success: function (data) {

        const cityTable = document.getElementById("cityTable");
        cityTable.innerHTML = ""; // 테이블 내용 초기화

        // 데이터를 for 루프를 사용하여 출력
        for (let i = 0; i < data.length; i++) {
          const city = data[i].regionName;
          const row = cityTable.insertRow();
          const cell = row.insertCell(0);
          cell.textContent = city;
        }
      },
      error: function () {
        // 요청이 실패한 경우 처리할 작업을 정의할 수 있습니다.
      }
    });
    }
</script>

</body>

</html>