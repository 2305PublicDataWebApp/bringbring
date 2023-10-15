<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>브링브링</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

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
    <link href="../resources/assets/css/user/findEmail.css" rel="stylesheet">

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
  
    <!-- ======= Hero Section ======= -->
    <!-- <div id="hero" style="width: 100%;margin: 0 auto;height: 70px;" ></div> -->

    <!-- 메인 -->
    <main>
        <div class="form_main w-100 m-auto rounded">
            <h1 class="h3 mb-4 fw-normal text-center">이메일 계정 찾기
            </h1>
            <form id="form_findEmail" action="/user/findEmail.do" method="post" novalidate>
        
                <div class="form-floating mb-4">
                    <input type="text" id="floatingName" name="userName" class="form-control" placeholder="name" required>
                    <label for="floatingName">이름</label>
                    <div class="invalid-feedback">
                        이름을 입력해주세요.
                    </div>
                </div>

                <div class="form-floating mb-4">
                    <input type="text" id="floatingPhone" name="userPhone" class="form-control" placeholder="Phone" required>
                    <label for="floatingPhone">휴대전화번호</label>
                    <div class="invalid-feedback">
                        번호를 입력해주세요.
                    </div>
                </div>
                <input type="submit" id="findEmail_btn" class="check_email_input w-100 text-center fw-bold fs-4 rounded" value="확인">
        
            </form>
            <!-- Modal -->
            <div class="modal fade" id="static_findEmail_modal" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog" tabindex="-1"
                aria-labelledby="static_findEmail_modal_Label" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="static_findEmail_modal_Label">이메일 계정</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
						<div class="modal-body">
							<p id="modal_body_result"></p>
						</div>
						<div class="modal-footer">
<!--                             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button> -->
                            <button type="button" onclick="showLoginForm();" class="btn btn-primary findEmail_login_btn">로그인</button>
                        </div>
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

    <!-- 이메일 계정 찾기 유효성 & Ajax 모달 -->
    <script>
        $(document).ready(function () {
            $('#form_findEmail').on("submit", function (event) {
                event.preventDefault(); // 폼 제출 방지

//                 if (!this.checkValidity()) {
//                     // 폼 유효성 검사가 실패하면
//                     return;
//                 }
                if(this.checkValidity()){                	
                	// 폼 데이터 가져오기
					var userName = $('#floatingName').val();
	    			var userPhone = $('#floatingPhone').val();
	    			
	                // Ajax 요청 보내기
	                $.ajax({
	                    url: '/user/findEmail.do', // 서버 엔드포인트 URL 설정
	                    type: 'POST', // HTTP 요청 메서드 설정 (POST)
	                    data: { "userName" : userName, "userPhone" : userPhone },
	                    success: function (response) {
	                        // Ajax 요청 성공 시 실행할 코드
	                        console.log(response);
	
	                        // 서버에서 받은 데이터를 모달로 표시
	                        if(response.userId != null) {
		                        $('#modal_body_result').html("아이디 : " + response.userId);                    	
	                        }else if(response.error != null) {
	                        	$('#modal_body_result').html(response.error); 
	                        }
	
	                        // 모달 열기
	                        $('#static_findEmail_modal').modal('show');
	                    },
	                    error: function () {
	                        // Ajax 요청 실패 시 실행할 코드
	                        alert('Ajax 오류! 관리자에게 문의하세요.');
	                    }
	                });
	                
	                // 부트스트랩 유효성 클래스 추가
	        	}
                $(this).addClass('was-validated');
            });
        });
    </script>
    <!-- 채널톡 api -->
    <script>
        (function () { var w = window; if (w.ChannelIO) { return w.console.error("ChannelIO script included twice."); } var ch = function () { ch.c(arguments); }; ch.q = []; ch.c = function (args) { ch.q.push(args); }; w.ChannelIO = ch; function l() { if (w.ChannelIOInitialized) { return; } w.ChannelIOInitialized = true; var s = document.createElement("script"); s.type = "text/javascript"; s.async = true; s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js"; var x = document.getElementsByTagName("script")[0]; if (x.parentNode) { x.parentNode.insertBefore(s, x); } } if (document.readyState === "complete") { l(); } else { w.addEventListener("DOMContentLoaded", l); w.addEventListener("load", l); } })();

        ChannelIO('boot', {
            "pluginKey": "3e438b51-7087-4b0c-b50f-c1cb50c8f770"
        });

    </script>


</body>

</html>