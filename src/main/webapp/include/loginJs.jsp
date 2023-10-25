<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    // Kakao.init('b82d0f1e81f80d7dfb52a8b896d5b146'); // JavaScript 키
    // console.log(Kakao.isInitialized());
  	 //function deleteCookie(name) {
        //document.cookie = name + '=; path=/; Expires=Thu, 01 Jan 1999 00:00:10 GMT; domain=.kakao.com;';
    //}
     function login(){
    	// deleteCookie('_kawlt');
        location.href = "/user/login.do";
        }
     function logout(){
    	// Kakao.Auth.logout()
     	location.href = "/user/logout.do";
     }

function loginCheck(){
    if(confirm("로그인 후 사용가능한 기능입니다. 로그인 페이지로 이동하시겠습니까?")){
        location.href="/user/login.do";
    }
}