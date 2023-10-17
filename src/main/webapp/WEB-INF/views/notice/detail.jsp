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
				<h2>[지역] ${notice.noticeTitle }</h2>
			</div>
			<div class="notice-subtitle">
				<div class="notice-info">${notice.noticeCreateDate } |
					${notice.noticeType }</div>
				<div class="notice-btn">
					<!-- 관리자만 보이는 버튼 -->
					<c:if test="${adminNo ne 0}">
					<button class="btn btn-primary" onclick="showNoticeUpdate();">수정하기</button>
					<button class="btn btn-primary"
						onclick="deleteNotice('${delUrl}');">삭제하기</button>
						</c:if>
				</div>
			</div>
			<div class="icon">
				<!-- 푸터에 트위터, 페북, 인스타가 있어서 이렇게 했는데 카카오 로그인이 가능하니 하나를 빼고 카카오톡을 넣는게 나을지 고민중임 -->
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
		<div class="content">${notice.noticeContent }</div>
		<hr>
		<!-- 이전글/다음글 -->
		<div class="otherdetail">
			<li>이전 | 
					<a href="${detailUrl}?noticeNo=${preNoticeNo}&searchKeyword=${searchKeyword}">${notice.noticeTitle }</a>

			</li>
			<li>다음 | 
					<a href="${detailUrl }?noticeNo=${nextNoticeNo}">${notice.noticeTitle }</a>
			</li>
		</div>

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
  <script>
    (function () { var w = window; if (w.ChannelIO) { return w.console.error("ChannelIO script included twice."); } var ch = function () { ch.c(arguments); }; ch.q = []; ch.c = function (args) { ch.q.push(args); }; w.ChannelIO = ch; function l() { if (w.ChannelIOInitialized) { return; } w.ChannelIOInitialized = true; var s = document.createElement("script"); s.type = "text/javascript"; s.async = true; s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js"; var x = document.getElementsByTagName("script")[0]; if (x.parentNode) { x.parentNode.insertBefore(s, x); } } if (document.readyState === "complete") { l(); } else { w.addEventListener("DOMContentLoaded", l); w.addEventListener("load", l); } })();

    ChannelIO('boot', {
      "pluginKey": "3e438b51-7087-4b0c-b50f-c1cb50c8f770"
    });

  </script>

  <!-- 기능 script -->
	<script>
		function showNoticeUpdate() {
			const noticeNo = "${notice.noticeNo}";
			location.href = "/notice/update.do?noticeNo=" + noticeNo;
		}

		function deleteNotice() {
			const noticeNo = "${notice.noticeNo}";
			if (confirm("게시글을 삭제하시겠습니까?")) {
				location.href = "/notice/delete.do?noticeNo=" + noticeNo;
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