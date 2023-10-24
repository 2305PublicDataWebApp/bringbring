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
  <link href="../resources/assets/css/admin/emissionDetail.css" rel="stylesheet">
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

  <!-- 메인 -->
  <main>
    <section>
      <div style="display: flex; flex-direction: column; justify-content: space-between">
        <div style="margin: 0 auto; margin-top: 30px;">
          <h2>예약 상세 내역</h2>
        </div>
        <div>
          <div class="card" style="width: 600px; margin: 0 auto; border: none;">
            <div class="card-body">
                <c:forEach var="rdList" items="${rdList}">
              <table class="table align-middle text-center">
                  <colgroup>
                      <col width="20%">
                      <col width="25%">
                      <col width="20%">
                      <col width="35%">
                  </colgroup>
                  <tr>
                    <td class="trHead">예약 번호</td>
                    <td>${rdList.reservation.rvNo}</td>
                      <td class="trHead">예약 상세번호</td>
                      <td>${rdList.reservation.rvDischargeNo}</td>
                  </tr>
                  <tr>
                    <td class="trHead">예약자 이름</td>
                    <td>${rdList.reservation.rvName}</td>
                    <td class="trHead">아이디</td>
                    <td>${rdList.user.userId}</td>
                  </tr>
                  <tr>
                    <td class="trHead"> 신청 주소</td>
                    <td colspan="3">${rdList.reservation.rvAddr}</td>
                  </tr>
                  <tr>
                      <td class="trHead">상세 주소</td>
                      <td>${rdList.reservation.rvAddrDetail}</td>
                    <td class="trHead">배출지역</td>
                    <td>${rdList.district.districtName}</td>
                  </tr>
                  <tr>
                    <td class="trHead">신청일</td>
                    <td colspan="3">${rdList.reservation.rvApplicationDate}</td>
                  </tr>
                  <tr>
                    <td class="trHead">수거 예약일 </td>
                    <td colspan="3">${rdList.reservation.rvRvDate}</td>
                  </tr>
                  <tr>
                      <td class="trHead">종류</td>
                      <td>${rdList.wasteCategory.wasteCategoryName}</td>
                    <td class="trHead">수거 물품</td>
                    <td>${rdList.wasteType.wasteTypeName}</td>
                  </tr>
                  <tr>
                    <td class="trHead">결제 금액</td>
                    <td colspan="3">${rdList.pay.payAmount}원</td>
                  </tr>
                  <tr>
                    <td class="trHead">상태</td>
                      <c:if test="${rdList.reservation.isRvCompletion.toString() eq 'Y'}">
                          <td colspan="3">예약접수 완료</td>
                      </c:if>
                      <c:if test="${rdList.reservation.isRvCompletion.toString() eq 'N'}">
                          <td colspan="3">신청상태</td>
                      </c:if>
                  </tr>           
              </table>
                </c:forEach>
                <div style="display: flex; justify-content: space-around;;">
                    <c:forEach var="rdList" items="${rdList}" varStatus="status">
                        <c:choose>
                            <c:when test="${rdList.reservation.isRvCompletion.toString() eq 'Y'}">
                                <!-- 'Y'일 때는 버튼을 표시하지 않음 -->
                            </c:when>
                            <c:otherwise>
                                <button class="btn btn-success" style="width: 150px; height: 50px" onclick="submitReservation(${rdList.reservation.rvNo})">접수처리</button>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

<%--                <button class="btn btn-success" style="width: 150px; height: 50px"  onclick="submitReservation(${rvNo})">접수처리</button>--%>
                <button class="btn btn-success"  style="width: 150px;" onclick="goBack()">목록으로</button>
              </div>
            </div>
          </div>
        </div>
      </div>
      <br/>
  
    </section>

  </main>
<!-- End #main -->

  <!-- 푸터 -->
  <jsp:include page="/include/footer.jsp"></jsp:include>ooter -->

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

    function submitReservation(rvNo){
        window.location.href = '/admin/reservationUpdate.do?rvNo=' + rvNo;
        alert("예약접수 완료 : 수거업체에 예약정보를 전달하였습니다.");
    }

    function goBack() {
        window.history.back();
    }

  </script>
  
  
</body>

</html>