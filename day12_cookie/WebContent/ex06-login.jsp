<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
</head>
<body>


<h2>로그인</h2>

<c:if test="${empty login}">
<form action="ex06-login-action.jsp" method="POST">
	<p><input type="text" name="userid" placeholder="ID" value="${cookie.userid.value }" autofocus required></p>
	<p><input type="text" name="userpw" placeholder="PW" required></p>
	<p>
		<label>
			<input type="checkbox" name="storeId" 
				${not empty cookie.userid ?'checked' : '' }> <%-- checkbox는 체크 안하면 null이고 하면 on이다. --%>
			ID 저장 <%--로그인을 성공했을때 쿠키에 아이디를 저장하기위한것 --%>
		</label>
	</p>	
	<p><input type="submit" value="로그인">
</form>
</c:if>
<c:if test="${not empty login}">
	<h3>${login.username }님 	[${login.userid }]</h3>
	<a href="ex06-logout.jsp"><button>로그아웃</button></a>
</c:if>

</body>
</html>