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
        <h1>관리자 관리</h1>
        <div style="width: 100%;height: 30px;"></div>
        <h4 style="color: rgb(189, 245, 229);">관리자 리스트와 관리자를 해임할 수 있는 페이지입니다.</h4>
      </div>
      <div style="display: flex;flex-direction: row;justify-content: flex-end;">
        <img src="../resources/assets/img/admin/page-icon.png" style="width: 250px;" alt="">
      </div>
    </div>
  </section>

  <!-- 메인 -->
  <main>
    <section>
      <div class="row">
        <div class="four col-md-3">
          <div class="counter-box colored">
            <h4>회원 수 : ${userCount}</h4>
          </div>
        </div>
        <div class="col-md-3">
          <div class="counter-box colored">
              <h4>관리자 수 : ${adminCount}</h4>
          </div>
        </div>
        <div class="col-md-3">
          <div class="counter-box colored">
              <h4>탈퇴한 회원 : ${deletedUser}</h4>
          </div>
        </div>
        <div class="col-md-3">
          <button onclick="location.href='/admin/memberList.do'" class="region-btn" style="width: 300px; height: 80px; border: none;">
            <h4>회원 조회</h4>
          </button>
        </div>
      </div>
    </section>
    <section>
      <div style="display: flex; justify-content: space-between">
        <div>
          <h2>관리자 리스트</h2>
        </div>
        <form action="/admin/searchAdmin.do" method="GET">
        <div class="input-group" style="width: 400px; height: 30px;">
          <select name="searchCondition" class="form-select" aria-label=".form-select-lg example" style="width: 20%;">
            <option value="all" <c:if test="${searchCondition =='all'}">selected</c:if>>전체</option>
            <option value="id" <c:if test="${searchCondition =='id'}">selected</c:if>>아이디</option>
            <option value="number" <c:if test="${searchCondition =='number'}">selected</c:if>>회원번호</option>
            <option value="phone" <c:if test="${searchCondition =='phone'}">selected</c:if>>전화번호</option>
            <option value="region" <c:if test="${searchCondition =='region'}">selected</c:if>>관활지역</option>
          </select>
          <input type="text" class="form-control" placeholder="검색" name="searchKeyword" value="${searchKeyword}" aria-label="Search" aria-describedby="search-addon" style="width: 50%;" />
          <input type="submit" class="btn btn-outline-success" id="user-serch-btn" value="검색"></input>
        </div>
        </form>
      </div>
      <br/>
      <div class="table-responsive">
        <table class="table align-middle text-center">
            <thead class="table-success align-middle">
                <tr>
                    <th>관리자 번호</th>
                    <th>회원 아이디</th>
                    <th>담당자 번호</th>
                    <th>관리자 임명일</th>
                    <th>관할 지역</th>
                    <th>-</th>
                </tr>
            </thead>
          <tbody>
          <c:forEach var="admin" items="${searchList}" varStatus="a">
            <tr>
              <td>${admin.adminNo}</td>
              <td>${admin.userId}</td>
              <td>${admin.userPhone}</td>
              <td>${admin.adminCreateDate}</td>
              <td>${admin.regionName}</td>
              <td>
              <c:if test="${admin.adminNo ne 1}">
                <button class="btn btn-success" onclick="confirmAdminRemoval(${admin.userNo})">관리자 해임</button>
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
                <li class="page-item"><a class="page-link" href="/admin/searchAdmin.do?page=${pInfo.startNavi-1 }" class="first"><i class="bi bi-chevron-left"></i></a></li>
              </c:if>
              <c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
                <c:url var="pageUrl" value="/admin/searchAdmin.do">
                  <c:param name="page" value="${p }"></c:param>
                  <c:param name="searchCondition" value="${searchCondition}"/>
                  <c:param name="searchKeyword" value="${searchKeyword}"/>
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
                <li class="page-item"><a class="page-link" href="/admin/searchAdmin.do?page=${pInfo.endNavi+1 }" class="last"><i class="bi bi-chevron-right"></i></a></li>
              </c:if>
            </ul>
          </nav>
        </div>
    </div>
    </section>
  </main>
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
  <script src="../resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.10.2/umd/popper.min.js"></script>


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

    //관리자 해임
    function confirmAdminRemoval(userNo) {
      var confirmation = confirm("정말로 관리자를 해임하시겠습니까?");
      if (confirmation) {
        $.ajax({
          url: '/admin/adminDelete.do',
          type: 'POST',
          data: { userNo: userNo },
          success: function(response) {
            console.log(response);
            if (response ==="success") {
              alert("관리자가 성공적으로 해임되었습니다.");
              location.reload();
            } else {
              alert("관리자 해임에 실패하였습니다. 다시 시도해주세요.");
            }
          },
          error: function(error) {
            alert("오류가 발생하였습니다. 다시 시도해주세요.");
          }
        });
      }
    }
  </script>


</body>

</html>