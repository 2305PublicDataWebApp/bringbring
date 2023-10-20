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
<div style="width: 100%;height: 1000px;">

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
                    <input type="file" name="uploadFiles" class="uploadImg" accept="image/*" required multiple="multiple" style="display: none;">
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

  // input 요소의 이미지 업로드 이벤트 처리
  function handlerInputChange(e) {
    // input 요소와 가장 가까이 있는 tr 찾기
    const tr = e.target.closest('tr');

    // tr에 대한 imgCount를 0으로 설정
    imgCount.set(tr, 0);

    if (!imgCount.has(tr)) {
      imgCount.set(tr, 0);
    }

    imgCount.set(tr, imgCount.get(tr) + 1);

    console.log('추가한 이미지' + imgCount.get(tr));

    if (imgCount.get(tr) > 2) {
      alert('이미지는 물품당 2개까지 첨부할 수 있습니다.');
      e.target.value = '';
      imgCount.set(tr, 2);
    }
  }

  imgUploads.forEach((input) => {
    input.addEventListener('change', function (e) {
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
    const files = e.currentTarget.files;
    const imgPreview = e.target.closest('tr').querySelector('.img-preview');
    const docFrag = new DocumentFragment();

    // 파일 갯수 검사
    if (imgPreview.children.length + e.currentTarget.files.length > 1) {
      alert('이미지는 한장씩 첨부할 수 있습니다.');
      e.target.value = '';
      return;
    }


    // 이미지 파일만 처리
    const imageFiles = Array.from(e.currentTarget.files).filter(file => file.type.match("image/.*"));
    for (const imageFile of imageFiles) {
      const reader = new FileReader();
      reader.onload = (e) => {
        const preview = createElement(e, imageFile);
        imgPreview.appendChild(preview);
      };
      reader.readAsDataURL(imageFile);
    }

    // 이미지를 추가한 후 현재 파일 목록을 업데이트
    // e.target.value = ''; // 파일 input 초기화
  }

  // 미리보기 생성
  function createElement(e, file) {
    let tr = e.target;

    // for (let i = 0; i < tr.length; i++) {
    //   let cellValue = tr[i].innerHTML; // or cells[i].textContent.
    //   console.log(cellValue);
    // }

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
    console.log("아");

    // 모든 .formList 요소를 선택
    const formLists = document.querySelectorAll('.formList');

    // FormData를 현재 폼에 설정
    const form = document.getElementById('uploadForm');
    form.enctype = 'multipart/form-data';
    form.method = 'POST';

    // FormData를 폼에 설정
    const formData = new FormData();

    let hasFiles = false; // 이미지 첨부 여부를 나타내는 변수

    // 각 .formList 요소를 순회하며 FormData에 파일 필드와 데이터 추가
    formLists.forEach(function (formList) {
      const listId = formList.dataset.listId; // data-list-id 속성을 사용하여 리스트 ID 가져옴
      const wasteInfoNo = formList.querySelector('.wasteInfoNo').value;
      const fileInput = formList.querySelector('.uploadImg');

      console.log("fileInput" + fileInput + wasteInfoNo);

      if (fileInput && fileInput.files.length > 0) {
        formData.append("listId", listId);
        formData.append("wasteInfoNo", wasteInfoNo);
        for (let i = 0; i < fileInput.files.length; i++) {
          formData.append("uploadFiles[]", fileInput.files[i]);
        }
        hasFiles = true; // 이미지가 첨부되었음을 표시
        console.log("파일이 선택됨");
      } else {
        console.log("파일이 선택되지 않았음");
        hasFiles = false;
        return false; // 이미지가 첨부되지 않았을 때 폼 전송 중지
      }
    });

    if (hasFiles) {
      console.log(formData);
      console.log(form);

      console.log("uploadFiles: " + formData.get('uploadFiles[]'));
      console.log("wasteInfoNo: " + formData.get('wasteInfoNo'));

      form.submit();
      for (const [key, value] of formData.entries()) {
        console.log(key + ": " + value);
      }
    } else {
      alert('물품마다 이미지는 반드시 첨부해야 합니다.');
    }

  }






  // 파일 업로드 필드에서 파일을 추가한 후 파일 읽어보는 코드
  // const file = formData.get('uploadFiles');
  //
  // if (file instanceof File) {
  //   const reader = new FileReader();
  //
  //   reader.onload = function (e) {
  //     const fileContents = e.target.result;
  //     console.log("File Contents: " + fileContents);
  //   };
  //
  //   reader.readAsText(file); // 파일을 텍스트로 읽음
  // }









  // // 파일 업로드 필드와 업로드 버튼 요소 가져오기
  // const fileInputs = document.querySelectorAll('.uploadFiles');
  // const uploadButton = document.getElementById('submitButton');
  // const form = document.getElementById('uploadForm');
  //
  // console.log(uploadButton);
  //
  // // 업로드 버튼 클릭 이벤트 리스너 추가
  // uploadButton.addEventListener('click', async () => {
  //   const formData = new FormData();
  //
  //   // 모든 파일 업로드 필드에서 선택한 파일을 FormData에 추가
  //   fileInputs.forEach(input => {
  //     const files = input.files;
  //     for (let i = 0; i < files.length; i++) {
  //       formData.append('uploadedFiles', files[i]);
  //       console.log(formData.get('uploadedFiles'));
  //     }
  //   });
  //
  //   formData.forEach((value, key) => {
  //     console.log(key, value);
  //   });
  //
  //   // 서버로 데이터를 보내는 부분
  //   try {
  //     const response = await fetch('/reservation/addImage.do', {
  //       method: 'POST',
  //       body: formData,
  //     });
  //
  //     if (response.ok) {
  //       // 성공적으로 업로드되었을 때 수행할 작업
  //       console.log('파일 업로드 성공');
  //     } else {
  //       console.error('파일 업로드 실패');
  //     }
  //   } catch (error) {
  //     console.error('파일 업로드 중 오류 발생', error);
  //   }
  // });
  //
  //


</script>


</body>

</html>