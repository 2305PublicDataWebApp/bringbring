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
  <link href="../resources/assets/img/main/title-icon.png" rel="icon">
  <link href="../resources/assets/img/main/title-icon.png" rel="apple-touch-icon">

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
  <script src="../resources/assets/js/summernote/summernote-lite.js"></script>
  <script src="../resources/assets/js/summernote/lang/summernote-ko-KR.js"></script>
<!--   카카오 api 관련 -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=043e510b873d1287a23e00d8444a6b47&libraries=services"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <style>
    /* 여기서부터 이 html의 css */
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
    /* 썸머노트 css*/
    .note-icon-caret:before {
        width: 7px;
    }
    .dropdown-toggle::after {
        border: 0px;
    }
    main select{
      height: 35px;
    }
  </style>
</head>

<body>

  <!-- 헤더 -->
  <jsp:include page="/include/header.jsp"></jsp:include>

  <div style="width: 100%;height: 74px;"></div>
    
  <main style="width: 100%;margin: 0 auto;padding-top: 50px;">
    <!-- 글쓰기 텍스트 영역 -->
    <div style="margin: 0 auto;text-align: center;margin: 30px 0px 70px 0px;">
      <h2>나눔 게시판 글 작성</h2>
    </div>
    <div style="width: 1000px; margin: 0 auto; border: 2px solid #ccc;padding: 20px 0px;">
      <div style="margin: 0 auto;width: 800px;">
        <ul class="divide-insert-menu" style="padding: 0px;">
          <li>
            <label for="title">제목</label>
            <input type="text" id="title">
          </li>
          <li class="file-li" style="padding-bottom: 10px;">
            <label for="image">파일</label>
            <i style="font-size: 20px;width: 30px;" class="bi bi-plus-circle-fill" id="addFileInput"></i>
            <input style="font-size: 15px;border: 1px solid rgba(133, 133, 133, 0.5);width: 570px;border-radius: 3px;" class="form-control" type="file" id="image">
          </li>
          <li>
            <label for="region">지역</label>
            <select name="" id="region" style="width: 100px;margin-right: 15px;">
              <option value="seoul">서울</option>
              <option value="seoul">경기</option>
              <option value="seoul">경상</option>
              <option value="seoul">충청</option>
              <option value="seoul">강원</option>
              <option value="seoul">전라</option>
            </select>
            <select name="" id="" style="width: 150px;margin-right: 15px;">
              <option value="seoul">서울</option>
              <option value="seoul">경기</option>
              <option value="seoul">경상</option>
              <option value="seoul">충청</option>
              <option value="seoul">강원</option>
              <option value="seoul">전라</option>
            </select>
          </li>
          <li>
            <label for="type">종류</label>
            <select name="" id="type" style="width: 176px;margin-right: 15px;">
              <option value="seoul">가전제품</option>
              <option value="seoul">생활용품</option>
              <option value="seoul">가구</option>
              <option value="seoul">기타</option>
            </select>
          </li>
          <li>
            <label for="summernote">내용</label>
            <div id="" class="d-flex justify-content-center flex-column" style="width: 600px;">
              <textarea id="summernote" spellcheck="false" required></textarea>
            </div>
          </li>
          <li>
            <label for="location">거래 희망 장소</label>
            <input style="width: 500px;margin-right: 15px;" id="location" type="text" id="location">
            <button class="btn btn-success" id="searchAddrBtn" onclick="sample5_execDaumPostcode();">주소 검색</button>
            <input type="hidden" id="coordinateX">
            <input type="hidden" id="coordinateY">
          </li>
          <li>
            <label>지도 미리보기</label>
            <div id="map" style="height: 300px;width: 600px;border: 1px solid rgba(133, 133, 133, 0.5);border-radius: 5px;"></div>
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
 
  
  <script type="text/javascript">
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
// 	    position: new daum.maps.LatLng(37.566535, 126.9779692),
	    map: map
	  });
	
	
	  function sample5_execDaumPostcode() {
	    new daum.Postcode({
	      oncomplete: function (data) {
	        var addr = data.address; // 최종 주소 변수
	        var postCode = data.zonecode;
	        // 주소 정보를 해당 필드에 넣는다.
	        document.getElementById("location").value = addr;
	//         document.getElementById("sample6_postcode").value = postCode;
	        // 주소로 상세 정보를 검색
	        geocoder.addressSearch(data.address, function (results, status) {
	          // 정상적으로 검색이 완료됐으면
	          if (status === daum.maps.services.Status.OK) {
	
	            var result = results[0]; //첫번째 결과의 값을 활용
	
	            // 해당 주소에 대한 좌표를 받아서
	            var coords = new daum.maps.LatLng(result.y, result.x);
	            document.getElementById("coordinateX").value = result.x;
	            document.getElementById("coordinateY").value = result.y;
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
 
  <script type="text/javascript">

	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	var marker = new kakao.maps.Marker(); // 클릭한 위치를 표시할 마커입니다
// 	  infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
	
	
	//지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	  searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
	      if (status === kakao.maps.services.Status.OK) {
	          
	          
	          document.getElementById("location").value = result[0].address.address_name;
					
	          // 마커를 클릭한 위치에 표시합니다 
	          marker.setPosition(mouseEvent.latLng);
	          document.getElementById("coordinateX").value = mouseEvent.latLng.La;
	          document.getElementById("coordinateY").value = mouseEvent.latLng.Ma;
	          
	          marker.setMap(map);
	
	          // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
// 	          infowindow.open(map, marker);
	      }   
	  });
	});
	

	
	function searchAddrFromCoords(coords, callback) {
	  // 좌표로 행정동 주소 정보를 요청합니다
	  geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
	}
	
	function searchDetailAddrFromCoords(coords, callback) {
	  // 좌표로 법정동 상세 주소 정보를 요청합니다
	  geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}
	
	
  </script>
  
</body>

</html>