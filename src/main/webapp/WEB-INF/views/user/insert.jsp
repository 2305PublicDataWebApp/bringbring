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
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <!-- Favicons -->
    <link href="../resources/assets/img/main/icon-title.png" rel="icon">
    <link href="../resources/assets/img/main/icon-title.png" rel="apple-touch-icon">

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
    <link href="../resources/assets/css/user/insert.css" rel="stylesheet">

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
        <div class="form_insert w-100 m-auto rounded">
            <h1 class="h3 mb-3 fw-normal text-center">회원가입</h1>

            <form id="register_form" action="/user/insert.do" method="post" novalidate>
                <div class="container">
                    <div class="row mb-4">
                        <div class="form-floating col-10 p-0">
                            <input type="email" id="floatingEmail" class="form-control" name="userId" placeholder="name@example.com" required>
                            <label for="floatingEmail">아이디(이메일)</label>
                            <div id="user_Email_check_error" class="invalid-feedback">
                                이메일을 입력해주세요.
                            </div>
                        </div>
                        <div class="col-2 pe-0">
                            <input type="button" onclick="id_check_btn();" id="email_check_input" class="email_check_input w-100 rounded" value="중복 확인">
                        </div>
                    </div>
                </div>
                
                <div class="form-floating mb-4">
                    <input type="password" id="floatingPassword" class="form-control" name="userPwd" placeholder="Password" required>
                    <label for="floatingPassword">비밀번호</label>
                    <div class="invalid-feedback">
                        비밀번호를 입력해주세요.
                    </div>
                </div>
                <div class="form-floating mb-4">
                    <input type="password" id="floatingPasswordCheck" class="form-control" placeholder="Password" required>
                    <label for="floatingPasswordCheck">비밀번호 확인</label>
                    <div id="user_pwd_check_error" class="invalid-feedback"></div>
                </div>
                <div class="form-floating mb-4">
                    <input type="text" class="form-control" id="floatingName" name="userName" placeholder="Name" required>
                    <label for="floatingName">이름</label>
                    <div class="invalid-feedback">
                        이름을 입력해주세요.
                    </div>
                </div>
                <div class="form-floating mb-4">
                    <input type="text" id="floatingPhone" class="form-control" name="userPhone" placeholder="Phone" required>
                    <label for="floatingPhone">전화번호</label>
                    <div id="user_phone_check_error" class="invalid-feedback"></div>
                </div>
                <div class="container">
                    <div class="row mb-4">
                        <div class="form-floating col-10 p-0">
                            <input type="text" id="floatingPostcode" class="form-control" name="userPostCode" placeholder="Postcode" required readonly>
                            <label for="floatingPostcode">우편번호</label>
                            <div class="invalid-feedback">
                                주소를 검색하여 입력해주세요.
                            </div>
                        </div>
                        <div class="col-2 pe-0">
                            <input type="button" onclick="daumPostcode_btn();" class="address_input w-100 rounded" value="우편 번호">
                        </div>
                    </div>
                </div>
                <div class="form-floating mb-4">
                    <input type="text" id="floatingAddress" class="form-control" name="userAddress" placeholder="Address" required>
                    <label for="floatingAddress">주소</label>
                    <div class="invalid-feedback">
                        주소를 검색하여 선택해주세요.
                    </div>
                </div>
                <div class="form-floating mb-4">
                    <input type="text" id="floatingAddressDetail" class="form-control" name="userAddressDetail" placeholder="AddressDetail" required>
                    <label for="floatingAddressDetail">상세주소</label>
                    <div class="invalid-feedback">
                        상세주소를 입력해주세요.
                    </div>
                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input">
                    <label class="form-check-label">동의하기</label>
                </div>
                <p class="ps-4 pe-4">위치기반 서비스 이용약관(선택), 이벤트 혜택 정보 수신 (선택) 동의를 포함합니다. </p>
                
                <input type="submit" id="register_btn" class="insert_btn_input w-100 text-center fw-bold fs-4 rounded" value="회원가입">
                
            </form>

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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script type="text/javascript">
    // 회원가입 유효성
    document.addEventListener('DOMContentLoaded', function () {
    	const form = document.getElementById('register_form');
        const pwdCheckError = document.getElementById('user_pwd_check_error');
        const phoneError = document.getElementById("user_phone_check_error");
        const EmailCheckError = document.getElementById("user_Email_check_error");

	    form.addEventListener('submit', function (event) {
            
            if (!form.checkValidity()) {
                // 폼 유효성 검사가 실패하면
                event.preventDefault(); // 폼 제출 방지
                event.stopPropagation(); // 이벤트 버블링 중지
            }
            pwdCheckError.innerHTML="비밀번호를 한번 더 입력해주세요."
            phoneError.innerHTML="전화번호를 입력해주세요."
            EmailCheckError.innerHTML="이메일을 입력해주세요."
            form.classList.add('was-validated'); // 부트스트랩 유효성 클래스 추가
        
        });
        
     	// 입력란에서 입력이 발생할 때 전화번호 유효성 검사
        document.getElementById('floatingPhone').addEventListener("keyup", function (event) {
	        const phoneValue = document.getElementById('floatingPhone').value;
			
            // 전화번호 유효성 검사 (예: 숫자로만 이루어져야 함)
            if (!/^\d+$/.test(phoneValue)) {
            	event.preventDefault();
		        phoneError.classList.remove('invalid-feedback');
		        phoneError.classList.add('mt-1')
		        phoneError.style.fontSize = "14px";
		        phoneError.style.height = "10px";
                phoneError.innerHTML = "숫자만 입력 가능합니다.";
                phoneError.style.color = "red";
            }
            if(phoneValue === ""){
            	phoneError.innerHTML = "전화번호를 입력해주세요.";
            	phoneError.classList.remove('mt-1')
	            phoneError.classList.add('invalid-feedback');
            }
        });
    
	    // 비밀번호 재확인
	    document.getElementById('floatingPasswordCheck').addEventListener('keyup', function() {
	        var pass1 = document.getElementById('floatingPassword').value;
	        var pass2 = this.value; // 현재 이벤트가 발생한 요소 (floatingPasswordCheck)의 값
	
	        pwdCheckError.classList.remove('invalid-feedback');
	        pwdCheckError.classList.add('mt-1')
	        pwdCheckError.style.fontSize = "14px";
	        pwdCheckError.style.height = "10px";
	        if (pass1 !== "" || pass2 !== "") {
	            if (pass1 === pass2) {
	            	pwdCheckError.innerHTML = "비밀번호가 일치합니다.";
	            	pwdCheckError.style.color = "green";
	            } else {
	            	pwdCheckError.innerHTML = "비밀번호가 일치하지 않습니다.";
	            	pwdCheckError.style.color = "red";
	            }
	        }
	
	        if (pass2 === "") {
	        	pwdCheckError.innerHTML = "비밀번호를 한번 더 입력해주세요.";
	        	pwdCheckError.classList.remove('mt-1')
	            pwdCheckError.classList.add('invalid-feedback');
	        }
	    });
// 	    ** JQuery **
// 	    $('#member_pw_check').keyup(function() {
// 	        const pass1 = $('#member_pw').val(); 
// 			const pass2 = $('#member_pw_check').val();
// 	        const password_check = document.getElementById('member_pw_check_div');
	
// 			if (pass1 != "" || pass2 != "") {
// 				if (pass1 == pass2) {
// 					$('#check_pw').text("비밀번호가 일치합니다.");  // .innerHTML는 자바스크립트
// 					$('#check_pw').css("color", "green");
// 					$('#check_pw').css("font-size", "14px");
// 					$('#check_pw').css("margin-top", "4px");
// 	            }else if(pass2 == "") {
// 	            $('#check_pw').text(""); 
// 	            } else {
// 					$('#check_pw').text("비밀번호가 일치하지 않습니다.");
// 					$('#check_pw').css("color", "red");
// 					$('#check_pw').css("font-size", "14px");
// 					$('#check_pw').css("margin-top", "4px");
// 				}
// 	            password_check.classList.replace('invalid-feedback', 'd-none');
// 			}
// 	        if(pass2 == "") {
// 	            password_check.classList.replace('d-none', 'invalid-feedback');
// 	        }
			
// 		});
    });
    
    function id_check_btn() {
    	// 입력된 이메일 값 가져오기
    	var userId = $('#floatingEmail').val();
    	var userIdCheck_div = $('#user_Email_check_error');
    	var submitButton = $('#register_btn');
    	
    	// 서버로 이메일 중복 확인 요청
    	$.ajax({
    		url: '/user/Email_check.do',
    		type: 'POST',
    		data: { "userId" : userId },
    		success: function(response) {
    			// 서버에서 받은 데이터 글로 나타내기
    			if(userId !== "") {    				
	    			userIdCheck_div.removeClass('invalid-feedback').addClass('mt-1');
	    			userIdCheck_div.css({
	    				'font-size': '14px',
	    				'height': '10px'
    				})
	    			if(response.unavailable != null) {
	    				userIdCheck_div.html(response.unavailable);
	    				userIdCheck_div.css('color', 'red');
	    				submitButton.prop('disabled', true);
	    			}else if(response.available != null) {
	    				userIdCheck_div.html(response.available);
	    				userIdCheck_div.css('color','green')
	    				submitButton.prop('disabled', false);
	    			}
    			}else if(userId === ""){
    				userIdCheck_div.text("이메일을 입력해주세요.");
    				userIdCheck_div.removeClass('mt-1').addClass('invalid-feedback').css('color', 'red');;
    			}
    		},
    		error: function() {
    			// Ajax 요청 실패 시 실행할 코드
    			alert('Ajax 오류! 관리자에게 문의하세요.');
    		}
    		
    	})
    }
    
    // 주소 API
    function daumPostcode_btn() {
    	new daum.Postcode({
    		oncomplete: function(data) {
    			
    			// 우편번호와 주소 정보를 해당 필드에 넣는다.
    			document.getElementById('floatingPostcode').value = data.zonecode;
    			document.getElementById('floatingAddress').value = data.roadAddress +", "+ data.buildingName;
    			
    			// 커서를 상세주소 필드로 이동한다.
                document.getElementById("floatingAddressDetail").focus();
    		}
    	}).open();
    }
    </script>
    <!-- 채널톡 api -->
    <jsp:include page="/include/chatBot.jsp"></jsp:include>


</body>

</html>