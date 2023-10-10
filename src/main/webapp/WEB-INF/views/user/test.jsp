<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>아이디 비번 INSERT</h1>
		<fieldset>
			<legend>Insert Test</legend>
			<form action="/member/insert.do" method="post">
				아이디 : <input name="memberId" /> <br>
				비밀번호 : <textarea name="memberPw" rows="" cols=""></textarea> <br>
				<input type="submit" value="완료">
			</form>
		</fieldset>
	</body>
</html>