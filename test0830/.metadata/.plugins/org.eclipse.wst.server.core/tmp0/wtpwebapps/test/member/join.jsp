<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div id="join">
	<form action="${cpath }/member/join-action.jsp" method="POST">
		<p><input type="text" name="userid" placeholder="ID" autofocus required autocomplete="off" ></p>
		<p><input type="password" name="userpw" placeholder="Password" required></p>
		<p><input type="text" name="username" placeholder="Name" required autocomplete="off" ></p>
		<p><input type="email" name="email" placeholder="e@mail" required autocomplete="off" ></p>
		<p>생년월일 <input type="date" name="birth" value="2023-08-30" required></p>
		<p><input type="submit" value="회원가입"></p>
	</form>
</div>
</body>
</html>