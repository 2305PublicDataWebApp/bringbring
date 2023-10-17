<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<!-- Google Fonts -->
		<link
		  href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
		  rel="stylesheet">

		<link href="../resources/assets/css/common.css" rel="stylesheet">
	</head>
	<body>
	  <!-- ======= Header ======= -->
	  <header id="header" class="fixed-top ">
	    <div class="container d-flex align-items-center">
	      <img src="../resources/assets/img/main/icon-title.png" style="width: 27px;margin: 1px 5px 5px 0px;" alt="">
	      <h1 class="logo me-auto" style="font-family: 'RixYeoljeongdo_Regular';"><a href="/">브링브링</a></h1>
	      <!-- Uncomment below if you prefer to use an image logo -->
	      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
	
	      <nav id="navbar" class="navbar">
	        <ul>
	          <li><a class="nav-link scrollto" href="#about">배출안내</a></li>
	          <!-- <li><a class="nav-link scrollto" href="#services">수거신고</a></li> -->
	          <li><a class="nav-link scrollto" href="#portfolio">공지사항</a></li>
	          <li><a class="nav-link scrollto" href="/divide/list.do">나눔게시판</a></li>
	          
	          <c:if test="${sessionScope.sessionId eq null}">
				<li>
					<button onclick="login();" class="getstarted scrollto">로그인</button>
				</li>
			</c:if>
			<c:if test="${sessionScope.sessionId ne null}">
				<c:if test="${sessionScope.sessionUserGrade >= 2}">
					<li class="dropdown"><a href="#"><span>관리자 메뉴</span> <i class="bi bi-chevron-down"></i></a>
						<ul>
							<c:if test="${sessionScope.sessionUserGrade eq 3}">
								<!-- 최고 관리자 기능 -->
								<li><a href="/admin/memberList.do">회원 관리</a></li>
								<li><a href="/admin/reportList.do">신고 관리</a></li>
							</c:if>
							<li><a href="/admin/contactM.do">문의 관리</a></li>
							<li><a href="/admin/reservationM.do">배출 관리</a></li>
						</ul>
					</li>
				</c:if>
				<li><a class="nav-link scrollto" href="/mypage/main.do">${sessionScope.sessionName }님</a></li>
			    <li>
			    	<button onclick="logout();" class="getstarted scrollto">로그아웃</button>
			    </li>
			</c:if>
	        </ul>
	        <i class="bi bi-list mobile-nav-toggle"></i>
	      </nav><!-- .navbar -->
	
	    </div>
	  	</header><!-- End Header -->
	  	<script>
	  		<jsp:include page="/include/loginJs.jsp"></jsp:include>
		</script>
	</body>
</html>