<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>브링브링</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="../resources/assets/img/main/icon-title.png" rel="icon">
    <link href="../resources/assets/img/main/icon-title.png" rel="apple-touch-icon">

    <!-- Vendor CSS Files -->
    <link href="../resources/assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="../resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="../resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="../resources/assets/css/style.css" rel="stylesheet">
    <link href="../resources/assets/css/common.css" rel="stylesheet">


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
          <h1 style="font-family: 'LINESeedKR-Bd';">나눔 게시판</h1>
          <div style="width: 100%;height: 30px;"></div>
          <h4 style="color: rgb(189, 245, 229);">당신의 낡고 병든 추억이 누군가에겐 도움이 될 수 있습니다.</h4>
        </div>
        <div style="display: flex;flex-direction: row;justify-content: flex-end;">
          <img src="../resources/assets/img/divide/free-icon-gift-3835774.png" style="width: 250px;" alt="">
        </div>
      </div>
    </section>
    
  <main style="width: 100%;margin: 0 auto;padding-top: 50px;">
    <section data-aos="fade-up">
      <div style="width: 1000px;margin: 0 auto;">    
          <div class="input-group" style="width: 600px;float: left;" >
              <select name="searchCondition" class="form-select" aria-label="Default select example" style="margin-right: 8px;border: 1px solid #adb5bd;">
                  <option value="all">전체</option>
                  <option value="title">제목</option>
                  <option value="nickName">지역</option>
                </select>
              <input name="searchKeyword" style="width: 200px;border: 1px solid #adb5bd;" class="form-control me-2" type="search" placeholder="검색어를 입력해주세요." aria-label="Search">
              <button class="btn btn-outline-success" style="border-bottom-right-radius: 5px;border-top-right-radius: 5px;z-index: 1;width: 80px;" type="submit" >Search</button>
          </div>
          <div style="float: right;">
            <button type="button" class="btn btn-success">글 등록</button>
          </div>
          <div style="width: 100%;float: left;border-top: 1px solid #ccc;margin-top: 15px;padding: 10px 0px">
              <p style="float:left;font-size: 18px;margin: 0;padding: 5px;font-weight: 600;font-family: 'SUITE-Regular';letter-spacing: 2px;padding-left: 15px;"># 20건</p>
              <p style="margin: 0;padding: 7px 13px 0px 8px;margin-left: 3px;float: right;">
              <a href="/community/certify.tp" style="text-decoration:underline;">최신순 </a>|
              <a href="/community/certify.tp?sortType=likeDESC">추천순</a>
          </div>
          <table data-aos-delay="50" class="table" style="text-align: center;margin:0;margin-top: 5px;">
            <thead>
              <tr class="table" style="border-bottom: 2px solid #ccc;">
              </tr>
            </thead>
            <tbody>
            <c:forEach var="divide" items="${dList}" varStatus="i">
                <tr>
                    <c:url var="detailUrl" value="/divide/detail.do">
                        <c:param name="divNo" value="${divide.boardNo }"></c:param>
                    </c:url>
                    <td style="width: 220px;padding-top: 20px;padding-bottom: 20px;">
                        <div class="card" style="width: 200px;height: 120px;overflow: hidden">
                            <div class="card-img-top" style="width: 100%; height: 100%; background-image: url(${divide.imagePath}); background-position: center center;"></div>
                        </div>
                    </td >
                    <td style="text-align: left;font-size: 17px;">
                        <h4 style="padding-top: 20px;font-weight: 600;margin: 0;font-size: 22px;">
                            <a href="${detailUrl}">${divide.divTitle}</a>
                        </h4>
                        <br>
                        나눔 지역 : <br>
                        카테고리 :
                    </td>
                    /////////////////////////////
                    <td id="tr">
                        <a href="${detailUrl}">${divide.divTitle}</a>
                    </td>
                    <td class="tr">${divide.userNickname }</td>
                    <td class="tr">
                        <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${divide.divCreateDate }" />
                    </td>
                    <td>좋아요 수</td>
                    <td class="tr">
                        <fmt:formatNumber pattern="##,###,###" value="${divide.viewCount}"></fmt:formatNumber>
                    </td>
                </tr>
            </c:forEach>
              <!-- 아 -->
              <tr>
                <td style="width: 220px;padding-top: 20px;padding-bottom: 20px;">
                    <div class="card" style="width: 200px;height: 120px;overflow: hidden">
                    <div class="card-img-top" style="width: 100%; height: 100%; background-image: url(${community.boardFilePath}); background-position: center center;"></div>
                    </div>
                </td >
                <td style="text-align: left;font-size: 17px;">
                    <h4 style="padding-top: 20px;font-weight: 600;margin: 0;font-size: 22px;">
                        <a href="#">제목</a>
                    </h4> 
                    <br>
                    나눔 지역 : <br>
                    카테고리 : 
                </td>
                <td style="width: 100px;">
                    <div style="margin-top: 110px;">
                      <i class="bi bi-chat"></i>
                      2 &nbsp;
                      <i class="bi bi-heart"></i>
                      2
                    </div>
                </td>
              </tr>
              <tr>
                <td style="width: 220px;padding-top: 20px;padding-bottom: 20px;">
                    <div class="card" style="width: 200px;height: 120px;overflow: hidden">
                    <div class="card-img-top" style="width: 100%; height: 100%; background-image: url(${community.boardFilePath}); background-position: center center;"></div>
                    </div>
                </td >
                <td style="text-align: left;font-size: 17px;">
                    <h4 style="padding-top: 20px;font-weight: 600;margin: 0;font-size: 22px;">
                        <a href="#">제목</a>
                    </h4> 
                    <br>
                    나눔 지역 : <br>
                    카테고리 : 
                </td>
                <td style="width: 100px;">
                    <div style="margin-top: 110px;">
                      <i class="bi bi-chat"></i>
                      2 &nbsp;
                      <i class="bi bi-heart"></i>
                      2
                    </div>
                </td>
              </tr>
              <tr>
                <td style="width: 220px;padding-top: 20px;padding-bottom: 20px;">
                    <div class="card" style="width: 200px;height: 120px;overflow: hidden">
                    <div class="card-img-top" style="width: 100%; height: 100%; background-image: url(${community.boardFilePath}); background-position: center center;"></div>
                    </div>
                </td >
                <td style="text-align: left;font-size: 17px;">
                    <h4 style="padding-top: 20px;font-weight: 600;margin: 0;font-size: 22px;">
                        <a href="#">제목</a>
                    </h4> 
                    <br>
                    나눔 지역 : <br>
                    카테고리 : 
                </td>
                <td style="width: 100px;">
                    <div style="margin-top: 110px;">
                      <i class="bi bi-chat"></i>
                      2 &nbsp;
                      <i class="bi bi-heart"></i>
                      2
                    </div>
                </td>
              </tr>
              <tr>
                <td style="width: 220px;padding-top: 20px;padding-bottom: 20px;">
                    <div class="card" style="width: 200px;height: 120px;overflow: hidden">
                    <div class="card-img-top" style="width: 100%; height: 100%; background-image: url(${community.boardFilePath}); background-position: center center;"></div>
                    </div>
                </td >
                <td style="text-align: left;font-size: 17px;">
                    <h4 style="padding-top: 20px;font-weight: 600;margin: 0;font-size: 22px;">
                        <a href="#">제목</a>
                    </h4> 
                    <br>
                    나눔 지역 : <br>
                    카테고리 : 
                </td>
                <td style="width: 100px;">
                    <div style="margin-top: 110px;">
                      <i class="bi bi-chat"></i>
                      2 &nbsp;
                      <i class="bi bi-heart"></i>
                      2
                    </div>
                </td>
              </tr>
              <tr>
                <td style="width: 220px;padding-top: 20px;padding-bottom: 20px;">
                    <div class="card" style="width: 200px;height: 120px;overflow: hidden">
                    <div class="card-img-top" style="width: 100%; height: 100%; background-image: url(${community.boardFilePath}); background-position: center center;"></div>
                    </div>
                </td >
                <td style="text-align: left;font-size: 17px;">
                    <h4 style="padding-top: 20px;font-weight: 600;margin: 0;font-size: 22px;">
                        <a href="#">제목</a>
                    </h4> 
                    <br>
                    나눔 지역 : <br>
                    카테고리 : 
                </td>
                <td style="width: 100px;">
                    <div style="margin-top: 110px;">
                      <i class="bi bi-chat"></i>
                      2 &nbsp;
                      <i class="bi bi-heart"></i>
                      2
                    </div>
                </td>
              </tr>
              <tr>
                <td style="width: 220px;padding-top: 20px;padding-bottom: 20px;">
                    <div class="card" style="width: 200px;height: 120px;overflow: hidden">
                    <div class="card-img-top" style="width: 100%; height: 100%; background-image: url(${community.boardFilePath}); background-position: center center;"></div>
                    </div>
                </td >
                <td style="text-align: left;font-size: 17px;">
                    <h4 style="padding-top: 20px;font-weight: 600;margin: 0;font-size: 22px;">
                        <a href="#">제목</a>
                    </h4> 
                    <br>
                    나눔 지역 : <br>
                    카테고리 : 
                </td>
                <td style="width: 100px;">
                    <div style="margin-top: 110px;">
                      <i class="bi bi-chat"></i>
                      2 &nbsp;
                      <i class="bi bi-heart"></i>
                      2
                    </div>
                </td>
              </tr>
              <tr>
                <td style="width: 220px;padding-top: 20px;padding-bottom: 20px;">
                    <div class="card" style="width: 200px;height: 120px;overflow: hidden">
                    <div class="card-img-top" style="width: 100%; height: 100%; background-image: url(${community.boardFilePath}); background-position: center center;"></div>
                    </div>
                </td >
                <td style="text-align: left;font-size: 17px;">
                    <h4 style="padding-top: 20px;font-weight: 600;margin: 0;font-size: 22px;">
                        <a href="#">제목</a>
                    </h4> 
                    <br>
                    나눔 지역 : <br>
                    카테고리 : 
                </td>
                <td style="width: 100px;">
                    <div style="margin-top: 110px;">
                      <i class="bi bi-chat"></i>
                      2 &nbsp;
                      <i class="bi bi-heart"></i>
                      2
                    </div>
                </td>
              </tr>
              <tr>
                <td style="width: 220px;padding-top: 20px;padding-bottom: 20px;">
                    <div class="card" style="width: 200px;height: 120px;overflow: hidden">
                    <div class="card-img-top" style="width: 100%; height: 100%; background-image: url(${community.boardFilePath}); background-position: center center;"></div>
                    </div>
                </td >
                <td style="text-align: left;font-size: 17px;">
                    <h4 style="padding-top: 20px;font-weight: 600;margin: 0;font-size: 22px;">
                        <a href="#">제목</a>
                    </h4> 
                    <br>
                    나눔 지역 : <br>
                    카테고리 : 
                </td>
                <td style="width: 100px;">
                    <div style="margin-top: 110px;">
                      <i class="bi bi-chat"></i>
                      2 &nbsp;
                      <i class="bi bi-heart"></i>
                      2
                    </div>
                </td>
              </tr>
              <tr>
                <td style="width: 220px;padding-top: 20px;padding-bottom: 20px;">
                    <div class="card" style="width: 200px;height: 120px;overflow: hidden">
                    <div class="card-img-top" style="width: 100%; height: 100%; background-image: url(${community.boardFilePath}); background-position: center center;"></div>
                    </div>
                </td >
                <td style="text-align: left;font-size: 17px;">
                    <h4 style="padding-top: 20px;font-weight: 600;margin: 0;font-size: 22px;">
                        <a href="#">제목</a>
                    </h4> 
                    <br>
                    나눔 지역 : <br>
                    카테고리 : 
                </td>
                <td style="width: 100px;">
                    <div style="margin-top: 110px;">
                      <i class="bi bi-chat"></i>
                      2 &nbsp;
                      <i class="bi bi-heart"></i>
                      2
                    </div>
                </td>
              </tr>
            </tbody>
          </table>
      </div>
    </section>
    <div style="width: 1000px;margin: 0 auto;margin-top: 60px;">
      <nav aria-label="Page navigation example" style="display: flex;">
        <ul class="pagination" style="margin: 0 auto;">
            <c:if test="${pInfo.startNavi ne 1}">
                <c:url var="bPageUrl" value="/divide/list.do">
                    <c:param name="page" value="${pInfo.startNavi-1}"></c:param>
                </c:url>
                <li class="page-item">
                    <a style="color: black;" class="page-link" href="${bPageUrl}">Previous</a>
                </li>
            </c:if>
            <c:forEach begin="${pInfo.startNavi}" end="${pInfo.endNavi}" var="p">
                <c:url var="pageUrl" value="/divide/list.do">
                    <c:param name="page" value="${p}"></c:param>
                </c:url>
                <li class="page-item">
                    <a style="color: black;" class="page-link" href="${pageUrl}">${p}</a>
                </li>
            </c:forEach>
            <c:if test="${pInfo.endNavi ne pInfo.naviTotalCount}">
                <c:url var="nPageUrl" value="/divide/list.do">
                    <c:param name="page" value="${pInfo.endNavi+1}"></c:param>
                </c:url>
                <li class="page-item">
                    <a style="color: black;" class="page-link" href="${nPageUrl}">Next</a>
                </li>
            </c:if>
<%--          <li class="page-item"><a class="page-link" href="#">Previous</a></li>--%>
<%--          <li class="page-item"><a class="page-link" href="#">1</a></li>--%>
<%--          <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
<%--          <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
<%--          <li class="page-item"><a class="page-link" href="#">4</a></li>--%>
<%--          <li class="page-item"><a class="page-link" href="#">5</a></li>--%>
<%--          <li class="page-item"><a class="page-link" href="#">Next</a></li>--%>
        </ul>
      </nav>
    </div>
  </main>
  <!-- 메인 -->
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

  <!-- 채널톡 api -->
  <script>
    (function () { var w = window; if (w.ChannelIO) { return w.console.error("ChannelIO script included twice."); } var ch = function () { ch.c(arguments); }; ch.q = []; ch.c = function (args) { ch.q.push(args); }; w.ChannelIO = ch; function l() { if (w.ChannelIOInitialized) { return; } w.ChannelIOInitialized = true; var s = document.createElement("script"); s.type = "text/javascript"; s.async = true; s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js"; var x = document.getElementsByTagName("script")[0]; if (x.parentNode) { x.parentNode.insertBefore(s, x); } } if (document.readyState === "complete") { l(); } else { w.addEventListener("DOMContentLoaded", l); w.addEventListener("load", l); } })();

    ChannelIO('boot', {
      "pluginKey": "3e438b51-7087-4b0c-b50f-c1cb50c8f770"
    });

    <!-- 로그인, 로그아웃 -->
    <jsp:include page="/include/loginJs.jsp"></jsp:include>
  </script>
  
  
</body>

</html>