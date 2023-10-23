<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<%--  <link href="../resources/assets/css/common.css" rel="stylesheet">--%>

  <!-- 카카오 api 관련 -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=043e510b873d1287a23e00d8444a6b47&libraries=services"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
    main .divideImg{
      width: 850px;
      height: 600px;
      background-position: 50% 50%;
      background-repeat: no-repeat;
      background-size: cover;
    }
    main .heartButton{
      border: 0px;
      height: 42px;
      border-radius: 100%;
      margin-bottom: 5px;
      background-color: inherit;
    }
    main .detailBtn{
      margin-right: 10px;
    }
  </style>
</head>

<body>

  <!-- 헤더 -->
  <jsp:include page="/include/header.jsp"></jsp:include>

  <div style="width: 100%;height: 74px;"></div>
    
  <main style="width: 100%;margin: 0 auto;padding-top: 50px;" data-aos="fade-up">
    <!-- 캐러셀 영역 -->
    <div id="carouselExampleIndicators" class="carousel slide" style="margin-bottom: 45px;">
      <div class="carousel-indicators">
        <c:forEach var="image" items="${iList}" varStatus="loop">
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${loop.index}" class="<c:if test='${loop.first}'>active</c:if>" aria-label="Slide ${loop.index + 1}"></button>
        </c:forEach>
      </div>
      <div class="carousel-inner" style="position: relative;">
        <c:forEach var="image" items="${iList}" varStatus="loop">
          <div class="carousel-item <c:if test='${loop.first}'>active</c:if>">
            <div class="divideImg" style="background-image: url(${image.imagePath});" data-bs-interval="4000"></div>
          </div>
        </c:forEach>
        <div style="width: 850px;height: 50px;position:absolute;bottom: 50px;background-image: linear-gradient(to top, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0));"></div>
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

    <div style="width: 850px;margin: 0 auto;" >
      <!-- 프로필 영역 -->
      <div style="width: 100%;height: 130px;border-bottom: 2px solid #ccc;border-top: 2px solid #ccc;">
        <div style="float: left;">
          <img style="width: 50px;height: 50px;margin-top: 35px;margin-left: 10px;" src="../resources/assets/img/divide/free-icon-user-847969.png" alt="">
        </div>
        <div style="float: left;padding: 35px 15px 0px 15px;">
          <h5>${dData.user.userName}</h5>
          <p>${dData.city.cityName} ${dData.district.districtName}</p>
        </div>
        <div style="display: flex;float: right;height: 100%;flex-direction: column;justify-content: space-evenly;">
          <c:if test="${sessionId ne null && sessionId ne dData.user.userId}">
            <button data-bs-toggle="modal" data-bs-target="#exampleModal" type="button" class="btn btn-success datailBtn">게시글 신고하기</button>
          </c:if>
          <c:if test="${sessionId ne null && sessionId eq dData.user.userId}">
            <button onclick="updateDivide();" type="button" class="btn btn-success detailBtn">수정하기</button>
            <button onclick="deleteDivide();" type="button" class="btn btn-success detailBtn">삭제하기</button>
          </c:if>
        </div>
      </div>
      <!-- 제목 영역 -->
      <div style="width: 100%;border-bottom: 1px solid #ccc;display: flex;" >
        <div style="padding: 35px 15px;width: 92%;">
          <h3 style="margin-bottom: 15px;">${dData.divide.divTitle}</h3>
          <p style="margin-bottom: 5px;">${dData.wasteCategory.wasteCategoryName}</p>
          <p style="margin: 0px;">
<%--            <fmt:parseDate value="${dData.divide.divCreateDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parseDateTime1" type="both" />--%>
            <fmt:parseDate value="${dData.divide.divCreateDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parseDateTime1" type="both" />
            <fmt:formatDate value="${parseDateTime1}" pattern="yyyy. MM. dd." />
<%--            ${dData.divide.divCreateDate}--%>
          </p>
        </div>
        <div id="heartDiv" style="width: 8%;text-align: center;" class="align-self-center">
          <c:if test="${sessionId eq null || sessionId ne heart.userId}">
            <button class="heartButton" onclick="insertHeart();">
              <i style="font-size: 30px;" class="bi bi-heart"></i>
            </button>
          </c:if>
          <c:if test="${heart.userId ne null && sessionId eq heart.userId}">
            <button class="heartButton" onclick="deleteHeart();">
              <i style="font-size: 30px;color: #FF8080;" class="bi bi-heart-fill"></i>
            </button>
          </c:if>
        </div>
      </div>
      <!-- 내용 영역 -->
      <div style="width: 100%; border-bottom: 2px solid #ccc; display: flex; flex-direction: column; align-items: flex-end;">
        <div style="padding: 35px 15px;width: 100%;">
          <div style="width: 100%;margin: 0px 0px 100px 0px;">${dData.divide.divContent}</div>
<%--          <textarea cols="88" rows="15" style="resize: none; border: none; outline: none; width: 100%;" readonly>${dData.divide.divContent}</textarea>--%>
        </div>
        <div style="margin: 0px 10px 7px 0px;">
<%--          <i class="bi bi-chat"></i>--%>
          채팅 <span>${dData.divide.chatroomCount}</span>&nbsp;&nbsp;•&nbsp;
<%--          <i class="bi bi-heart"></i>--%>
          찜 <span id="heartCount">${dData.divide.heartCount}</span> &nbsp;•&nbsp;
          조회 <span id="viewCount">${dData.divide.viewCount}</span>
        </div>
      </div>      
      <!-- 거래 희망장소 영역 -->
      <div style="width: 100%;">
        <div style="padding: 35px 15px;">
          <h3>거래 희망 장소</h3>
          <p style="margin-bottom: 5px;">
            <c:if test="${dData.divide.divXCoordinate eq null}">
              아직 희망하는 장소가 없습니다.
            </c:if>
            <c:if test="${dData.divide.divXCoordinate ne null}">
              <span id="divideAddress"></span>
            </c:if>
          </p>
        </div>
      </div>
      <!-- 지도 영역 -->
      <div id="map" style="width: 100%;height: 300px;border: 1px solid #ccc;"></div>
      <!-- 버튼 영역 -->
      <div style="margin: 0 auto;text-align: center;margin-top: 100px;">
<%--        <c:if test="${sessionId ne null && sessionId ne dData.user.userId}">--%>
          <button onclick="openPopup('/chatting/${sessionId}?divNo=${dData.divide.divNo}&getUserId=${dData.user.userId}')" class="btn btn-success btn-lg">1:1 채팅 신청</button>
<%--        </c:if>--%>
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
            <select name="repCategory" class="form-select" aria-label="Default select example">
              <option value="no" selected>신고할 항목을 선택해주세요</option>
              <option value="fraud">사기 글이에요</option>
              <option value="unpleasant">회원들에게 불쾌감을 주는 글이에요</option>
              <option value="inappropriate">부적절한 회원이에요</option>
              <option value="other">기타 다른 사유가 있어요</option>
            </select>
            <textarea name="repContent" id="" cols="30" rows="10" style="width: 100%;resize: none;border: 1px solid #dee2e6;margin-top: 10px;border-radius: 7px;"></textarea>
          </div>
          <div class="modal-footer">
            <button id="closeReport" type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            <button onclick="insertReport();" type="button" class="btn btn-success">작성 완료</button>
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

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- jquery -->
<%--  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>--%>
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
        $(document).ready(function() {
          $.ajax({
            url: "/divide/updateViewCount.do",
            data: { divNo: ${dData.divide.divNo}, viewCount: ${dData.divide.viewCount} },
            type: "POST",
            success: function(data) {
              if(data > 0){
                var viewCountSpan = document.getElementById("viewCount");
                viewCountSpan.textContent = ""; // 기존 내용을 지우기
                viewCountSpan.textContent = data; // 새로운 정수 값을 설정
              }else{
                alert("조회수 증가 실패!");
              }

            },
            error: function() {
              alert("Ajax 오류! 관리자에게 문의하세요");
            }
          });
        });

        var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
        var xCoor = "${dData.divide.divYCoordinate}";
        var yCoor = "${dData.divide.divXCoordinate}";
        if(xCoor === ""){
          container.style.display = "none";
          xCoor = "33.450701";
          yCoor = "126.570667";
        }
        var options = { //지도를 생성할 때 필요한 기본 옵션
          center: new kakao.maps.LatLng(xCoor, yCoor), //지도의 중심좌표.
          level: 3 //지도의 레벨(확대, 축소 정도)
        };

        var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

        // 마커가 표시될 위치입니다
        // var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667);
        var markerPosition  = new kakao.maps.LatLng(xCoor, yCoor);
        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
          position: markerPosition
        })

        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);


        // 데이터들을 저장할 배열 선언
        var positions = [];

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

    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

    function searchDetailAddrFromCoords(coords, callback) {
      // 좌표로 법정동 상세 주소 정보를 요청합니다
      geocoder.coord2Address(yCoor, xCoor, callback);
    }

    // 주소 변환
    searchDetailAddrFromCoords(kakao.maps.LatLng(xCoor, yCoor), function(result, status) {
        var detailAddr = result[0].address.address_name;
        var divideAddress = document.getElementById("divideAddress");
        if(divideAddress){
          divideAddress.innerText = detailAddr;
        }
    });

    var heartDiv = document.getElementById("heartDiv");
    var spanElement = document.getElementById("heartCount");

    function insertHeart() {
      $.ajax({
        url: "/divide/insertHeart.do",
        data: { divNo: ${dData.divide.divNo}, userId: "${sessionId}"},
        type: "POST",
        success: function(data) {
          if(data > -1){
            heartDiv.innerHTML = '';

            // 새로운 버튼과 아이콘 코드를 추가
            var buttonElement = document.createElement("button");
            buttonElement.className = "heartButton";
            buttonElement.onclick = deleteHeart;

            var iconElement = document.createElement("i");
            iconElement.style.fontSize = "30px";
            iconElement.style.color = "#FF8080";
            iconElement.className = "bi bi-heart-fill";

            buttonElement.appendChild(iconElement);
            heartDiv.appendChild(buttonElement);

            spanElement.textContent = ""; // 기존 내용을 지우기
            spanElement.textContent = data; // 새로운 정수 값을 설정
            // location.reload();
          }else{
            alert("실패!");
          }
        },
        error: function() {
          alert("Ajax 오류! 관리자에게 문의하세요");
        }
      });
    }

    function deleteHeart() {
      $.ajax({
        url: "/divide/deleteHeart.do",
        data: { userId: "${sessionId}", divNo: "${dData.divide.divNo}"},
        type: "POST",
        success: function(data) {
          if(data > -1){
            heartDiv.innerHTML = '';

            var buttonElement2 = document.createElement("button");
            buttonElement2.className = "heartButton";
            buttonElement2.onclick = insertHeart;

            var iconElement2 = document.createElement("i");
            iconElement2.style.fontSize = "30px";
            iconElement2.className = "bi bi-heart";

            buttonElement2.appendChild(iconElement2);
            heartDiv.appendChild(buttonElement2);

            spanElement.textContent = ""; // 기존 내용을 지우기
            spanElement.textContent = data; // 새로운 정수 값을 설정
            // location.reload();
          }else{
            alert("실패!");
          }
        },
        error: function() {
          alert("Ajax 오류! 관리자에게 문의하세요");
        }
      });
    }

    function deleteDivide() {
      if(confirm("게시글을 삭제하시겠습니까?")){
        location.href = "/divide/delete.do?divNo=${dData.divide.divNo}";
      }
    }

    function insertReport() {
      if(confirm("신고를 완료하시겠어요?")){
        var closeReportButton = document.getElementById("closeReport");
        var repCategory = document.querySelector('select[name="repCategory"]').value;
        var repContent = document.querySelector('textarea[name="repContent"]').value;

        if (repCategory === "no") {
          alert("신고 항목을 선택해주세요.");
          return false;
        }else if(repContent === ""){
          alert("신고 내용을 작성해주세요.");
          return false;
        }

        $.ajax({
          url: "/report/insert.do",
          data: { repCategory: repCategory, repContent: repContent, divNo: "${dData.divide.divNo}"},
          type: "POST",
          success: function(data) {
            if(data === "success"){
              alert("신고가 접수되었습니다.");
              closeReportButton.click();
              document.querySelector('select[name="repCategory"]').value = 'no';
              document.querySelector('textarea[name="repContent"]').value = '';
            }else{
              alert("실패!");
            }
          },
          error: function() {
            alert("Ajax 오류! 관리자에게 문의하세요");
          }
        });
      }
    }

    function updateDivide() {
      location.href = "/divide/update.do?divNo=${dData.divide.divNo}";
    }

    function openPopup(url) {
      if(confirm("${dData.user.userName}님께 채팅 신청을 하시겠어요?")){
        var name = "브링브링 채팅방";
        var option = "width = 516, height = 668, top = 20, left = 200, location = no"
        window.open(url, name, option);
      }
    }

    <!-- 로그인, 로그아웃 -->
    <jsp:include page="/include/loginJs.jsp"></jsp:include>
  </script>
</body>

</html>