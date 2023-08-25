<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01-form.jsp</title>
</head>
<body>
<div>

	<h1>ex01-form.jsp</h1>
	<hr>
	
	<h3>application/x-www-form-urlencoded : POST일때 기본값</h3>
	<h3>multipart/form-data : 파일을 포함한 데이터 전송하기 위한 형식</h3>
	
	<ul>
		<li>input[type="file"]요소는 value를 지정할 수 없다.</li>
		<li>대부분 문자열 형식의 input이고 일부만 파일이더라도 반드시 multipart형식으로 제출해야한다.</li>
		<li>multipart/form-data형식이 기존 requst의 getParameter()를 사용할 수 없다.</li>
	</ul>
	<fieldset>
		<form method="POST" enctype="multipart/form-data" action="ex01-action.jsp">
			<p><input type="file" name="profileImage"></p>
			<p><input type="submit"></p>
		</form>
	</fieldset>


</div>
</body>
</html>