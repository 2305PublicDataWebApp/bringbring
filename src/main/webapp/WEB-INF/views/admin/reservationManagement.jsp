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
  <!--  달력-->
  <!--  <link rel="stylesheet" href="../../../resources/assets/css/reservation/bootstrap-material-datetimepicker.css" />-->
  <!--  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">-->
  <%--  얘 지우면 작동은 되는데 뭔가 이상한 오류가 뜸--%>
  <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
  <!--  <link rel="stylesheet" href="/css/jquery-ui.min.css">-->
  <!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>-->
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

  <%--  얘 지우면 작동 안됨--%>
  <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
  <%--  <script type='text/javascript' src='../../../resources/assets/js/reservation/jquery-1.8.3.js'></script>--%>


  <!-- 얘 지우면 오류도 안 나고 작동도 안됨 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
  <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>


  <%--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css"/>--%>
  <%--  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>--%>



  <!-- 달력 한글로 출력 js 파일-->
  <script src="../../../resources/assets/js/reservation/bootstrap-datepicker.kr.js" charset="UTF-8"></script>



  <%--  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepickr/1.9.0/js/bootstrap-datepicker.min.js">--%>

  <%--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker3.min.css">--%>
</head>

<body>

<!-- 헤더 -->
<jsp:include page="/include/header.jsp"></jsp:include>

  <div style="width: 100%;height: 74px;"></div>
  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center" style="width: 100%;margin: 0 auto;">
    <div style="width: 1300px;margin: 0 auto;">
      <div style="float: left;margin-top: 60px;">
        <h1>수거 관리</h1>
        <div style="width: 100%;height: 30px;"></div>
        <h4 style="color: rgb(189, 245, 229);">회원들의 예약정보를 관리할 수 있습니다.</h4>
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
          <button onclick="location.href='/admin/localRvList.do?regionNo=' + ${sessionScope.sessionRegionNo}" class="region-btn" style="width: 300px; height: 80px; border: none;">
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
          <select class="form-select"  name="searchCondition" aria-label=".form-select-lg example" style="width: 20%;" id="searchCriteria">
            <option value="district">배출지역</option>
            <option value="applicationDate">신청일</option>
            <option value="reservationDate">예약일</option>
            <option value="completion">상태</option>
          </select>
          <input type="text" id="datepicker" class="form-control" placeholder="검색" aria-label="Search" aria-describedby="search-addon" name="searchKeyword" style="width: 50%;" />
          <button type="button" class="btn btn-outline-success" id="user-search-btn">검색</button>
        </div>
        <input type="hidden" name="pageName" value="${pInfo.currentPage}" />
      </div>
      <br/>
      <div class="table-responsive">
        <table id="reservationTable" class="table align-middle text-center">
          <colgroup>
            <col width="10%"/>
            <col width="15%"/>
            <col width="15%"/>
            <col width="15%"/>
            <col width="15%"/>
            <col width="15%"/>
            <col width="15%"/>
          </colgroup>
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
              <td>${res.reservation.rvApplicationDate}</td>
              <td>${res.reservation.rvRvDate}</td>
              <td>${res.pay.isPayStatus}</td>
              <td>
                <c:if test="${sessionScope.sessionRegionNo eq res.region.regionNo}">
                  <c:if test="${res.reservation.isRvCompletion.toString() eq 'Y'}">
                    <button type="button" class="btn btn-light" onclick="redirectToReservationDetail(${res.reservation.rvNo})">
                      예약완료
                    </button>
                  </c:if>
                <c:if test="${res.reservation.isRvCompletion.toString() eq 'N'}">
                  <button type="button" class="btn btn-success" onclick="redirectToReservationDetail(${res.reservation.rvNo})">
                    예약접수
                  </button>
                </c:if>
                </c:if>
                <c:if test="${sessionScope.sessionRegionNo ne res.region.regionNo}">
                  타 지역 접수건
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
<jsp:include page="/include/chatBot.jsp"></jsp:include>
  <script>

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

    function redirectToReservationDetail(rvNo) {
      var url = '/admin/reservationDetail.do?rvNo=' + rvNo;
      window.location.href = url;
    }


    $(function() {
      var datePicker = $("#datepicker").datepicker({
        language: "kr",
        calendarWeeks: false,
        todayHighlight: true,
        autoclose: true,
        startDate: '-1m',
        endDate: '+1m',
        daysOfWeekDisabled: [0, 6],
        format: "yyyy-mm-dd",
        autoHide: true
      });

      $("#searchCriteria").change(function() {
        var selectedValue = $(this).val();
        var title = "";
        if (selectedValue === "applicationDate" || selectedValue === "reservationDate") {
          title = selectedValue === "applicationDate" ? "선택일" : "예약일";
          datePicker.datepicker("setDate", new Date());
          $("#datepicker").datepicker("show");
        } else if (selectedValue === "completion") {
          title = "예약 상태";
          datePicker.datepicker("hide");
          var status = prompt("예약 상태를 선택하세요. (Y 또는 N) / Y=예약완료, N=에약접수)", "N");
          if (status !== null && (status === 'Y' || status === 'N')) {
            performSearch(selectedValue, status);
          } else if (status !== null) {
            alert("올바른 예약 상태를 입력하세요. (Y 또는 N)");
          }
        } else {
          title = selectedValue === "district" ? "배출지역" : "";
          datePicker.datepicker("hide");
        }
        $("#datepickerTitle").text(title);
      });


      $("#datepicker").focus(function() {
        datePicker.datepicker("hide");
      });

      // $("#user-search-btn").click(function() {
      //   var selectedCriteria = $("#searchCriteria").val();
      //   if (selectedCriteria === "completion") {
      //     var status = prompt("예약 상태를 선택하세요. (Y 또는 N) / Y=예약완료, N=에약접수)", "N");
      //     if (status !== null && (status === 'Y' || status === 'N')) {
      //       performSearch(selectedCriteria, status);
      //     } else if (status !== null) {
      //       alert("올바른 예약 상태를 입력하세요. (Y 또는 N)");
      //     }
      //   } else {
      //     performSearch(selectedCriteria, $("#datepicker").val());
      //   }
      // });

      // 검색을 수행하는 함수
      function performSearch(criteria, status) {
        console.log("검색 기준:", criteria);
        console.log("선택한 상태:", status);

        // 검색어를 검색 input에 설정
        var searchInput = status; // 여기에 검색 로직을 추가하여 검색어를 가져오세요.
        $("#datepicker").val(searchInput); // 선택한 상태를 검색 input에 설정
      }
    });

    function performSearch(pageNumber) {
      var searchCondition = $('select[name="searchCondition"]').val();
      var searchKeyword = $('input[name="searchKeyword"]').val();

      // AJAX 요청
      $.ajax({
        type: 'POST',
        url: '/admin/reservationSearch.do?page=' + pageNumber,
        data: {searchCondition: searchCondition, searchKeyword: searchKeyword},
        dataType: 'json',
        async: false,
        success: function (searchData) {
          var reservationList = searchData.reservationList;
          var pageInfo = searchData.pInfo;

          // 테이블 바디를 찾습니다
          var tbody = $('#reservationTable tbody');
          tbody.empty(); // 기존 tbody 내용을 지웁니다.

          // 서버에서 받은 JSON 데이터를 사용하여 새로운 행을 생성하고 테이블에 추가합니다
          for (var i = 0; i < reservationList.length; i++) {
            var res = reservationList[i];
            var row = "<tr>" +
                    "<td>" + res.reservation.rvNo + "</td>" +
                    "<td>" + res.reservation.rvName + "</td>" +
                    "<td>" + res.district.districtName + "</td>" +
                    "<td>" + res.reservation.rvApplicationDate + "</td>" +
                    "<td>" + res.reservation.rvRvDate + "</td>" +
                    "<td>" + res.pay.isPayStatus + "</td>" +
                    "<td>";
            if (res.reservation.isRvCompletion.toString() === 'Y') {
              row += "<button type='button' class='btn btn-light' onclick='redirectToReservationDetail(" + res.reservation.rvNo + ")'>예약완료</button>";
            } else {
              row += "<button type='button' class='btn btn-success' onclick='redirectToReservationDetail(" + res.reservation.rvNo + ")'>예약접수</button>";
            }
            row += "</td></tr>";

            tbody.append(row);
          }

          var paginationContainer = $('.pagination');
          paginationContainer.empty(); // 기존 페이징 UI를 비웁니다.

          if (pageInfo.startNavi !== 1) {
            paginationContainer.append('<li class="page-item"><a class="page-link" href="#" data-page="' + (pageInfo.startNavi - 1) + '"><i class="bi bi-chevron-left"></i></a></li>');
          }

          for (var i = pageInfo.startNavi; i <= pageInfo.endNavi; i++) {
            if (i === pageInfo.currentPage) {
              paginationContainer.append('<li class="page-item active"><a class="page-link" href="#" data-page="' + i + '" style="background-color:#00AD7C; border-color: #00AD7C">' + i + '</a></li>');
            } else {
              paginationContainer.append('<li class="page-item"><a class="page-link" href="#" data-page="' + i + '">' + i + '</a></li>');
            }
          }

          if (pageInfo.endNavi !== pageInfo.naviTotalCount) {
            paginationContainer.append('<li class="page-item"><a class="page-link" href="#" data-page="' + (pageInfo.endNavi + 1) + '"><i class="bi bi-chevron-right"></i></a></li>');
          }

          // 페이지 번호 클릭 이벤트 핸들러 등록
          paginationContainer.find('.page-link').on('click', function(event) {
            event.preventDefault();
            var pageNumber = $(this).data('page');
            performSearch(pageNumber); // 검색 함수 호출
          });
        },
        error: function (error) {
          alert("검색 에이잭스 오류");
          console.error('Error:', error);
        }
      });
    }

    // 검색 버튼 클릭 이벤트 핸들러
    $('#user-search-btn').on('click', function(event) {
      event.preventDefault();
      var pageNumber = 1; // 검색 시 페이지 번호를 1로 초기화
      performSearch(pageNumber); // 검색 함수 호출
    });

    // 페이지 로드 시 기본 검색 실행
    $(document).ready(function () {
      var pageNumber = 1; // 페이지 번호를 1로 초기화
      performSearch(pageNumber); // 검색 함수 호출
    });



  </script>



</body>

</html>