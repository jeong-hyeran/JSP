<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>ex01-action.jsp</title>
</head>
<body>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="user"/>

<c:set var="dao" value="${MemberDAO.getInstance() }" />
<c:set var="login" value="${dao.login(user) }" scope="session" />

<%
	String autologin = request.getParameter("autologin");
	if(autologin != null){ // 자동 로그인 체크박스에 체크를 했다면
		Cookie c = new Cookie("JSESSIONID",session.getId());
		c.setMaxAge(60*60*24*7);
		response.addCookie(c);
	}
	response.sendRedirect("ex01-form.jsp");
%>

</body>
</html>