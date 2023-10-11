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
    <link href="../resources/assets/css/user/findPw.css" rel="stylesheet">

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
            <form id="form_findPw" action="#" method="post" novalidate>
        
                <div class="form-floating mb-4">
                    <input type="text" id="floatingName" class="form-control" placeholder="name" required>
                    <label for="floatingName">이름</label>
                    <div class="invalid-feedback">
                        이름을 입력해주세요.
                    </div>
                </div>

                <div class="form-floating mb-4">
                    <input type="text" id="floatingPhone" class="form-control" placeholder="Phone" required>
                    <label for="floatingPhone">휴대전화번호</label>
                    <div class="invalid-feedback">
                        번호를 입력해주세요.
                    </div>
                </div>

                <div class="container">
                    <div class="row mb-4">
                        <div class="form-floating col-10 p-0">
                            <input type="number" id="floatingPhone" class="form-control" placeholder="Phone" required>
                            <label for="floatingPhone">이메일 주소</label>
                            <div class="invalid-feedback">
                                이메일 주소를 입력해주세요.
                            </div>
                        </div>
                        <div class="col-2 pe-0">
                            <input type="button" id="certification_number_btn" class="certification_number_btn w-100 rounded" value="인증 번호">
                        </div>
                    </div>
                </div>

                <div class="form-floating mb-4">
                    <input type="text" id="floatingPhone" class="form-control" placeholder="certification_number" required>
                    <label for="floatingPhone">인증 번호</label>
                    <div class="invalid-feedback">
                        인증 번호를 입력해주세요.
                    </div>
                </div>

                <input type="submit" id="findEmail_btn" class="check_pw_input w-100 text-center fw-bold fs-4 rounded" value="확인">
                        <!-- data-bs-toggle="modal" data-bs-target="#static_findEmail_modal" > -->
        
            </form>
            <!-- Modal -->
            <!-- <div class="modal fade" id="static_findEmail_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                aria-labelledby="static_findEmail_modal_Label" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="static_findEmail_modal_Label">이메일 계정</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p>이메일 : </p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                            <button type="button" class="btn btn-primary">로그인</button>
                        </div>
                    </div>
                </div>
            </div> -->

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
    <!-- 폼 유효성 -->
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            const form = document.getElementById('form_findPw');
    
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    // 폼 유효성 검사가 실패하면
                    event.preventDefault(); // 폼 제출 방지
                    event.stopPropagation(); // 이벤트 버블링 중지
                }
                form.classList.add('was-validated'); // 부트스트랩 유효성 클래스 추가
            
            });
        });
    </script>
    <!-- 비밀번호 찾기 유효성 & Ajax 모달 -->
    <!-- <script>
        $(document).ready(function () {
            $('#form_findEmail').submit(function (event) {
                if (!this.checkValidity()) {
                    // 폼 유효성 검사가 실패하면
                    event.preventDefault(); // 폼 제출 방지
                    event.stopPropagation(); // 이벤트 버블링 중지

                }else {
                    // 폼 유효성 검사가 성공한 경우
                    event.preventDefault(); // 폼 제출 방지

                    // 폼 데이터 가져오기
                    var formData = new FormData(this);

                    // Ajax 요청 보내기
                    $.ajax({
                        url: 'findEmail_ajax.do', // 서버 엔드포인트 URL 설정
                        type: 'POST', // HTTP 요청 메서드 설정 (POST)
                        data: formData,
                        processData: false,
                        contentType: false,
                        success: function (response) {
                            // Ajax 요청 성공 시 실행할 코드
                            console.log(response);

                            // 서버에서 받은 데이터를 모달로 표시
                            $('#static_findEmail_modal .modal-body').html(response);

                            // 모달 열기
                            $('#static_findEmail_modal').modal('show');
                        },
                        error: function () {
                            // Ajax 요청 실패 시 실행할 코드
                            alert('Ajax 오류! 관리자에게 문의하세요.');
                        }
                    });
                }

                // 부트스트랩 유효성 클래스 추가
                $(this).addClass('was-validated');
            });
        });
    </script> -->
    <!-- 채널톡 api -->
    <script>
        (function () { var w = window; if (w.ChannelIO) { return w.console.error("ChannelIO script included twice."); } var ch = function () { ch.c(arguments); }; ch.q = []; ch.c = function (args) { ch.q.push(args); }; w.ChannelIO = ch; function l() { if (w.ChannelIOInitialized) { return; } w.ChannelIOInitialized = true; var s = document.createElement("script"); s.type = "text/javascript"; s.async = true; s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js"; var x = document.getElementsByTagName("script")[0]; if (x.parentNode) { x.parentNode.insertBefore(s, x); } } if (document.readyState === "complete") { l(); } else { w.addEventListener("DOMContentLoaded", l); w.addEventListener("load", l); } })();

        ChannelIO('boot', {
            "pluginKey": "3e438b51-7087-4b0c-b50f-c1cb50c8f770"
        });

    </script>


</body>

</html>