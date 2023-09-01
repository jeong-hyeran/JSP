<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board2.*, member.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="boardDAO" value="${BoardDAO.getInstance() }" />
<c:set var="memberDAO" value="${MemberDAO.getInstance() }" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>day17 - board2</title>
</head>
<body>

<h1>board1</h1>
<hr>

<nav>
	<c:if test="${not empty login }">
		<div><h6>${login.userid }[${ login.username }]</h6></div>
	</c:if>
	<ul>
	
		<c:if test="${empty login }">
			<li><a href="${cpath }/member/login.jsp">로그인</a></li>
		</c:if>
		
		<c:if test="${not empty login }">
			<li><a href="${cpath }/membe/loout.jsp">로그아웃</a></li>
			<li><a href="${cpath }/board/write.jsp">새글작성</a></li>
			<li><a href="${cpath }/board/list.jsp">글목록</a></li>
		</c:if>
		
	</ul>
</nav>
