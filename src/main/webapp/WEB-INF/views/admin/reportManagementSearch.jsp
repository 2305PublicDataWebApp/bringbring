<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
  <link href="../resources/assets/css/admin/management.css" rel="stylesheet">
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
        <h1>신고 관리</h1>
        <div style="width: 100%;height: 30px;"></div>
        <h4 style="color: rgb(189, 245, 229);">회원들이 신고한 게시물을 관리하는 페이지입니다.</h4>
      </div>
      <div style="display: flex;flex-direction: row;justify-content: flex-end;">
        <img src="../resources/assets/img/admin/page-icon4.png" style="width: 250px;" alt="">
      </div>
    </div>
  </section>

  <!-- 메인 -->
  <main>
    <section>
      <div class="row">
        <div class="four col-md-3">
          <div class="counter-box colored">
            <h4> 누적 신고 수 : ${reportCount}</h4>
          </div>
        </div>
        <div class="col-md-3">
          <div class="counter-box colored">
              <h4>삭제 된 게시물 수 : ${deleteCount}</h4>
          </div>
        </div>
    </section>
    <section>
      <div style="display: flex; justify-content: space-between">
        <div>
          <h2>신고 게시글</h2>
        </div>
        <form action="/admin/searchReport.do" method="GET">
          <div class="input-group" style="width: 400px; height: 30px;">
            <select name="searchCondition" class="form-select" aria-label=".form-select-lg example" style="width: 20%;">
              <option value="all" <c:if test="${searchCondition =='all'}">selected</c:if>>전체</option>
              <option value="id" <c:if test="${searchCondition =='id'}">selected</c:if>>작성자</option>
              <option value="title" <c:if test="${searchCondition =='title'}">selected</c:if>>글제목</option>
              <option value="category" <c:if test="${searchCondition =='category'}">selected</c:if>>신고유형</option>
            </select>
            <input type="text" class="form-control rounded" placeholder="검색어를 입력하세요" name="searchKeyword" style="width: 50%;" />
            <input type="submit" class="btn btn-outline-success" id="user-serch-btn" value="검색"></input>
          </div>
        </form>
      </div>
      <br/>
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="table-responsive">
              <table class="table align-middle text-center">
                <thead class="table-light align-middle">
                  <tr>
                    <th>신고 번호</th>
                    <th>글 번호</th>
                    <th>작성자</th>
                    <th>글 제목</th>
                    <th>작성일</th>
                    <th>신고일</th>
                    <th>신고 유형</th>
                    <th>-</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach var="report" items="${reportList}" varStatus="a">
                  <tr>
                    <td>${report.repNo}</td>
                    <td>${report.divNo}</td>
                    <td>${report.userId}</td>
                    <c:url var="detailUrl" value="/divide/detail.do">
                      <c:param name="divNo" value="${report.divNo}"></c:param>
                    </c:url>
                    <td><a href="${detailUrl}">${report.divTitle}</a></td>
                    <fmt:parseDate value="${report.divCreateDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parseDateTime1" type="both" />
                    <td><fmt:formatDate value="${parseDateTime1}" pattern="yyyy-MM-dd" /></td>
                    <fmt:parseDate value="${report.repCreateDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parseDateTime2" type="both" />
                    <td><fmt:formatDate value="${parseDateTime2}" pattern="yyyy-MM-dd" /></td>
                    <td>${report.repCategory}</td>
                    <td>
                      <button class="btn btn-success" data-bs-toggle="modal"
                              data-bs-target="#reportModal"  data-div-no="${report.divNo }">게시글 삭제</button>
                    </td>
                  </tr>
                  <div class="modal fade" id="reportModal" tabindex="-1"
                       aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="exampleModalLabel">신고 글 상세 정보</h5>
                          <button type="button" class="btn-close" data-bs-dismiss="modal"
                                  aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                          <input type="text" class="form-control" id="divNoModal"
                                 name="memberId" required>
                          <div class="mb-3">
                            <label  class="form-label"><h6>제목</h6></label>
                            <div id="modalTitle" style="width: 100%;height:40px; resize: none;border: 1px solid #dee2e6; padding: 5px;">
                            </div>
                          </div>
                          <div class="mb-3">
                            <label class="form-label"><h6>작성자</h6></label>
                            <div id="modalUserId" style="width: 100%;height:40px; resize: none;border: 1px solid #dee2e6; padding: 5px;">
                            </div>
                          </div>
                          <div class="mb-3">
                            <label class="form-label"><h6>글내용</h6></label>
                            <div id="modalContent"  style="width: 100%;height:150px; resize: none;border: 1px solid #dee2e6; padding: 5px;">
                            </div>
                          </div>
                          <div class="mb-3">
                            <label  class="form-label"><h6>신고유형</h6></label>
                            <div id="modalCategory" >
                            </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary"
                                    data-bs-dismiss="modal">닫기</button>
                            <button type="submit" class="btn btn-success" onclick="confirmDivideRemoval(${report.divNo})">게시글 삭제</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      <div class="mt-5 d-flex justify-content-center">
        <nav aria-label="Page navigation exampler">
          <ul class="pagination">
            <c:if test="${pInfo.startNavi ne '1' }">
              <li class="page-item"><a class="page-link" href="/admin/searchReport.do?page=${pInfo.startNavi-1 }" class="first"><i class="bi bi-chevron-left"></i></a></li>
            </c:if>
            <c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
              <c:url var="pageUrl" value="/admin/searchReport.do">
                <c:param name="page" value="${p }"></c:param>
                <c:param name="searchCondition" value="${searchCondition}"/>
                <c:param name="searchKeyword" value="${searchKeyword}"/>
              </c:url>
              <c:choose>
                <c:when test="${p == pInfo.currentPage}">
                  <li class="page-item active" ><a href="${pageUrl}" class="page-link" style="background-color:#00AD7C; border-color: #00AD7C">${p}</a></li>
                </c:when>
                <c:otherwise>
                  <li class="page-item"><a href="${pageUrl}" class="page-link">${p}</a></li>
                </c:otherwise>
              </c:choose>
            </c:forEach>
            <c:if test="${pInfo.endNavi ne pInfo.naviTotalCount }">
              <li class="page-item"><a class="page-link" href="/admin/searchReport.do?page=${pInfo.endNavi+1 }" class="last"><i class="bi bi-chevron-right"></i></a></li>
            </c:if>
          </ul>
        </nav>
      </div>
      </div>
    </section>

  </main>
<!-- End #main -->

  <!-- 푸터 -->
  <jsp:include page="/include/footer.jsp"></jsp:include>->

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
  <script src="../resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>


  <!-- Template Main JS File -->
  <script src="../resources/assets/js/main.js"></script>

  <!-- 채널톡 api -->
  <jsp:include page="/include/chatBot.jsp"></jsp:include>
  <script>

    $(document).ready(function () {
      var trigger = $('.hamburger'),
          overlay = $('.overlay'),
          isClosed = false;
    
        trigger.click(function () {
          hamburger_cross();      
        });
    
        function hamburger_cross() {
    
          if (isClosed == true) {          
            overlay.hide();
            trigger.removeClass('is-open');
            trigger.addClass('is-closed');
            isClosed = false;
          } else {   
            overlay.show();
            trigger.removeClass('is-closed');
            trigger.addClass('is-open');
            isClosed = true;
          }
      }
      
      $('[data-toggle="offcanvas"]').click(function () {
            $('#wrapper').toggleClass('toggled');
      });  
    });

    $(document).ready(function () {
      // 모달이 열릴 때의 이벤트 리스너 등록
      $('#reportModal').on('show.bs.modal', function (e) {
        var button = $(e.relatedTarget);
        var divNo = button.data('div-no');
        $('#divNoModal').val(divNo);
        $.ajax({
          url: '/admin/reportListDetail.do',
          type: 'GET',
          data: { divNo: divNo },
          dataType: 'json',
          success: function(response) {
            var reportDetails = response; // 서버에서 반환한 JSON 데이터를 변수에 저장
            var plainTextContent = stripHtmlTags(reportDetails[0].divContent);
            $('#modalTitle').text(reportDetails[0].divTitle); // 예시: 첫 번째 객체의 divTitle을 표시
            $('#modalContent').text(plainTextContent); // 예시: 첫 번째 객체의 divContent를 표시
            $('#modalCategory').text(reportDetails[0].repCategory); // 예시: 첫 번째 객체의 repCategory를 표시
            $('#modalUserId').text(reportDetails[0].userId); // 예시: 첫 번째 객체의 repCategory를 표시
          },
          error: function(error) {
            console.error('Error fetching divide details: ', error);
          }
        });

      });

      function stripHtmlTags(html) {
        var doc = new DOMParser().parseFromString(html, 'text/html');
        return doc.body.textContent || "";
      }
      // 신고글 삭제 버튼 클릭 시 이벤트 처리
      $(document).on('click', '.report-button', function() {
        var divNo = $(this).data('div-no');
        confirmDivideRemoval(divNo);
      });

    });



    //신고글 삭제
    function confirmDivideRemoval(divNo) {
      var confirmation = confirm("신고글을 삭제하시겠습니까?");
      if (confirmation) {
        $.ajax({
          url: '/admin/divideDelete.do',
          type: 'POST',
          data: { divNo: divNo },
          success: function(response) {
            console.log(response);
            if (response ==="success") {
              alert("성공적으로 삭제 되었습니다.");
              location.reload();
            } else {
              alert("신고글 삭제에 실패하였습니다. 다시 시도해주세요.");
            }
          },
          error: function(error) {
            alert("오류가 발생하였습니다. 다시 시도해주세요.");
          }
        });
      }
    }


  </script>
  
  
</body>

</html>