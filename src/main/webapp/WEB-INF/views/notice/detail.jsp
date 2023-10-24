<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

  <!-- Vendor CSS Files -->
  <link href="../resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="../resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="../resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/bootstrap/css/bootstrap.notice.css" rel="stylesheet">
  <link href='https://cdn-uicons.flaticon.com/uicons-brands/css/uicons-brands.css' rel='stylesheet'>

  <!-- Template Main CSS File -->
  <link href="../resources/assets/css/style.css" rel="stylesheet">
  <link href="../resources/assets/css/common.css" rel="stylesheet">
  <link href="../resources/assets/css/notice/detail.css" rel="stylesheet">

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
  
   <div style="width: 100%;height: 74px;"></div>
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
		<div class="head">
			<div class="notice-title">
				<h2>						
					<c:if test="${notice.noticeType == '서비스'}">[ ${notice.regionName}]</c:if>
					<c:if test="${notice.noticeType == '업데이트'}">[ 전체 ]</c:if> 
					${notice.noticeTitle }</h2>
			</div>
			<div class="notice-subtitle">
				<div class="notice-info">${notice.noticeCreateDate } |
					${notice.noticeType }</div>
				<div class="notice-btn">
				<c:url var="delUrl" value="/notice/delete.do">
					<c:param name="noticeNo" value="${notice.noticeNo }" />
				 	<c:param name="userNo" value="${notice.userNo }" />
				</c:url>
				<c:url var="modiUrl" value="/notice/update.do">
					<c:param name="noticeNo" value="${notice.noticeNo }" />
					<c:param name="userNo" value="${notice.userNo }" />
				</c:url>
					<!-- 관리자만 보이는 버튼 -->
			<c:if test="${sessionScope.sessionUserGrade >=2 }">
					<button class="btn btn-primary" onclick="showUpdateNotice('${modiUrl}');">수정하기</button>
					<button class="btn btn-primary"
						onclick="deleteNotice('${delUrl}');">삭제하기</button>
			</c:if>
				</div>
			</div>
			<div class="icon">
				<li><i class="material-symbols-outlined" onclick="copyURL()">share</i>
				</li>
				<li><i class="fi fi-brands-twitter" onclick="shareTwitter()"></i>
				</li>
				<li><i class="fi fi-brands-facebook" onclick="shareFacebook()"></i>
				</li>
				<li><i class="fi fi-brands-instagram"
					onclick="shareInstagram()"></i></li>
			</div>
		</div>
		<hr>
		<div class="content">
			${notice.noticeContent }
				<img width="800px" src="${image.imagePath }">
		</div>
		<hr>

		<button class="btn btn-success" onclick="goList()">목록으로</button>
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
  <jsp:include page="/include/chatBot.jsp"></jsp:include>

  <!-- 기능 script -->
	<script>
		function showUpdateNotice(modiUrl) {
			location.href = modiUrl;
		}

		function deleteNotice(delUrl) {
			if (confirm("게시글을 삭제하시겠습니까?")) {
				location.href = delUrl;
			}
		}

		function goList() {
			location.href = "/notice/list.do"
		}

		function copyURL() {
			var pageUrl = window.location.href;
			// 임시 input 엘리먼트 생성
			var tempInput = document.createElement('input');
			tempInput.value = pageUrl;
			// input 엘리먼트를 화면에 추가하고 선택한 후 복사
			document.body.appendChild(tempInput);
			tempInput.select();
			document.execCommand('copy');
			// input 엘리먼트 제거
			document.body.removeChild(tempInput);
			// 사용자에게 복사 완료 메시지 표시
			alert('페이지 URL이 복사되었습니다.');
		}
		function shareFacebook() {
			var pageUrl = window.location.href;
			// 페이스북 공유 URL 생성
			var facebookShareUrl = 'https://www.facebook.com/sharer/sharer.php?u='
					+ encodeURIComponent(pageUrl);
			// 새 창에서 페이스북 공유 페이지 열기
			window.open(facebookShareUrl, 'facebook-share-dialog',
					'width=626,height=436');
		}
		function shareTwitter() {
			var pageUrl = window.location.href;
			var twitterShareUrl = 'https://twitter.com/intent/tweet?url='
					+ encodeURIComponent(pageUrl);
			window.open(twitterShareUrl, 'twitter-share-dialog',
					'width=626,height=436');
		}
		function shareInstagram() {
			var pageUrl = window.location.href;
			var instagramShareUrl = 'https://www.instagram.com/share?url='
					+ encodeURIComponent(pageUrl);
			window.open(instagramShareUrl, 'instagram-share-dialog',
					'width=626,height=436');
		}
	</script>


</body>

</html>