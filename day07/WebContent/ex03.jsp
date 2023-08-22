<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp</title>
<style>

	.tr{
		border: 1px solid black;
		margin-bottom: -2px; 
		display : flex;
		width: fit-content;
	}
	.tr > div{
		padding: 10px;
		border: 1px solid black;
		margin-right: -1px;
		height: 20px;
	}
	.white{
		background-color: white;
	}
	.grey{
		background-color: #eee;
	}
</style>
</head>
<body>

<h1>ex03.jsp</h1>
<hr>
<h3>dao 객체를 생성</h3>
<jsp:useBean id="dao" class="ex03.MovieDAO"/>

<h3>dao의 메서드를 호출하여 리스트 받기</h3>
<c:set var="list" value="${dao.getdata() }"/>

<h3>JSTL forEach로 출력</h3>


<%-- <h3>date : ${movie }</h3> --%>
<%-- ${dao.getdata() } --%>
<%-- <h3>list : ${list }</h3> --%>
<div class="tr">
	<div style="width: 35px;">순위</div>
	<div style="width: 200px;">제목</div>
	<div style="width: 100px;">개봉일자</div>
	<div style="width: 80px;">예매율</div>
	<div style="width: 100px;">예매관객수</div>
	<div style="width: 100px;">누적관객수</div>
</div>
<c:forEach var="line" items="${list }" varStatus="st">
<div class="tr ${st.index % 2 == 0 ? 'white' : 'grey' }">
	<div style="width: 35px;">${line.movie_rank }</div>
	<div style="width: 200px;">${line.title }</div>
	<div style="width: 100px;">${line.openningDate }</div>
	<div style="width: 80px;">${line.reserveRate }%</div>
	<div style="width: 100px;">
	<fmt:formatNumber value="${line.reserveCount }"/>명
	</div>
	<div style="width: 100px;">
	<fmt:formatNumber value="${line.watchCount }"/>명</div>
</div>
</c:forEach>
</body>
</html>