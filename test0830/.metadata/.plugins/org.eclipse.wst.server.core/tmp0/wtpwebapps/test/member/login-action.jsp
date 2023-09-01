<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<jsp:useBean id="user" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="user"/>
<c:set var="login" value="${memberDAO.login(user) }" scope="session"/>

<script>
	const login = '${login}'
	alert(login ==''?'로그인 실패':'${login.username}님 환영합니다.')
	location.href='${cpath}'
</script>

</body>
</html>