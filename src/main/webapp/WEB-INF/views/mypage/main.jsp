<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>브링브링</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- JQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
    <link href="../resources/assets/css/mypage/mypage.css" rel="stylesheet">

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
                <h1>마이 페이지</h1>
                <div style="width: 100%;height: 30px;"></div>
                <h4 style="color: rgb(189, 245, 229);">내역을 편리하게 확인하고, 나만의 정보를 관리하는 특별한 공간입니다.</h4>
            </div>
            <div style="display: flex;flex-direction: row;justify-content: flex-end;">
                <img src="../resources/assets/img/mypage/mypage_book.png" style="width: 250px;" alt="">
            </div>
        </div>
    
    </section>

    <!-- 메인 -->
    <main>
        <div class="mypage_top m-auto rounded">
            <div class="mypage_top_div ps-5 pb-3 mt-3" style="height:75px;">
                <h1 class="d-inline">${userOne.userName }</h1>
                <div class="d-inline">
                    <a href="/user/update.do">
                        <img src="../resources/assets/img/mypage/mypage_gear.png" class="h-100 pb-3">
                    </a>
                </div>
            </div>

            <div class="container">
                <div class="row" style="min-height:750px;">
                    <div class="mypage_sidebar col-3 p-5">
                        <a href="/mypage/enroll.do" class="fs-1">신청 내역</a>
                        <a href="/mypage/inquire.do" class="fs-1">문의 내역</a>
                        <a href="#" class="fs-1">채팅 내역</a>
                    </div>
                    <div class="col-9 ps-5 pt-5">
                        <div class="mb-5">
                            <div class="d-inline">
                                <img src="${userOne.userProfilePath }" class="mypage_profile_img rounded-circle">
                            </div>
                            <div class="d-inline align-middle">
                                <h1 class="d-inline">${userOne.userName } </h1>
                                <p class="fs-4 d-inline">님 환영합니다~!</p>
                            </div>
                        </div>

                        <h3>최근 신청 내역</h3>
                        <div class="container recent_enroll_list">
                            <div class="row p-3 border rounded">
                                <div class="col-3">
                                    <p>2023-10-01</p>
                                    <img src="../resources/assets/img/mypage/Test_img.jpg" class="rounded">
                                </div>
                                <div class="col-6 mt-5">
                                    <h2>책상</h2>
                                    <p class="fs-4">예약 번호 1234-1234</p>
                                    <p class="fs-4">결재 금액 5,000원</p>
                                </div>
                                <div class="col-3 text-end">
                                    <!-- 상세보기 모달 -->
                                    <a href="#" data-bs-toggle="modal" data-bs-target="#enroll_modal">상세보기 >></a>
                                    <p class="fw-1 fs-1 pt-5">신청 완료</p>
                                </div>
                            </div>
                        </div>

                        <div class="container mt-5 p-0">
                            <h3>최근 문의 내역</h3>
                            <c:if test="${empty inquireList}">
                            	<p>최근 문의한 내역이 없습니다.</p>
                            </c:if>
                         	<c:if test="${!empty inquireList}" >
	                            <table class="table table-hover table-bordered">
	                                <colgroup>
	                                    <col width=8%>
	                                    <col width=51%>
	                                    <col width=15%>
	                                    <col width=14%>
	                                </colgroup>
	                                <thead class="table-light">
	                                    <tr>
	                                        <th class="text-center">번호</th>
	                                        <th>제목</th>
	                                        <th class="text-center">답변 여부</th>
	                                        <th class="text-center">작성일</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
		                                	<c:forEach var="inquire" items="${inquireList }" begin="0" end="1" varStatus="i">
			                                    <tr>
			                                        <td class="text-center">${i.count }</td>
			                                        <td>${inquire.inqTitle }</td>
			                                        <td class="text-center">
														<!-- fn:contains를 사용하여 문자열 비교 -->
			                                        	<c:choose>
			                                        		<c:when test="${fn:contains(inquire.answerYn, 'Y')}">답변 완료</c:when>
			                                        		<c:when test="${fn:contains(inquire.answerYn, 'N')}">답변 대기중</c:when>
			                                        	</c:choose>
			                                        </td>
			                                        <td class="text-center">
			                                        	<!-- LocalDateTime을 Date type으로 변경 후 format형태로 변형 -->
			                                        	<fmt:parseDate value="${inquire.inqCreateDate }"
			                                        		pattern="yyyy-MM-dd" var="parseDate" type="both" />
			                                        	<fmt:formatDate pattern="yyyy-MM-dd" value="${parseDate }" />
			                                        </td>
			                                    </tr>
		                                	</c:forEach>
	                                </tbody>
	                            </table>
                            </c:if>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="enroll_modal" tabindex="-1"
                    aria-labelledby="enroll_modal" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="enroll_modal_Label">상세 내역</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body container">
                        <div class="modal_border_bottom p-3">
                            <p>예약 번호 : 1234-1234</p>
                            <p class="m-0">예약 날짜 : 2023-10-01</p>
                        </div>
                        <div class="modal_border_bottom p-3">
                            <p class="fs-5">장소 : 서울특별시 중구 남대문로 120 그레이즈 청계</p>
                            <div class="row">
                                <div class="col-4 text-center">
                                    <img src="../resources/assets/img/mypage/Test_img.jpg" class="rounded">
                                </div>
                                <div class="col-8 row">
                                    <div class="col-10 pt-4">
                                        <h3>책상</h3>
                                    </div>
                                    <div class="col-6">
                                        <p>수량 :  1개</p>
                                    </div>
                                    <div class="col-6 text-end">
                                        <p>5,000원</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="">
                            <div class="row p-3 pb-0">
                                <div class="col">
                                    <p class="fs-4 m-0">총 결제 금액</p>
                                </div>
                                <div class="col">
                                    <p class="fs-4 m-0 text-end">5,000원</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button> -->
                        <input type="submit" id="findEmail_btn" class="cancel_reservation_btn w-100 text-center fw-bold fs-4 rounded mt-0" value="예약 취소">
                    </div>
                </div>
            </div>
        </div>
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

    <!-- Template Main JS File -->
    <script src="../resources/assets/js/main.js"></script>

    <!-- 채널톡 api -->
    <script>
        (function () { var w = window; if (w.ChannelIO) { return w.console.error("ChannelIO script included twice."); } var ch = function () { ch.c(arguments); }; ch.q = []; ch.c = function (args) { ch.q.push(args); }; w.ChannelIO = ch; function l() { if (w.ChannelIOInitialized) { return; } w.ChannelIOInitialized = true; var s = document.createElement("script"); s.type = "text/javascript"; s.async = true; s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js"; var x = document.getElementsByTagName("script")[0]; if (x.parentNode) { x.parentNode.insertBefore(s, x); } } if (document.readyState === "complete") { l(); } else { w.addEventListener("DOMContentLoaded", l); w.addEventListener("load", l); } })();

        ChannelIO('boot', {
            "pluginKey": "3e438b51-7087-4b0c-b50f-c1cb50c8f770"
        });

    </script>


</body>

</html>