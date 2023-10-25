<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>정보 수정</title>
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
  <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
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
<div style="width: 100%;">

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
        <input type="hidden" name="userNo" id="sessionNo" value="${userInfo.userNo}">
        <div id="infoContainer">
          <div class="container-in" id="regionArea">
            <%--          <li id="regionArea">--%>
            <label for="cityNo">지역</label>
            <div>
              <select name="cityNo" id="cityNo" onchange="citySelect();" style="width: 100px;margin-right: 15px;">
                <c:forEach var="city" items="${cList}" >
                  <option value="${city.cityNo}">${city.cityName}</option>
                  ${city.cityName} ${city.cityNo}
                </c:forEach>
              </select>
              <select name="districtNo" id="districtNo" style="width: 150px;">
              </select>
            </div>
            <%--          </li>--%>
          </div>
          <div class="container-in">
            <label>배출 주소</label>
            <div id="address" class="input-div">
              <input type="text" id="sample6_postcode" placeholder="우편번호">
              <input type="button" onclick="sample5_execDaumPostcode();" value="우편번호 찾기"><br>
              <input type="text" id="sample6_address" placeholder="주소" value="${infoList.get(0).reservation.rvAddr}" style="width: 400px"><br>
              <input type="text" id="sample6_detailAddress" placeholder="상세주소" style="width: 400px">
              <input type="hidden" name="rvAddr" id="rvAddr">
              <%--            <input type="text" id="sample6_extraAddress" placeholder="참고항목">--%>
            </div>
          </div>
          <div class="container-in">
            <label>물품 배출 위치</label>
            <div class="input-div">
              <div id="map"></div>
              <input type="text" id="rvAddrDetail" name="rvAddrDetail" value="${infoList.get(0).reservation.rvAddrDetail}" placeholder="배출할 장소의 상세 정보를 입력해주세요" style="width: 400px">
            </div>
          </div>
          <div class="container-in">
            <label>배출일</label>
            <div class="input-group date input-div" style="width: 520px">
              <input type="text" name="rvRvDate" class="form-control" id="calenderControll" value="${infoList.get(0).reservation.rvRvDate}" placeholder="배출일을 지정해주세요"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
              <input type="hidden" name="rvRvDate" id="rvRvDate">
              <label type="button" id="calenderClick" for="calenderControll">
                <img src="../../../resources/assets/img/reservation/calendar.png" id="calender">
              </label>
            </div>
          </div>
          <div class="container-in">
            <label>신청자명</label>
            <div class="input-div">
              <input type="text" id="rvName" name="rvName" value="${infoList.get(0).reservation.rvName}" placeholder="신청자의 이름을 입력해주세요" style="width: 400px">
            </div>
          </div>
          <div class="container-in">
            <label>휴대폰</label>
            <div class="input-div">
              <input type="number" id="rvPhone" name="rvPhone" value="${infoList.get(0).reservation.rvPhone} placeholder="연락이 가능한 휴대전화 번호를 입력해주세요" style="width: 400px">
            </div>
          </div>
          <div class="container-in">
            <label>요청사항</label>
            <div class="input-div">
              <input type="text" id="rvRequest" name="rvRequest" value="${infoList.get(0).reservation.rvRequest}" placeholder="요청사항이 있으면 작성해주세요" style="width: 400px">
            </div>
          </div>
        </div>
      </form>
    </div>
    <p class="title">선택할 물품 사진 추가</p>
    <hr>
    <div>
      <form name="uploadForm" id="uploadForm" action="/reservation/addImage.do" method="post" enctype="multipart/form-data">
        <table class="table">
          <tbody>
          <c:forEach items="${infoList}" var="info" varStatus="i">
            <c:forEach items="${info.wasteData}" var="item" varStatus="j">
              <tr>
                <th scope="row">선택 ${i.index + 1}</th>
                <td>${item.wasteType.wasteTypeName}</td>
                <td>${item.wasteInfo.wasteInfoStandard}</td>
                <td>${item.wasteInfo.wasteInfoFee}원</td>
              </tr>
              <tr class="pic-tr">
                <td style="width: 12%">
                  <div class="file-Add-Td">
                    <div class="file-Add-Div list formList" data-list-id="${i.index}">
                      <div class="pic-Add-Btn">
                        <img src="../../../resources/assets/img/reservation/pic-add.png">
                      </div>
                      <input type="file" name="uploadFiles" class="uploadImg" accept="image/*" required multiple style="display: none;">
                      <input type="hidden" class="wasteInfoNo" name="wasteInfoNo" value="${item.wasteInfo.wasteInfoNo}">
                      <input type="hidden" class="imageIndexNo" name="imageIndexNo" value="${i.index+1}">
                      <div class="pic-Add-Btn">
                        <button class="btn btn-outline-success pic-Add-Btn" onclick="document.querySelector('.uploadImg').click()">사진 추가</button>
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
          </c:forEach>
          </tbody>
        </table>
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
        <li>배출 예약은 현재 날짜 기준으로 3일 이후부터 신청 가능하며 최대 한 달 후까지 예약이 가능합니다.</li>
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

<!--day.js-->
<script src="https://cdn.jsdelivr.net/npm/dayjs@1.10.5/dayjs.min.js"></script>

<!-- 채널톡 api -->
<jsp:include page="/include/chatBot.jsp"></jsp:include>

<script>

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

  $(document).ready(function() {
    $.ajax({
      url: "/divide/selectDistrict.do",
      data: { cityNo: 1 },
      type: "POST",
      success: function(data) {
        var districtNo = document.getElementById("districtNo");

        for (var i = 0; i < data.length; i++) {
          var option = document.createElement("option");
          option.value = data[i].districtNo;
          option.text = data[i].districtName;
          districtNo.appendChild(option);
        }
      },
      error: function() {
        alert("Ajax 오류! 관리자에게 문의하세요");
      }
    });


  });

  function citySelect() {
    var cityNo = document.getElementById("cityNo").value;
    var districtNo = document.querySelector("#districtNo");
    districtNo.innerHTML = "";
    if(cityNo !== "0"){
      $.ajax({
        url : "/divide/selectDistrict.do",
        data : {cityNo : cityNo},
        type : "POST",
        success : function(data) {
          for (var i = 0; i < data.length; i++) {
            var option = document.createElement("option");
            option.value = data[i].districtNo;
            option.text = data[i].districtName;
            districtNo.appendChild(option);
          }
        },
        error : function() {
          alert("Ajax 오류! 관리자에게 문의하세요");
        }
      })
    }

  }


  // 주소-좌표 변환 객체를 생성합니다
  var geocoder = new kakao.maps.services.Geocoder();
  // 전역 레벨에서 marker 변수를 선언하고 초기화
  var marker = new daum.maps.Marker({
    map: map
  });

  let userPostCode = document.getElementById('sample6_postcode');
  let userAddress = document.getElementById('sample6_address');
  let userAddressDetail = document.getElementById('sample6_detailAddress');
  let userName = document.getElementById('rvName');
  let userPhone = document.getElementById('rvPhone');
  // let rvAddr = document.querySelector('#rvAddr').value;

  function printUserInfo() {
    const userId = document.querySelector('#sessionId').value;
    console.log(userId);

    $.ajax({
      url: '/reservation/select/userInfo.do',
      data: {userId: userId},
      type: 'post',
      success: function (data) {
        userPostCode.value= data.userPostCode;
        userAddress.value= data.userAddress;
        userAddressDetail.value= data.userAddressDetail;
        userName.value= data.userName;
        userPhone.value= data.userPhone;

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
    userPostCode.value= '';
    userAddress.value= '';
    userAddressDetail.value= '';
    userName.value= '';
    userPhone.value= '';


    marker.setMap(null);
    // 새로운 마커 생성
    marker = new daum.maps.Marker({
      map: map
    });
  }

  document.querySelector('#submitBtn').addEventListener('click', function () {
    let rvAddrDetail = document.querySelector('#rvAddrDetail');
    let rvRvDate = document.querySelector('#calenderControll').value;
    let rvRequest = document.querySelector('#rvRequest');

    let rvAddr = userAddress.value + ' ' +userAddressDetail.value;

    // 날짜 파싱 및 서식 지정
    // const formattedDate = dayjs(rvRvDateInput).format('YYYY-MM-DD'+'T'+'HH:mm:ss');
    // let rvRvDate = document.querySelector('#rvRvDate');
    // rvRvDate.value = formattedDate;
    if(rvRequest.value == '') {
      rvRequest.value = '요청사항 없음';
    }

    if(
            // userPostCode.value== '' ||
            userAddress.value== '' ||
            userName === '' ||
            userName.value== '' ||
            userPhone.value== '' ||
            rvAddrDetail.value== '' ||
            rvRvDate== ''
    ) {
      alert("모든 정보를 입력해야 합니다.");
      document.querySelector('#rvAddr').value = rvAddr;
      return false;
    } else {
      document.querySelector('#rvAddr').value = rvAddr;
      console.log(rvAddr);
      document.insertInfoForm.submit();
    }
  })



</script>

<script>

  const imgCount = new Map();
  // input file
  const imgUploads = document.querySelectorAll('.uploadImg');
  var filesArr = []; // 업로드한 파일을 저장하는 배열
  // input 요소의 이미지 업로드 이벤트 처리

  function handlerInputChange(e) {
    // input 요소와 가장 가까이 있는 tr 찾기
    const tr = e.target.closest('tr');
    var files = e.target.files; // 선택한 파일 목록을 가져옴
    // var filesArr = Array.prototype.slice.call(files);
    // var fileArr = fileListArr.slice(); // 파일 목록 배열을 복사
    var inputElements = document.querySelectorAll('input[name="uploadFiles"]');
    const wasteInfoNo = event.target.closest('tr').querySelector('.wasteInfoNo').value;
    const imageIndexNo = event.target.closest('tr').querySelector('.imageIndexNo').value;


    // 파일을 배열에 추가
    for (let i = 0; i < files.length; i++) {
      const file = files[i];
      filesArr.push({file, wasteInfoNo, imageIndexNo});
    }

    console.log("fileArrs", filesArr);

    // tr에 대한 imgCount를 0으로 설정
    // imgCount.set(tr, 0);

    if (!imgCount.has(tr)) {
      imgCount.set(tr, 0);
    }

    imgCount.set(tr, imgCount.get(tr) + 1);

    console.log('추가한 이미지' + imgCount.get(tr));
    // Map을 전체적으로 확인하려면 다음과 같이 출력할 수 있습니다.
    console.log('전체 imgCount Map:', imgCount);



    if (imgCount.get(tr) > 5) {
      alert('이미지는 물품당 5개까지 첨부할 수 있습니다.');
      e.target.value = '';
      imgCount.set(tr, 5);
    }
  }

  // 파일을 배열에서 제거
  function removeFileFromArray(file, wasteInfoNo) {
    const fileIndex = filesArr.findIndex(item => item.file.name === file.name && item.wasteInfoNo === wasteInfoNo);
    if (fileIndex !== -1) {
      filesArr.splice(fileIndex, 1);
    }
  }

  imgUploads.forEach((input) => {
    input.addEventListener('change', function (e) {
      console.log("imgUploads ", imgUploads);
      handlerInputChange(e);
    });
  });



  // 파일 업로드 버튼과 관련된 "사진 추가" 버튼들을 선택
  const uploadBtns = document.querySelectorAll('.pic-Add-Btn');
  uploadBtns.forEach((upload) => {
    const relatedUpload = upload.previousElementSibling;
    console.log("relatedUpload: ", relatedUpload);

    if (relatedUpload) {
      upload.addEventListener('click', () => relatedUpload.click());
    }
  });


  // 이미지 업로드와 미리보기 관리
  const rows = document.querySelectorAll('.pic-tr');

  rows.forEach((row) => {
    const uploadImg = row.querySelector('.uploadImg');
    const uploadBtn = row.querySelector('.pic-Add-Btn');
    const preview = row.querySelector('.img-preview');

    uploadBtn.addEventListener('click', () => uploadImg.click());
    uploadImg.addEventListener('change', (e) => getImgs(e, preview));
  });

  // 업로드된 이미지를 가져와서 미리보기함
  function getImgs(e, preview) {
    const uploadFiles = [];
    const files = e.target.files;
    const imgPreview = e.target.closest('tr').querySelector('.img-preview');
    const wasteInfoNo = e.target.closest('tr').querySelector('.wasteInfoNo').value;
    const docFrag = new DocumentFragment();
    // 파일 갯수 검사
    if (imgPreview.children.length + e.currentTarget.files.length > 5) {
      alert('이미지는 물품당 최대 5장씩 첨부할 수 있습니다.');
      e.target.value = '';
      return;
    }

    // 파일을 uploadFiles 배열에 추가
    for (let i = 0; i < e.currentTarget.files.length; i++) {

      uploadFiles.push(e.currentTarget.files[i]);
    }



    // 이미지 파일만 처리
    const imageFiles = Array.from(e.currentTarget.files).filter(file => file.type.match("image/.*"));
    for (const imageFile of imageFiles) {
      const reader = new FileReader();
      reader.onload = (e) => {
        const preview = createElement(e, imageFile, wasteInfoNo);
        imgPreview.appendChild(preview);
      };
      reader.readAsDataURL(imageFile);
    }

    // 이미지를 추가한 후 현재 파일 목록을 업데이트
    // e.target.value = ''; // 파일 input 초기화
  }

  // 미리보기 생성
  function createElement(e, file, wasteInfoNo) {
    let tr = e.target;

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
      removeFileFromArray(file, wasteInfoNo);
      console.log("fileArr", filesArr);
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


  function submitFormBtn() {

    // 모든 .formList 요소를 선택
    const formLists = document.querySelectorAll('.formList');

    // FormData를 현재 폼에 설정
    const form = document.getElementById('uploadForm');
    form.enctype = 'multipart/form-data';
    form.method = 'POST';
    const formData = new FormData();
    let hasFiles = false; // 이미지 첨부 여부를 나타내는 변수

    let allRowsHaveImages = true; // 모든 행에 이미지가 첨부되었음을 가정
    let alertShown = false; // 알림이 이미 표시되었는지 여부를 추적

    // 중복 파일 확인을 위한 Set을 생성
    const addedFiles = new Set();

    // 각 행(tr)마다 이미지 업로드 확인 및 FormData에 추가
    formLists.forEach(formList => {
      const uploadFiles = Array.from(formList.querySelectorAll('.uploadImg'));

      // 이미지 첨부 여부를 확인
      if (uploadFiles.length < 1) {
        allRowsHaveImages = false; // 이미지가 없는 행이 있음을 표시
        if (!alertShown) {
          alert('물품당 반드시 한 장의 이미지를 첨부해야 합니다.');
          alertShown = true; // 알림을 한 번만 표시
        }
        return;
      }

      const wasteInfoNo = uploadFiles[0].closest('tr').querySelector('.wasteInfoNo').value;
      const imageIndexNo = uploadFiles[0].closest('tr').querySelector('.imageIndexNo').value;

      const filesArrForTr = filesArr.filter(fileObj => fileObj.wasteInfoNo === wasteInfoNo);

      if (filesArrForTr.length < 1) {
        allRowsHaveImages = false; // 이미지가 없는 행이 있음을 표시
        if (!alertShown) {
          alert('물품당 반드시 한 장의 이미지를 첨부해야 합니다.');
          alertShown = true; // 알림을 한 번만 표시
        }
        return;
      }

      // FormData에 해당 행(tr)의 이미지 파일 추가
      for (let i = 0; i < filesArrForTr.length; i++) {
        const isFileAdded = addedFiles.has(filesArrForTr[i].file);
        // 이미 추가된 파일이 아닌 경우에만 추가
        if (!isFileAdded) {
          formData.append('file', filesArrForTr[i].file);
          formData.append('wasteInfoNo', filesArrForTr[i].wasteInfoNo);
          formData.append('imageIndexNo', filesArrForTr[i].imageIndexNo);
          console.log(imageIndexNo);

          // Set에 이미 추가된 파일 추가
          addedFiles.add(filesArrForTr[i].file);
        }
      }
    });

    // 모든 행에 이미지가 첨부되었을 때에만 서버 요청을 보냄
    if (allRowsHaveImages) {
      $.ajax({
        url: '/reservation/imageUpload.do',
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
          location.href = "/reservation/insertInfo.do";
          console.log('업로드 완료', response);
        },
        error: function(error) {
          alert("Ajax 오류! 관리자에게 문의 바랍니다.");
          console.error('업로드 실패', error);
        }
      });
    }
  }


</script>

</body>

</html>