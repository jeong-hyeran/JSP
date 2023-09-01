<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write.jsp</title>
</head>
<body>

	<h1>새 글 작성</h1>
	<form method="POST">
		<table border="1" cellspacing="0" cellpadding="10">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" placeholder="제목" required
					autofocus></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="writer" placeholder="작성자" required></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" placeholder="내용을 작성하세요" required></textarea></td>
			</tr>
		</table>
		<p>
			<input type="submit" value="제출">
		</p>
	</form>
		<p>
			<a href="${cpath }/board"><button>목록</button></a>
		</p>
</body>
</html>