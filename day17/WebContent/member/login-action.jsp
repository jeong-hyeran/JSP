<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<jsp:useBean id="user" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="user"/>

<c:set var="login" value="${memberDAO.login(user) }" scope="session"/>

${login }
<script>
	const login = '${login}'
	alert(login != '' ? '로그인성공':'로그인실패')
	location.href='${cpath}/header.jsp'
</script>
</body>
</html>