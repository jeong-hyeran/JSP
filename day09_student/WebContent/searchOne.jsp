<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<main>

<!-- <div id="main"> -->
<h3>단일조회</h3>

${param.name }
<c:set var="dto" value="${dao.selectOne(param.name) }" />
	<ul id="search">
		<li>이름 : ${dto.name }</li>
		<li>국어점수 : ${dto.kor }</li>
		<li>영어점수 : ${dto.eng }</li>
		<li>수학점수 : ${dto.math }</li>
		<li>합계점수 : ${dto.total }</li>
		<li>평균점수 : ${dto.avg }</li>
	</ul>

	

<!-- </div> -->
</main>

</body>
</html>