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
        <h1>문의 관리</h1>
        <div style="width: 100%;height: 30px;"></div>
        <h4 style="color: rgb(189, 245, 229);">회원들이 작성한 문의 글을 조회 및 답변을 달아줄 수 있습니다.</h4>
      </div>
      <div style="display: flex;flex-direction: row;justify-content: flex-end;">
        <img src="../resources/assets/img/admin/page-icon5.png" style="width: 250px;" alt="">
      </div>
    </div>
  </section>

  <!-- 메인 -->
  <main>
      <section>
      <div style="display: flex; justify-content: space-between; margin-top:50px">
        <div>
          <h2>문의 게시글</h2>
        </div>
        <div class="input-group" style="width: 400px; height: 30px;">
          <select name="searchCondition" class="form-select" aria-label=".form-select-lg example" style="width: 20%;">
            <option value="all">전체</option>
            <option value="city">지역</option>
              <option value="id">작성자</option>
              <option value="category">문의유형</option>
          </select>
          <input type="search" class="form-control" placeholder="검색" aria-label="Search" name="searchKeyword" aria-describedby="search-addon" style="width: 50%;" />
          <button type="button" class="btn btn-outline-success" id="user-search-btn">검색</button>
        </div>
          <input type="hidden" name="pageName" value="${pInfo.currentPage}" />
      </div>
      <br/>
      <div style="display: flex; justify-content: space-between; align-items: baseline; margin: 15px 15px 0 15px; padding-top: 10px; padding-bottom: 10px; border-top:1px solid #ccc;">
          <h6><a href='javascript:void(0);' onclick="handleAnswerYLinkClick(${pInfo.currentPage});" class="answerY">답변 등록 글</a>&nbsp;&nbsp;|&nbsp;&nbsp; <a href='javascript:void(0);' onclick="handleAnswerNLinkClick(${pInfo.currentPage});" class="answerN">답변 미등록 글</a></h6>
          <select name="cityNo" id="cityNo" style="width:100px;margin-right: 15px;" onchange="handleCityChange(${pInfo.currentPage})">
              <option value="지역" selected>지역</option>
              <c:forEach var="city" items="${cList}" >
                  <option value="${city.cityNo}">${city.cityName}</option>
              </c:forEach>
          </select>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-md-12">
              <div class="table-responsive">
                <table id="inquireTable" class="table align-middle text-center">
                    <colgroup>
                        <col width="5%"/>
                        <col width="10%"/>
                        <col width="40%"/>
                        <col width="10%"/>
                        <col width="10%"/>
                        <col width="10%"/>
                        <col width="15%"/>
                    </colgroup>
                    <thead class="table-success align-middle">
                        <tr>
                            <th>글번호</th>
                            <th>작성자</th>
                            <th>제목</th>
                            <th>지역</th>
                            <th>문의유형</th>
                            <th>작성일</th>
                            <th>답변여부</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="inq" items="${inqList}" varStatus="i">
                        <tr>
                            <td>${inq.inqNo}</td>
                            <td>${inq.userId}</td>
                            <c:url var="detailUrl" value="/inquire/detail.do">
                                <c:param name="inqNo" value="${inq.inqNo}"></c:param>
                            </c:url>
                            <td><a href="${detailUrl}">${inq.inqTitle}</a></td>
                            <td>${inq.districtName}</td>
                            <td>${inq.inqCategory}</td>
                            <fmt:parseDate value="${inq.inqCreateDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parseDateTime" type="both" />
                            <td><fmt:formatDate value="${parseDateTime}" pattern="yyyy-MM-dd" /></td>
                            <td>${inq.answerYn}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
          </div>
        </div>
      </div>
      <div class="mt-5 d-flex justify-content-center">
          <nav aria-label="Page navigation exampler">
              <ul class="pagination">
                  <c:if test="${pInfo.startNavi ne '1' }">
                      <li class="page-item"><a class="page-link" href="/admin/contactList.do?page=${pInfo.startNavi-1 }" class="first"><i class="bi bi-chevron-left"></i></a></li>
                  </c:if>
                  <c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
                      <c:url var="pageUrl" value="/admin/contactList.do">
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
                      <li class="page-item"><a class="page-link" href="/admin/contactList.do?page=${pInfo.endNavi+1 }" class="last"><i class="bi bi-chevron-right"></i></a></li>
                  </c:if>
              </ul>
          </nav>
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


    //답변 등록글 불러오기
    function handleAnswerYLinkClick(pageNumber) {
        var answerYn = 'Y';
        $.ajax({
            type: 'POST',
            url:  '/admin/inquireAnswer.do?page=' + pageNumber,
            data: {answerYn: answerYn},
            dataType: 'json',
            success: function (data) {
                var inqList = data.inqList; // 서버에서 받은 inqList 배열

                // 테이블 바디를 찾습니다
                var tbody = $('#inquireTable tbody');
                tbody.empty(); // 기존 tbody 내용을 지웁니다.

                // 서버에서 받은 JSON 데이터를 사용하여 새로운 행을 생성하고 테이블에 추가합니다
                for (var i = 0; i < inqList.length; i++) {
                    var inq = inqList[i];
                    var row = '<tr>';
                    row += '<td>' + inq.inqNo + '</td>';
                    row += '<td>' + inq.userId + '</td>';
                    row += '<td><a href="/inquire/detail.do?inqNo=' + inq.inqNo + '">' + inq.inqTitle + '</a></td>';
                    row += '<td>' + inq.districtName + '</td>';
                    row += '<td>' + inq.inqCategory + '</td>';

                    // 날짜 포맷에 따라서 수정
                    var inqCreateDate = new Date(inq.inqCreateDate);
                    var formattedDate = inqCreateDate.getFullYear() + '-' +
                        ('0' + (inqCreateDate.getMonth() + 1)).slice(-2) + '-' +
                        ('0' + inqCreateDate.getDate()).slice(-2);

                    row += '<td>' + formattedDate + '</td>';
                    row += '<td>' + inq.answerYn + '</td>';
                    row += '</tr>';
                    tbody.append(row); // 새로운 행을 추가합니다.
                }

                // 페이징 처리
                var pageInfo = data.pageInfo;
                var paginationContainer = $('.pagination');
                paginationContainer.empty(); // 기존 페이징 UI를 비웁니다.

                if (pageInfo.startNavi !== 1) {
                    paginationContainer.append('<li class="page-item"><a class="page-link" href="/admin/contactList.do?page=' + (pageInfo.startNavi - 1) + '"><i class="bi bi-chevron-left"></i></a></li>');
                }

                for (var i = pageInfo.startNavi; i <= pageInfo.endNavi; i++) {
                    if (i === pageInfo.currentPage) {
                        paginationContainer.append('<li class="page-item active"><a class="page-link" href="/admin/contactList.do?page=' + i + '" style="background-color:#00AD7C; border-color: #00AD7C">' + i + '</a></li>');
                    } else {
                        paginationContainer.append('<li class="page-item"><a class="page-link" href="/admin/contactList.do?page=' + i + '">' + i + '</a></li>');
                    }
                }

                if (pageInfo.endNavi !== pageInfo.naviTotalCount) {
                    paginationContainer.append('<li class="page-item"><a class="page-link" href="/admin/contactList.do?page=' + (pageInfo.endNavi + 1) + '"><i class="bi bi-chevron-right"></i></a></li>');
                }
                $('#user-search-btn').on('click', function(event) {
                    var searchCondition = $('select[name="searchCondition"]').val();
                    var searchKeyword = $('input[name="searchKeyword"]').val();
                    event.preventDefault();
                    if (searchCondition !== null && searchCondition !== '') {
                        $.ajax({
                            type: 'POST',
                            url: '/admin/inquireSearch.do?page=' + pageNumber,
                            data: {searchCondition: searchCondition, searchKeyword: searchKeyword},
                            dataType: 'json',
                            async: false,
                            success: function (searchData) {
                                var inqList = searchData.inqList; // searchData에서 데이터를 가져와야 합니다.
                                var pageInfo = searchData.pInfo; // searchData에서 데이터를 가져와야 합니다.

                                // 테이블 바디를 찾습니다
                                var tbody = $('#inquireTable tbody');
                                tbody.empty(); // 기존 tbody 내용을 지웁니다.

                                // 서버에서 받은 JSON 데이터를 사용하여 새로운 행을 생성하고 테이블에 추가합니다
                                for (var i = 0; i < inqList.length; i++) {
                                    var inq = inqList[i];
                                    var row = '<tr>';
                                    row += '<td>' + inq.inqNo + '</td>';
                                    row += '<td>' + inq.userId + '</td>';
                                    row += '<td><a href="/inquire/detail.do?inqNo=' + inq.inqNo + '">' + inq.inqTitle + '</a></td>';
                                    row += '<td>' + inq.districtName + '</td>';
                                    row += '<td>' + inq.inqCategory + '</td>';

                                    // 날짜 포맷에 따라서 수정
                                    var inqCreateDate = new Date(inq.inqCreateDate);
                                    var formattedDate = inqCreateDate.getFullYear() + '-' +
                                        ('0' + (inqCreateDate.getMonth() + 1)).slice(-2) + '-' +
                                        ('0' + inqCreateDate.getDate()).slice(-2);

                                    row += '<td>' + formattedDate + '</td>';
                                    row += '<td>' + inq.answerYn + '</td>';
                                    row += '</tr>';
                                    tbody.append(row); // 새로운 행을 추가합니다.
                                }

                                var paginationContainer = $('.pagination');
                                paginationContainer.empty(); // 기존 페이징 UI를 비웁니다.

                                if (pageInfo.startNavi !== 1) {
                                    paginationContainer.append('<li class="page-item"><a class="page-link" href="/admin/contactList.do?page=' + (pageInfo.startNavi - 1) + '"><i class="bi bi-chevron-left"></i></a></li>');
                                }

                                for (var i = pageInfo.startNavi; i <= pageInfo.endNavi; i++) {
                                    if (i === pageInfo.currentPage) {
                                        paginationContainer.append('<li class="page-item active"><a class="page-link" href="/admin/contactList.do?page=' + i + '" style="background-color:#00AD7C; border-color: #00AD7C">' + i + '</a></li>');
                                    } else {
                                        paginationContainer.append('<li class="page-item"><a class="page-link" href="/admin/contactList.do?page=' + i + '">' + i + '</a></li>');
                                    }
                                }

                                if (pageInfo.endNavi !== pageInfo.naviTotalCount) {
                                    paginationContainer.append('<li class="page-item"><a class="page-link" href="/admin/contactList.do?page=' + (pageInfo.endNavi + 1) + '"><i class="bi bi-chevron-right"></i></a></li>');
                                }
                            },

                            error: function (error) {
                                alert("두 번째 에이잭스 오류");
                                console.error('Error:', error);
                            }
                        });
                    }
                });
                $('.answerN').removeClass('text-success');
                $('.answerY').addClass('text-success');
            },
            error: function (error) {
                // 오류 발생 시의 처리
                console.error('Error:', error);
            }
        });

        $(document).ready(function() {
            $('.pagination').on('click', '.page-link', function(event) {
                event.preventDefault();
                var pageNumber = $(this).attr('href').split('=')[1]; // 페이지 번호 추출
                handleAnswerYLinkClick(pageNumber);
            });
        });
    }

    function handleAnswerNLinkClick(pageNumber) {
        var answerYn = 'N';
        $.ajax({
            type: 'POST',
            url:  '/admin/inquireAnswer.do?page=' + pageNumber,
            data: {answerYn: answerYn},
            dataType: 'json',
            success: function (data) {
                var inqList = data.inqList; // 서버에서 받은 inqList 배열

                // 테이블 바디를 찾습니다
                var tbody = $('#inquireTable tbody');
                tbody.empty(); // 기존 tbody 내용을 지움

                // 서버에서 받은 JSON 데이터를 사용하여 새로운 행을 생성하고 테이블에 추가
                for (var i = 0; i < inqList.length; i++) {
                    var inq = inqList[i];
                    var row = '<tr>';
                    row += '<td>' + inq.inqNo + '</td>';
                    row += '<td>' + inq.userId + '</td>';
                    row += '<td><a href="/inquire/detail.do?inqNo=' + inq.inqNo + '">' + inq.inqTitle + '</a></td>';
                    row += '<td>' + inq.districtName + '</td>';
                    row += '<td>' + inq.inqCategory + '</td>';

                    // 날짜 포맷에 따라서 수정
                    var inqCreateDate = new Date(inq.inqCreateDate);
                    var formattedDate = inqCreateDate.getFullYear() + '-' +
                        ('0' + (inqCreateDate.getMonth() + 1)).slice(-2) + '-' +
                        ('0' + inqCreateDate.getDate()).slice(-2);

                    row += '<td>' + formattedDate + '</td>';
                    row += '<td>' + inq.answerYn + '</td>';
                    row += '</tr>';
                    tbody.append(row); // 새로운 행 추가
                }

                // 페이징 처리
                var pageInfo = data.pageInfo;
                var paginationContainer = $('.pagination');
                paginationContainer.empty(); // 기존 페이징 UI를 비움

                if (pageInfo.startNavi !== 1) {
                    paginationContainer.append('<li class="page-item"><a class="page-link" href="/admin/contactList.do?page=' + (pageInfo.startNavi - 1) + '"><i class="bi bi-chevron-left"></i></a></li>');
                }

                for (var i = pageInfo.startNavi; i <= pageInfo.endNavi; i++) {
                    if (i === pageInfo.currentPage) {
                        paginationContainer.append('<li class="page-item active"><a class="page-link" href="/admin/contactList.do?page=' + i + '" style="background-color:#00AD7C; border-color: #00AD7C">' + i + '</a></li>');
                    } else {
                        paginationContainer.append('<li class="page-item"><a class="page-link" href="/admin/contactList.do?page=' + i + '">' + i + '</a></li>');
                    }
                }

                if (pageInfo.endNavi !== pageInfo.naviTotalCount) {
                    paginationContainer.append('<li class="page-item"><a class="page-link" href="/admin/contactList.do?page=' + (pageInfo.endNavi + 1) + '"><i class="bi bi-chevron-right"></i></a></li>');
                }
                $('#user-search-btn').on('click', function(event) {
                    var searchCondition = $('select[name="searchCondition"]').val();
                    var searchKeyword = $('input[name="searchKeyword"]').val();
                    event.preventDefault();
                    if (searchCondition !== null && searchCondition !== '') {
                        $.ajax({
                            type: 'POST',
                            url: '/admin/inquireSearch.do?page=' + pageNumber,
                            data: {searchCondition: searchCondition, searchKeyword: searchKeyword},
                            dataType: 'json',
                            async: false,
                            success: function (searchData) {
                                var inqList = searchData.inqList;
                                var pageInfo = searchData.pInfo;

                                // 테이블 바디를 찾습니다
                                var tbody = $('#inquireTable tbody');
                                tbody.empty(); // 기존 tbody 내용을 지웁니다.

                                // 서버에서 받은 JSON 데이터를 사용하여 새로운 행을 생성하고 테이블에 추가합니다
                                for (var i = 0; i < inqList.length; i++) {
                                    var inq = inqList[i];
                                    var row = '<tr>';
                                    row += '<td>' + inq.inqNo + '</td>';
                                    row += '<td>' + inq.userId + '</td>';
                                    row += '<td><a href="/inquire/detail.do?inqNo=' + inq.inqNo + '">' + inq.inqTitle + '</a></td>';
                                    row += '<td>' + inq.districtName + '</td>';
                                    row += '<td>' + inq.inqCategory + '</td>';

                                    // 날짜 포맷에 따라서 수정
                                    var inqCreateDate = new Date(inq.inqCreateDate);
                                    var formattedDate = inqCreateDate.getFullYear() + '-' +
                                        ('0' + (inqCreateDate.getMonth() + 1)).slice(-2) + '-' +
                                        ('0' + inqCreateDate.getDate()).slice(-2);

                                    row += '<td>' + formattedDate + '</td>';
                                    row += '<td>' + inq.answerYn + '</td>';
                                    row += '</tr>';
                                    tbody.append(row); // 새로운 행을 추가합니다.
                                }

                                var paginationContainer = $('.pagination');
                                paginationContainer.empty(); // 기존 페이징 UI를 비웁니다.

                                if (pageInfo.startNavi !== 1) {
                                    paginationContainer.append('<li class="page-item"><a class="page-link" href="/admin/contactList.do?page=' + (pageInfo.startNavi - 1) + '"><i class="bi bi-chevron-left"></i></a></li>');
                                }

                                for (var i = pageInfo.startNavi; i <= pageInfo.endNavi; i++) {
                                    if (i === pageInfo.currentPage) {
                                        paginationContainer.append('<li class="page-item active"><a class="page-link" href="/admin/contactList.do?page=' + i + '" style="background-color:#00AD7C; border-color: #00AD7C">' + i + '</a></li>');
                                    } else {
                                        paginationContainer.append('<li class="page-item"><a class="page-link" href="/admin/contactList.do?page=' + i + '">' + i + '</a></li>');
                                    }
                                }

                                if (pageInfo.endNavi !== pageInfo.naviTotalCount) {
                                    paginationContainer.append('<li class="page-item"><a class="page-link" href="/admin/contactList.do?page=' + (pageInfo.endNavi + 1) + '"><i class="bi bi-chevron-right"></i></a></li>');
                                }
                            },

                            error: function (error) {
                                alert("두 번째 에이잭스 오류");
                                console.error('Error:', error);
                            }
                        });
                    }
                });

                $('.answerY').removeClass('text-success'); // 기존의 success 클래스를 삭제
                $('.answerN').addClass('text-success'); // 새로운 success 클래스를 추가

            },
            error: function (error) {
                // 오류 발생 시의 처리
                console.error('Error:', error);
            }
        });

        $(document).ready(function() {
            $('.pagination').on('click', '.page-link', function(event) {
                event.preventDefault();
                var pageNumber = $(this).attr('href').split('=')[1]; // 페이지 번호 추출
                handleAnswerNLinkClick(pageNumber);
            });
        });
    }

    function handleCityChange(pageNumber) {
        var cityNo = document.getElementById("cityNo").value;
        $.ajax({
            type: 'POST',
            url: '/admin/inquireCity.do?page=' + pageNumber,
            data: { cityNo: cityNo },
            dataType: 'json',
            success: function (data) {
                console.log(data);
                var inqList = data.inqList; // 서버에서 받은 inqList 배열

                // 테이블 바디를 찾습니다
                var tbody = $('#inquireTable tbody');
                tbody.empty(); // 기존 tbody 내용을 지웁니다.

                // 서버에서 받은 JSON 데이터를 사용하여 새로운 행을 생성하고 테이블에 추가합니다
                for (var i = 0; i < inqList.length; i++) {
                    var inq = inqList[i];
                    var row = '<tr>';
                    row += '<td>' + inq.inqNo + '</td>';
                    row += '<td>' + inq.userId + '</td>';
                    row += '<td><a href="/inquire/detail.do?inqNo=' + inq.inqNo + '">' + inq.inqTitle + '</a></td>';
                    row += '<td>' + inq.districtName + '</td>';
                    row += '<td>' + inq.inqCategory + '</td>';

                    // 날짜 포맷에 따라서 수정
                    var inqCreateDate = new Date(inq.inqCreateDate);
                    var formattedDate = inqCreateDate.getFullYear() + '-' +
                        ('0' + (inqCreateDate.getMonth() + 1)).slice(-2) + '-' +
                        ('0' + inqCreateDate.getDate()).slice(-2);

                    row += '<td>' + formattedDate + '</td>';
                    row += '<td>' + inq.answerYn + '</td>';
                    row += '</tr>';
                    tbody.append(row); // 새로운 행을 추가합니다.
                }

                // 페이징 처리
                var pageInfo = data.pageInfo;
                var paginationContainer = $('.pagination');
                paginationContainer.empty(); // 기존 페이징 UI를 비웁니다.

                if (pageInfo.startNavi !== 1) {
                    paginationContainer.append('<li class="page-item"><a class="page-link" href="/admin/contactList.do?page=' + (pageInfo.startNavi - 1) + '"><i class="bi bi-chevron-left"></i></a></li>');
                }

                for (var i = pageInfo.startNavi; i <= pageInfo.endNavi; i++) {
                    if (i === pageInfo.currentPage) {
                        paginationContainer.append('<li class="page-item active"><a class="page-link" href="/admin/contactList.do?page=' + i + '" style="background-color:#00AD7C; border-color: #00AD7C">' + i + '</a></li>');
                    } else {
                        paginationContainer.append('<li class="page-item"><a class="page-link" href="/admin/contactList.do?page=' + i + '">' + i + '</a></li>');
                    }
                }

                if (pageInfo.endNavi !== pageInfo.naviTotalCount) {
                    paginationContainer.append('<li class="page-item"><a class="page-link" href="/admin/contactList.do?page=' + (pageInfo.endNavi + 1) + '"><i class="bi bi-chevron-right"></i></a></li>');
                }
                $('#user-search-btn').on('click', function(event) {
                    var searchCondition = $('select[name="searchCondition"]').val();
                    var searchKeyword = $('input[name="searchKeyword"]').val();
                    event.preventDefault();
                    if (searchCondition !== null && searchCondition !== '') {
                        $.ajax({
                            type: 'POST',
                            url: '/admin/inquireSearch.do?page=' + pageNumber,
                            data: {searchCondition: searchCondition, searchKeyword: searchKeyword},
                            dataType: 'json',
                            async: false,
                            success: function (searchData) {
                                var inqList = searchData.inqList; // searchData에서 데이터를 가져와야 합니다.
                                var pageInfo = searchData.pInfo; // searchData에서 데이터를 가져와야 합니다.

                                // 테이블 바디를 찾습니다
                                var tbody = $('#inquireTable tbody');
                                tbody.empty(); // 기존 tbody 내용을 지웁니다.

                                // 서버에서 받은 JSON 데이터를 사용하여 새로운 행을 생성하고 테이블에 추가합니다
                                for (var i = 0; i < inqList.length; i++) {
                                    var inq = inqList[i];
                                    var row = '<tr>';
                                    row += '<td>' + inq.inqNo + '</td>';
                                    row += '<td>' + inq.userId + '</td>';
                                    row += '<td><a href="/inquire/detail.do?inqNo=' + inq.inqNo + '">' + inq.inqTitle + '</a></td>';
                                    row += '<td>' + inq.districtName + '</td>';
                                    row += '<td>' + inq.inqCategory + '</td>';

                                    // 날짜 포맷에 따라서 수정
                                    var inqCreateDate = new Date(inq.inqCreateDate);
                                    var formattedDate = inqCreateDate.getFullYear() + '-' +
                                        ('0' + (inqCreateDate.getMonth() + 1)).slice(-2) + '-' +
                                        ('0' + inqCreateDate.getDate()).slice(-2);

                                    row += '<td>' + formattedDate + '</td>';
                                    row += '<td>' + inq.answerYn + '</td>';
                                    row += '</tr>';
                                    tbody.append(row); // 새로운 행을 추가합니다.
                                }

                                var paginationContainer = $('.pagination');
                                paginationContainer.empty(); // 기존 페이징 UI를 비웁니다.

                                if (pageInfo.startNavi !== 1) {
                                    paginationContainer.append('<li class="page-item"><a class="page-link" href="/admin/contactList.do?page=' + (pageInfo.startNavi - 1) + '"><i class="bi bi-chevron-left"></i></a></li>');
                                }

                                for (var i = pageInfo.startNavi; i <= pageInfo.endNavi; i++) {
                                    if (i === pageInfo.currentPage) {
                                        paginationContainer.append('<li class="page-item active"><a class="page-link" href="/admin/contactList.do?page=' + i + '" style="background-color:#00AD7C; border-color: #00AD7C">' + i + '</a></li>');
                                    } else {
                                        paginationContainer.append('<li class="page-item"><a class="page-link" href="/admin/contactList.do?page=' + i + '">' + i + '</a></li>');
                                    }
                                }

                                if (pageInfo.endNavi !== pageInfo.naviTotalCount) {
                                    paginationContainer.append('<li class="page-item"><a class="page-link" href="/admin/contactList.do?page=' + (pageInfo.endNavi + 1) + '"><i class="bi bi-chevron-right"></i></a></li>');
                                }
                            },

                            error: function (error) {
                                alert("두 번째 에이잭스 오류");
                                console.error('Error:', error);
                            }
                        });
                    }
                });
                $('.answerY').removeClass('text-success'); // 기존의 success 클래스를 삭제
                $('.answerN').removeClass('text-success'); // 새로운 success 클래스를 추가

            },
            error: function (error) {
                // 오류 발생 시의 처리
                console.error('Error:', error);
            }
        });
        $(document).ready(function() {
            $('.pagination').on('click', '.page-link', function(event) {
                event.preventDefault();
                var pageNumber = $(this).attr('href').split('=')[1]; // 페이지 번호 추출
                handleCityChange(pageNumber);
            });
        });
    }

    $('#user-search-btn').on('click', function(event) {
        var searchCondition = $('select[name="searchCondition"]').val();
        var searchKeyword = $('input[name="searchKeyword"]').val();
        var pageNumber = $('input[name="pageName"]').val();
        event.preventDefault();
        if (searchCondition !== null && searchCondition !== '') {
            $.ajax({
                type: 'POST',
                url: '/admin/inquireSearch.do?page=' + pageNumber,
                data: {searchCondition: searchCondition, searchKeyword: searchKeyword},
                dataType: 'json',
                async: false,
                success: function (searchData) {
                    var inqList = searchData.inqList; // searchData에서 데이터를 가져와야 합니다.
                    var pageInfo = searchData.pInfo; // searchData에서 데이터를 가져와야 합니다.

                    // 테이블 바디를 찾습니다
                    var tbody = $('#inquireTable tbody');
                    tbody.empty(); // 기존 tbody 내용을 지웁니다.

                    // 서버에서 받은 JSON 데이터를 사용하여 새로운 행을 생성하고 테이블에 추가합니다
                    for (var i = 0; i < inqList.length; i++) {
                        var inq = inqList[i];
                        var row = '<tr>';
                        row += '<td>' + inq.inqNo + '</td>';
                        row += '<td>' + inq.userId + '</td>';
                        row += '<td><a href="/inquire/detail.do?inqNo=' + inq.inqNo + '">' + inq.inqTitle + '</a></td>';
                        row += '<td>' + inq.districtName + '</td>';
                        row += '<td>' + inq.inqCategory + '</td>';

                        // 날짜 포맷에 따라서 수정
                        var inqCreateDate = new Date(inq.inqCreateDate);
                        var formattedDate = inqCreateDate.getFullYear() + '-' +
                            ('0' + (inqCreateDate.getMonth() + 1)).slice(-2) + '-' +
                            ('0' + inqCreateDate.getDate()).slice(-2);

                        row += '<td>' + formattedDate + '</td>';
                        row += '<td>' + inq.answerYn + '</td>';
                        row += '</tr>';
                        tbody.append(row); // 새로운 행을 추가합니다.
                    }

                    var paginationContainer = $('.pagination');
                    paginationContainer.empty(); // 기존 페이징 UI를 비웁니다.

                    if (pageInfo.startNavi !== 1) {
                        paginationContainer.append('<li class="page-item"><a class="page-link" href="/admin/contactList.do?page=' + (pageInfo.startNavi - 1) + '"><i class="bi bi-chevron-left"></i></a></li>');
                    }

                    for (var i = pageInfo.startNavi; i <= pageInfo.endNavi; i++) {
                        if (i === pageInfo.currentPage) {
                            paginationContainer.append('<li class="page-item active"><a class="page-link" href="/admin/contactList.do?page=' + i + '" style="background-color:#00AD7C; border-color: #00AD7C">' + i + '</a></li>');
                        } else {
                            paginationContainer.append('<li class="page-item"><a class="page-link" href="/admin/contactList.do?page=' + i + '">' + i + '</a></li>');
                        }
                    }

                    if (pageInfo.endNavi !== pageInfo.naviTotalCount) {
                        paginationContainer.append('<li class="page-item"><a class="page-link" href="/admin/contactList.do?page=' + (pageInfo.endNavi + 1) + '"><i class="bi bi-chevron-right"></i></a></li>');
                    }
                },

                error: function (error) {
                    alert("검색 에이잭스 오류");
                    console.error('Error:', error);
                }
            });
            $(document).ready(function() {
                $('.pagination').on('click', '.page-link', function(event) {
                    event.preventDefault();
                    var pageNumber = $(this).attr('href').split('=')[1]; // 페이지 번호 추출
                    handleCityChange(pageNumber);
                });
            });
        }

    });


  </script>
  
  
</body>

</html>