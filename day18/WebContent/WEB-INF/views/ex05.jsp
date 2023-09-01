<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05.jsp</title>
</head>
<body>

<h1>ex05.jsp</h1>
<hr>

<table border="1" cellspacing="0" cellpadding="10">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>내용</th>
			<th>날짜</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.idx }</td>
			<td><a href="${cpath}/ex05/view?idx=${dto.idx}">${dto.title }</a></td>
			<td>${dto.writer }</td>
			<td>${dto.content }</td>
			<td>${dto.wdate }</td>
		</tr>
		</c:forEach>
	</tbody>
</table>

<a href="${cpath }/ex05/write"><button>새글 작성</button></a>

</body>
</html>