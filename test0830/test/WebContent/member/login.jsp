<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div id="login">
	
	<form action="${cpath }/member/login-action.jsp" method="POST">
		<p><input type="text" name="userid" placeholder="ID"  autofocus required autocomplete="off"></p>
		<p><input type="password" name="userpw" placeholder="Password" required></p>
		<p><input type="submit" value="로그인"></p>
	</form>

	<a href="${cpath }/member/join.jsp"><button>회원가입</button></a>
</div>

</body>
</html>