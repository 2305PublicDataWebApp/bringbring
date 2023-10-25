<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>대형 폐기물 배출 금액</title>
    <meta content="" name="description">
    <meta content="" name="keywords">


    <!-- Favicons -->
    <link href="../resources/assets/img/main/icon-title.png" rel="icon">
    <link href="../resources/assets/img/main/icon-title.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="../../../resources/assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="../../../resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="../../../resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="../../../resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="../../../resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="../../../resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="../../../resources/assets/css/style.css" rel="stylesheet">
    <link href="../../../resources/assets/css/common.css" rel="stylesheet">

    <!-- =======================================================
    * Template Name: Arsha
    * Updated: Sep 18 2023 with Bootstrap v5.3.2
    * Template URL: https://bootstrapmade.com/arsha-free-bootstrap-html-template-corporate/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


    <link rel="stylesheet" href="../../../resources/assets/css/reservation/guide.css">
    <link rel="stylesheet" href="../../../resources/assets/css/reservation/common.css">
</head>

<body>

<!-- 헤더 -->
<jsp:include page="/include/header.jsp"></jsp:include>

<div style="width: 100%;height: 74px;"></div>
<!-- ======= Hero Section ======= -->
<section id="hero" class="d-flex align-items-center" style="width: 100%;margin: 0 auto;">
    <div style="width: 1300px;margin: 0 auto;">
        <div style="float: left;margin-top: 60px;">
            <h1>대형 폐기물 배출 금액</h1>
            <div style="width: 100%;height: 30px;"></div>
            <h4 style="color: rgb(189, 245, 229);">대형 폐기물 배출 정보와 수수료를 안내드립니다.</h4>
        </div>
        <div style="display: flex;flex-direction: row;justify-content: flex-end;">
            <img src="../../../resources/assets/img/reservation/guideIcon.png" style="width: 250px;" alt="">
        </div>
    </div>

</section>
<div style="width: 100%;">

    <main style="margin-top: 50px; margin-bottom: 100px">
<%--        <p class="title">배출 물품 선택</p>--%>
<%--        <hr>--%>
        <div class="container">
            <div id="category_box">
                <button type="button" class="btn btn-outline-success" id="furniture" value="가구" onclick="wasteSelect(this);">가구</button>
                <button type="button" class="btn btn-outline-success" id="electronics" value="가전" onclick="wasteSelect(this);">가전</button>
                <button type="button" class="btn btn-outline-success" id="appliance" value="운동용품" onclick="wasteSelect(this);">운동용품</button>
                <button type="button" class="btn btn-outline-success" id="household" value="생활/주방" onclick="wasteSelect(this);">생활/주방</button>
                <button type="button" class="btn btn-outline-success" id="instrument" value="악기" onclick="wasteSelect(this);">악기</button>
                <button type="button" class="btn btn-outline-success" id="digital" value="디지털" onclick="wasteSelect(this);">디지털</button>
                <button type="button" class="btn btn-outline-success" id="other" value="기타" onclick="wasteSelect(this);">기타</button>
            </div>
        </div>
        <div>
            <div id="listDiv">
                    <table class="table table-hover" id="listTable" style="--bs-table-bg:none">
                        <tbody>
                          <p id="listDiv-p">물품을 선택해주세요</p>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </main>
</div><!-- End Hero -->

<!-- 메인 -->
<!-- End #main -->

<!-- 푸터 -->
<jsp:include page="/include/footer.jsp"></jsp:include>

<div id="preloader"></div>
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="../../../resources/assets/vendor/aos/aos.js"></script>
<script src="../../../resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../../resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="../../../resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="../../../resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="../../../resources/assets/vendor/waypoints/noframework.waypoints.js"></script>
<script src="../../../resources/assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="../../../resources/assets/js/main.js"></script>

<!-- 채널톡 api -->
<jsp:include page="/include/chatBot.jsp"></jsp:include>

<script type="text/javascript">

    // 버튼 선택 시 리스트 출력
    function wasteSelect(button) {
        // 모든 버튼에서 'active' 클래스 제거
        var buttons = document.querySelectorAll('.btn.btn-outline-success');
        buttons.forEach(function(btn) {
            btn.classList.remove('active');
        });

        // 클릭한 버튼에 'active' 클래스 추가
        button.classList.add('active');

        let cellNum = 1;
        let selectItem = button.value;
        console.log("선택된 값: " + selectItem);

        let encodedItem = encodeURIComponent(selectItem);
        let url = "/reservation/selectItem.do?" + encodedItem;

        $.ajax({
            url: url,
            data: { selectItem: selectItem },
            type: "GET",
            success: function (data) {
                const seletMsg = document.querySelector('#listDiv-p');
                seletMsg.style.display = 'none';

                var tableBody = document.getElementById('listTable');

                // 기존 목록을 모두 삭제
                while (tableBody.firstChild) {
                    tableBody.removeChild(tableBody.firstChild);
                }

                var groupedData = {};

                for (var i = 0; i < data.length; i++) {
                    var item = data[i];
                    var wasteTypeName = item.wasteType.wasteTypeName;
                    let wasteInfoNo = item.wasteInfo.wasteInfoNo;

                    if (!groupedData[wasteTypeName]) {
                        groupedData[wasteTypeName] = {
                            wasteCategoryName: wasteTypeName,
                            wasteInfoStandards: [],
                            wasteInfoFees: [],
                            wasteInfoNo: []
                        };
                    }

                    groupedData[wasteTypeName].wasteInfoStandards.push(item.wasteInfo.wasteInfoStandard);
                    groupedData[wasteTypeName].wasteInfoFees.push(item.wasteInfo.wasteInfoFee);
                    groupedData[wasteTypeName].wasteInfoNo.push(item.wasteInfo.wasteInfoNo);

                }
                var table = document.getElementById("listTable");
                // thead 요소 생성
                var thead = document.createElement('thead');

// 첫 번째 열 (종류)
                var thCategory = document.createElement('th');
                thCategory.textContent = "종류";
                thCategory.className = "firstTd";

// 두 번째 열 (규격)
                var thSpecification = document.createElement('th');
                thSpecification.textContent = "규격";

// 세 번째 열 (수수료)
                var thFee = document.createElement('th');
                thFee.textContent = "수수료";
                thFee.className = "thirdTd";

// thead에 열 추가
                thead.appendChild(thCategory);
                thead.appendChild(thSpecification);
                thead.appendChild(thFee);



                // 이벤트 리스너 연결 및 선택한 아이템을 배열에 추가 또는 제거
                for (var wasteTypeName in groupedData) {


                    var item = groupedData[wasteTypeName];
                    var trTag = document.createElement('tr');

                    // 첫 번째 열 (종류)
                    var firstCell = document.createElement('td');
                    var label = document.createElement('label');
                    label.textContent = item.wasteCategoryName;
                    firstCell.appendChild(label);
                    firstCell.className = "firstTd";

                    // 두 번째 열 (선택 상품, 여러 데이터)
                    var secondCell = document.createElement('td');
                    for (var i = 0; i < item.wasteInfoStandards.length; i++) {
                        var selectedText = item.wasteInfoStandards[i];
                        var pTag = document.createElement('p');
                        pTag.textContent = selectedText;
                        secondCell.appendChild(pTag);
                    }

                    // 세 번째 열 (가격, 여러 데이터)
                    var thirdCell = document.createElement('td');
                    for (var i = 0; i < item.wasteInfoFees.length; i++) {
                        var matchingFee = item.wasteInfoFees[i];
                        var pTag = document.createElement('p');
                        pTag.textContent = matchingFee+'원';
                        thirdCell.appendChild(pTag);
                    }

                    // 테이블에 thead 추가
                    table.appendChild(thead);

                    secondCell.className = "secondTd";
                    thirdCell.className = "thirdTd";
                    trTag.appendChild(firstCell);
                    trTag.appendChild(secondCell);
                    trTag.appendChild(thirdCell);
                    tableBody.appendChild(trTag);
                }
            },
            error: function () {
                alert("Ajax 오류! 관리자에게 문의하세요");
            }
        });
    }


</script>

</body>

</html>