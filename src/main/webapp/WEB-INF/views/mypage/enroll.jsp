<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <!-- fslightbox 스타일 시트 추가 -->
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fslightbox/3.4.1/fslightbox.min.css">--%>

    <!-- Template Main CSS File -->
    <link href="../resources/assets/css/style.css" rel="stylesheet">
    <link href="../resources/assets/css/common.css" rel="stylesheet">
    <link href="../resources/assets/css/mypage/mypage.css" rel="stylesheet">
    <link href="../resources/assets/css/mypage/enroll.css" rel="stylesheet">

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
                <h1 class="d-inline">${userOne.userName}</h1>
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
                        <a href="/inquire/list.do" class="fs-1">문의 내역</a>
                        <a href="/mypage/divide.do" class="fs-1">나눔 내역</a>
                        <a href="/mypage/chatting.do" class="fs-1">채팅방 목록</a>
                        <a href="/mypage/heart.do" class="fs-1">찜한 게시물</a>
                    </div>
                    <div class="col-9 ps-5 pt-5">
                        
                        <h1 class="mt-3">신청 내역</h1>
                       	<c:set var="printedImageGroupNos" value="" />
                        <c:forEach var="resInfo" items="${reservationInfo }">
                        	<c:set var="imageGroupNo" value="${resInfo.image.imageGroupNo}" />
                        	<c:choose>
                			<c:when test="${!fn:contains(pageScope.printedImageGroupNos, imageGroupNo)}">
	                        <div id="imageGroup${resInfo.image.imageGroupNo}" class="container enroll_list">
	                            <div class="row p-3 border rounded">
	                                <div class="col-3">
	                                    <p>${resInfo.reservation.rvApplicationDate }</p>
	                                    <img src="${resInfo.image.imagePath }" class="rounded">
	                                </div>
	                                <div class="col-6 mt-5">
	                                    <h2>${resInfo.wasteType.wasteTypeName}</h2>
	                                    <p class="fs-4">예약 번호 ${resInfo.reservation.rvDischargeNo }</p>
	                                    <p class="fs-4">결제 금액 ${resInfo.reservationDetail.rvDetailFee }원</p>
	                                </div>
	                                <div class="col-3 text-end">
	                                    <a href="javascript:void(0)" onclick="openModal(${resInfo.reservation.rvNo})">상세보기 >></a>
	                                    <p class="fw-1 fs-1 pt-5">
                                            <c:choose>
                                                <c:when test="${fn:contains(resInfo.reservation.isRvCancel, 'Y')}">
                                                    신청 취소
                                                </c:when>
                                                <c:when test="${fn:contains(resInfo.reservation.isRvCompletion, 'N')}">
                                                    신청 완료
                                                </c:when>
                                                <c:when test="${fn:contains(resInfo.reservation.isRvCompletion, 'Y')}">
                                                    처리 완료
                                                </c:when>
                                            </c:choose>
										</p>
	                                </div>
	                            </div>
	                        </div>
	                        <c:set var="printedImageGroupNos" value="${printedImageGroupNos},${imageGroupNo}" scope="page" />
			                </c:when>
			                <c:otherwise>
			                    <!-- 이미 출력된 값이라면 아무 작업도 하지 않음 -->
			                </c:otherwise>
			            </c:choose>
						</c:forEach>
                        <div style="width: 1000px;margin: 0 auto;margin-top: 60px;">
                            <nav aria-label="Page navigation example" style="display: flex; width: 770px;">
                                <ul class="pagination" style="margin: 0 auto;">
                                    <c:if test="${pageInfo.startNavi ne 1}">
                                        <c:url var="bPageUrl" value="/mypage/enroll.do">
                                            <c:param name="page" value="${pageInfo.startNavi-1}"></c:param>
                                        </c:url>
                                        <li class="page-item">
                                            <a style="color: black;" class="page-link" href="${bPageUrl}"><</a>
                                        </li>
                                    </c:if>
                                    <c:forEach begin="${pageInfo.startNavi}" end="${pageInfo.endNavi}" var="p">
                                        <c:url var="pageUrl" value="/mypage/enroll.do">
                                            <c:param name="page" value="${p}"></c:param>
                                        </c:url>
                                        <li class="page-item">
                                            <a style="color: black;" class="page-link" href="${pageUrl}">${p}</a>
                                        </li>
                                    </c:forEach>
                                    <c:if test="${pageInfo.endNavi ne pageInfo.naviTotalCount}">
                                        <c:url var="nPageUrl" value="/mypage/enroll.do">
                                            <c:param name="page" value="${pageInfo.endNavi+1}"></c:param>
                                        </c:url>
                                        <li class="page-item">
                                            <a style="color: black;" class="page-link" href="${nPageUrl}">>/a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
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
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="closeModal()"></button>
                    </div>
                    <div id="modal_body_content" class="modal-body container">
                    </div>
                    <div class="modal-footer">
                        <input type="submit" id="rvUpdate" class="cancel_reservation_btn w-100 text-center fw-bold fs-4 rounded mt-0" value="정보 수정">
                        <input type="submit" id="findEmail_btn" class="cancel_reservation_btn w-100 text-center fw-bold fs-4 rounded mt-0" value="예약 취소" onclick="confirmCancel()">
                    </div>
                </div>
            </div>
        </div>
        <!-- 이미지 팝업 모달 -->
        <div id="imagePopup" class="modal fade">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="imagePopupLabel">이미지 상세보기</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <img id="popupImage" class="popup-content">
                        <div id="imageList" class="mt-3"></div>
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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/fslightbox/3.4.1/index.min.js"></script>

	<script>
	function openModal(rvNo) {

        $.ajax({
            url: '/reservation/selectMyList.do', // 요청을 보낼 API 엔드포인트
            type: 'GET',
            data: { rvNo: rvNo }, // 요청 데이터 (rvNo 매개변수를 전달)
            success: function(response) {

                const matchedReservations = response;

                if (response.length > 0) {

                    // 모달을 열고 matchedReservation을 사용하여 모달 내용을 업데이트
                    const modalBody = document.getElementById("modal_body_content");

                    // 모달 내용을 채워넣기
                    let modalContent = '<div class="modal_border_bottom p-3" id="modalHeader">';
                    modalContent += '<div>';
                    modalContent += '<p id="rvDischargeNo">예약 번호 : ' + matchedReservations[0].reservation.rvDischargeNo + '</p>';
                    modalContent += '<p class="m-0">예약 날짜 : ' + matchedReservations[0].reservation.rvRvDate + '</p>';
                    modalContent += '<input type="hidden" id="modalPayId" name="modalPayId" value="' + matchedReservations[0].pay.payId + '">';
                    modalContent += '</div>';
                    modalContent += '<div>';
                    // modalContent += '<a href="/reservation/modify.do?rvDischargeNo=' + matchedReservations[0].reservation.rvDischargeNo + '">';
                    // modalContent += '<button class="btn btn-primary" id="modifyButton">정보 수정</button>';
                    // modalContent += '</a>';
                    modalContent += '</div>';
                    modalContent += '</div>';
                    modalContent += '<div class="modal_border_bottom p-3">';
                    modalContent += '<p class="fs-5">장소 : ' + matchedReservations[0].reservation.rvAddr + matchedReservations[0].reservation.rvAddrDetail + '</p>';
                    modalContent += '<p>신청자 : ' + matchedReservations[0].reservation.rvName + '</p>';
                    modalContent += '<p>연락처 : ' + matchedReservations[0].reservation.rvPhone + '</p>';
                    modalContent += '<p>요청사항 : ' + matchedReservations[0].reservation.rvRequest + '</p>';

                    const displayedImageIndexes = [];


                    for (let i = 0; i < matchedReservations.length; i++) {
                        const imageIndexNo = matchedReservations[i].connection.imageIndexNo;

                        // 이미 출력한 imageIndexNo가 아닌 경우에만 이미지 출력
                        if (!displayedImageIndexes.includes(imageIndexNo)) {

                            const imageJson = JSON.stringify(matchedReservations[i].image);

                            const data = {
                                imageIndexNo : matchedReservations[i].connection.imageIndexNo,
                                rvDetailNo : matchedReservations[i].reservationDetail.rvDetailNo
                            }

                            console.log("data", JSON.stringify(data));

                            modalContent += '<div class="row mb-2">';
                            modalContent += '<div class="col-4 text-center">';
                            modalContent += '<img src="' + matchedReservations[i].image.imagePath + '" class="rounded popup-image" ' +
                                'onclick="openImagePopup(this)">';
                            modalContent += '<input type="hidden" id="imageIndexNo' + imageIndexNo + '" value="' + matchedReservations[i].connection.imageIndexNo + '">';
                            modalContent += '<input type="hidden" id="rvDetailNo' + imageIndexNo + '" value="' + matchedReservations[i].reservationDetail.rvDetailNo + '">';

                            // modalContent += '<img src="' + matchedReservations[i].image.imagePath + '" class="rounded popup-image" ' +
                            //     'onclick="openImagePopup(' + imageIndexNo + ')">';
                            // modalContent += '<img src="' + matchedReservations[i].image.imagePath + '" class="rounded popup-image" ' +
                            //     'onclick="openImagePopup(' + imageIndexNo + ', groupedData)">';

                            modalContent += '</div>';
                            modalContent += '<div class="col-8 row">';
                            modalContent += '<div class="col-10 pt-4">';
                            modalContent += '<h3>' + matchedReservations[i].wasteType.wasteTypeName + '</h3>';
                            modalContent += '</div>';
                            modalContent += '<div class="col-6">';
                            modalContent += '<p>수량 : 1개</p>';
                            modalContent += '</div>';
                            modalContent += '<div class="col-6 text-end">';
                            modalContent += '<p>' + matchedReservations[i].wasteInfo.wasteInfoFee + '원</p>';
                            modalContent += '</div>';
                            modalContent += '</div>';
                            modalContent += '</div>';
                            // 이미 출력한 imageIndexNo를 배열에 추가
                            displayedImageIndexes.push(imageIndexNo);
                        } else {
                            // 이미 출력한 imageIndexNo인 경우에는 추가하지 않고 다음으로 넘어감
                            continue;
                        }
                    }



                    modalContent += '</div>';
                    modalContent += '<div class="">';
                    modalContent += '<div class="row p-3 pb-0">';
                    modalContent += '<div class="col">';
                    modalContent += '<p class="fs-4 m-0">총 결제 금액</p>';
                    modalContent += '</div>';
                    modalContent += '<div class="col">';
                    modalContent += '<p class="fs-4 m-0 text-end" id="rvDetailFee">' + matchedReservations[0].reservationDetail.rvDetailFee + '원</p>';
                    modalContent += '</div>';
                    modalContent += '</div>';
                    modalContent += '</div>';

                    modalBody.innerHTML = modalContent;

                    const modalFooter = document.querySelector('.modal-footer');
                    modalFooter.innerHTML = '';

                    if (matchedReservations[0].reservation.isRvCancel === 'N') {
                        if (matchedReservations[0].reservation.isRvCompletion === 'N') {
                            modalFooter.innerHTML =
                                '<input type="submit" id="findEmail_btn" class="cancel_reservation_btn w-100 text-center fw-bold fs-4 rounded mt-0" value="예약 취소" onclick="confirmCancel()">';
                        } else {
                            modalFooter.innerHTML = '<p>수거가 완료되었습니다</p>';
                        }
                    } else if (matchedReservations[0].reservation.isRvCancel === 'Y') {
                        modalFooter.innerHTML = '<p>예약 취소되었습니다</p>';
                    }

                    const modal = document.getElementById("enroll_modal");
                    modal.dataset.matchedReservations = JSON.stringify(matchedReservations);

                    // 모달을 열기
                    $('#enroll_modal').modal('show');


                } else {
                    // 일치하는 예약을 찾지 못한 경우 처리
                    alert("일치하는 예약을 찾지 못했습니다.");
                }
            },
            error: function(xhr, status, error) {
                console.error('Ajax 요청 실패:', status, error);
            }
        });
	}

    <jsp:include page="/include/loginJs.jsp"></jsp:include>

    function openImagePopup(obj) {
        var parentDiv = obj.parentElement;
        var siblings = Array.from(parentDiv.children);
        var objIndex = siblings.indexOf(obj);
        var imageIndexNoSibling = siblings[objIndex + 1];
        var rvDetailNoSibling = siblings[objIndex + 2];
        let imageIndexNo = imageIndexNoSibling.value;
        let rvDetailNo = rvDetailNoSibling.value;

        $.ajax({
            url: '/reservation/selectImage.do',
            type: 'GET',
            data: { imageIndexNo: imageIndexNo, rvDetailNo: rvDetailNo },
            success: function(response) {
                // 이미지 데이터를 추출
                var images = [];
                for (var i = 0; i < response.length; i++) {
                    var item = response[i];
                    console.log(item)
                    images.push(item.image.imagePath);
                }
                console.log("images", images)

                // 모달 이미지 엘리먼트를 가져옵니다.
                var popupImage = document.getElementById("popupImage");
                popupImage.src = images[0]; // 첫 번째 이미지를 표시합니다.

                // 이미지 목록 생성
                var imageList = document.getElementById("imageList");
                imageList.innerHTML = ""; // 이미지 목록 초기화

                for (var i = 0; i < images.length; i++) {
                    let imageItem = document.createElement("img");
                    imageItem.src = images[i];
                    imageItem.classList.add("popup-thumbnail");
                    // 클로저를 사용하여 i 값을 고정
                    (function(index) {
                        imageItem.onclick = function () {
                            changeImage(index, images);
                        };
                    })(i);

                    imageList.appendChild(imageItem);
                }

                // 이미지 팝업 모달 열기
                $('#imagePopup').modal('show');
            },
            error: function(error) {
                console.error('에이젝스 요청 오류:', error);
            }
        });
    }

    function changeImage(i, images) {
        console.log(i)
        var popupImage = document.getElementById("popupImage");
        popupImage.src = images[i]; // 이미지를 변경합니다.
        console.log(images[i])
    }





	</script>
    <script>

        let isSelectVisible = false;
        let selectedOption = 4; // 기타를 기본 값으로 지정

        function confirmCancel() {
            // 모달에서 matchedReservations 데이터를 읽어옴
            const modal = document.getElementById("enroll_modal");
            const matchedReservations = JSON.parse(modal.dataset.matchedReservations);
            console.log(matchedReservations);

            if (!isSelectVisible) {
                // select 창을 보여주기
                const modalContent = document.getElementById("modal_body_content");
                const selectElement = createSelectElement(matchedReservations);
                modalContent.appendChild(selectElement);
                isSelectVisible = true;

                // 선택한 option의 변경을 감지하고 저장
                selectElement.addEventListener('change', function () {
                    selectedOption = selectElement.value;
                });
            } else {
                const userConfirmed = confirm("예약을 취소하시겠습니까? 확인 후 복구할 수 없습니다.");
                if (userConfirmed) {
                    if (selectedOption) {
                        const parsedOption = JSON.parse(selectedOption);
                        cancelPay(parsedOption);
                    } else {
                        alert("취소 이유를 선택하세요.");
                    }
                }
            }
        }

        function closeModal() {
            isSelectVisible = false;
            $('#enroll_modal').modal('hide'); // 모달을 숨깁니다.
        }

        function createSelectElement(matchedReservations) {
            const select = document.createElement("select");
            select.className = 'form-select form-select-lg mb-3';
            select.setAttribute("aria-label", ".form-select-lg example");

                const option1 = document.createElement("option");
                option1.value = '1';
                option1.text =  '배출 물품 변경';
                const option2 = document.createElement("option");
                option2.value = '2';
                option2.text =  '기상 악화로 인한 취소';
                const option3 = document.createElement("option");
                option3.value = '3';
                option3.text =  '개인 사정으로 인한 일정 변경';
                const option4 = document.createElement("option");
                option4.value = '4';
                option4.text =  '기타';
                select.appendChild(option1);
                select.appendChild(option2);
                select.appendChild(option3);
                select.appendChild(option4);

            return select;
        }

        function cancelPay(parsedOption) {
            // const modal = document.getElementById("enroll_modal");
            // const matchedReservations = JSON.parse(modal.dataset.matchedReservations);

            const dischaegeNoStr = document.querySelector("#rvDischargeNo").textContent;
            const dischargeNo = dischaegeNoStr.substring(dischaegeNoStr.length - 17);
            const cancel_request_amount = document.querySelector("#rvDetailFee").textContent;
            const payId = document.querySelector("#modalPayId").value;

            console.log(dischargeNo);
            console.log(cancel_request_amount)
            console.log(payId);
            console.log(parsedOption)

            $.ajax({
                url: "/reservation/cancel.do",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify({
                    dischargeNo : dischargeNo,
                    merchant_uid: payId, // 예: ORD20180131-0000011
                    cancel_request_amount: cancel_request_amount, // 환불금액
                    reason: parsedOption // 환불사유
                }),
                success: function (data) {
                    console.log("data", data);
                    alert("예약 취소 요청이 성공했습니다.")
                    $('#enroll_modal').modal('hide');
                },
                error: function () {
                    alert("예약 취소 요청이 실패했습니다 관리자에게 문의하세요");
                }
            });
        }
    </script>
    <!-- 채널톡 api -->
    <jsp:include page="/include/chatBot.jsp"></jsp:include>




</body>

</html>