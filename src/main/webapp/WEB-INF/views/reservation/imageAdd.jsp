<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>대형 폐기물 사진 추가</title>
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


  <link rel="stylesheet" href="../../../resources/assets/css/reservation/imageAdd.css">
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
      <h1>대형 폐기물 사진 추가</h1>
      <div style="width: 100%;height: 30px;"></div>
      <h4 style="color: rgb(189, 245, 229);">폐기물 사진을 추가해주세요</h4>
    </div>
    <div style="display: flex;flex-direction: row;justify-content: flex-end;">
      <img class="addImg" src="../../../resources/assets/img/reservation/picture.png" style="width: 250px;" alt="">
    </div>
  </div>

</section>
<div style="width: 100%;">

  <main>
    <h2 class="subject">대형 폐기물 사진 추가</h2>
    <div>
      <div class="progress-bar out-progress-bar">
        <div class="progress-bar in-progress-bar"></div>
      </div>
    </div>
    <p class="title">선택할 물품 사진 추가</p>
    <hr>
    <div>
      <form name="uploadForm" id="uploadForm" action="/reservation/addImage.do" method="post" enctype="multipart/form-data">
        <table class="table">
          <tbody>
          <c:forEach items="${wasteDataList}" var="item" varStatus="i">
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
                    <div class="pic-Add-Btn">
                      <button class="btn btn-outline-success pic-Add-Btn" onclick="document.getElementById('uploadImg').click()">사진 추가</button>
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
          </tbody>
        </table>
      </form>
    </div>
    <div id="submit_btn_box">
      <button class="btn btn-success" id="submitBtn" type="button" onclick="submitFormBtn();">사진 추가하기</button>
      <%--    <button class="btn btn-success" id="submitButton" type="button">사진 추가하기</button>--%>
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
<script>
  (function () { var w = window; if (w.ChannelIO) { return w.console.error("ChannelIO script included twice."); } var ch = function () { ch.c(arguments); }; ch.q = []; ch.c = function (args) { ch.q.push(args); }; w.ChannelIO = ch; function l() { if (w.ChannelIOInitialized) { return; } w.ChannelIOInitialized = true; var s = document.createElement("script"); s.type = "text/javascript"; s.async = true; s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js"; var x = document.getElementsByTagName("script")[0]; if (x.parentNode) { x.parentNode.insertBefore(s, x); } } if (document.readyState === "complete") { l(); } else { w.addEventListener("DOMContentLoaded", l); w.addEventListener("load", l); } })();

  ChannelIO('boot', {
    "pluginKey": "3e438b51-7087-4b0c-b50f-c1cb50c8f770"
  });



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


      // 파일을 배열에 추가
      for (let i = 0; i < files.length; i++) {
        const file = files[i];
        filesArr.push({file, wasteInfoNo});
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



    if (imgCount.get(tr) > 4) {
      alert('이미지는 물품당 4개까지 첨부할 수 있습니다.');
      e.target.value = '';
      imgCount.set(tr, 4);
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
    if (imgPreview.children.length + e.currentTarget.files.length > 4) {
      alert('이미지는 한장씩 첨부할 수 있습니다.');
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

    // 각 행(tr)마다 이미지 업로드 확인 및 FormData에 추가
    formLists.forEach(formList => {
      const uploadFiles = Array.from(formList.querySelectorAll('.uploadImg'));

      // 이미지 첨부 여부를 확인
      if (uploadFiles.length < 1) {
        allRowsHaveImages = false; // 이미지가 없는 행이 있음을 표시
        if (!alertShown) {
          alert('최소한 한 장의 이미지를 첨부해야 합니다.');
          alertShown = true; // 알림을 한 번만 표시
        }
        return;
      }

      const wasteInfoNo = uploadFiles[0].closest('tr').querySelector('.wasteInfoNo').value;

      const filesArrForTr = filesArr.filter(fileObj => fileObj.wasteInfoNo === wasteInfoNo);

      if (filesArrForTr.length < 1) {
        allRowsHaveImages = false; // 이미지가 없는 행이 있음을 표시
        if (!alertShown) {
          alert('각 행당 최소한 한 장의 이미지를 첨부해야 합니다.');
          alertShown = true; // 알림을 한 번만 표시
        }
        return;
      }

      // FormData에 해당 행(tr)의 이미지 파일 추가
      for (let i = 0; i < filesArrForTr.length; i++) {
        formData.append('file', filesArrForTr[i].file);
        formData.append('wasteInfoNo', filesArrForTr[i].wasteInfoNo);
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



    // // 각 .formList 요소를 순회하며 FormData에 파일 필드와 데이터 추가
    // formLists.forEach(function (formList) {
    //   const listId = formList.dataset.listId; // data-list-id 속성을 사용하여 리스트 ID 가져옴
    //   const wasteInfoNo = formList.querySelector('.wasteInfoNo').value;
    //   const fileInput = formList.querySelector('.uploadImg');
    //
    //   console.log("fileInput" + fileInput + wasteInfoNo);
    //
    //   if (fileInput && fileInput.files.length > 0) {
    //     formData.append("listId", listId);
    //     formData.append("wasteInfoNo", wasteInfoNo);
    //     for (let i = 0; i < fileInput.files.length; i++) {
    //       formData.append("uploadFiles[]", fileInput.files[i]);
    //     }
    //     hasFiles = true; // 이미지가 첨부되었음을 표시
    //     console.log("파일이 선택됨");
    //   } else {
    //     console.log("파일이 선택되지 않았음");
    //     hasFiles = false;
    //     return false; // 이미지가 첨부되지 않았을 때 폼 전송 중지
    //   }
    // });
    //
    // if (hasFiles) {
    //   console.log(formData);
    //   console.log(form);
    //
    //   console.log("uploadFiles: " + formData.get('uploadFiles[]'));
    //   console.log("wasteInfoNo: " + formData.get('wasteInfoNo'));
    //
    //   form.submit();
    //   for (const [key, value] of formData.entries()) {
    //     console.log(key + ": " + value);
    //   }
    // } else {
    //   alert('물품마다 이미지는 반드시 첨부해야 합니다.');
    // }

  }


</script>


</body>

</html>