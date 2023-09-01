<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view.jsp</title>
</head>
<body>

<h1>view.jsp</h1>
<hr>

<table>
	<tr> 
		<td>제목</td>
		<td>${dto.title }</td>
	</tr>
	<tr> 
		<td>작성자</td>
		<td>${dto.writer}</td>
	</tr>
	<tr> 
		<td>내용</td>
		<td>${dto.content }</td>
	</tr>
</table>
<a href="${cpath }/ex05/delete?idx=${dto.idx}"><button>삭제</button></a>
</body>
</html>