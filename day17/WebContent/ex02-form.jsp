<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-form.jsp</title>
</head>
<body>

<h1>java.sql.Date form태그로 입력박기</h1>
<hr>

<form action="ex02-action.jsp" method="POST">
	<p><input type="number" name="idx" value="1"></p>
	<p><input type="text" name="title" value="제목"></p>
	<p><input type="text" name="writer" value="작성자"></p>
	<p><input type="text" name="content" value="내용"></p>
	<p><input type="text" name="uploadFile" ></p>
	<p><input type="date" name="_wdate" value="2023-08-28"></p>
	<P><input type="submit"></P>
</form>

</body>
</html>