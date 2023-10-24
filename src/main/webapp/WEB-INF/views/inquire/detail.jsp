<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>브링브링</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <link href="../resources/assets/img/main/icon-title.png" rel="icon">
  <link href="../resources/assets/img/main/icon-title.png" rel="apple-touch-icon">


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
</head>

<body>

  <!-- 헤더 -->
  <jsp:include page="/include/header.jsp"></jsp:include>

  <div style="width: 100%;height: 74px;"></div>
    
  <main style="width: 100%;margin: 0 auto;padding-top: 50px;">
    
    

    <div style="width: 850px;margin: 0 auto;">
      <!-- 프로필 영역 -->
      <div  data-aos="fade-up" style="width: 100%;height: 130px;border-bottom: 2px solid #ccc;border-top: 2px solid #ccc;">
        <div style="float: left;">
          <img style="width: 50px;height: 50px;margin-top: 35px;margin-left: 10px;" src="../resources/assets/img/divide/free-icon-user-847969.png" alt="">
        </div>
        <div style="float: left;padding: 35px 15px;">
          <h5>${inqDetail.user.userName}</h5>
          <p>${inqDetail.city.cityName} ${inqDetail.district.districtName}</p>
        </div>
        <div style="display: flex;float: right;height: 100%;flex-direction: column;justify-content: space-evenly;">
          <c:if test="${sessionId eq inqDetail.user.userId}">
            <button onclick="goUpdate();" type="button" class="btn btn-success">글 수정</button>
            <button onclick="goDelete();" type="button" class="btn btn-success">글 삭제</button>
          </c:if>
        </div>
      </div>
      <!-- 제목 영역 -->
      <div data-aos="fade-up" style="width: 100%;border-bottom: 1px solid #ccc;">
        <div style="padding: 35px 15px;">
          <h3>${inqDetail.inquire.inqTitle}</h3>
          <p style="margin-bottom: 5px;">카테고리 : ${inqDetail.inquire.inqCategory}</p>
          <p style="margin: 0px;">
            <fmt:parseDate value="${inqDetail.inquire.inqCreateDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parseDateTime1" type="both" />
            <fmt:formatDate value="${parseDateTime1}" pattern="yyyy. MM. dd." />
          </p>
        </div>
      </div>
      <!-- 내용 영역 -->
      <div data-aos="fade-up" style="width: 100%; border-bottom: 2px solid #ccc; display: flex; flex-direction: column; align-items: flex-end;background-color: #eee;">
        <div style="padding: 35px">
          <div style="border: none; outline: none; width: 780px;padding: 10px;background-color: white;" readonly>
            <div style="width: 100%;height: 150px;display: flex;margin-bottom: 20px;">
              <c:forEach var="image" items="${iList}">
                  <a href="${image.imagePath}" download>
                    <img src="${image.imagePath}" style="width: 200px; height: 150px; border: 1px solid #ccc; border-radius: 10px; margin-right: 10px;">
                  </a>
              </c:forEach>
            </div>
            ${inqDetail.inquire.inqContent}
          </div>
        </div>
      </div>      
    </div>
    <div data-aos="fade-up">
      <div style="width: 850px;height: 130px;border-bottom: 1px solid #ccc;border-top: 2px solid #ccc;margin: 0 auto;margin-top: 200px;">
        <div style="padding-top: 35px;padding-left: 15px;float: left;">
          <h4>답변</h4>
          <p>${inqDetail.city.cityName} ${inqDetail.district.districtName} 관리자</p>
        </div>
        <div id="btnArea" style="display: flex;float: right;height: 100%;flex-direction: column;justify-content: center;">
          <c:if test="${inqDetail.district.regionNo eq sessionScope.sessionRegionNo}">
            <c:if test="${inqDetail.answer.ansContent eq null}">
              <button type="button" onclick="showInsertAnswer(this);" class="btn btn-success">답변 추가</button>
            </c:if>
            <c:if test="${inqDetail.answer.ansContent ne null}">
              <button type="button" class="btn btn-success">답변 수정</button>
            </c:if>
          </c:if>
        </div>
      </div>
<%--      답변이 안달렸을 떄--%>
      <c:if test="${inqDetail.answer.ansContent eq null}">
        <form name="insertForm" action="/answer/insert.do" method="post">
            <c:if test="${admin.userNo ne null && admin.userNo ne 0}">
              <input type="hidden" name="userNo" value="${admin.userNo}">
            </c:if>
            <input type="hidden" name="inqNo" value="${inqDetail.inquire.inqNo}">
            <input type="hidden" name="inqNo" value="${inqDetail.inquire.inqNo}">
            <div style="width: 850px;margin: 0 auto;">
              <div style="width: 100%; border-bottom: 2px solid #ccc; display: flex; flex-direction: column; align-items: flex-end;background-color: #eee;">
                <div id="ansContentArea" style="padding: 35px;display:none;">
                  <textarea name="ansContent" cols="86" rows="15" style="resize: none; border: none; outline: none; width: 100%;padding: 10px;" placeholder="답변을 입력해주세요"></textarea>
                </div>
              </div>
                <p id="ansContentMessage" style="padding: 30px 10px;">아직 답변이 등록되지 않았습니다.</p>
            </div>
        </form>
      </c:if>
<%--      답변이 안달렸을 때--%>
      <%--      답변이 달렸을 때--%>
      <c:if test="${inqDetail.answer.ansContent ne null}">
        <form name="updateForm" action="/answer/update.do" method="post">
          <div style="width: 850px;margin: 0 auto;">
            <div style="width: 100%; border-bottom: 2px solid #ccc; display: flex; flex-direction: column; align-items: flex-end;background-color: #eee;">
              <div id="ansContentAreaUpdate" style="padding: 35px;display:none;">
                  <div style="border: none; outline: none; width: 780px;height: 380px;padding: 10px;background-color: white;" name="ansContent" readonly>${inqDetail.answer.ansContent}</div>
              </div>
            </div>
          </div>
        </form>
      </c:if>
      <%--      답변이 달렸을 때--%>
    </div>
    <div style="margin: 0 auto;text-align: center;margin-top: 100px;" data-aos="fade-up">
      <button type="button" class="btn btn-success btn-lg" onclick="goList();">목록으로</button>
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

  <script>
    (function () { var w = window; if (w.ChannelIO) { return w.console.error("ChannelIO script included twice."); } var ch = function () { ch.c(arguments); }; ch.q = []; ch.c = function (args) { ch.q.push(args); }; w.ChannelIO = ch; function l() { if (w.ChannelIOInitialized) { return; } w.ChannelIOInitialized = true; var s = document.createElement("script"); s.type = "text/javascript"; s.async = true; s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js"; var x = document.getElementsByTagName("script")[0]; if (x.parentNode) { x.parentNode.insertBefore(s, x); } } if (document.readyState === "complete") { l(); } else { w.addEventListener("DOMContentLoaded", l); w.addEventListener("load", l); } })();

    ChannelIO('boot', {
      "pluginKey": "3e438b51-7087-4b0c-b50f-c1cb50c8f770"
    });

    <!-- 로그인, 로그아웃 -->
    <jsp:include page="/include/loginJs.jsp"></jsp:include>

    function showInsertAnswer(obj) {
      // Get the parent div element
      document.getElementById("ansContentArea").style.display="block";
      document.getElementById("ansContentMessage").style.display="none";
      var parentDiv = obj.parentElement;

      // Clear the contents of the parent div
      parentDiv.innerHTML = '';

      // Create the "글 등록" button
      var insertButton = document.createElement('button');
      insertButton.type = 'button';
      insertButton.className = 'btn btn-success';
      insertButton.innerText = '답변 등록';
      insertButton.addEventListener('click', function() {
        insertAnswer();
      });
      insertButton.style.marginBottom = "12px";
      var backBtn = document.createElement('button');
      backBtn.type = 'button';
      backBtn.className = 'btn btn-success';
      backBtn.innerText = '취소';
      backBtn.addEventListener('click', function() {
        btnBack();
      });

      // Append the "글 등록" button to the parent div
      parentDiv.appendChild(insertButton);
      parentDiv.appendChild(backBtn);
    }
  function btnBack() {
    document.getElementById("ansContentArea").style.display="none";
    document.getElementById("ansContentMessage").style.display="block";
    document.getElementById("btnArea").innerHTML = '';
    var createButton = document.createElement('button');
    createButton.type = 'button';
    createButton.className = 'btn btn-success';
    createButton.innerText = '답변 추가';
    createButton.addEventListener('click', function() {
      showInsertAnswer(this);
    });
    document.getElementById("btnArea").appendChild(createButton);
  }

    function goUpdate() {
      location.href = "/inquire/update.do?inqNo=${inqDetail.inquire.inqNo}";
    }
    function goDelete() {
      if(confirm("문의 글을 삭제하시겠습니까?")){
        location.href = "/inquire/delete.do?inqNo=${inqDetail.inquire.inqNo}";
      }
    }
    function goList() {
      location.href = "/inquire/list.do";
    }
  </script>
  <!-- 채널톡 api -->

</body>

</html>