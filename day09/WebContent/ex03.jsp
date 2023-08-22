<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="youtube.DAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp</title>
<style>
	img{
		width: 250px;	
	}
</style>
</head>
<body>

<h1>ex02.jsp</h1>
<hr>

<h3>커넥션풀과 싱글톤이 적용된 dao를 이용하여 목록을 화면에 띄어보세요</h3>
<h3>select * from youtube order by idx</h3>

<c:set var="dao" value="${DAO.getInstance() }" />
<%-- ${dao } --%>
<c:set var="list" value="${dao.selectList() }" />
<%-- ${line } --%>
<div id="root">
<c:forEach var="dto" items="${list }">
<div>${dto.title }</div>
<div>${dto.channel}</div>
<div>${dto.viewCount }</div>
<div>
<img src="${dto.thumbnail }">
</div>

</c:forEach>
</div>

</body>
</html>