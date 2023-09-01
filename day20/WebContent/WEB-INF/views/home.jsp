<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>home.jsp</title>
</head>
<body>

<h1>home.jsp</h1>
<hr>
<h3>Hello!!</h3>
<h3>
	오늘은 <fmt:formatDate value="${date }" pattern="yyyy년 MM월 dd일" />
</h3>

<a href="${cpath }/board"><button>게시판</button></a>

</body>
</html>