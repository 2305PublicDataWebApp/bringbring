<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
  
  <!-- Vendor CSS Files -->
  <link href="../resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="../resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">

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
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	<script src="../resources/assets/js/summernote/summernote-lite.js"></script>
	<script src="../resources/assets/js/summernote/lang/summernote-ko-KR.js"></script>

	<!-- 카카오 api 관련 -->
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
    .fileLayOut{
    	font-size: 15px;
    	border: 1px solid rgba(133, 133, 133, 0.5);
    	width: 570px;
    	border-radius: 3px;
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
	<form name="insertForm" action="/divide/insert.do" method="post" enctype="multipart/form-data">
	    <div style="width: 1000px; margin: 0 auto; border: 2px solid #ccc;padding: 20px 0px;">
	      <div style="margin: 0 auto;width: 800px;">
	        <ul class="divide-insert-menu" style="padding: 0px;">
	          <li>
	            <label for="divTitle">제목</label>
	            <input name="divTitle" id="divTitle" type="text" id="title">
	          </li>
	          <li class="file-li" style="padding-bottom: 10px;">
	            <label for="image">파일</label>
	            <i style="font-size: 20px;width: 30px;" class="bi bi-plus-circle-fill" id="addFileInput"></i>
	            <input name="uploadFiles" class="form-control fileLayOut" type="file" id="image">
	          </li>
	          <li>
	            <label for="cityNo">지역</label>
	            <select name="cityNo" id="cityNo" onchange="citySelect();" style="width: 100px;margin-right: 15px;">
	              <c:forEach var="city" items="${cList}" >			
					  <option value="${city.cityNo}">${city.cityName}</option>
				  </c:forEach>
	            </select>
	            <select name="districtNo" id="districtNo" style="width: 150px;">
				</select>
	          </li>
	          <li>
	            <label for="wasteCategoryNo">종류</label>
	            <select name="wasteCategoryNo" id="wasteCategoryNo" style="width: 176px;margin-right: 15px;">
					<option value="0">종류 선택</option>
					<c:forEach var="wCategory" items="${wList}" >			
						<option value="${wCategory.wasteCategoryNo}">${wCategory.wasteCategoryName}</option>
					</c:forEach>
	            </select>
	          </li>
	          <li>
	            <label for="summernote">내용</label>
	            <div id="" class="d-flex justify-content-center flex-column" style="width: 600px;">
	              <textarea name="divContent" id="summernote" spellcheck="false" required></textarea>
	            </div>
	          </li>
	          <li>
				<label for="location">거래 희망 장소</label>
				<input style="width: 500px;margin-right: 15px;" type="text" id="location">
				<button type="button" class="btn btn-success" id="searchAddrBtn" onclick="sample5_execDaumPostcode();">주소 검색</button>
				<input name="divXCoordinate" type="hidden" id="coordinateX">
				<input name="divYCoordinate" type="hidden" id="coordinateY">
	          </li>
	          <li>
	            <label>지도 미리보기</label>
	            <div id="map" style="height: 300px;width: 600px;border: 1px solid rgba(133, 133, 133, 0.5);border-radius: 5px;"></div>
	          </li>
	        </ul>
	      </div>
	    </div>
	    <div style="margin: 0 auto;text-align: center;margin-top: 100px;">
	      <button type="button" class="btn btn-success btn-lg" onclick="checkSubmit();">글 작성 완료</button>
	    </div>
	</form>
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
            var newInput = '<li style="margin: 0px 0px 10px 195px; padding: 0;"><input name="uploadFiles" class="form-control fileLayOut" type="file"></li>';
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
                fontNames: ['LINESeedKR-Bd','SUITE-Regular','Giants-Bold', 'Comic Sans MS','맑은 고딕','굴림체','굴림','돋움체','바탕체'],
                fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
            });
        });
        

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
				console.log(result.x);
	            document.getElementById("coordinateY").value = result.y;
				  console.log(result.y);
	            map.relayout();
	            // 지도 중심을 변경한다.
	            map.setCenter(coords);
	            // 마커를 결과값으로 받은 위치로 옮긴다.
	            marker.setPosition(coords);
				return false;
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
			  console.log(mouseEvent.latLng.La);
	          document.getElementById("coordinateY").value = mouseEvent.latLng.Ma;
			  console.log(mouseEvent.latLng.Ma);
	          
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
	
	// insert form 유효성 검사
	const form = document.forms.insertForm;
    function checkSubmit(){
      // event.preventDefault();
      const divTitle = form.querySelector("#divTitle").value;
      const divContent = form.querySelector("#summernote").value;
      const cityNo = form.querySelector("#cityNo").value;
      const wasteCategoryNo = form.querySelector("#wasteCategoryNo").value;
		// 파일 input 엘리먼트 가져오기
		const fileInput = form.querySelector("#image");
		// 선택된 파일 가져오기
		const selectedFile = fileInput.files[0];

      // 유효성 검사
      if (divTitle.trim() === "") {
        alert("제목을 입력해주세요.");
      } else if (!selectedFile) {
		  alert("사진은 한 개 이상 둥록해주세요.");
	  } else if (cityNo === "0") {
        alert("지역을 선택해주세요.");
      } else if (wasteCategoryNo === "0") {
        alert("종류를 선택해주세요.");
      } else if (divContent.trim() === "") {
        alert("내용을 입력해주세요.");
      } else {
        // 폼 제출 (만약 추가 유효성 검사가 필요하다면 여기에 추가)
        form.submit();
      }
    }
  </script>
  <script type="text/javascript">
	  $(document).ready(function() {
		  $.ajax({
			  url: "/divide/selectDistrict.do",
			  data: { cityNo: 1 },
			  type: "POST",
			  success: function(data) {
				  var districtNo = document.getElementById("districtNo");

				  for (var i = 0; i < data.length; i++) {
					  var option = document.createElement("option");
					  option.value = data[i].cityNo;
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
							option.value = data[i].cityNo;
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
  	
  	<!-- 로그인, 로그아웃 -->
    <jsp:include page="/include/loginJs.jsp"></jsp:include>
  </script>
</body>

</html>