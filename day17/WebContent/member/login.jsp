<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div>
<c:if test="${not empty login }">
	<c:redirect url="/header.jsp" />
</c:if>
<c:if test="${empty login }">
	<form action="login-action.jsp" method="POST">
		<p><input type="text" name="userid" placeholder="ID"></p>
		<p><input type="password" name="userpw" placeholder="Password"></p>
		<p><input type="submit" value="로그인" ></p>
	</form>
</c:if>

</div>

</body>
</html> 