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

  <!-- Google Fonts -->
  <link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
    rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="../resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="../resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <!-- <link href="../assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet"> -->
  <!-- <link href="../assets/vendor/remixicon/remixicon.css" rel="stylesheet"> -->
  <!-- <link href="../assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet"> -->

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
    .fileLayOut{
      font-size: 15px;
      border: 1px solid rgba(133, 133, 133, 0.5);
      width: 570px;
      border-radius: 3px;
    }
    .imgPreview{
      width: 120px;
      height: 120px;
      background-position: 50% 50%;
      border-top-left-radius: 10px;
      border-top-right-radius: 10px;
      background-repeat: no-repeat;
      background-size: cover;
      border: 1px solid rgb(25, 135, 84);
      margin: 5px 15px 0px 15px;
      border-bottom: 0px;
    }
    .deleteBtn{
      border: 1px solid rgb(25, 135, 84);
      background: rgb(255, 255, 255);
      color: rgb(25, 135, 84);
      margin-bottom: 20px;
      width: 120px;
      border-top-left-radius: 0px;
      border-top-right-radius: 0px;
      margin: 0px 15px 10px 15px;
    }
    .sortLeft{
      float: left;
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
      <h2>문의 글 작성</h2>
    </div>
    <div style="width: 1000px; margin: 0 auto; border: 2px solid #ccc;padding: 20px 0px;">
      <form name="insertForm" action="/inquire/update.do" method="post" enctype="multipart/form-data">
        <div style="margin: 0 auto;width: 800px;">
          <ul class="divide-insert-menu" style="padding: 0px;">
            <li>
              <label for="inqTitle">*제목</label>
              <input name="inqTitle" type="text" id="inqTitle">
            </li>
            <li class="file-li" style="padding-bottom: 10px;">
              <label>*사진</label>
              <input style="width: 600px;" accept="image/*" name="uploadFiles" id="inputFile1" class="form-control fileLayOut" type="file">
            </li>
            <li>
              <div style="font-size: 14px;color: #a6a5a5;margin-left: 150px;display:flex;width: 100%;">
                <div style="width: 30%;">
                  이미지 개수 <span id="imageCount">0</span> / 5
                </div>
                <div style="float:right;width: 70%;text-align: right;padding-right: 18px;">
                  #이미지 파일은 1~5개까지 첨부 가능합니다.
                </div>
              </div>
            </li>
            <li style="padding: 0px 15px 0px 15px;">
              <div class="image-list" style="width: 900px;padding-left: 150px;">
              </div>
            </li>
            <li>
              <label for="cityNo">*지역</label>
  <%--            ${cList}--%>
              <select name="cityNo" id="cityNo" onchange="citySelect();" style="width: 100px;margin-right: 15px;">
                <c:forEach var="city" items="${cList}" >
                  <option value="${city.cityNo}">${city.cityName}</option>
                </c:forEach>
              </select>
              <select name="districtNo" id="districtNo" style="width: 150px;">
              </select>
            </li>
            <li>
              <label for="inqCategory">*유형</label>
              <select name="inqCategory" id="inqCategory" style="width: 600px;margin-right: 15px;">
                <option value="selectInquire">문의 유형을 선택해주세요</option>
                <option value="delivery">배송 연착, 배송 환불 관련 문의사항</option>
                <option value="divide">나눔 게시판 관련 문의사항</option>
                <option value="chatting">채팅 관련 문의사항</option>
                <option value="improvement">개선하면 좋을 점</option>
                <option value="etc">기타</option>
              </select>
            </li>
            <li>
              <label for="summernote">*내용</label>
              <div id="" class="d-flex justify-content-center flex-column" style="width: 600px;">
                <textarea name="inqContent" id="summernote" spellcheck="false" required></textarea>
              </div>
            </li>
          </ul>
        </div>
      </form>
    </div>
    <div style="margin: 0 auto;text-align: center;margin-top: 100px;">
      <button type="button" onclick="checkSubmit();" class="btn btn-success btn-lg">글 작성 완료</button>
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
    // (function () { var w = window; if (w.ChannelIO) { return w.console.error("ChannelIO script included twice."); } var ch = function () { ch.c(arguments); }; ch.q = []; ch.c = function (args) { ch.q.push(args); }; w.ChannelIO = ch; function l() { if (w.ChannelIOInitialized) { return; } w.ChannelIOInitialized = true; var s = document.createElement("script"); s.type = "text/javascript"; s.async = true; s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js"; var x = document.getElementsByTagName("script")[0]; if (x.parentNode) { x.parentNode.insertBefore(s, x); } } if (document.readyState === "complete") { l(); } else { w.addEventListener("DOMContentLoaded", l); w.addEventListener("load", l); } })();
    //
    // ChannelIO('boot', {
    //   "pluginKey": "3e438b51-7087-4b0c-b50f-c1cb50c8f770"
    // });

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
      var districtNo = document.getElementById("districtNo");
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
    <jsp:include page="/include/loginJs.jsp"></jsp:include>

  </script>
  <script>
    const form = document.forms.insertForm;
    function checkSubmit(){
        // event.preventDefault();
        const inqTitle = form.querySelector("#inqTitle").value;
        const inqContent = form.querySelector("#summernote").value;
        const cityNo = form.querySelector("#cityNo").value;
        const inqCategory = form.querySelector("#inqCategory").value;
        // 파일 input 엘리먼트 가져오기
        const fileInput = form.querySelector('input[type="file"][name="uploadFiles"]');
        // 선택된 파일 가져오기
        const selectedFile = fileInput.files[0];

        var inputElements = document.querySelectorAll('input[name="uploadFiles"]');

        // 유효성 검사
        if (inqTitle.trim() === "") {
        alert("제목을 입력해주세요.");
        } else if (!selectedFile) {
        alert("사진은 한 개 이상 등록해주세요.");
        } else if (inputElements.length > 6) {
        alert("5개까지의 파일만 업로드할 수 있습니다.");
        }else if (cityNo === "0") {
        alert("지역을 선택해주세요.");
        } else if (inqCategory === "selectInquire") {
        alert("유형을 선택해주세요.");
        } else if (inqContent.trim() === "") {
        alert("내용을 입력해주세요.");
        } else {
        // 폼 제출 (만약 추가 유효성 검사가 필요하다면 여기에 추가)
        form.submit();
        }
    }
  </script>
  <script>
    const imgCount = {};

    var number = 1;
    var delNumber = 1;
    const imgUploads = document.querySelectorAll('input[name="uploadFiles"]');
    var imgPreview = document.querySelector('.image-list');

    function handlerInputChange(e) {

      var imageCountElement = document.querySelector("#imageCount");
      var inputElements = document.querySelectorAll('input[name="uploadFiles"]');
      if (parseInt(imageCountElement.innerHTML) > 4) {
        alert("5장 이상 사진을 추가할 수 없습니다.");
        imageCountElement.innerHTML = (inputElements.length - 1).toString();
        return;
      }
      const tr = e.target.closest('tr');
      if (!imgCount[tr]) {
        imgCount[tr] = 0;
      }

      imgCount[tr]++;

      // console.log('뭔데?????' + imgCount[tr]);



      // input file추가
      const newInput = document.createElement('input');
      newInput.type = 'file';
      newInput.style.width = '600px';
      newInput.accept = 'image/*';
      newInput.name = 'uploadFiles';
      number++;
      console.log("number : "+number);
      newInput.id = 'inputFile'+number;
      newInput.className = 'form-control fileLayOut';
      newInput.addEventListener('change', handlerInputChange);
      newInput.addEventListener('change', getImgs);

      // 선택한 input type 파일을 숨깁니다.
      e.target.style.display = 'none';

      // 선택한 입력 요소를 DOM에서 새로운 것으로 교체합니다.
      e.target.parentElement.appendChild(newInput);

    }

    document.querySelectorAll('input[name="uploadFiles"]').forEach((input) => {

      input.addEventListener('change', handlerInputChange)

    });
    function getImgs(e) {

      var imageCountElement = document.querySelector("#imageCount");
      var inputElements = document.querySelectorAll('input[name="uploadFiles"]');
      if (parseInt(imageCountElement.innerHTML) > 4) {
        imageCountElement.innerHTML = (inputElements.length - 1).toString();
        e.target.value = '';
        return false;
      }

      const uploadFiles = [];
      const files = e.currentTarget.files;
      var imgPreview = document.querySelector('.image-list');


      // 파일 타입 검사
      for (let i = 0; i < [...files].length; i++) {

        // 파일 처리
        uploadFiles.push(files[i]);
        const reader = new FileReader();
        reader.onload = (e) => {
          var preview = createElement(e, files[i]);
          imgPreview.appendChild(preview);
        };
        reader.readAsDataURL(files[i]);

      }
    }



    function createElement(e, file) {

      let tr = e.target;

      // for (let i = 0; i < tr.length; i++) {
      // 	let cellValue = tr[i].innerHTML; // or cells[i].textContent.
      // 	console.log(cellValue);
      // }

      console.log("number : "+number);
      const li = document.createElement('li');
      const div = document.createElement('div');
      const deleteBtn = document.createElement('button');

      div.className = "sortLeft";
      div.id = 'inputFile'+delNumber;

      const imagePreview = document.createElement("div");
      imagePreview.className = "imgPreview";
      imagePreview.style.backgroundImage = "url("+e.target.result+")";


      deleteBtn.textContent= '삭제하기';
      deleteBtn.className = 'deleteBtn btn btn-success';
      deleteBtn.setAttribute('data-number', delNumber);

      div.appendChild(imagePreview);
      div.appendChild(deleteBtn);
      imgPreview.appendChild(div);

      delNumber++;


      console.log(imgCount);

      function deleteImage(obj) {
        const parentElement = obj.parentElement;
        console.log(parentElement);
        if (parentElement) {
          parentElement.remove();
        }
      }

      var inputElements = document.querySelectorAll('input[name="uploadFiles"]');
      var imageCountElement = document.querySelector("#imageCount");
      imageCountElement.innerHTML = '';
      imageCountElement.innerHTML = (inputElements.length - 1).toString();

      deleteBtn.addEventListener('click', function(event) {
        // 클릭한 deleteBtn에 접근하기 위해 event.target을 사용합니다.
        const btnNumber = event.target.getAttribute('data-number');
        div.remove();

        // btnNumber를 사용하여 해당 id를 가진 요소를 선택하고 제거합니다.
        document.querySelector("#inputFile" + btnNumber).remove();

        let trClicked = e.target;

        while (trClicked && trClicked.tagName !== 'TR') {
          trClicked = trClicked.parentElement;
        }

        if (trClicked) {
          imgCount[trClicked]--; // trClicked 엘리먼트가 존재하면 imgCount[trClicked]를 감소
        }

        console.log('이미지' + imgCount);
        console.log(imgCount[trClicked]);

        var inputElements = document.querySelectorAll('input[name="uploadFiles"]');
        var imageCountElement = document.querySelector("#imageCount");
        imageCountElement.innerHTML = '';
        imageCountElement.innerHTML = (inputElements.length - 1).toString();
      });

      return div;
    }
    document.querySelectorAll('input[name="uploadFiles"]').forEach((input) => {

      document.querySelector('input[name="uploadFiles"]').addEventListener('change', getImgs);

      // input.addEventListener('change', handlerInputChange)
    });
    document.querySelector('input[name="uploadFiles"]').addEventListener('change', getImgs);
  </script>
  
</body>

</html>