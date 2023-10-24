<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link href="../../assets/img/main/title-icon.png" rel="icon">
    <link href="../../assets/img/main/title-icon.png" rel="apple-touch-icon">

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
    <link href="../resources/assets/css/user/findPwd.css" rel="stylesheet">

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
            <h1 class="h3 mb-4 fw-normal text-center">비밀번호 찾기
            </h1>
            <form id="form_findPwd" action="/user/findPwd.do" method="post" novalidate>
        
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
                    <div id="user_phone_check_error" class="invalid-feedback"></div>
                </div>

                <div class="container">
                    <div class="row mb-4">
                        <div class="form-floating col-10 p-0">
                            <input type="email" id="floatingEmail" name="userId" class="form-control" placeholder="Email" required>
                            <label for="floatingEmail">아이디(이메일)</label>
                            <div class="invalid-feedback">
                                이메일 인증을 해주세요.
                            </div>
                        </div>
                        <div class="col-2 pe-0">
                            <input type="button" id="certification_number_btn" class="certification_number_btn w-100 rounded" value="인증 번호">
                        </div>
                    </div>
                </div>

                <div class="form-floating mb-4">
                    <input type="text" id="floatingEmailCode" name="mailChkCode" class="form-control" placeholder="certification_number" required>
                    <label for="floatingEmailCode">인증 번호</label>
                    <div id="email_code_check" class="invalid-feedback"></div>
                </div>

                <input type="submit" id="findPwd_btn" class="check_pw_input w-100 text-center fw-bold fs-4 rounded" value="확인">
        
            </form>
            <!-- Modal -->
            <div class="modal fade" id="static_findPwd_modal" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog" tabindex="-1"
                aria-labelledby="static_findPwd_modal_Label" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="static_findPwd_modal_Label">비밀번호</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p id="modal_body_result"></p>
                        </div>
                        <div class="modal-footer">
<!--                             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button> -->
                            <button type="button" onclick="showLoginForm();" class="btn btn-primary findPwd_login_btn">로그인</button>
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
    <script>
		var emailChkData;
	    $(document).ready(function () {
            $('#form_findPwd').on("submit", function (event) {
                event.preventDefault(); // 폼 제출 방지
                event.stopPropagation(); // 이벤트 버블링 중지

                if($('#form_findPwd')[0].checkValidity()){                	
                	// 폼 데이터 가져오기
					var userName = $('#floatingName').val();
	    			var userPhone = $('#floatingPhone').val();
		   			var userId = $('#floatingEmail').val();
	    			
	                // 이름, 전화번호 확인
	                $.ajax({
	                    url: '/user/findPwd.do', // 서버 엔드포인트 URL 설정
	                    type: 'POST', // HTTP 요청 메서드 설정 (POST)
	                    data: { 
	                    	"userName" : userName,
	                    	"userPhone" : userPhone,
	                    	"userId" : userId
	                    },
	                    success: function (response) {
	                        // Ajax 요청 성공 시 실행할 코드
	                        console.log(response);
	                        console.log(emailChkData);
	                        // 서버에서 받은 데이터를 모달로 표시
	                        if(emailChkData == $('#floatingEmailCode').val()){
		                        $('#modal_body_result').html("비밀번호 : " + response.userPwd);                    	
	                        }else if(response.error != null){
	                        	$('#modal_body_result').html(response.error); 
	                        }
	
	                        // 모달 열기
	                        $('#static_findPwd_modal').modal('show');
	                    },
	                    error: function () {
	                        // Ajax 요청 실패 시 실행할 코드
	                        alert('Ajax 오류! 관리자에게 문의하세요.');
	                    }
	                });
	                
	                // 부트스트랩 유효성 클래스 추가
	        	}
                $('#user_phone_check_error').text("전화번호를 입력해주세요.");
                $('#email_code_check').text("인증 번호를 입력해주세요.");
                $('#form_findPwd').addClass('was-validated');
            });
            $('#certification_number_btn').click(function () {
                certification_code_btn();
            });
            // 입력란에서 입력이 발생할 때 전화번호 유효성 검사
            $('#floatingPhone').on('keyup', function(event) {
                const phoneValue = $('#floatingPhone').val();
                const phoneError = $('#user_phone_check_error');

                // 전화번호 유효성 검사 (예: 숫자로만 이루어져야 함)
                if (!/^\d+$/.test(phoneValue)) {
                    event.preventDefault();
                    phoneError.removeClass('invalid-feedback');
                    phoneError.addClass('mt-1');
                    phoneError.css({
                        'font-size': '14px',
                        'height': '10px',
                        'color': 'red'
                    });
                    phoneError.text("숫자만 입력 가능합니다.");
                } 
                if( phoneValue === "") {
                    phoneError.text("전화번호를 입력해주세요.");
                    phoneError.removeClass('mt-1');
                    phoneError.addClass('invalid-feedback');
                }
            });
        });
		// 이메일 인증번호
    	function certification_code_btn() {
			var userId = $('#floatingEmail').val();
			var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    	  	if(userId && userId.trim() !== "") {    	 
    	  		if (emailPattern.test(userId)) {
		    	   $.ajax({
		    	      type : "POST",
		    	      url : "/user/mailConfirm",
		    	      data : {
		    	         "email" : userId
		    	      },
		    	      success : function(data){
		    	    	  emailChkData = data;
		    	         	alert("해당 이메일로 인증번호 발송이 완료되었습니다. \n 확인부탁드립니다.");
		    	         console.log("data : "+data);
		    	         chkEmailConfirm(data);
		    	      },
		    	      error: function () {
		                  // Ajax 요청 실패 시 실행할 코드
		                  alert('Ajax 오류! 관리자에게 문의하세요.');
		              }
		    	   })
    	  		} else {
    	            alert("올바른 이메일 주소를 입력해주세요.");
    	        }
			}else {
				alert("아이디(이메일)을 입력해주세요.");
 	  		}
    	};
   		// 이메일 인증번호 체크 함수
		function chkEmailConfirm(data){
			$('#floatingEmailCode').on("keyup", function(){
				$('#email_code_check').removeClass('invalid-feedback').addClass('mt-1')
				.css({
				    'font-size': '14px',
				    'height': '10px'
				})
				if (data !== $('#floatingEmailCode').val()) { 
					$('#email_code_check').text("인증번호가 일치하지 않습니다.");
					$("#email_code_check").css({
						"color" : "red"
					})
// 					return false;
				} else { 
					$('#email_code_check').text("인증번호가 일치합니다.")
					$("#email_code_check").css({
						"color" : "green"
					})
// 					return true;
				}
				if ($('#floatingEmailCode') === "") {
					$('#email_code_check').text("인증 번호를 입력해주세요.");
		        	$('#email_code_check').removeClass('mt-1').addClass('invalid-feedback')
		        }
			})
		}
		function showLoginForm() {
        	location.href = "/user/login.do";
        }
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