<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="name" value="${param.name }" scope="session"></c:set>
<main>

<div>
<form action="${cpath }/modify-action.jsp" method="POST">
	<p><input type="number" name ="kor" placeholder="국어점수"></p>
	<p><input type="number" name ="eng" placeholder="영어점수"></p>
	<p><input type="number" name ="math" placeholder="수학점수"></p>
	<p><input type="submit" value="수정"></p>
</form>
</div>

</main>





</body>
</html>