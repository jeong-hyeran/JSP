<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01-form.jsp</title>
</head>
<body>

<h1>ex01-form.jsp</h1>
<hr>
<table border="1" cellspacing="0" cellpadding="10">
<tr>
	<td>
		cookie.JSESSIONID.value<br>
		내가 마지막으로 사용한 세션의 ID
	</td>
	<td>${cookie.JSESSIONID.value }</td>
</tr>
<tr>
	<td>
		session.id<br>
		현재 사용중인 세션의 ID
	</td>
	<td> ${pageContext.session.id }</td>
</table>

<c:if test="${empty login }">
<h3>로그인 폼</h3>
<form action="ex01-action.jsp" method="POST">
	<p><input type="text" name="userid" placeholder="ID" required autocomplete="off" autofocus> </p>
	<p><input type="text" name="userpw" placeholder="Password" required></p>
	<p>
		<label>
			<input type="checkbox" name="autologin">
			자동로그인
		</label>
	</p>
			<p><input type="submit" value="로그인"></p>
</form>
</c:if>
<c:if test="${not empty login}">
	<h3>현재 접속된 사용자 : ${login.userid } (${login.username })</h3>
	<p>
		<a href="ex01-logout.jsp"><button>로그아웃</button></a>
	</p>
</c:if>
</body>
</html>