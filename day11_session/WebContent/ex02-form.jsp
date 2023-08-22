<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-form.jsp</title>
</head>
<body>

<h1>ex02-form.jsp</h1>
<hr>

<h3>로그인 폼</h3>
${dao }
<form action="ex02-action.jsp" method="POST">
	<p><input type="text" name="userId" placeholder="ID" autofocus required></p>
	<p><input type="text" name="userPw" placeholder="password" required></p>
	<p><input type="submit" value="로그인"></p>
</form>

</body>
</html>