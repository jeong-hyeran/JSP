<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<main>
<h3 style="text-align: left;">조회할 학생 이름 검색</h3>
<form action="${cpath}/searchOne.jsp" method="POST">
	<p><input type="text" name="name" placeholder="이름" autofocus></p>
	<p><input type="submit" value="검색"></p>
</form>

</main>
</body>
</html>