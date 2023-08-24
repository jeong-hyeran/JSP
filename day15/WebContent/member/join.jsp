<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div>
<c:if test="${not empty login }">
<script>
	alert('이미 가입되어 있습니다.')	
	location.href='${cpath}'
</script>
</c:if>

	<form action="join-action.jsp" method="POST">
	<p><input type="text" name="userid" placeholder="ID" autocomplete="off" autofocus required></p>
	<p><input type="password" name="userpw" placeholder="Password" required></p>
	<p><input type="text" name="username" placeholder="Name" required></p>
	<p><input type="email" name="email" placeholder="e@mail" required></p>
	<p>생년월일<input type="date" name="birth"required></p>
	<p><input type="submit" value="회원가입"></p>
	
	</form>

</div>
</body>
</html>