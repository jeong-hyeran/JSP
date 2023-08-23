<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div>
	<h3>회원가입</h3>
	<form action="${cpath }/member/join-action.jsp" method="POST">
		<p><input type="text" name="userid" placeholder="ID" autofocus required autocomplete="off"></p>
		<p><input type="password" name="userpw" placeholder="Password" required></p>
		<p><input type="text" name="username" placeholder="Name" required></p>
		<p><input type="email" name="email" placeholder="ful@var" required></p>
		<p>생년월일<input type="date" name="birth" required></p>
	</form>
</div>

</body>
</html>