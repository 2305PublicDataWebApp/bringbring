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
          <h1>회원 관리</h1>
          <div style="width: 100%;height: 30px;"></div>
          <h4 style="color: rgb(189, 245, 229);">회원 정보 조회, 회원 탈퇴 관리, 관리자 권한 부여 페이지입니다. </h4>
        </div>
        <div style="display: flex;flex-direction: row;justify-content: flex-end;">
          <img src="../resources/assets/img/admin/page-icon.png" style="width: 250px;" alt="">
        </div>
      </div>
    </section>

    <!-- 메인 -->
    <main>
      <section>
        <div class="row">
          <div class="four col-md-3">
            <div class="counter-box colored">
              <h4>회원 수 : ${userCount}</h4>
            </div>
          </div>
          <div class="col-md-3">
            <div class="counter-box colored">
                <h4>관리자 수 : ${adminCount}</h4>
            </div>
          </div>
          <div class="col-md-3">
            <div class="counter-box colored">
                <h4>탈퇴한 회원 : ${deletedUser}</h4>
            </div>
          </div>
          <div class="col-md-3">
            <button onclick="location.href='/admin/adminList.do'" class="region-btn" style="width: 300px; height: 80px; border: none;">
              <h4>관리자 조회</h4>
            </button>
          </div>
        </div>
      </section>
      <section>
        <div style="display: flex; justify-content: space-between">
          <div>
            <h2>회원 리스트</h2>
          </div>
          <form action="/admin/searchUser.do" method="GET">
          <div class="input-group" style="width: 400px; height: 30px;">
              <select name="searchCondition" class="form-select" aria-label=".form-select-lg example" style="width: 20%;">
                <option value="all" <c:if test="${searchCondition =='all'}">selected</c:if>>전체</option>
                <option value="id" <c:if test="${searchCondition =='id'}">selected</c:if>>아이디</option>
                <option value="number" <c:if test="${searchCondition =='number'}">selected</c:if>>회원번호</option>
                <option value="phone" <c:if test="${searchCondition =='phone'}">selected</c:if>>전화번호</option>
                <option value="userDeleted" <c:if test="${searchCondition =='userDeleted'}">selected</c:if>>탈퇴여부</option>
              </select>
              <input type="text" class="form-control" placeholder="검색어를 입력하세요" name="searchKeyword" value="${searchKeyword}" style="width: 5  0%;" />
              <button type="submit" class="btn btn-outline-success" id="user-serch-btn" >검색</button>
          </div>
          </form>

        </div>
        <br/>
        <div class="table-responsive">
          <table class="table align-middle text-center">
              <thead class="table-success align-middle">
                  <tr>
                      <th>회원 번호</th>
                      <th>회원 아이디</th>
                      <th>핸드폰 번호</th>
                      <th>가입일</th>
                      <th>탈퇴 여부</th>
                      <th>관리</th>
                  </tr>
              </thead>
              <tbody>
                  <c:forEach var="user" items="${searchList}" varStatus="u">
                    <tr>
                      <td>${user.userNo}</td>
                      <td>${user.userId}</td>
                      <td>${user.userPhone}</td>
                      <td>
                       ${user.userCreateDate}
                      </td>
                      <td>
                        ${user.isUserDeleted}
                      </td>
                      <td>
                        <c:if test="${user.userNo ne 1}">
                          <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                  data-bs-target="#adminModal"  data-user-no="${user.userNo}">
                            관리자 임명
                          </button>
                        </c:if>
                        <c:if test="${user.userNo eq 1}">
                          최고 관리자
                        </c:if>
                        <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                data-bs-target="#adminModal" data-user-no="${user.userNo}">
                          관리자 임명
                        </button>
                        <c:if test="${user.isUserDeleted.toString() eq 'Y'}">
                          <button type="button" class="btn btn-success" onclick="confirmUserRemoval(${user.userNo})">
                            탈퇴 승인
                          </button>
                        </c:if>

                      </td>
                    </tr>
                    <div class="modal fade" id="adminModal" tabindex="-1"
                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">관리자 임명</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                            <form class="sign-form" action="/admin/insertAdmin.do" method="post">
                              <input type="hidden" name="userNo" id="userNoInput">
                              <div class="mb-3 custom-input">
                                <label class="form-label">관할지역</label>
                                <div class="input-group">
                                  <select name="cityNo" id="cityNo" style="width: 100px;margin-right: 15px;">
                                    <c:forEach var="city" items="${cList}" >
                                      <option value="${city.cityNo}">${city.cityName}</option>
                                    </c:forEach>
                                    </select>
                                    <select name="regionNo" id="regionNo" style="width: 150px;">
                                    </select>
                                </div>
                              </div>
                              <div class="mb-3 custom-input">
                                <label for="adminOrg" class="form-label">기관명</label>
                                <div class="input-group">
                                  <input type="text" class="form-control" id="adminOrg"
                                         name="adminOrg" required placeholder="기관 명을 입력해 주세요">
                                </div>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-secondary"
                                        data-bs-dismiss="modal">닫기</button>
                                <button type="submit" class="btn btn-success">관리자 임명</button>
                              </div>
                            </form>
                            <!--2안  -->
                          </div>
                        </div>
                      </div>
                    </div>
                  </c:forEach>
              </tbody>
          </table>
          <div class="mt-5 d-flex justify-content-center">
            <nav aria-label="Page navigation exampler">
              <ul class="pagination">
                <c:if test="${pageInfo.startNavi ne '1' }">
                  <li class="page-item"><a class="page-link" href="/admin/searchUser.do?page=${pageInfo.startNavi-1 }" class="first"><i class="bi bi-chevron-left"></i></a></li>
                </c:if>
                <c:forEach begin="${pageInfo.startNavi }" end="${pageInfo.endNavi }" var="p">
                  <c:url var="pageUrl" value="/admin/searchUser.do">
                    <c:param name="page" value="${p }"></c:param>
                    <c:param name="searchCondition" value="${searchCondition}"/>
                    <c:param name="searchKeyword" value="${searchKeyword}"/>
                  </c:url>
                  <c:choose>
                    <c:when test="${p == pageInfo.currentPage}">
                      <li class="page-item active" ><a href="${pageUrl}" class="page-link" style="background-color:#00AD7C; border-color: #00AD7C">${p}</a></li>
                    </c:when>
                    <c:otherwise>
                      <li class="page-item"><a href="${pageUrl}" class="page-link">${p}</a></li>
                    </c:otherwise>
                  </c:choose>
                </c:forEach>
                <c:if test="${pageInfo.endNavi ne pageInfo.naviTotalCount }">
                  <li class="page-item"><a class="page-link" href="/admin/memberList.do?page=${pageInfo.endNavi+1 }" class="last"><i class="bi bi-chevron-right"></i></a></li>
                </c:if>
              </ul>
            </nav>
          </div>
      </div>
      </section>
    </main>
  <!-- End #main -->
    <!-- 푸터 -->
    <jsp:include page="/include/footer.jsp"></jsp:include>nd Footer -->

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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.10.2/umd/popper.min.js"></script>


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
        $('#adminModal').on('show.bs.modal', function (e) {
          var button = $(e.relatedTarget);
          var userNo = button.data('user-no');
          $('#userNoInput').val(userNo);
          updateRegionOptions();
        });

        // citySelect의 change 이벤트에 대한 이벤트 핸들러 등록
        $('#cityNo').change(function () {
          updateRegionOptions();
        });

        function updateRegionOptions() {
          var citySelect = document.getElementById("cityNo");
          var regionSelect = document.getElementById("regionNo");
          var cityNo = citySelect.value;

          // 시티넘버가 0이 아닌 경우에만 AJAX 요청 보내기
          if (cityNo !== "0") {
            $.ajax({
              url: "/admin/selectRegion.do",
              data: { cityNo: cityNo },
              type: "POST",
              success: function (data) {
                console.log(data);
                // 서버에서 받은 데이터로 리전 셀렉트 박스 업데이트
                regionSelect.innerHTML = "";
                for (var i = 0; i < data.length; i++) {
                  var option = document.createElement("option");
                  option.value = data[i].regionNo;
                  option.text = data[i].regionName;
                  regionSelect.appendChild(option);
                }
              },
              error: function () {
                alert("Ajax 오류! 관리자에게 문의하세요");
              }
            });
          } else {
            // 시티넘버가 0인 경우에 대한 처리 (예: 경고 메시지 표시)
            alert("시티넘버가 선택되지 않았습니다.");
          }
        }
      });

      //회원 탈퇴 승인
      function confirmUserRemoval(userNo) {
        var confirmation = confirm("회원탈퇴를 승인 하시겠습니까?" + userNo);
        if (confirmation) {
          $.ajax({
            url: '/admin/userDelete.do',
            type: 'POST',
            data: { userNo: userNo },
            success: function(response) {
              console.log(response);
              if (response ==="success") {
                alert("회원 탈퇴 승인 완료.");
                location.reload();
              } else {
                alert("회원 탈퇴 승인 실패. 다시 시도해주세요.");
              }
            },
            error: function(error) {
              // 오류 발생 시 처리를 여기에 추가합니다.
              alert("오류가 발생하였습니다. 다시 시도해주세요.");
            }
          });
        }
      }
    </script>


  </body>

  </html>