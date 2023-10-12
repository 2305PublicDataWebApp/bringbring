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
		
	</head>
	<body>
	  <!-- ======= Header ======= -->
	  <header id="header" class="fixed-top ">
	    <div class="container d-flex align-items-center">
	      <img src="../resources/assets/img/main/cargo-truck.png" style="width: 46px;padding: 0px 7px 5px 0px;" alt="">
	      <h1 class="logo me-auto" style="font-family: 'RixYeoljeongdo_Regular';"><a href="index.html">브링브링</a></h1>
	
	      <nav id="navbar" class="navbar">
	        <ul>
	          <li><a class="nav-link scrollto" href="#about">배출안내</a></li>
	          <!-- <li><a class="nav-link scrollto" href="#services">수거신고</a></li> -->
	          <li><a class="nav-link scrollto" href="#portfolio">공지사항</a></li>
	          <li><a class="nav-link scrollto" href="#team">문의게시판</a></li>
	          <li><a class="nav-link scrollto" href="#team">나눔게시판</a></li>
	          
	          <li>
	            <c:if test="${sessionScope.sessionId eq null}">
		          	<button onclick="login();" class="getstarted scrollto">로그인</button>
	          	</c:if>
	          	<c:if test="${sessionScope.sessionId ne null} ">
		          	<button onclick="logout();" class="getstarted scrollto">로그아웃</button>
	          	</c:if>
	          </li>
	        </ul>
	        <i class="bi bi-list mobile-nav-toggle"></i>
	      </nav><!-- .navbar -->
	
	    </div>
	  </header><!-- End Header -->
	</body>
</html>