<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<main>
<h1>학생 추가</h1>
	<form action="${cpath }/add-action.jsp" method="POST">
			
		<p> <input type="text" name="name" placeholder="이름" autofocus required> </p>
		<p> <input type="number" name="kor" placeholder="국어점수" required> </p>
		<p> <input type="number" name="eng" placeholder="영어점수" required> </p>
		<p> <input type="number" name="math" placeholder="수학점수" required> </p>
		<p> <input type="submit" value="입력">
		
	</form>


</main>
</body>
</html>