<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.MemberDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login-action.jsp</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8"); 
%>
<c:set var="dao" value="${MemberDAO.getInstance() }"/>
<jsp:useBean id="user" class="member.MemberDTO" />
<jsp:setProperty property="*" name="user"/>


<c:set var="login" value="${dao.login(user) }"	scope="session"/>

<%
	String storeId = request.getParameter("storeId");
	// checkbox의 value를 지정하지 않았을 경우
	// 체크하면 값은 'on'이고,
	// 체크하지 않으면 값은 null이다.
	
	boolean flag1 = storeId != null;
	boolean flag2 = session.getAttribute("login") != null;
	
	Cookie c = new Cookie("userid", request.getParameter("userid"));
	c.setMaxAge(flag1 && flag2 ? 300 :0);
	response.addCookie(c);
%>
<script>
	const login = '${login}'
	if(login == ''){
		alert('로그인 실패')
	}else{
		alert('로그인 성공')
	}
		location.href='ex06-login.jsp'
</script>

</body>
</html>

