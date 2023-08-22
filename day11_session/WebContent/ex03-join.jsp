<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03-join.jsp</title>
</head>
<body>

<h1>ex03-join.jsp</h1>
<hr>

<form action="ex03-action.jsp" method="POST">
	<p><input type="text" name="userId" placeholder="ID" required>
	<p><input type="password" name="userPw" placeholder="Password" required>
	<p><input type="text" name="userName" placeholder="Name" required>
	<p><input type="email" name="email" placeholder="foo@bar.com" required>
	<p>생년월일<input type="date" name="birth" required>
	<p><input type="submit" value="회원가입">
</form>

</body>
</html>