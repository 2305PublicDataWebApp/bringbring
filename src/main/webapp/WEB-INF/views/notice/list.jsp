<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>브링브링</title>
  <meta content="" name="description">
  <meta content="" name="keywords">


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
  <link href="../resources/assets/vendor/bootstrap/css/bootstrap.notice.css" rel="stylesheet">


  <!-- Template Main CSS File -->
  <link href="../resources/assets/css/style.css" rel="stylesheet">
  <link href="../resources/assets/css/common.css" rel="stylesheet">
  <link href="../resources/assets/css/notice/list.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Arsha
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/arsha-free-bootstrap-html-template-corporate/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  
</head>

<body>

  <!-- ======= Header ======= -->
  <jsp:include page="/include/header.jsp"></jsp:include>
  
  
  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center" style="width: 100%;margin: 0 auto;">
    <div style="width: 1300px;margin: 0 auto;">
      <div style="float: left;margin-top: 60px;">
        <h1>공지사항</h1>
        <div style="width: 100%;height: 30px;"></div>
        <h4 style="color: rgb(189, 245, 229);">브링브링의 업데이트 정보 등 다양한 소식을 알려드립니다.</h4>
      </div>
      <div style="display: flex;flex-direction: row;justify-content: flex-end;">
        <img src="../resources/assets/img/notice/free-icon-noticeboard-3000428.png" style="width: 250px;" alt="">
      </div>
    </div>

  </section>

  <!-- <div style="width: 100%;height: 1000px;"></div> -->
  <!-- End Hero -->

  <!-- 메인 -->
	<main id="main" class="main">
		<!-- 카테고리 메뉴 -->
		<div class="head">
			<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="pills-all-tab"
						data-bs-toggle="pill" data-bs-target="#pills-all" type="button"
						role="tab" aria-controls="pills-all" aria-selected="true"
						value="all">전체</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="pills-service-tab"
						data-bs-toggle="pill" data-bs-target="#pills-service"
						type="button" role="tab" aria-controls="pills-service"
						aria-selected="false" value="service">서비스</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="pills-update-tab"
						data-bs-toggle="pill" data-bs-target="#pills-update" type="button"
						role="tab" aria-controls="pills-update" aria-selected="false"
						value="update">업데이트</button>
				</li>
			</ul>

			<form class="d-flex" action="notice/search.do" method="get">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search" name="searchKeyword">
				<button class="btn btn-outline-success" type="submit">검색</button>
			</form>
		</div>

		<!-- 테이블 -->
		<div class="tab-content" id="noticeContent">
			<div class="tab-pane fade show active" id="pills-all" role="tabpanel"
				aria-labelledby="all-tab">
				<div class="col-lg-12">
					<table class="table table-hover text-center">
						<thead class="table-light">
							<tr>
								<th scope="row">No</th>
								<th scope="row">카테고리</th>
								<th scope="row">지역</th>
								<th scope="row">제목</th>
								<th scope="row">조회수</th>
								<th scope="row">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="notice" items="${noticeList }" varStatus="n">
								<c:if test="${not empty notice.noticeCreateDate}">
									<c:set var="currentDate"
										value="<%=java.time.LocalDate.now()%>" />
									<c:set var="sevenDaysAgo" value="${currentDate.minusDays(7)}" />
									<tr>
										<th scope="row">${n.count }</th>
										<td>${notice.noticeType}</td>
										<td>지역</td>
										<c:url var="detailUrl" value="/notice/detail.do">
											<c:param name="noticeNo" value="${notice.noticeNo }" />
										</c:url>
										<td style="width: 641.15px;"><a href="${detailUrl }"
											onclick="increaseViewCount(${notice.noticeNo});">
												${notice.noticeTitle } <c:if
													test="${notice.noticeCreateDate.isAfter(sevenDaysAgo)}">
													<img src="../resources/assets/img/notice/new_icon.png"
														style="width: 20px; height: 20px;" />
												</c:if>
										</a></td>
										<td id="noticeViewCount_${notice.noticeNo }">${notice.noticeViewCount }
										</td>
										<td>${notice.noticeCreateDate}</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
 			<div class="tab-pane fade" id="pills-service" role="tabpanel"
				aria-labelledby="service-tab">
				<div class="col-lg-12">
					<table class="table table-hover text-center">
						<thead class="table-light">
							<tr>
								<th scope="row">No</th>
								<th scope="row">카테고리</th>
								<th scope="row">지역</th>
								<th scope="row">제목</th>
								<th scope="row">조회수</th>
								<th scope="row">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="notice" items="${noticeList }" varStatus="n">
								<c:if test="${notice.noticeType eq 'service' }">
									<tr>
										<th scope="row">${n.count }</th>
										<td>${notice.noticeType}</td>
										<td>지역</td>
										<c:url var="detailUrl" value="/notice/detail.do">
											<c:param name="noticeNo" value="${notice.noticeNo }" />
										</c:url>
										<td style="width: 641.15px;"><a href="${detailUrl }"
											onclick="increaseViewCount(${notice.noticeNo});">
												${notice.noticeTitle } <c:if
													test="${notice.noticeCreateDate.isAfter(sevenDaysAgo)}">
													<img src="../resources/assets/img/notice/new_icon.png"
														style="width: 20px; height: 20px;" />
												</c:if>
										</a></td>
										<td id="noticeViewCount_${notice.noticeNo }">${notice.noticeViewCount }
										</td>
										<td>${notice.noticeCreateDate}</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="tab-pane fade" id="pills-update" role="tabpanel"
				aria-labelledby="update-tab">
				<div class="col-lg-12">
					<table class="table table-hover text-center">
						<thead class="table-light">
							<tr>
								<th scope="row">No</th>
								<th scope="row">카테고리</th>
								<th scope="row">지역</th>
								<th scope="row">제목</th>
								<th scope="row">조회수</th>
								<th scope="row">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="notice" items="${noticeList }" varStatus="n">
								<c:if test="${notice.noticeType eq 'update' }">
									<tr>
										<th scope="row">${n.count }</th>
										<td>${notice.noticeType}</td>
										<td>지역</td>
										<c:url var="detailUrl" value="/notice/detail.do">
											<c:param name="noticeNo" value="${notice.noticeNo }" />
										</c:url>
										<td style="width: 641.15px;"><a href="${detailUrl }"
											onclick="increaseViewCount(${notice.noticeNo});">
												${notice.noticeTitle } <c:if
													test="${notice.noticeCreateDate.isAfter(sevenDaysAgo)}">
													<img src="../resources/assets/img/notice/new_icon.png"
														style="width: 20px; height: 20px;" />
												</c:if>
										</a></td>
										<td id="noticeViewCount_${notice.noticeNo }">${notice.noticeViewCount }
										</td>
										<td>${notice.noticeCreateDate}</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- 글쓰기버튼 관리자만 보임 -->
		<c:if test="${sessionScope.sessionUserGrade >=2 }">
			<button type="button" class="btn btn-success"
				onclick="showNoticeInsert()">글쓰기</button>
		</c:if>
		<!-- 페이징 -->
		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<c:if test="${pInfo.startNavi != 1 }">
					<li class="page-item">
								<c:url var="preUrl" value="/notice/list.do">
				<c:param name="page" value="${pInfo.startNavi-1  }" />
			</c:url><a class="page-link"
						href="#" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span></a></li>
				</c:if>
				
				<c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }"
					var="p">
					<c:url var="pageUrl" value="/notice/list.do">
						<c:param name="page" value="${p }"></c:param>
					</c:url>
					<c:choose>
						<c:when test="${p == pInfo.currentPage}">
							<li class="page-item active"><a href="${pageUrl}"
								class="page-link" style="background-color: #00AD7C">${p}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a href="${pageUrl}" class="page-link">${p}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:if test="${pInfo.endNavi != pInfo.naviTotalCount }">
					<li class="page-item">
								<c:url var="nextUrl" value="/notice/list.do">
				<c:param name="page" value="${pInfo.startEndNavi+1  }" />
			</c:url><a class="page-link"
						href="#" aria-label="Next"><span aria-hidden="true">다음</span></a></li>
				</c:if>
			</ul>
		</nav>

	</main>
	<!-- End #main -->

  <!-- ======= Footer ======= -->
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
	<!-- 기능 script -->
	<script>
		function showNoticeInsert() {
			location.href = "/notice/insert.do"
		}
		
	</script>


</body>

</html>