<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*,board.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="memberDAO" value="${MemberDAO.getInstance() }"/>
<c:set var="boardDAO" value="${BoardDAO.getInstance() }"/>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>day15</title>
<link href="${cpath }/style/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div style="background-color: black">
<header>
	<div>
		<h1><a href="${cpath }">day15</a></h1>
		<nav>
			<div id="user">
				<c:if test="${not empty login }">
					<h4>${login.userid } [${login.username }]</h4>
				</c:if>
			</div>
			<ul>
			<c:if test="${empty login }">
				<li><a href="${cpath }/member/login.jsp">로그인</a></li>
			</c:if>
			<c:if test="${not empty login }">
				<li><a href="${cpath }/member/logout.jsp">로그아웃</a></li>
			</c:if>
				<li><a href="${cpath }/board/list.jsp">게시판</a></li>
				<li><a href="${cpath }/member/join.jsp">회원가입</a></li>
			</ul>
		</nav>
	</div>

<hr>
	
</header>
</div>