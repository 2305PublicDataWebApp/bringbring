<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>브링브링</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- JQuery -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
  <link href="../resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="../resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="../resources/assets/css/style.css" rel="stylesheet">
  <link href="../resources/assets/css/common.css" rel="stylesheet">
  <link href="../resources/assets/css/admin/management.css" rel="stylesheet">
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
  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center" style="width: 100%;margin: 0 auto;">
    <div style="width: 1300px;margin: 0 auto;">
      <div style="float: left;margin-top: 60px;">
        <h1>배출 관리</h1>
        <div style="width: 100%;height: 30px;"></div>
        <h4 style="color: rgb(189, 245, 229);">회원들이 예약한 배출 정보를 관리할 수 있습니다.</h4>
      </div>
      <div style="display: flex;flex-direction: row;justify-content: flex-end;">
        <img src="../resources/assets/img/admin/page-icon3.png" style="width: 250px;" alt="">
      </div>
    </div>
  </section>

  <!-- 메인 -->
  <main>
    <section>
      <div class="row">
        <div class="four col-md-3">
          <div class="counter-box colored">
            <h4>누적신청수  : ${resCount}</h4>
          </div>
        </div>
        <div class="col-md-3">
          <div class="counter-box colored">
              <h4>신청접수 : ${resCountX}</h4>
          </div>
        </div>
        <div class="col-md-3">
          <div class="counter-box colored">
              <h4>예약완료 : ${resCountY}</h4>
          </div>
        </div>
        <div class="col-md-3">
          <button onclick="location.href='/admin/localM.do'" class="region-btn" style="width: 300px; height: 80px; border: none;">
              <h4>관할 지역조회</h4> 
          </button>
          </div>
        </div>
    </section>
    <section>
      <div style="display: flex; justify-content: space-between">
        <div>
          <h2>예약 내역</h2>
        </div>
        <div class="input-group" style="width: 400px; height: 30px;">
          <select class="form-select" aria-label=".form-select-lg example" style="width: 20%;">
            <option selected>배출지역</option>
            <option value="1">신청일</option>
            <option value="2">주소</option>
          </select>
          <input type="search" class="form-control" placeholder="검색" aria-label="Search" aria-describedby="search-addon" style="width: 50%;" />
          <button type="button" class="btn btn-outline-success" id="user-serch-btn">검색</button>
        </div>
      </div>
      <br/>
      <div class="table-responsive">
        <table class="table align-middle text-center">
            <thead class="table-success align-middle">
                <tr>
                    <th>예약 번호</th>
                    <th>신청자</th>
                    <th>배출지역</th>
                    <th>신청일</th>
                    <th>예약일</th>
                    <th>결제여부</th>
                    <th>상태</th>
                </tr>
            </thead>
          <tbody>
          <c:forEach var="res" items="${resList}" varStatus="r">
            <tr>
              <td>${res.reservation.rvNo}</td>
              <td>${res.reservation.rvName}</td>
              <td>${res.district.districtName}</td>
              <fmt:parseDate value="${res.reservation.rvApplicationDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parseDateTime" type="both" />
              <td><fmt:formatDate value="${parseDateTime}" pattern="yyyy-MM-dd" /></td>
              <td>${res.reservation.rvRvDate}</td>
              <td>${res.pay.isPayStatus}</td>
              <td>
                  <c:if test="${res.reservation.isRvCompletion.toString() eq 'Y'}">
                      <p>접수완료</p>
                  </c:if>
                <c:if test="${res.reservation.isRvCompletion.toString() eq 'N'}">
                  <button type="button" class="btn btn-success" onclick="redirectToReservationDetail(${res.reservation.rvNo})">
                    예약처리
                  </button>
                </c:if>
              </td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
        <div class="mt-5 d-flex justify-content-center">
          <nav aria-label="Page navigation exampler">
            <ul class="pagination">
              <c:if test="${pInfo.startNavi ne '1' }">
                <li class="page-item"><a class="page-link" href="/admin/reservationList.do?page=${pInfo.startNavi-1 }" class="first"><i class="bi bi-chevron-left"></i></a></li>
              </c:if>
              <c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
                <c:url var="pageUrl" value="/admin/reservationList.do">
                  <c:param name="page" value="${p }"></c:param>
                </c:url>
                <c:choose>
                  <c:when test="${p == pInfo.currentPage}">
                    <li class="page-item active" ><a href="${pageUrl}" class="page-link" style="background-color:#00AD7C; border-color: #00AD7C">${p}</a></li>
                  </c:when>
                  <c:otherwise>
                    <li class="page-item"><a href="${pageUrl}" class="page-link">${p}</a></li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
              <c:if test="${pInfo.endNavi ne pInfo.naviTotalCount }">
                <li class="page-item"><a class="page-link" href="/admin/reservationList.do?page=${pInfo.endNavi+1 }" class="last"><i class="bi bi-chevron-right"></i></a></li>
              </c:if>
            </ul>
          </nav>
        </div>
    </div>
    </section>

  </main>
<!-- End #main -->

  <!-- 푸터 -->
  <jsp:include page="/include/footer.jsp"></jsp:include>nd Footer -->

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
  <script src="../resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>


  <!-- Template Main JS File -->
  <script src="../resources/assets/js/main.js"></script>

  <!-- 채널톡 api -->
  <script>
    (function () { var w = window; if (w.ChannelIO) { return w.console.error("ChannelIO script included twice."); } var ch = function () { ch.c(arguments); }; ch.q = []; ch.c = function (args) { ch.q.push(args); }; w.ChannelIO = ch; function l() { if (w.ChannelIOInitialized) { return; } w.ChannelIOInitialized = true; var s = document.createElement("script"); s.type = "text/javascript"; s.async = true; s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js"; var x = document.getElementsByTagName("script")[0]; if (x.parentNode) { x.parentNode.insertBefore(s, x); } } if (document.readyState === "complete") { l(); } else { w.addEventListener("DOMContentLoaded", l); w.addEventListener("load", l); } })();

    ChannelIO('boot', {
      "pluginKey": "3e438b51-7087-4b0c-b50f-c1cb50c8f770"
    });

    $(document).ready(function () {
      var trigger = $('.hamburger'),
          overlay = $('.overlay'),
          isClosed = false;
    
        trigger.click(function () {
          hamburger_cross();      
        });
    
        function hamburger_cross() {
    
          if (isClosed == true) {          
            overlay.hide();
            trigger.removeClass('is-open');
            trigger.addClass('is-closed');
            isClosed = false;
          } else {   
            overlay.show();
            trigger.removeClass('is-closed');
            trigger.addClass('is-open');
            isClosed = true;
          }
      }
      
      $('[data-toggle="offcanvas"]').click(function () {
            $('#wrapper').toggleClass('toggled');
      });  
    });

    function redirectToReservationDetail(reNo) {
      var url = '/admin/reservationDetail.do?reNo=' + reNo;
      window.location.href = url;
    }
  </script>


  
</body>

</html>