<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>결제</title>
  <meta content="" name="description">
  <meta content="" name="keywords">


  <!-- Favicons -->
  <link href="../../../resources/assets/img/main/title-icon.png" rel="icon">
    <link href="../../../resources/assets/img/main/title-icon.png" rel="apple-touch-icon">

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

<!--  달력-->
<!--  <link rel="stylesheet" href="../../../resources/assets/css/reservation/bootstrap-material-datetimepicker.css" />-->
<!--  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">-->
  <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<!--  <link rel="stylesheet" href="/css/jquery-ui.min.css">-->
<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>-->
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
  <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>


  <!--결제-->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>


  <link rel="stylesheet" href="../../../resources/assets/css/reservation/payment.css">
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
      <h1>결제</h1>
      <div style="width: 100%;height: 30px;"></div>
      <h4 style="color: rgb(189, 245, 229);">선택하신 상품의 수수료를 결제해주세요</h4>
    </div>
    <div style="display: flex;flex-direction: row;justify-content: flex-end;">
      <img src="../../../resources/assets/img/reservation/payment.png" style="width: 250px;" alt="">
    </div>
  </div>

</section>
<div style="width: 100%;height: 1000px;">

<main>
  <h2 class="subject">결제</h2>
  <div>
    <div class="progress-bar out-progress-bar">
      <div class="progress-bar in-progress-bar"></div>
    </div>
  </div>
  <div>
    <p class="title">배출 정보</p>
  </div>
  <hr>
  <div id="infoContainer">
    <table class="table table-borderless">
      <tr>
        <td style="padding-top: 20px">
          <label>배출 품목</label>
        </td>
        <td>
          <table class="table table-borderless">
            <c:forEach items="${wasteDataList}" var="item" varStatus="i">
              <tr>
                <td class="selectedItems" style="padding-bottom: 20px; padding-top: 20px; border-bottom: 1px solid #ccc;">
                  <span class="selectSpan">선택 ${i.index + 1}</span><span>${item.wasteCategory.wasteCategoryName} > ${item.wasteType.wasteTypeName} > ${item.wasteInfo.wasteInfoStandard}</span>
                </td>
              </tr>
            </c:forEach>
          </table>
<%--          <ul class="list-group list-group-flush" id="itemList">--%>

<%--          </ul>--%>
        </td>
      </tr>
      <tr>
        <td style="padding-top: 17px">
          <label>배출 장소</label>
        </td>
        <td>
          <ul class="list-group list-group-flush">
            <li class="list-group-item">${reservationInfo.rvAddr}</li>
          </ul>
        </td>
      </tr>
      <tr>
        <td style="padding-top: 17px">
          <label>배출일</label>
        </td>
        <td>
          <ul class="list-group list-group-flush">
            <li class="list-group-item">${reservationInfo.rvRvDate}</li>
          </ul>
        </td>
      </tr>
      <tr>
        <td style="padding-top: 17px">
          <label>수수료</label>
        </td>
        <td>
          <ul class="list-group list-group-flush">
            <li class="list-group-item">${reservationDetail.rvDetailFee}원</li>
            <input type="hidden" id="rvDetailFee" name="rvDetailFee" value="${reservationDetail.rvDetailFee}원">
          </ul>
        </td>
      </tr>
    </table>
  </div>
  <div>
    <p class="title">결제 수단</p>
    <hr>
    <div>
      <div class="form-check" id="card-form">
        <div>
          <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
        </div>
        <div id="card-div">
          <label class="form-check-label" for="flexRadioDefault1" id="card-img">
            <img src="../../../resources/assets/img/reservation/card.png" id="payment-card">
            <p>신용카드</p>
          </label>
        </div>
      </div>
    </div>
  </div>
  <div id="submit_btn_box">
    <button class="btn btn-success" id="submitBtn" type="button" onclick="requestPay()">결제하기</button>
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
<!--day.js-->
<script src="https://cdn.jsdelivr.net/npm/dayjs@1.10.5/dayjs.min.js"></script>

<!-- 채널톡 api -->
<script>
  (function () { var w = window; if (w.ChannelIO) { return w.console.error("ChannelIO script included twice."); } var ch = function () { ch.c(arguments); }; ch.q = []; ch.c = function (args) { ch.q.push(args); }; w.ChannelIO = ch; function l() { if (w.ChannelIOInitialized) { return; } w.ChannelIOInitialized = true; var s = document.createElement("script"); s.type = "text/javascript"; s.async = true; s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js"; var x = document.getElementsByTagName("script")[0]; if (x.parentNode) { x.parentNode.insertBefore(s, x); } } if (document.readyState === "complete") { l(); } else { w.addEventListener("DOMContentLoaded", l); w.addEventListener("load", l); } })();

  ChannelIO('boot', {
    "pluginKey": "3e438b51-7087-4b0c-b50f-c1cb50c8f770"
  });


  function requestPay() {
    let uidDate = new dayjs().format("YYYYMMDDTHHmmss");
    const rvDetailTotal = ${reservationDetail.rvDetailTotal};
    // const Fee = document.querySelector('#rvDetailFee').value;
    const Fee = 100;
    const userEmail = '${sessionScope.sessionId}';
    const userName = '${sessionScope.sessionName}';


    console.log(uidDate);
    console.log("뭐야")
    var IMP = window.IMP;
    IMP.init("imp44058332"); // 예: imp00000000
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
        pg: "html5_inicis",
        pay_method: "card",
        pay_currency: "₩",
        merchant_uid: "BRING"+ uidDate,
        name: "브링브링",
        amount: Fee,
        buyer_email: userEmail,
        buyer_name: userName
        // buyer_tel: "010-4242-4242",
        // buyer_addr: "서울특별시 강남구 신사동",
        // buyer_postcode: "01181"
      }, function (rsp) { // callback
          console.log(rsp);
        if (rsp.success) {
          // 결제 성공 시 로직
          let msg = '결제가 완료되었습니다.';
          let date = dayjs();
          let format = "YYYY-MM-DD HH:mm:s";
          let nowDate = date.format(format);
          console.log(msg);

          $.ajax({
            type: "GET",
            url: '/reservation/pay.do',
            data: {
              userId : userEmail,
              rvDetailTotal: rvDetailTotal,
              rvDetailFee: Fee,
              payAmount: Fee,
              payMethod: "card",
              payCurrency: "₩",
              // payDate: nowDate,
              // imp_uid: rsp.imp_uid,
              payId: rsp.merchant_uid
            },
            success: function () {
              location.href="/reservation/payComplete.do";
            },
            error: function () {
              alert("Ajax 오류! 관리자에게 문의하세요");
            }
          });

        } else {
          // 결제 실패 시 로직
          var msg = '결제에 실패하였습니다. 관리자에게 문의하세요';
          alert(msg += '에러내용 : ' + rsp.error_msg);
        }
      });
    }
</script>

<script>

</script>

</body>

</html>